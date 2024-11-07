/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-2-6
 *********************************************************************/

data admission;
   input dept $ gender $ yes no @@;
   total = yes + no;
datalines;
anth  female   32   81  anth  male  21   41
astr  female    6    0  astr  male   3    8
chem  female   12   43  chem  male  34  110
clas  female    3    1  clas  male   4    0
comm  female   52  149  comm  male   5   10
comp  female    8    7  comp  male   6   12
engl  female   35  100  engl  male  30  112
geog  female    9    1  geog  male  11   11
geol  female    6    3  geol  male  15    6
germ  female   17    0  germ  male   4    1
hist  female    9    9  hist  male  21   19
lati  female   26    7  lati  male  25   16
ling  female   21   10  ling  male   7    8
math  female   25   18  math  male  31   37
phil  female    3    0  phil  male   9    6
phys  female   10   11  phys  male  25   53
poli  female   25   34  poli  male  39   49
psyc  female    2  123  psyc  male   4   41
reli  female    3    3  reli  male   0    2
roma  female   29   13  roma  male   6    3
soci  female   16   33  soci  male   7   17
stat  female   23    9  stat  male  36   14
zool  female    4   62  zool  male  10   54
;
proc print data = admission; run;

proc genmod data = admission;
   class dept; 
   model yes / total = dept / dist = bin link = logit r;
   output out = residuals stdreschi = streschi;
run;

proc sort data = residuals; by gender; 
proc print data = residuals; run;


/*** logistic regression with three departments deleted ***/

data refined; 
   set admission; 
   if dept in ('astr', 'geog', 'psyc') then delete;
proc print data = refined; run;

proc genmod data = refined;
   class dept; 
   model yes / total = dept / dist = bin link = logit;
run;   


/*** logistic regression using dept and gender as predictors ***/

proc genmod data = admission;
   class dept gender; 
   model yes / total = dept gender / dist = bin link = logit;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
