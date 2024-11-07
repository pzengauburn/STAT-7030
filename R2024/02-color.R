######################################################################
# STAT 7030 - Categorical Data Analysis 
# Peng Zeng (Auburn University)
# 2023-12-26
######################################################################

######################################################################
# Children's hair color
######################################################################

region1 = c(76, 19, 83, 65, 3)
region2 = c(152, 94, 134, 117, 19)
prob = c(0.3, 0.12, 0.3, 0.25, 0.03)

# goodness-of-test 
chisq.test(region1, p = prob)
chisq.test(region2, p = prob)

# compute critical value
qchisq(0.95, 4)

# manually computing for region 1
expected1 = sum(region1) * prob 
sum((region1 - expected1)^2 / expected1)
# compute p-values 
1 - pchisq(7.7602, 4)

# manually computing for region 2
expected2 = sum(region2) * prob 
sum((region2 - expected2)^2 / expected2)
# compute p-values 
1 - pchisq(21.3824, 4)

######################################################################
# THE END
######################################################################
