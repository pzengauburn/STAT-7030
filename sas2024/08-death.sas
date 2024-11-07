/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-02-20
 *********************************************************************/

data death;
   input victim $ defendant $ death $ count @@;
datalines;
   white white yes 53 white white no 414
   white black yes 11 white black no 37
   black white yes  0 black white no 16
   black black yes  4 black black no 139
;
proc print data = death; run;


proc freq data = death order = data;
   weight count;
   table victim * defendant * death / measures cmh;
run;


proc freq data = death order = data;
   weight count;
   table defendant * death / measures;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
