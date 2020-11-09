## Continuous Distributions in R.

# This script is intended for you to get familiar with continuous distributions in R.
# It will also allow you to comfortably confront various assignment questions
# that you will likely face.

#############################################################################################
# Distributions covered: Uniform, Exponential, Gamma,                                       #
#                        Normal                                                             #
# Content covered: 1 Probability Density Functions.                                         #
#                  2 Cumulative Distribution Functions.                                     #
#                  3 Moment Generating Functions.                                           #
#############################################################################################


# First ensure that the necessary packages are installed and loaded.
# Uncomment as needed

#install.packages("devtools") # to install the MGF function.
library(devtools)

#install.packages("stats") # for pdf, cdf.
library(stats)

#install_github("alexandernel14/MGF) # for Moment Generating Functions.
library(MGF)


#=====================================================================================#
# Uniform Distribution

# Your friend's lateness to parties is modelled by the Uniform Distribution
# with him being equally likely to be 0 to 10 minutes late.
# X ~ U(0,10)

# What is the probability that you have to wait more than 5 minutes
# for your friend?
punif(q = 5, min = 0, max = 10, lower.tail = FALSE)

# What is the probability that you have to wait from 5 to 7 minutes
# for your friend?
punif(q = 7, min = 0, max = 10, lower.tail = TRUE) -
punif(q = 5, min = 0, max = 10, lower.tail = TRUE)

#=====================================================================================#
# Exponential Distribution

# Suppose we are waiting in a queue to be served at a restaurant where the 
# amount of time between people being served follows an Exponential Distribution with a mean
# time of 5 minutes per person.

# Assume that there is one person ahead of us then Let X be the amount of time we wait
# untill we get served.
# X ~ Exp(1/5)

# Exponential.example.pdf
# What is the probability that we will wait at most 6 minutes?
pexp(q = 6, rate = 0.2,lower.tail = TRUE)

# What is the probability that it will take longer than 6 minutes for us to be served?
# Using the lower tail = TRUE (default) and using the complement
1 - pexp(q = 6, rate = 0.2,lower.tail = TRUE)

# Using the lower.tail = FALSE
pexp(q = 6, rate = 0.2,lower.tail = FALSE)

# MGF of the Exponential Distribution
mgf("Exponential")

# Second moment (E[X^2]) and centralized moment (Var[X])
MGF_evaluator(distribution = "Exponential",lambda = 0.2, order_of_moment = 2)

#=====================================================================================#
# Gamma Distribution
# X ~ Gamma(alpha,lambda)

# Note that the Exponential Distribution is a special case of the 
# Gamma Distribution with alpha being set to 1.


# We can verify this by looking at the MGF of a Gamma and Exponential Random variable
# with the same rate parameters and alpha/shape equal to 1.

# Gamma Distribution MGF
mgf("Gamma")
mgf("Exponential")


# Let X ~ Gamma(2,0.2)

# What is the probability that X is less than or equal to 6?
pgamma(q = 6,shape = 2, rate = 0.2)

# What is the probbility that X is greater than 6?
pgamma(q = 6,shape = 2, rate = 0.2,lower.tail = FALSE)

# What is the probability that (6 < X < 12)
pgamma(q = 12,shape = 2, rate = 0.2) - pgamma(q = 6,shape = 2, rate = 0.2)
#=====================================================================================#

# Normal Distribution

# Assume that the IQ of students in a class follow the Normal Distribution
# with a mean of 100 and a standard deviation of 15 (Variance = 225).

# X ~ N(100,225)

# What percentage of students have an IQ lower than 130?
a <- pnorm(q = 130,mean = 100,sd = 15,lower.tail = TRUE)
a
# What is the Z score corresponding to the above probability?
qnorm(a)

# What is the Probability that students have IQs within 3 standard deviations of the mean
# P(100-3*sd < X < 100+3*sd) == P(55 < X < 145)
pnorm(q = 100+3*15,mean = 100,sd = 15) - pnorm(q = 100-3*15,mean = 100,sd = 15)

# Moment Generating Function of the Normal Distribution
mgf("Normal")

# Second moments of the N(100,225)
MGF_evaluator(distribution = "Normal", order_of_moment = 2,mu = 100, sigma = 15)

#=====================================================================================#





