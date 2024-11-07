######################################################################
# STAT 7030 - Categorical Data Analysis 
# Peng Zeng (Auburn University)
# 2023-12-14
######################################################################

######################################################################
# heights of women
######################################################################

height = c(58.2, 64.0, 59.5, 64.5, 60.7, 64.1, 60.9, 64.8,
           61.9, 65.2, 61.9, 65.7, 62.2, 66.2, 62.2, 66.7,
           62.4, 67.1, 62.9, 67.8, 63.9, 68.9, 63.1, 69.6, 63.9)

# histogram 
hist(height, prob = T, main = "Histogram of 25 women's heights", 
     xlab = "height in inches", col = "yellow")
lines(density(height), lwd = 2, col = "blue")

# QQ-plot 
qqnorm(height)
qqline(height, col = "red")

# summary statistics 
mean(height)    # mean = 63.932
var(height)     # var = 7.956433
sd(height)      # sd = 2.820715

# CI = (62.8263, 65.0377) by nornal approximation 
mean(height) + c(-1, 1) * qnorm(0.975) * sd(height) / sqrt(25)
# CI = (62.76767, 65.09633) by t-distribution 
mean(height) + c(-1, 1) * qt(0.975, 24) * sd(height) / sqrt(25)

# hypothesis testing H0: mu = 62 versus Ha: mu > 62 
t.test(height, mu = 62)                           # CI = (62.76767 65.09633)
t.test(height, mu = 62, alternative = "greater")  # t0 = 3.4247, p-value = 0.001109

######################################################################
# THE END
######################################################################
