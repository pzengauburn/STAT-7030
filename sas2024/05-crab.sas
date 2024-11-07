/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-01-17
 *********************************************************************/

filename crabtxt url "http://www.auburn.edu/~zengpen/teaching/STAT-7030/datasets/crab.txt";

data crab;
   infile crabtxt firstobs = 2;
   input color spine width satell weight; 
   width2 = width * width;
   weight = weight / 1000;
   if satell > 0 then yes = 1; else yes = 0;
run;

proc print data = crab; run;

/*** width as predictor ***/

proc logistic data = crab;
   model yes (event = '1') = width; 
run;

/* reduced model when testing beta = 0. */

proc logistic data = crab; 
   model yes (event = '1') = ;
run;

/* get estimated probabilities and their confidence interval */

proc logistic data = crab; 
   model yes (event = '1') = width / covb;
   output out = crabfit prob = prob lower = lower upper = upper;
run;

proc print data = crabfit; run;

/*** prediction and confidence intervals ***/

data one;
   input width;
datalines;
26.5
;
data new; set crab one; 
proc print data = new; run;

proc logistic data = new; 
   model yes (event = '1') = width;
   output out = crabfitnew prob = prob lower = lower upper = upper;
run;

proc print data = crabfitnew; run;

/*** logistic regression with a quadratic term ***/

proc logistic data = crab; 
   model yes (event = '1') = width width2;
run;

/*******************************************/
/***** predictors are width and color ******/ 
/*******************************************/

proc logistic data = crab;
   class color (ref = '5') / param = reference;
   model yes (event = '1') = color width;
run;

proc logistic data = crab;
   class color (ref = '5') / param = reference;
   model yes (event = '1') = color width color * width;
run;

proc logistic data = crab;
   class color (ref = '5') / param = reference;
   model yes (event = '1') = width;
run;

/****** two different ways of assigning scores to color *****/
data crab2;
   set crab;
   c1 = color - 1;
   if color = 5 then c2 = 0; else c2 = 1;
proc logistic data = crab2;
   model yes (event = '1') = c1 width;
run;

proc logistic data = crab2;
   model yes (event = '1') = c2 width;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
