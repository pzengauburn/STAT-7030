/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-02-20
 *********************************************************************/

data drugs;
   input a $ c $ m $ count; 
datalines;
yes yes yes 911  
yes yes no  538   
yes no  yes  44   
yes no  no  456
no  yes yes   3   
no  yes no   43   
no  no  yes   2   
no  no  no  279
;
proc print data = drugs; run;

proc genmod data = drugs order = data; 
  class a c m;
  model count = a c m a*m a*c c*m / dist=poi link = log p;
run;


/* Compare Different Models */
proc genmod data = drugs; 
  class a c m;
  model count = a c m / dist=poi link = log p;
proc genmod data = drugs; 
  class a c m;
  model count = a c m a*c / dist=poi link = log p;
proc genmod data = drugs; 
  class a c m;
  model count = a c m a*m c*m / dist=poi link = log p;
proc genmod data = drugs; 
  class a c m;
  model count = a c m a*m a*c c*m / dist=poi link = log p;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
