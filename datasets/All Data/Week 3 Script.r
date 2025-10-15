
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
