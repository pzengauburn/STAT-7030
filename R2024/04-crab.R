######################################################################
# STAT 7030 - Categorical Data Analysis 
# Peng Zeng (Auburn University)
# 2024-01-16
######################################################################

######################################################################
# horseshoe crabs 
######################################################################

crab = read.table("http://www.auburn.edu/~zengpen/teaching/STAT-7030/datasets/crab.txt", header = TRUE)

fit1 = glm(satell ~ width, data = crab, family = poisson(link = "log"))
summary(fit1)

# It is not negative binomial, but also include a dispersion parameter 
fit2 = glm(satell ~ width, data = crab, family = quasipoisson(link = "log"))
summary(fit2)

######################################################################
# THE END
######################################################################
