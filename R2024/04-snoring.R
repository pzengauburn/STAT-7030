######################################################################
# STAT 7030 - Categorical Data Analysis 
# Peng Zeng (Auburn University)
# 2024-01-16
######################################################################

######################################################################
# heart disease and snoring 
######################################################################

yes = c(24, 35, 21, 30)
no = c(1355, 603, 192, 224) 
x = c(0, 2, 4, 5)

fit1 = glm(cbind(yes, no) ~ x, family = binomial(link = "identity"))
summary(fit1) 
fitted(fit1)

fit2 = glm(cbind(yes, no) ~ x, family = binomial(link = "logit"))
summary(fit2) 
fitted(fit2)

fit3 = glm(cbind(yes, no) ~ x, family = binomial(link = "probit"))
summary(fit3) 
fitted(fit3)

######################################################################
# THE END
######################################################################
