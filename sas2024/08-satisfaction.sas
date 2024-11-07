/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-02-20
 *********************************************************************/

data jobsat;
   input gender income satisf count; 
   if income = 1 then incomescore = 3;
   if income = 2 then incomescore = 10;
   if income = 3 then incomescore = 20;
   if income = 4 then incomescore = 35;
datalines;
1  1 1 1  
1  1 2 3  
1  1 3 11  
1 1 4 2 
1  2 1 2  
1  2 2 3  
1  2 3 17  
1 2 4 3 
1  3 1 0  
1  3 2 1  
1  3 3  8  
1 3 4 5
1  4 1 0  
1  4 2 2  
1  4 3 4   
1 4 4 2
0  1 1 1  
0  1 2 1  
0  1 3 2   
0 1 4 1
0  2 1 0  
0  2 2 3  
0  2 3 5   
0 2 4 1
0  3 1 0  
0  3 2 0  
0  3 3 7   
0 3 4 3
0  4 1 0  
0  4 2 1  
0  4 3 9   
0 4 4 6
;
proc print data = jobsat; run;

/* X Not In the Model */
proc logistic data = jobsat;
   weight count;
   class gender;
   model satisf = gender;
/* Y-ordinal, X-ordinal*/
proc logistic data = jobsat;
   weight count;
   class gender;
   model satisf = gender incomescore;
/*Y-ordinal, X-nominal*/
proc logistic data = jobsat;
   weight count;
   class gender income;
   model satisf = gender income;
run;

/* X Not In the Model */
proc logistic data = jobsat;
   weight count;
   class gender;
   model satisf = gender / link=glogit;
/*Y-nominal, X-ordinal*/
proc logistic data = jobsat;
   weight count;
   class gender;
   model satisf = gender incomescore / link=glogit;
/*Y-nominal, X-nominal*/
proc logistic data = jobsat;
   weight count;
   class gender income;
   model satisf = gender income / link=glogit;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
