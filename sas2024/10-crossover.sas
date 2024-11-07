/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-03-27
 *********************************************************************/

filename csvfile url "https://www.auburn.edu/~zengpen/teaching/STAT-7030/datasets/crossover.csv";

proc import out = crossover datafile = csvfile 
   dbms = csv replace; 
run; 
proc print data = crossover; run; 

data crossover2; 
   set crossover; 
   do i = 1 to count; 
      output; 
   end;
   drop i count; 
run;
proc print data = crossover2; run; 

data crossover3;
   set crossover2;
   subject = _n_;
      period = 1;
         drug  = substr(sequence, 1, 1);
         carry = "N";
         response = time1;
         output;
      period = 0;
         drug  = substr(sequence, 2, 1);
         carry = substr(sequence, 1, 1);
         if carry = "P" then carry = "N";
         response = time2;
         output;
run;
proc print data = crossover3; run;

proc genmod data = crossover3;
   class subject age drug carry;
   model response = period age drug period*age carry drug*age 
         / link = logit dist = bin type3;
   repeated subject = subject / type = unstr corrw;
run;

/*** remove carry ***/
proc genmod data = crossover3;
   class subject age drug carry;
   model response = period age drug period*age drug*age 
         / link = logit dist = bin type3;
   repeated subject = subject / type = unstr corrw;
run;

/*** remove carry and age * drug ***/
proc genmod data = crossover3;
   class subject age drug carry;
   model response = period age drug period*age  
         / link = logit dist = bin type3;
   repeated subject = subject / type = unstr corrw;
run;

/*** a joint test for carry and age * drug ***/
proc genmod data = crossover3;
   class subject age drug carry;
   model response = period age drug period*age carry age*drug 
         / link = logit dist = bin type3;
   repeated subject = subject / type = unstr corrw;
   contrast "joint" carry 1 0 -1,
                    carry 0 1 -1,
					age*drug 1 0 -1 -1 0 1,
					age*drug 0 1 -1 0 -1 1;
run;

/*** refined model ***/
proc genmod data = crossover3;
   class subject age drug carry;
   model response = period age drug period*age  
         / link = logit dist = bin type3;
   repeated subject = subject / type = unstr corrw;
   contrast "A vs B" drug 1 -1 0;
   contrast "A vs P" drug 1 0 -1;
   contrast "B vs P" drug 0 1 -1;
   estimate "A vs B" drug 1 -1 0 / exp;
   estimate "A vs P" drug 1 0 -1 / exp;
   estimate "B vs P" drug 0 1 -1 / exp;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
