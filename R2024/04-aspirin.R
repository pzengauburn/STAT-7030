######################################################################
# STAT 7030 - Categorical Data Analysis 
# Peng Zeng (Auburn University)
# 2024-01-16
######################################################################

######################################################################
# aspirin and heart attack 
######################################################################

yes = c(189, 104)
no = c(10845, 10933)
x = c(1, 0) 

fit1 = glm(cbind(yes, no) ~ x, family = binomial(link = "identity"))
summary(fit1) 

fit2 = glm(cbind(yes, no) ~ x, family = binomial(link = "log"))
summary(fit2) 

fit3 = glm(cbind(yes, no) ~ x, family = binomial(link = "logit"))
summary(fit3) 

######################################################################
# THE END
######################################################################
