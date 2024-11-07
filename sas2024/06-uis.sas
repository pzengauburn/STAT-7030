/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-2-6
 *********************************************************************/

/* Example in Hosmer and Lemeshow (2000) Applied Logistic Regression */

filename myfile url 'http://www.auburn.edu/~zengpen/teaching/STAT-7030/datasets/uis.dat';

data uis;
  infile myfile;
  input id age beck ivhx ndrugtx race treat site dfree;
  if ivhx = 2 then ivhx2 = 1; else ivhx2 = 0;
  if ivhx = 3 then ivhx3 = 1; else ivhx3 = 0;
run;

proc contents data = uis; run;
proc print data = uis; run;

/* fit univariate logistic regression model */
proc genmod data = uis descending;
   model dfree = age / dist=bin link=logit;
   estimate '10 year increase in age' age 10 / exp;
proc genmod data = uis descending;
   model dfree = beck / dist=bin link=logit;
   estimate '5 point increase in beck' beck 5 /exp;
proc logistic data = uis descending;
   class ivhx (ref='1') / param=ref;
   model dfree = ivhx;
proc logistic data = uis descending;
   model dfree = ndrugtx;
proc logistic data = uis descending;
   model dfree = race;
proc logistic data = uis descending;
   model dfree = treat;
proc logistic data = uis descending;
   model dfree = site;
run;


/* tentative multiple logistic regression model */
proc logistic data = uis descending;
   class ivhx (ref='1') / param=ref;
   model dfree = age ivhx ndrugtx race treat site;
run;
 

/* for age and ndrugtx, linear or quadratic */
data uistransf;
  set uis;
  age2 = age * age;
  ndrugtx2 = ndrugtx * ndrugtx;
run;

proc logistic data=uistransf descending;
  model dfree = ndrugtx ivhx2 ivhx3 race treat site;
proc logistic data=uistransf descending;
  model dfree = age ndrugtx ivhx2 ivhx3 race treat site;
proc logistic data=uistransf descending;
  model dfree = age age2 ndrugtx ivhx2 ivhx3 race treat site;
run;

proc logistic data=uistransf descending;
  model dfree = age ivhx2 ivhx3 race treat site;
proc logistic data=uistransf descending;
  model dfree = age ndrugtx ivhx2 ivhx3 race treat site;
proc logistic data=uistransf descending;
  model dfree = age ndrugtx ndrugtx2 ivhx2 ivhx3 race treat site;
run;


/* add interactions */

proc logistic data = uis descending;
   class ivhx (ref='1') / param=ref;
   model dfree = age ndrugtx ivhx race treat site age*ndrugtx;
proc logistic data = uis descending;
   class ivhx (ref='1') / param=ref;
   model dfree = age ndrugtx ivhx race treat site age*ivhx;
proc logistic data = uis descending;
   class ivhx (ref='1') / param=ref;
   model dfree = age ndrugtx ivhx race treat site age*race;
proc logistic data = uis descending;
   class ivhx (ref='1') / param=ref;
   model dfree = age ndrugtx ivhx race treat site age*treat;
proc logistic data = uis descending;
   class ivhx (ref='1') / param=ref;
   model dfree = age ndrugtx ivhx race treat site age*site;
proc logistic data = uis descending;
   class ivhx (ref='1') / param=ref;
   model dfree = age ndrugtx ivhx race treat site ndrugtx*ivhx;
proc logistic data = uis descending;
   class ivhx (ref='1') / param=ref;
   model dfree = age ndrugtx ivhx race treat site ndrugtx*race;
proc logistic data = uis descending;
   class ivhx (ref='1') / param=ref;
   model dfree = age ndrugtx ivhx race treat site ndrugtx*treat;
proc logistic data = uis descending;
   class ivhx (ref='1') / param=ref;
   model dfree = age ndrugtx ivhx race treat site ndrugtx*site;
proc logistic data = uis descending;
   class ivhx (ref='1') / param=ref;
   model dfree = age ndrugtx ivhx race treat site ivhx*race;
proc logistic data = uis descending;
   class ivhx (ref='1') / param=ref;
   model dfree = age ndrugtx ivhx race treat site ivhx*treat;
proc logistic data = uis descending;
   class ivhx (ref='1') / param=ref;
   model dfree = age ndrugtx ivhx race treat site ivhx*site;
proc logistic data = uis descending;
   class ivhx (ref='1') / param=ref;
   model dfree = age ndrugtx ivhx race treat site race*treat;
proc logistic data = uis descending;
   class ivhx (ref='1') / param=ref;
   model dfree = age ndrugtx ivhx race treat site race*site;
proc logistic data = uis descending;
   class ivhx (ref='1') / param=ref;
   model dfree = age ndrugtx ivhx race treat site treat*site;
run;


/* use stepwise and backward selection */

proc logistic data = uis descending;
   class ivhx (ref='1') / param=ref;
   model dfree = age|ndrugtx|ivhx|race|treat|site@2 / selection=stepwise;
run;

proc logistic data = uis descending;
   class ivhx (ref='1') / param=ref;
   model dfree = age|ndrugtx|ivhx|race|treat|site@2 / selection=backward;
run;

proc logistic data = uis descending;
   class ivhx (ref='1') / param=ref;
   model dfree = age ndrugtx ivhx treat age*ndrugtx / lackfit;
proc logistic data = uis descending;
   class ivhx (ref='1') / param=ref;
   model dfree = age ndrugtx ivhx race treat site age*ndrugtx race*site / lackfit;
run;



data onemore;
  input id age beck ivhx ndrugtx race treat site dfree;
  if ivhx = 2 then ivhx2 = 1; else ivhx2 = 0;
  if ivhx = 3 then ivhx3 = 1; else ivhx3 = 0;
datalines;
  . 30 20 3 10 0 1 0 .
;
data new; set uis onemore; 
proc print data = new; run;

proc logistic data = new descending;
   class ivhx (ref='1') / param=ref;
   model dfree = age ndrugtx ivhx race treat site age*ndrugtx race*site;
   output out = fitted p = prod upper= ucl lower = lcl;
proc print data=fitted; run;

/********************************************************************* 
 * THE END
 *********************************************************************/
