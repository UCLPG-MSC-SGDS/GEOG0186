rm(list = ls())
gc()

# Solution Code

# Question 1: download the dataset from PLDR.org website. 
# -- students are required to use the data on families at risk of housing insecurity

# store the URL as a string object
URL_downloadable_dataset <- "https://pldr.org/download/2o6lg/66h/FRoHII_2025_PLDR_v1.0.1.csv"
# download the dataset 
download.file(URL_downloadable_dataset, destfile = "FRoHII_2025_PLDR_v1.0.1.csv", mode = "wb")
# load the dataset into RStudio
FRoHII <- read.csv("FRoHII_2025_PLDR_v1.0.1.csv")

# Question 2 
table(FRoHII$label)
prop.table(table(FRoHII$label)) * 100

# Question 3
mean(FRoHII$risk_score)
# 3.488815
sd(FRoHII$risk_score)
# 1.660645
1 - pnorm(6, mean=3.488815, sd=1.660645)
# answer is 6.52%

# to generate the normal distribution curve - here are the codes
# find out the lowest and highest values to create the xaxis
min(FRoHII$risk_score)
max(FRoHII$risk_score)
# create the intervals for the x-axis
intervals <- seq(0, 12, 1)
intervals
# create actual x-axis for every single possible value between 0 to 12
x_axis <- seq(0, 12, by = 0.01)
# we use to x_axis and our known mean and SD 
probability_estimates <- dnorm(x_axis, mean = 3.488815, sd = 1.660645)
# we need to know highest plausible value to inform the yaxis
max(probability_estimates)

# create a plot from scratch
plot(x_axis, probability_estimates, type = "l", lwd = 3, axes = FALSE,
	main = "Probability Distribution for Housing Insecurity Risk in England",
	xlab = "Housing Risk", ylab = "Probability Density")
# add x-axis and use the interval breaks we created earlier on
axis(1, at = intervals)
axis(2, at = c(0, 0.05, 0.10, 0.15, 0.20, 0.25))
# add mean reference line
abline(v=3.488815, lwd = 1.5, lty = "dashed", col="black")
# add shaded area under the curve (right-side)
polygon(
	c(x_axis[x_axis>=6], 6), 
	c(probability_estimates[x_axis>=6], probability_estimates[x_axis==max(x_axis)]), 
	col="red")