/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-2-6
 *********************************************************************/

data heart;
   input blood total disease;
   pobs = disease / total;
datalines;
111.5   156   3
121.5   252  17
131.5   284  12
141.5   271  16
151.5   139  12
161.5    85   8
176.5    99  16
191.5    43   8
;
proc print data = heart; run;

proc logistic data = heart; 
   model disease / total = blood / influence;
run;

proc genmod data = heart; 
   model disease / total = blood / dist = bin link = logit r;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/