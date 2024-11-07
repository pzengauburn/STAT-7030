/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-01-16
 *********************************************************************/

data snoring;
   input snoring $ x disease total;
datalines;
never        0 24 1379 
occasion     2 35  638 
nearly       4 21  213 
every        5 30  254
;
proc print data = snoring; run;

/***** linear probability model *****/
proc genmod data = snoring;
   model disease / total = x / dist = bin link = identity;
run;

/***** logistic regression model *****/
proc genmod data = snoring;
   model disease / total = x / dist = bin link = logit;
run;

/***** probit model *****/
proc genmod data = snoring;
   model disease / total = x / dist = bin link = probit;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
