/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-01-16
 *********************************************************************/

filename crabtxt url "http://www.auburn.edu/~zengpen/teaching/STAT-7030/datasets/crab.txt";

data crab;
   infile crabtxt firstobs = 2;
   input color spine width satell weight; 
run;

proc print data = crab; run;

/***** GLM for counts data with different link functions *****/

proc genmod data = crab; 
   model satell = width / dist = poi link = log;
run;

proc genmod data = crab; 
   model satell = width / dist = poi link = identity;
run;

proc genmod data = crab; 
   model satell = width / dist = negbin link = identity;
run;

proc genmod data = crab; 
   model satell = width / dist = negbin link = log;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
