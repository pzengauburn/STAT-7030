/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2023-12-27
 *********************************************************************/

data aspirin;
   input trt $ attack $ count;
datalines;
placebo yes   189
placebo no  10845
aspirin yes   104
aspirin no  10933
;
proc print data = aspirin; run;

proc freq data = aspirin order = data;
   weight count;
   table trt * attack / measures;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
