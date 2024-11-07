######################################################################
# STAT 7030 - Categorical Data Analysis 
# Peng Zeng (Auburn University)
# 2023-12-27
######################################################################

######################################################################
# Children's hair color
######################################################################

region1 = c(76, 19, 83, 65, 3)
region2 = c(152, 94, 134, 117, 19)
prob = c(0.3, 0.12, 0.3, 0.25, 0.03)

# compute critical value
qchisq(0.95, 4)

# manually computing for region 1
expected1 = sum(region1) * prob 
2 * sum(region1 * log(region1 / expected1))
# compute p-values 
1 - pchisq(9.0176, 4)

# manually computing for region 2
expected2 = sum(region2) * prob 
2 * sum(region2 * log(region2 / expected2))
# compute p-values 
1 - pchisq(19.1994, 4)

######################################################################
# THE END
######################################################################
