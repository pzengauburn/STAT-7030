/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-02-20
 *********************************************************************/

data edubelief;
    input degree belief $ count @@;
datalines;
1 fund 178  1 mod  138  1 lib  108
2 fund 570  2 mod  648  2 lib  442
3 fund 138  3 mod  252  3 lib  252
;  
proc print data = edubelief; run;

proc freq data = edubelief order=data; 
  weight count;
  tables degree * belief / chisq expected;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
