/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2023-12-26
 *********************************************************************/

/********************************************************************* 
 * Children's hair color
 *********************************************************************/

data color;
  input region eyes $ hair $ count @@;
datalines;
  1 blue  fair   23  1 blue  red     7  1 blue  medium 24
  1 blue  dark   11  1 green fair   19  1 green red     7
  1 green medium 18  1 green dark   14  1 brown fair   34
  1 brown red     5  1 brown medium 41  1 brown dark   40
  1 brown black   3  2 blue  fair   46  2 blue  red    21
  2 blue  medium 44  2 blue  dark   40  2 blue  black   6
  2 green fair   50  2 green red    31  2 green medium 37
  2 green dark   23  2 brown fair   56  2 brown red    42
  2 brown medium 53  2 brown dark   54  2 brown black  13
;
proc print data = color; run;

/***** construct a three-way contingency table *****/

proc freq data = color order = data; 
  table region * hair * eyes;
  weight count;
run;

/***** sort data according to the value of region *****/

proc sort data = color;
  by region;
run;

/***** Pearson's chi-squared test for two regions separately *****/

proc freq data = color order = data;
   weight count;
   tables hair / testp = (30 12 30 25 3);
   by region;
run;

/***** p-values and critical value *****/

data chi; 
   pvalue1 = 1.0 - cdf('chisquared', 7.7602, 4);
   pvalue2 = 1.0 - cdf('chisquared', 21.3824, 4);
   critical = cinv(0.95, 4); 
proc print data = chi; run;

/********************************************************************* 
 * THE END
 *********************************************************************/
