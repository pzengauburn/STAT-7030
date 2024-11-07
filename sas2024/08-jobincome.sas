/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-02-20
 *********************************************************************/

data jobincome;
   input income satisfaction $ count @@;
datalines;
   7.5  VD 1  7.5  LD 3  7.5  MS 10  7.5  VS 6
   20   VD 2  20   LD 3  20   MS 10  20   VS 7 
   32.5 VD 1  32.5 LD 6  32.5 MS 14  32.5 VS 12
   60   VD 0  60   LD 1  60   MS  9  60   VS 11
;
proc print data = jobincome; run;

proc freq data = jobincome order = data;
   weight count;
   table income * satisfaction / chisq measures scorout;
run;

proc freq data = jobincome order = data;
   weight count;
   table income * satisfaction / chisq measures score = rank scorout;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
