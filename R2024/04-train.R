######################################################################
# STAT 7030 - Categorical Data Analysis 
# Peng Zeng (Auburn University)
# 2024-01-16
######################################################################

######################################################################
# horseshoe crabs 
######################################################################

train = read.table("http://www.auburn.edu/~zengpen/teaching/STAT-7030/datasets/train.txt", header = TRUE)
train$num = train$year - 1975 
train$logkm = log(train$km)

fit1 = glm(count ~ num + offset(logkm), data = train, family = poisson)
summary(fit1)

# It is not negative binomial, but also include a dispersion parameter 
fit2 = glm(count ~ num + offset(logkm), data = train, family = quasipoisson)
summary(fit2)

######################################################################
# THE END
######################################################################
