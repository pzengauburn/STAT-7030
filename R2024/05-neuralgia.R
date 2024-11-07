######################################################################
# STAT 7030 - Categorical Data Analysis 
# Peng Zeng (Auburn University)
# 2024-01-17
######################################################################

######################################################################
# Neuralgia 
######################################################################

neuralgia = read.table("http://www.auburn.edu/~zengpen/teaching/STAT-7030/datasets/neuralgia.txt", header = TRUE)
str(neuralgia)

neuralgia$y = (neuralgia$Pain == "Yes")
neuralgia$Treatment = factor(neuralgia$Treatment, c("P", "A", "B"))
neuralgia$Sex = factor(neuralgia$Sex, c("M", "F"))

fit1 = glm(y ~ Treatment + Sex + Age + Duration, data = neuralgia, family = binomial)
summary(fit1)

fit2 = glm(y ~ Treatment + Sex + Age, data = neuralgia, family = binomial)
summary(fit2)

fit3 = glm(y ~ (Treatment + Sex + Age + Duration)^2, data = neuralgia, family = binomial)
summary(fit3)
anova(fit1, fit3)

######################################################################
# THE END
######################################################################
