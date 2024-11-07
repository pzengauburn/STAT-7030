/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-02-20
 *********************************************************************/

data aids;
   input race $ azt $ y n @@;
datalines;
white yes 14 107  white no 32 113 
black yes 11  63  black no 12  55
;
proc print data = aids; run;

proc logistic data = aids order = data;
   class race (ref = first) azt (ref = first) / param = reference;
   model y / n = azt race;
run;

/***** compare three different coding *****/

proc logistic data = aids order = data;
   class race (ref = first) azt (ref = first) / param = reference;
   model y / n = azt race;
run;

proc logistic data = aids order = data;
   class race azt / param = reference;
   model y / n = azt race;
run;

proc logistic data = aids order = data;
   class race azt;
   model y / n = azt race;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
