/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-02-20
 *********************************************************************/

data moving;
   input y1980 $ y1985 $ count;
   ine = 0; if y1980='NE' and y1980=y1985 then ine=1;
   imw = 0; if y1980='MW' and y1980=y1985 then imw=1;
   iso = 0; if y1980='SO' and y1980=y1985 then iso=1;
   iwe = 0; if y1980='WE' and y1980=y1985 then iwe=1;
   datalines;
NE NE 11607
MW NE 87
SO NE 172
WE NE 63
NE MW 100
MW MW 13677
SO MW 225
WE MW 176
NE SO 366
MW SO 515
SO SO 17819
WE SO 286
NE WE 124
MW WE 302
SO WE 270
WE WE 10192
;
proc print data = moving; run;

/* independence */
proc genmod data = moving;
   class y1980 y1985;
   model count = y1980 y1985 / dist=poi link=log p;
run;

/* quasi-independence */
proc genmod data = moving;
   class y1980 y1985;
   model count = y1980 y1985 ine imw iso iwe / dist=poi link=log p;
run;

data movingsym;
   input y1980 $ y1985 $ count inout$;
   datalines;
NE NE 11607   nene
MW NE 87      nemw
SO NE 172     neso
WE NE 63      newe
NE MW 100     nemw
MW MW 13677   mwmw
SO MW 225     mwso
WE MW 176     mwwe
NE SO 366     neso
MW SO 515     mwso
SO SO 17819   soso
WE SO 286     sowe
NE WE 124     newe
MW WE 302     mwwe
SO WE 270     sowe
WE WE 10192   wewe
;
proc print data = movingsym; run;

/* symmetry */
proc genmod data = movingsym;
   class inout;
   model count = inout / dist=poi link=log p;
run;

/* quasi-symmetry */
proc genmod data = movingsym;
   class y1980 y1985 inout;
   model count = y1980 y1985 inout / dist=poi link=log p;
run;


proc freq data = moving;
   weight count;
   table y1980 * y1985 / agree;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
