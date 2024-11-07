/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-2-6
 *********************************************************************/

filename crabtxt url "http://www.auburn.edu/~zengpen/teaching/STAT-7030/datasets/crab.txt";

data crab;
   infile crabtxt firstobs = 2;
   input color spine width satell weight; 
   weight = weight / 1000;
   if satell > 0 then yes = 1; else yes = 0;
   if color = 2 then c1 = 1; else c1 = 0;
   if color = 3 then c2 = 1; else c2 = 0;
   if color = 4 then c3 = 1; else c3 = 0;
   if color = 5 then c4 = 1; else c4 = 0;
   if spine = 1 then s1 = 1; else s1 = 0;
   if spine = 2 then s2 = 1; else s2 = 0;
run;

proc print data = crab; run;

/*** model with all variables ***/

proc logistic data = crab descending;
   model yes = weight width c1 c2 c3 s1 s2;
run;

/*** compare different models ***/

proc logistic data = crab descending;
   class color spine / param = ref;
   model yes = width|color|spine;
proc logistic data = crab descending;
   class color spine / param = ref;
   model yes = width|color color|spine width|spine;
proc logistic data = crab descending;
   class color spine / param = ref;
   model yes = width|spine color|spine;
proc logistic data = crab descending;
   class color spine / param = ref;
   model yes = width|color width|spine;
proc logistic data = crab descending;
   class color spine / param = ref;
   model yes = width|color color|spine;
proc logistic data = crab descending;
   class color spine / param = ref;
   model yes = width|color spine;
proc logistic data = crab descending;
   class color spine / param = ref;
   model yes = width color|spine;
proc logistic data = crab descending;
   class color spine / param = ref;
   model yes = width color spine;
proc logistic data = crab descending;
   class color spine / param = ref;
   model yes = color spine;
proc logistic data = crab descending;
   class color spine / param = ref;
   model yes = width spine;
proc logistic data = crab descending;
   class color spine / param = ref;
   model yes = color width;
proc logistic data = crab descending;
   class color spine / param = ref;
   model yes = color;
proc logistic data = crab descending;
   class color spine / param = ref;
   model yes = width;
proc logistic data = crab descending;
   class color spine / param = ref;
   model yes = c4 width;
proc logistic data = crab descending;
   class color spine / param = ref;
   model yes = ;
run;


/*** backward elimination ***/

proc logistic data = crab descending;
   class color spine / param = ref;
   model yes = width|color|spine / selection = backward;
run;

/*** stepwise elimination ***/

proc logistic data = crab descending;
   class color spine / param = ref;
   model yes = width|color|spine / selection = stepwise;
run;

/*** ROC curve ***/ 

proc logistic data = crab descending plots = roc;
   class color / param = ref;
   model yes = color width; 
run;

/*** Hosmer-Lemeshow test ***/ 

proc logistic data = crab descending;
   class color / param = ref;
   model yes = color width / lackfit;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
