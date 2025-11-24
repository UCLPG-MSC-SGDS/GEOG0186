rm(list = ls())

install.packages("readr") # run this line only once after installing it
library("readr")

AirQualityData <- read_csv("Desktop/AirQualityData.csv")

# Delete blank columns
AirQualityData <- AirQualityData[,-c(3,5,7)]

# Delete last three blank lines
AirQualityData <- AirQualityData[-c(366:369),]

# that first plot
plot(AirQualityData$`C PM10 particulate matter (Hourly measured)`, AirQualityData$`LBPM10 particulate matter (Hourly measured)`, ylab = expression( paste("Bloomsbury PM10", mu, "gm"^"3")),  xlab = expression( paste("Kerside PM10", mu, "gm"^"3")), main = "Kerside vs. Bloomsbury PM10 readings")

# time series plot
# first cleaning date column to make it in date format
AirQualityData$Date <- as.character(AirQualityData$Date)
AirQualityData$Datedd <- substr(AirQualityData$Date, 1, 2)
AirQualityData$Datemm <- substr(AirQualityData$Date, 4, 5)
AirQualityData$Dateyyyy <- substr(AirQualityData$Date, 7, 10)
AirQualityData$vddmmyyyy <- paste(AirQualityData$Datedd,"-", AirQualityData$Datemm,"-", AirQualityData$Dateyyyy, sep="")

install.packages("lubridate") # run this line only once after installing it
library("lubridate") # load package to clean the date finally

AirQualityData$DateFixed <- format(dmy(AirQualityData$vddmmyyyy), "%d-%m-%Y")
AirQualityData$DateFixed <- as.Date(AirQualityData$DateFixed, "%d-%m-%Y")

# Delete junk columns
AirQualityData <- AirQualityData[,-c(6:9)]

# use 'DateFixed' column AND RUN TWO LINES TOGETHER
plot(AirQualityData$`C PM10 particulate matter (Hourly measured)`~AirQualityData$DateFixed, type="l", lwd=1.5, main="Camden", ylab = expression( paste("Kerside PM10", mu, "gm"^"3")), xlab = "Date [Daily]", xaxt = "n")
axis.Date(side=1, at=seq(min(AirQualityData$DateFixed), max(AirQualityData$DateFixed), by = "months"), format="%d-%m-%Y", cex.axis = .7, labels = TRUE)

