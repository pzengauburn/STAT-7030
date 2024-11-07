/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-2-15
 *********************************************************************/

data impair;
   input mental ses life; 
datalines;
1 1 1
1 1 9
1 1 4
1 1 3
1 0 2
1 1 0
1 0 1
1 1 3
1 1 3
1 1 7
1 0 1
1 0 2
2 1 5
2 0 6
2 1 3
2 0 1
2 1 8
2 1 2
2 0 5
2 1 5
2 1 9
2 0 3
2 1 3
2 1 1
3 0 0
3 1 4
3 0 3
3 0 9
3 1 6
3 0 4
3 0 3
4 1 8
4 1 2
4 1 7
4 0 5
4 0 4
4 0 4
4 1 8
4 0 8
4 0 9
;
proc print data = impair; run;

proc logistic data = impair;
   model mental = life ses;
   output out = fitted p = prob lower = lower upper = upper;
run;

proc print data = fitted; run;

proc logistic data = impair;
   model mental = life ses / link = probit;
run;

proc logistic data = impair;
   model mental = life ses / link = cloglog;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
