/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-02-20
 *********************************************************************/

data afterlife;
   input gender $ belief $ count;
datalines;
female yes 509
female no  116
male   yes 398
male   no  104
;
proc print data = afterlife; run;

proc freq data = afterlife order = data;
   table gender * belief;
   weight count;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
