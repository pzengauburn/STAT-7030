/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-01-16
 *********************************************************************/

filename txtfile url "http://www.auburn.edu/~zengpen/teaching/STAT-7030/datasets/train.txt";

data train;
   infile txtfile firstobs = 2;
   input year km count; 
   num = year - 1975;
   logkm = log(km);   
run;
proc print data = train; run;  

proc genmod data = train;
   model count = num / dist = poi link = log offset = logkm;
run;
 
proc genmod data = train;
   model count = num / dist = negbin link = log offset = logkm;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
