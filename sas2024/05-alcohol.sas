/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-01-17
 *********************************************************************/

data alcohol;
   input alcohol present absent;
   total = present + absent;
datalines;
0    48  17066
0.5  38  14464
1.5   5    788
4.0   1    126
7.0   1     37
;
proc print data = alcohol; run;

proc logistic data = alcohol;
   class alcohol (ref = '7') / param = reference;
   model present / total = alcohol;
run;

/*** reduced model when b1 = ... = b5  ***/

proc logistic data = alcohol;
   class alcohol (ref = '7') / param = reference;
   model present / total = ;
run;

/*** get estimated probability  ***/

proc logistic data = alcohol;
   class alcohol (ref = '7') / param = reference;
   model present / total = alcohol;
   output out = alcoholfit prob = prob;
run;

proc print data = alcoholfit; run;

/*** treat alcohol as continuous variable  ***/

proc logistic data = alcohol;
   model present / total = alcohol;
   output out = alcoholfit2 prob = prob;
run;

proc print data = alcoholfit2; run;

/********************************************************************* 
 * THE END
 *********************************************************************/
