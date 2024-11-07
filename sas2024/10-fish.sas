/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-03-27
 *********************************************************************/

filename csvfile url "http://www.auburn.edu/~zengpen/teaching/STAT-7030/datasets/fish.csv";
 
proc import out = fish datafile = csvfile
    dbms = csv replace; 
run; 

proc print data = fish; run;  

proc freq data = fish;
    table count; 
run;

/* histogram of count */ 
proc sgplot data = fish;
    histogram count; 
run;

/* zero-inflated model */
proc genmod data = fish;
    class camper;
    model count = child camper / dist = zip link = log;
    zeromodel persons / link = logit;
run;

/* zero-inflated model */
proc genmod data = fish;
    class camper;
    model count = child camper / dist = zinb link = log;
    zeromodel persons / link = logit;
run;

proc genmod data = fish;
    class camper;
    model count = child camper / dist = zip link = log;
    zeromodel persons / link = logit;
    estimate "camper = 1" intercept 1 child 0.684 camper 1 0 @ZERO intercept 1 persons 2.528;
    estimate "camper = 0" intercept 1 child 0.684 camper 0 1 @ZERO intercept 1 persons 2.528;
run;

proc genmod data = fish;
    class camper;
    model count = child camper / dist = zinb link = log;
    zeromodel persons / link = logit;
    estimate "camper = 1" intercept 1 child 0.684 camper 1 0 @ZERO intercept 1 persons 2.528;
    estimate "camper = 0" intercept 1 child 0.684 camper 0 1 @ZERO intercept 1 persons 2.528;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
