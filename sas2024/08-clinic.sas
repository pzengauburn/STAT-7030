/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-02-20
 *********************************************************************/

data clinic;
   input center trt $ success failure;
   total = success + failure;
datalines;
1  drug    11  25
1  control 10  27
2  drug    16  4
2  control 22  10
3  drug    14  5
3  control  7  12
4  drug     2  14
4  control  1  16
5  drug     6  11
5  control  0  12
6  drug     1  10
6  control  0  10
7  drug     1  4
7  control  1  8
8  drug     4  2
8  control  6  1
;
proc print data = clinic; run;

proc logistic data = clinic;
   class center (ref = '8') trt (ref = 'control') / param = reference;
   model success / total = center trt; 
run;

/* saturated model */
proc logistic data = clinic;
   class center (ref = '8') trt (ref = 'control') / param = reference;
   model success / total = center trt center * trt; 
run;


data clinic2;
   input center trt $ response $ count @@;
   datalines;
1  drug     success  11 1  drug     failure  25
1  control  success  10 1  control  failure  27
2  drug     success  16 2  drug     failure  4
2  control  success  22 2  control  failure  10
3  drug     success  14 3  drug     failure  5
3  control  success  7  3  control  failure  12
4  drug     success  2  4  drug     failure  14
4  control  success  1  4  control  failure  16
5  drug     success  6  5  drug     failure  11
5  control  success  0  5  control  failure  12
6  drug     success  1  6  drug     failure  10
6  control  success  0  6  control  failure  10
7  drug     success  1  7  drug     failure  4
7  control  success  1  7  control  failure  8
8  drug     success  4  8  drug     failure  2
8  control  success  6  8  control  failure  1
;
proc print data = clinic2; run;

proc freq data = clinic2 order = data;
   weight count;
   table center * trt * response / cmh;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
