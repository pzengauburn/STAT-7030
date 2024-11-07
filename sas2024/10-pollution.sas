/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-03-27
 *********************************************************************/

filename csvfile url "https://www.auburn.edu/~zengpen/teaching/STAT-7030/datasets/pollution.csv";
proc import out = pollution datafile = csvfile 
   dbms = csv replace; 
run; 

proc print data = pollution; run; 

/**** correlation = exchangeable ****/
proc genmod data = pollution descending;
   class id city;
   model symptom = city age smoke / link = logit dist = bin type3;
   repeated subject = id / type = exch covb corrw;
   estimate "smoking" smoke 1 / exp;
run;

/**** correlation = ar(1) ****/
proc genmod data = pollution descending;
   class id city;
   model symptom = city age smoke / link = logit dist = bin type3;
   repeated subject = id / type = ar(1) covb corrw;
   estimate "smoking" smoke 1 / exp;
run;

/**** correlation = mdep(2) ****/
proc genmod data = pollution descending;
   class id city;
   model symptom = city age smoke / link = logit dist = bin type3;
   repeated subject = id / type = mdep(2) covb corrw;
   estimate "smoking" smoke 1 / exp;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
