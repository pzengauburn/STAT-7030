/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2023-12-27
 *********************************************************************/

/***** opinion on legalization of abortion *****/

data abortion;
  input answer $ count;
datalines;
yes 400
no  493
;
proc print data = abortion; run;

proc freq data = abortion; 
   weight count;
   table answer / binomial (p = 0.5 level = 'yes') alpha = 0.05;
run;

/***** number of students *****/

data student;
   input year $ count; 
datalines; 
freshman   5394   
sophomore  4463
junior     4441
senior     5739
;
proc print data = student; run;

proc freq data = student; 
   weight count;
   table year / binomial(p = 0.25 level = "senior") alpha = 0.05;  
run; 

/********************************************************************* 
 * THE END
 *********************************************************************/
