rm(list = ls())
gc()

setwd("/Users/anwarmusah/Documents/Websites/GEOG0013/data/Tutorials")

air_quality_data <- read.csv("Barcelona_Air_Pollution_data.csv")

summary(air_quality_data$NO2_est)

# create those classes
intervals <- seq(0, 130, 10)
intervals

# base the tail ends of the x-axis on lowest and highest value of the breaks
# create x-axis
x_axis <- seq(2, 130, by = 0.01)

# the original plot
hist(
	air_quality_data$NO2_est, 
	breaks = intervals,
	main = "Histogram for NO2 in Barcelona", 
	xlab = "NO2 estimates (ppb)",
	ylab = "Frequency Distribution"
)

# normal curve
probability_estimates <- dnorm(x_axis, mean = mean(air_quality_data$NO2_est), sd = sd(air_quality_data$NO2_est))

hist(
	air_quality_data$NO2_est, 
	breaks = intervals,
	prob = TRUE,
	ylim = c(0, max(probability_estimates)),
	main = "Histogram for NO2 in Barcelona", 
	xlab = "NO2 estimates (ppb)",
	ylab = "Probability Density"
	)
lines(x_axis, probability_estimates, col = 2, lwd = 2)

# create a plot from scratch
plot(x_axis, probability_estimates, type = "l", lwd = 3, axes = FALSE,
	main = "Probability [Normal] Distribution for NO2 in Barcelona",
	xlab = "NO2 values", ylab = "Probability Density")
# add x-axis and use the classes breaks from the histogram
axis(1, at = intervals)
# add y-axis and start from 0 and end at 0.020 at intervals of 0.005
axis(2, at = c(0, 0.005, 0.010, 0.015, 0.020))
# add vertical line for mean = 59.69
abline(v=59.69, lwd = 1.5, col="black")
# add two vertical lines for the plus and minus values for our sd = 20.63
abline(v=c(39.16, 80.22), lty="dashed", lwd = 1.5, col="red")

# create a plot from with shaded areas
plot(x_axis, probability_estimates, type = "l", lwd = 3, axes = FALSE,
	main = "Probability of NO2 being at most (or reaching) 45ppb",
	xlab = "NO2 values", ylab = "Probability Density")
# add x-axis and use the classes breaks from the histogram
axis(1, at = intervals)
# add y-axis and start from 0 and end at 0.020 at intervals of 0.005
axis(2, at = c(0, 0.005, 0.010, 0.015, 0.020))
# add mean reference line
abline(v=59.69, lwd = 1.5, lty = "dashed", col="black")
# add shaded area under the curve (left-side)
polygon(
	c(min(x_axis), x_axis[x_axis < 45], 45), 
	c(0, probability_estimates[x_axis < 45], 0),  
	col="red")


# create a plot from scratch
plot(x_axis, probability_estimates, type = "l", lwd = 3, axes = FALSE,
	main = "Probability of NO2 being at least (or exceeding) 80ppb",
	xlab = "NO2 values", ylab = "Probability Density")
# add x-axis and use the classes breaks from the histogram
axis(1, at = intervals)
# add y-axis and start from 0 and end at 0.020 at intervals of 0.005
axis(2, at = c(0, 0.005, 0.010, 0.015, 0.020))
# add mean reference line
abline(v=59.69, lwd = 1.5, lty = "dashed", col="black")

# add shaded area under the curve (right-side)
polygon(
	c(x_axis[x_axis>=80], 80), 
	c(probability_estimates[x_axis>=80], probability_estimates[x_axis==max(x_axis)]), 
	col="red")


# create a plot from scratch
plot(x_axis, probability_estimates, type = "l", lwd = 3, axes = FALSE,
	main = "Probability of NO2 being between 45ppb and 80ppb",
	xlab = "NO2 values", ylab = "Probability Density")
# add x-axis and use the classes breaks from the histogram
axis(1, at = intervals)
# add y-axis and start from 0 and end at 0.020 at intervals of 0.005
axis(2, at = c(0, 0.005, 0.010, 0.015, 0.020))

# add shaded area under the curve (middle)
polygon(
	c(45, x_axis[x_axis>=45 & x_axis<=80], 80), 
	c(0, probability_estimates[x_axis>=45 & x_axis<=80] ,0),
	col="red")
# add mean reference line
abline(v=59.69, lwd = 1.5, lty = "dashed", col="black")
