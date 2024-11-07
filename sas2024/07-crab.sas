/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-02-19
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

/*** linear discriminant analysis ***/

proc discrim data = crab method = normal pool = yes crossvalidate;
   class yes;
   priors prop; 
   var weight width c1 c2 c3 s1 s2;
run;

/*** classification tree ***/

proc hpsplit data = crab; 
   class yes; 
   model yes (event = "1") = weight width c1 c2 c3 s1 s2;
   grow entropy; 
   prune costcomplexity; 
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
