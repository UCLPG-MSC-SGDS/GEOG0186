
# setting my working directory
setwd("/Users/anwarmusah/Desktop/GEOG0186/Week 3")

# read.csv() for importing comma separated file (csv)
air_quality_data <- read.csv(file = "Barcelona_Air_Pollution_data.csv")

# See the data viewer
View(air_quality_data)
head(air_quality_data)

# NO2_est
air_quality_data$NO2_est
min(air_quality_data$NO2_est)
# minimum NO2: 2

max(air_quality_data$NO2_est)

# 1-10
# 11-20
# 21-30
# 31-40
# 41-50
# 51-60
# 61-70
# 71-80
# 81-90
# 91-100
# 101-110
# 111-120
# 121-130

classes <- seq(0, 130, 10)
air_quality_data$Groups <- cut(air_quality_data$NO2_est, breaks = classes)

table(air_quality_data$Groups)

# Generating Frequency Tables
frequency_table <- data.frame(table(air_quality_data$Groups))

# renaming columns
colnames(frequency_table)[1] <- "Groups"
colnames(frequency_table)[2] <- "Frequency"

# Calculation of relative frequency (proportion)
frequency_table$relativeFreq <- frequency_table$Frequency/718

# Calculation of cumulative frequency and cumulative relative frequency (proportion)
frequency_table$cumulativeFreq <- cumsum(frequency_table$Frequency)
frequency_table$cumulativeRelFreq <- cumsum(frequency_table$relativeFreq)

# Plotting in R
# how to generate a histogram
hist(air_quality_data$NO2_est, breaks = classes)

# apply so cosmetic features to the histogram plot
hist(air_quality_data$NO2_est, breaks = classes, 
	main = "Histogram: NO2 levels in Barcelona", 
	xlab = "NO2 ambient measurements [ppb]", 
	ylab = "Frequency Distribution")

# Cumulative Frequency Curve/Plot
cumulfreq <- c(0, cumsum(frequency_table$Frequency))
cumulfreq
plot(classes, cumulfreq)

# Apply the cosmetic features to graph
plot(classes, cumulfreq, main = "Cumulative Frequency Plot: NO2 levels in Barcelona",
	xlab = "NO2 ambient measurements [ppb]", ylab = "Cumulative Frequencies")
lines(classes, cumulfreq)


# PM10
min(air_quality_data$PM10_est)
max(air_quality_data$PM10_est)

# create classes
classes_PM10 <- seq(0, 60, 5)
air_quality_data$Groups_PM10 <- cut(air_quality_data$PM10_est, breaks = classes_PM10)
table(air_quality_data$Groups_PM10)

# Generating Frequency Tables
frequency_table_PM10 <- data.frame(table(air_quality_data$Groups_PM10))

# renaming columns
colnames(frequency_table_PM10)[1] <- "Groups"
colnames(frequency_table_PM10)[2] <- "Frequency"

# Calculation of relative frequency (proportion)
frequency_table_PM10$relativeFreq <- frequency_table_PM10$Frequency/718

# Calculation of cumulative frequency and cumulative relative frequency (proportion)
frequency_table_PM10$cumulativeFreq <- cumsum(frequency_table_PM10$Frequency)
frequency_table_PM10$cumulativeRelFreq <- cumsum(frequency_table_PM10$relativeFreq)

# histogram plot
hist(air_quality_data$PM10_est, 
	breaks = classes_PM10, main = "Histogram: PM10 in Barcelona", 
	xlab = "PM10 estimates [μm]")