######################################################################
# STAT 7030 - Categorical Data Analysis 
# Peng Zeng (Auburn University)
# 2024-01-17
######################################################################

######################################################################
# maternal alcohol consumption 
######################################################################

present = c(48, 38, 5, 1, 1)
absent = c(17066, 14464, 788, 126, 37)
x = c(0, 0.5, 1.5, 4, 7)
x.factor = factor(x, c("7", "0", "0.5", "1.5", "4"))

fit1 = glm(cbind(present, absent) ~ x.factor, family = binomial)
summary(fit1)

fit2 = glm(cbind(present, absent) ~ x, family = binomial)
summary(fit2)

# goodness-of-fit test 
anova(fit2, fit1)

######################################################################
# THE END
######################################################################
