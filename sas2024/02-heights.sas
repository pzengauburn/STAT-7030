/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2023-12-15
 *********************************************************************/

/********************************************************************* 
 * heights of women
 *********************************************************************/

data heights;
   input y @@;
datalines;
58.2  64.0  59.5  64.5  60.7  64.1  60.9  64.8
61.9  65.2  61.9  65.7  62.2  66.2  62.2  66.7
62.4  67.1  62.9  67.8  63.9  68.9  63.1  69.6 
63.9
;

proc print data = heights; run;

/***** analysis for univariate variable *****/

proc univariate data = heights mu0 = 65; 
   var y;
   histogram y / kernel;
   qqplot y / normal(mu = est sigma = est);
run;

/***** summary statistics *****/

proc means data = heights n mean std clm;
   var y;
run;

/***** a histogram with better quality *****/

proc sgplot data = heights;
   histogram y;
   density y;
run;

/***** one-sample t-test *****/

proc ttest data = heights h0 = 62 side = U; 
   var y; 
run;

proc ttest data = heights h0 = 62; 
   var y; 
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
