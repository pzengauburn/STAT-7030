/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-02-20
 *********************************************************************/

data accident;
   input gender$ location$ seatbelt$ injury$ count;
datalines;
female urban  no  no  7287
female urban  yes no  11587
female rural  no  no  3246
female rural  yes no  6134
male   urban  no  no  10381
male   urban  yes no  10969
male   rural  no  no  6123
male   rural  yes no  6693
female urban  no  yes 996
female urban  yes yes 759
female rural  no  yes 973
female rural  yes yes 757
male   urban  no  yes 812
male   urban  yes yes 380
male   rural  no  yes 1084
male   rural  yes yes 513
;
proc print data = accident; run;

/***  (GI, GL, GS, IL, IS, LS) ***/
proc genmod data = accident order = data;
   class gender location seatbelt injury;
   model count = gender location seatbelt injury
                 gender*location gender*seatbelt gender*injury
                 location*seatbelt location*injury seatbelt*injury 
                 / dist=poi link=log p;
run;

/***  (GLS, GI, IL, IS) ***/
proc genmod data = accident order = data;
   class gender location seatbelt injury;
   model count = gender location seatbelt injury
                 gender*injury location*injury seatbelt*injury 
		 gender*location gender*seatbelt location*seatbelt
                 gender*location*seatbelt
                 / dist=poi link=log p;
run;

/*** logit model ***/
proc genmod data = accident order = data;
   weight count;
   class gender location seatbelt;
   model injury = gender location seatbelt / dist=bin link=logit;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
