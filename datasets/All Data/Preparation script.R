

# Cleaning data 

setwd("/Volumes/Anwar-HHD/GEOG0013/Github/2022_2023/data/Tutorials")

air_quality_data <- read.csv("air_quality_Nov2017.csv", header = TRUE, sep = ",")

table(air_quality_data$Station)

air_quality_data_eixample <- air_quality_data[air_quality_data$Station == "Barcelona - Eixample",]
air_quality_data_eixample <- air_quality_data_eixample[, c(1,9,10,12,13,14)]

colnames(air_quality_data_eixample)[1] <- "StationName"
colnames(air_quality_data_eixample)[2] <- "Grade"
colnames(air_quality_data_eixample)[3] <- "PM10"
colnames(air_quality_data_eixample)[4] <- "ReadingDate"

summary(air_quality_data_eixample$NO2.Value)moder
sd(air_quality_data_eixample$NO2.Value, na.rm = TRUE)
air_quality_data_eixample$NO2_est <- rnorm(n=718, mean = 60.24, sd = 20.17165)
air_quality_data_eixample$NO2_est <- round(air_quality_data_eixample$NO2_est, 0)

air_quality_data_eixample$NO2_category <- ""
air_quality_data_eixample$NO2_category[air_quality_data_eixample$NO2_est>= 0 & air_quality_data_eixample$NO2_est<= 10] <- "1. Negligible"
air_quality_data_eixample$NO2_category[air_quality_data_eixample$NO2_est>= 11 & air_quality_data_eixample$NO2_est<= 50] <- "2. Low health impact"
air_quality_data_eixample$NO2_category[air_quality_data_eixample$NO2_est>= 51 & air_quality_data_eixample$NO2_est<= 100] <- "3. Moderate health impact"
air_quality_data_eixample$NO2_category[air_quality_data_eixample$NO2_est>= 101 & air_quality_data_eixample$NO2_est<= 150] <- "4. High health impact"

summary(air_quality_data_eixample$PM10.Value)
sd(air_quality_data_eixample$PM10.Value, na.rm = TRUE)
air_quality_data_eixample$PM10_est <- rnorm(n=718, mean = 27.00, sd = 9.454874)
air_quality_data_eixample$PM10_est <- round(air_quality_data_eixample$PM10_est, 0) + 5

air_quality_data_eixample$PM10_category <- ""
air_quality_data_eixample$PM10_category[air_quality_data_eixample$PM10_est>= 0 & air_quality_data_eixample$PM10_est<= 10] <- "1. Negligible"
air_quality_data_eixample$PM10_category[air_quality_data_eixample$PM10_est>= 11 & air_quality_data_eixample$PM10_est<= 50] <- "2. Low health impact"
air_quality_data_eixample$PM10_category[air_quality_data_eixample$PM10_est>= 51 & air_quality_data_eixample$PM10_est<= 100] <- "3. Moderate health impact"


air_quality_data_eixample <- air_quality_data_eixample[, c(1,6:10)]
colnames(air_quality_data_eixample)[1] <- "Location"
colnames(air_quality_data_eixample)[2] <- "ReadingDate"
row.names(air_quality_data_eixample) <- 1:nrow(air_quality_data_eixample)

write.csv(air_quality_data_eixample, file = "Barcelona_Air_Pollution_data.csv", row.names = FALSE)

# exercise

air_quality_data <- read.csv("Barcelona_Air_Pollution_data.csv")

View(air_quality_data)
head(air_quality_data)

air_quality_data$NO2_est

classes <- seq(0, 130, 10)
classes

# tell the cut() function to group NO2_est using the classes object
air_quality_data$Groups <- cut(air_quality_data$NO2_est, breaks=classes)
air_quality_data$Groups

View(air_quality_data)

table(air_quality_data$Groups)

frequency_results <- data.frame(table(air_quality_data$Groups))
frequency_results

# rename first column t9 "Groups"
# rename second column to "Frequency"
# print new variable names in console using names() function

colnames(frequency_results)[1] <- "Groups"    
colnames(frequency_results)[2] <- "Frequency" 
names(frequency_results) 
frequency_results

# generate a new column
frequency_results$relativeFreq <- frequency_results$Frequency/718
frequency_results

# add cumulativeFreq column to the data frame by adding Frequency using cumsum() function
frequency_results$cumulativeFreq <- cumsum(frequency_results$Frequency)

# add cumulativeRelFreq column to the data frame by adding Frequency using cumsum() function
frequency_results$cumulativeRelFreq <- cumsum(frequency_results$relativeFreq)

# see table
frequency_results

hist(air_quality_data$NO2_est, breaks = classes)

hist(air_quality_data$NO2_est, breaks = classes, main = "Histogram for NO2 in Barcelona", xlab = "NO2 estimates (ppb)")


cumfreq0 <- c(0, cumsum(frequency_results$Frequency))
plot(classes, cumfreq0, main="Cumulative Frequency for N02 in Barcelona", xlab="NO2 estimates (ppb)", ylab="Cumulative Frequencies")
lines(classes, cumfreq0) 


# compute all descriptive summaries measurements
summary(air_quality_data$NO2_est)

# compute all descriptive summaries measurements
sd(air_quality_data$NO2_est)

# Box plot
boxplot(air_quality_data$NO2_est, ylab = "NO2 estimates (ppb)", main="Box plot: Summary of Nitrogen Dioxide in Barcelona")


# Import data using read.csv() function 
Rent_data <- read.csv(file="Barcelona_rents_2015.csv", header = TRUE, sep = ",")
# Import data using read.csv() function 
Cars_data <- read.csv(file="Barcelona_cars_2015.csv", header = TRUE, sep = ",")

# Show viewer the data sets
View(Rent_data)
View(Cars_data)

# Using the merge() function 
Barcelona_data <- merge(Rent_data, Cars_data, by.x = "neighbourhood", by.y = "neighbourhood", all.x = TRUE)

# View the datasets
View(Barcelona_data)