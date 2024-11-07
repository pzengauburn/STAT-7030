/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-02-20
 *********************************************************************/

data agreement;
   input A B ab count;
   i1 = 0; if A = 1 and B = 1 then i1 = 1;
   i2 = 0; if A = 2 and B = 2 then i2 = 1;
   i3 = 0; if A = 3 and B = 3 then i3 = 1;
   i4 = 0; if A = 4 and B = 4 then i4 = 1;
datalines;
1 1 11 22 
1 2 12 2 
1 3 13 2 
1 4 14 0
2 1 12 5 
2 2 22 7 
2 3 23 14 
2 4 24 0
3 1 13 0 
3 2 23 2 
3 3 33 36 
3 4 34 0
4 1 14 0 
4 2 24 1 
4 3 34 17 
4 4 44 10
;
proc print data = agreement; run;

proc freq data = agreement;
   weight count;
   table A * B / agree;
run;

/* independence */
proc genmod data = agreement;
   class A B;
   model count = A B / dist=poi link=log;
run;

/* semi-independence */
proc genmod data = agreement;
   class A B;
   model count = A B i1 i2 i3 i4 / dist=poi link=log;
run;

/* symmetry */
proc genmod data = agreement;
   class ab;
   model count = ab / dist=poi link=log;
run;

/* semi-symmetry */
proc genmod data = agreement;
   class A B ab;
   model count = A B ab / dist=poi link=log;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
