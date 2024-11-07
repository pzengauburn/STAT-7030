/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-02-20
 *********************************************************************/

data stillbirth;
     input g$ a$ r$ b$ Count;
datalines;
     Male  <=24  Aborigine  StillBirth  22
     Male  25-28  Aborigine  StillBirth  21
     Male  29-32  Aborigine  StillBirth  12
     Male  33-36  Aborigine  StillBirth  4
     Male  37-41  Aborigine  StillBirth  7
     Female  <=24  Aborigine  StillBirth  17
     Female  25-28  Aborigine  StillBirth  13
     Female  29-32  Aborigine  StillBirth  10
     Female  33-36  Aborigine  StillBirth  10
     Female  37-41  Aborigine  StillBirth  13
     Male  <=24  Aborigine  LiveBirth  16
     Male  25-28  Aborigine  LiveBirth  42
     Male  29-32  Aborigine  LiveBirth  73
     Male  33-36  Aborigine  LiveBirth  387
     Male  37-41  Aborigine  LiveBirth  3934
     Female  <=24  Aborigine  LiveBirth  16
     Female  25-28  Aborigine  LiveBirth  19
     Female  29-32  Aborigine  LiveBirth  76
     Female  33-36  Aborigine  LiveBirth  451
     Female  37-41  Aborigine  LiveBirth  3729
     Male  <=24  White  StillBirth  171
     Male  25-28  White  StillBirth  109
     Male  29-32  White  StillBirth  95
     Male  33-36  White  StillBirth  112
     Male  37-41  White  StillBirth  169
     Female  <=24  White  StillBirth  167
     Female  25-28  White  StillBirth  100
     Female  29-32  White  StillBirth  78
     Female  33-36  White  StillBirth  92
     Female  37-41  White  StillBirth  209
     Male  <=24  White  LiveBirth  121
     Male  25-28  White  LiveBirth  358
     Male  29-32  White  LiveBirth  944
     Male  33-36  White  LiveBirth  5155
     Male  37-41  White  LiveBirth  101776
     Female  <=24  White  LiveBirth  107
     Female  25-28  White  LiveBirth  314
     Female  29-32  White  LiveBirth  727
     Female  33-36  White  LiveBirth  4224
     Female  37-41  White  LiveBirth  96077
;
proc print data = stillbirth; run;

proc genmod data = stillbirth;
   class a r g b;
   model count = a b r g / dist=poi link=log;
proc genmod data = stillbirth;
   class a r g b;
   model count = a | b | r | g @ 2 / dist=poi link=log;
proc genmod data = stillbirth;
   class a r g b;
   model count = a | b | r | g @ 3 / dist=poi link=log;
proc genmod data = stillbirth;
   class a r g b;
   model count = a|b|r|g@2 a*b*g a*r*g b*r*g / dist=poi link=log;
proc genmod data = stillbirth;
   class a r g b;
   model count = a|b|r|g@2 a*b*r a*r*g b*r*g / dist=poi link=log;
proc genmod data = stillbirth;
   class a r g b;
   model count = a|b|r|g@2 a*b*r a*b*g b*r*g / dist=poi link=log;
proc genmod data = stillbirth;
   class a r g b;
   model count = a|b|r|g@2 a*b*r a*b*g a*r*g / dist=poi link=log;
proc genmod data = stillbirth;
   class a r g b;
   model count = a|b|r|g@2 a*b*r a*r*g / dist=poi link=log;
proc genmod data = stillbirth;
   class a r g b;
   model count = a|b|r|g@2 a*r*g / dist=poi link=log;
proc genmod data = stillbirth;
   class a r g b;
   model count =  a*b*r a*r*g / dist=poi link=log;
proc genmod data = stillbirth;
   class a r g b;
   model count = a*r*g b*r b*g / dist=poi link=log;
proc genmod data = stillbirth;
   class a r g b;
   model count = a*r*g a*b b*g / dist=poi link=log;
proc genmod data = stillbirth;
   class a r g b;
   model count = a*r*g a*b b*r / dist=poi link=log;
proc genmod data = stillbirth;
   class a r g b;
   model count = a*r*g a*b / dist=poi link=log;
run;


proc genmod data = stillbirth;
   class a r g b;
   model count = a b r g a*b b*g r*b a*r*g / dist=poi link=log p;
run;

proc logistic data = stillbirth;
   class a r g b / param = ref;
   weight count;
   model b = a r g;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
