/********************************************************************* 
 * STAT 7030 - Categorical Data Analysis 
 * Peng Zeng (Auburn University)
 * 2024-2-15
 *********************************************************************/

data gator;
   input lake $ gender $ size $ food $ count;
datalines;
Hancock    male     small   fish          7
Hancock    male     small   invertebrate  1
Hancock    male     small   reptile       0
Hancock    male     small   bird          0
Hancock    male     small   other         5
Hancock    male     large   fish          4
Hancock    male     large   invertebrate  0
Hancock    male     large   reptile       0
Hancock    male     large   bird          1
Hancock    male     large   other         2
Hancock    female   small   fish          16
Hancock    female   small   invertebrate  3
Hancock    female   small   reptile       2
Hancock    female   small   bird          2
Hancock    female   small   other         3
Hancock    female   large   fish          3
Hancock    female   large   invertebrate  0
Hancock    female   large   reptile       1
Hancock    female   large   bird          2
Hancock    female   large   other         3
Oklawaha   male     small   fish          2
Oklawaha   male     small   invertebrate  2
Oklawaha   male     small   reptile       0
Oklawaha   male     small   bird          0
Oklawaha   male     small   other         1
Oklawaha   male     large   fish          13
Oklawaha   male     large   invertebrate  7
Oklawaha   male     large   reptile       6
Oklawaha   male     large   bird          0
Oklawaha   male     large   other         0
Oklawaha   female   small   fish          3
Oklawaha   female   small   invertebrate  9
Oklawaha   female   small   reptile       1
Oklawaha   female   small   bird          0
Oklawaha   female   small   other         2
Oklawaha   female   large   fish          0
Oklawaha   female   large   invertebrate  1
Oklawaha   female   large   reptile       0
Oklawaha   female   large   bird          1
Oklawaha   female   large   other         0
Trafford   male     small   fish          3
Trafford   male     small   invertebrate  7
Trafford   male     small   reptile       1
Trafford   male     small   bird          0
Trafford   male     small   other         1
Trafford   male     large   fish          8
Trafford   male     large   invertebrate  6
Trafford   male     large   reptile       6
Trafford   male     large   bird          3
Trafford   male     large   other         5
Trafford   female   small   fish          2
Trafford   female   small   invertebrate  4
Trafford   female   small   reptile       1
Trafford   female   small   bird          1
Trafford   female   small   other         4
Trafford   female   large   fish          0
Trafford   female   large   invertebrate  1
Trafford   female   large   reptile       0
Trafford   female   large   bird          0
Trafford   female   large   other         0
George     male     small   fish          13
George     male     small   invertebrate  10
George     male     small   reptile       0
George     male     small   bird          2
George     male     small   other         2
George     male     large   fish          9
George     male     large   invertebrate  0
George     male     large   reptile       0
George     male     large   bird          1
George     male     large   other         2
George     female   small   fish          3
George     female   small   invertebrate  9
George     female   small   reptile       1
George     female   small   bird          0
George     female   small   other         1
George     female   large   fish          8
George     female   large   invertebrate  1
George     female   large   reptile       0
George     female   large   bird          0
George     female   large   other         1
;
proc print data = gator; run;

proc logistic data = gator order = data; 
  freq count; 
  class lake (ref = 'George') size (ref = 'large') / param = ref;
  model food (ref = 'fish') = lake size / link = glogit;
  output out = fitted p = prob lower = lower upper = upper;
run;

proc print data = fitted; run;


/*  compare different models */
proc logistic data = gator; 
  freq count; 
  class lake size gender / param = ref;
  model food(ref = 'fish') = lake|size|gender/ link = glogit;
proc logistic data = gator; 
  freq count; 
  class lake size / param=ref;
  model food(ref = 'fish') = / link = glogit;
proc logistic data = gator; 
  freq count; 
  class lake size gender / param=ref;
  model food(ref = 'fish') = gender / link = glogit;
proc logistic data = gator; 
  freq count; 
  class lake size gender / param=ref;
  model food(ref = 'fish') = size / link = glogit;
proc logistic data = gator; 
  freq count; 
  class lake size gender / param=ref;
  model food(ref = 'fish') = lake / link = glogit;
proc logistic data = gator; 
  freq count; 
  class lake size gender / param=ref;
  model food(ref = 'fish') = lake size / link = glogit;
proc logistic data = gator; 
  freq count; 
  class lake size gender / param=ref;
  model food(ref = 'fish') = gender lake size / link = glogit;
run;

/*  compare different models: Collapsed over G */
proc logistic data = gator; 
  freq count; 
  class lake size / param = ref;
  model food(ref = 'fish') = lake|size / link = glogit;
proc logistic data = gator; 
  freq count; 
  class lake size / param = ref;
  model food(ref = 'fish') = / link = glogit;
proc logistic data = gator; 
  freq count; 
  class lake size / param = ref;
  model food(ref = 'fish') = size / link = glogit;
proc logistic data = gator; 
  freq count; 
  class lake size / param = ref;
  model food(ref = 'fish') = lake / link = glogit;
proc logistic data = gator; 
  freq count; 
  class lake size / param = ref;
  model food(ref = 'fish') = lake size / link = glogit;
run;

/********************************************************************* 
 * THE END
 *********************************************************************/
