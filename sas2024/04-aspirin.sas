/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-01-16
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
   table trt * attack / riskdiff;
run;

proc freq data = aspirin order = data;
   weight count;
   table trt * attack / measures;
run;

/***** fit a GLM *****/
data aspirin2;
   input trt $ attack $ x count total ;
datalines;
placebo yes  1  189 11037
aspirin yes  0  104 11034
;
proc print data = aspirin2; run;

proc genmod data = aspirin2; 
   model count / total = x / dist = bin link = identity;
run;

proc genmod data = aspirin2; 
   model count / total = x / dist = bin link = log;
run;

proc genmod data = aspirin2; 
   model count / total = x / dist = bin link = logit;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
