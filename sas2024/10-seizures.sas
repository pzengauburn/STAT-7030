/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-03-27
 *********************************************************************/

filename txtfile url "https://www.auburn.edu/~zengpen/teaching/STAT-7030/datasets/seizure.txt";

data seizure; 
   infile txtfile firstobs = 2; 
   input id y visit trt bline age; 
run; 

proc print data = seizure; run; 

proc genmod data = seizure; 
   class id; 
   model y = trt bline age / dist = poi link = log type3; 
   repeated subject = id / type = exch covb; 
   where id ~= 207; 
run; 

/* drop trt */ 
proc genmod data = seizure; 
   class id; 
   model y = bline age / dist = poi link = log type3; 
   repeated subject = id / type = exch covb; 
   where id ~= 207;    
run; 

/********************************************************************* 
 * THE END
 *********************************************************************/
