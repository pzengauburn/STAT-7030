######################################################################
# STAT 7030 - Categorical Data Analysis 
# Peng Zeng (Auburn University)
# 2024-01-17
######################################################################

######################################################################
# horseshoe crabs 
######################################################################

crab = read.table("http://www.auburn.edu/~zengpen/teaching/STAT-7030/datasets/crab.txt", header = TRUE)
crab$yes = (crab$satell > 0)

######################################################################
# width as predictor 
######################################################################

fit1 = glm(yes ~ width, data = crab, family = binomial)
summary(fit1)

# predicted probabilities 
predict(fit1, data.frame(width = c(21, 33.5)), type = "response")

# reduced model when testing H0: beta = 0. 
fit0 = glm(yes ~ 1, data = crab, family = binomial)

# likelihood ratio test for H0: beta = 0.
anova(fit0, fit1)

# 95% CI for prob at x = 26.5
x = c(1, 26.5)
SE = drop( sqrt(t(x) %*% vcov(fit1) %*% x) )
CI0 = sum(coef(fit1) * x) + c(-1, 1) * qnorm(0.975) * SE  
exp(CI0) / (1 + exp(CI0))

# check quadratic term  
fit2 = glm(yes ~ width + I(width^2), data = crab, family = binomial)
summary(fit2) 

######################################################################
# width and color as predictor 
######################################################################

crab$cfactor = factor(crab$color, c("5", "2", "3", "4"))
# additive model 
fit3 = glm(yes ~ cfactor + width, data = crab, family = binomial)
summary(fit3) 

# model with interaction 
fit4 = glm(yes ~ cfactor * width, data = crab, family = binomial)
summary(fit4) 

# check the significance of interactions 
anova(fit3, fit4)

# check the significance of color 
anova(fit1, fit3)

# scores {1, 2, 3, 4} 
crab$cx1 = crab$color - 1 
fit5 = glm(yes ~ cx1 + width, data = crab, family = binomial)
summary(fit5) 
anova(fit5, fit3)

# scores {1, 1, 1, 0} 
crab$cx2 = (crab$color != 5) 
fit6 = glm(yes ~ cx2 + width, data = crab, family = binomial)
summary(fit6) 
anova(fit6, fit3)

######################################################################
# THE END
######################################################################
