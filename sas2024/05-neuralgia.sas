/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-01-17
 *********************************************************************/

filename txtfile url "http://www.auburn.edu/~zengpen/teaching/STAT-7030/datasets/neuralgia.txt";

data Neuralgia;
   infile txtfile firstobs = 2;
   input Treatment $ Sex $ Age Duration Pain $; 
run;

proc print data = Neuralgia; run;

proc logistic data = Neuralgia;
   class Treatment Sex / param = reference;
   model Pain (event = 'yes') = Treatment Sex Age Duration;
run;

/*** refined model ***/
proc logistic data = Neuralgia;
   class Treatment Sex / param = reference;
   model Pain (event = 'yes') = Treatment Sex Age;
run;

/*** contrast with reference coding ***/
proc logistic data = Neuralgia;
   class Treatment Sex / param = reference;
   model Pain (event = 'yes') = Treatment Sex Age;
   contrast 'A vs B'  Treatment 1 -1 / estimate = both;
   contrast 'AB vs P' Treatment 0.5 0.5 / estimate = both;
   contrast 'F vs M'  Sex 1 / estimate = both;
run;

/*** contrast statements are different if effect coding is used ***/
proc logistic data = Neuralgia;
   class Treatment Sex;
   model Pain (event = 'yes') = Treatment Sex Age;
   contrast 'A vs B'  Treatment 1 -1 / estimate = both;
   contrast 'AB vs P' Treatment 1.5 1.5 / estimate = both;
   contrast 'F vs M'  Sex 2 / estimate = both;
run;

/*** fitting the probability of 'no' instead of 'yes' ***/
proc logistic data = Neuralgia;
   class Treatment Sex / param = reference;
   model Pain (event = 'no') = Treatment Sex Age;
run;

/*** a model with all the two-order interactions ***/
proc logistic data = Neuralgia;
   class Treatment Sex / param = reference;
   model Pain (event = 'yes') = Treatment Sex Age Duration 
            Treatment * Sex Treatment * Age Treatment * Duration Sex * Age 
            Sex * Duration Age * Duration;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
