#2025 Air quality practical R code
#Change the working directory to desktop
setwd("~/Desktop")
CAM <- read.csv("AirQualityData2.csv",skip=4)
View(CAM)
summary(CAM)

#Mean and standard deviation for the four quarters (adapted for 2020 as leap year) 
mean(CAM$PM10.particulate.matter..Hourly.measured.[1:91], na.rm=TRUE)
mean(CAM$PM10.particulate.matter..Hourly.measured.[92:182], na.rm=TRUE)
mean(CAM$PM10.particulate.matter..Hourly.measured.[183:274], na.rm=TRUE)
mean(CAM$PM10.particulate.matter..Hourly.measured.[275:366], na.rm=TRUE)
sd(CAM$PM10.particulate.matter..Hourly.measured.[1:91], na.rm=TRUE)
sd(CAM$PM10.particulate.matter..Hourly.measured.[92:182], na.rm=TRUE)
sd(CAM$PM10.particulate.matter..Hourly.measured.[183:274], na.rm=TRUE)
sd(CAM$PM10.particulate.matter..Hourly.measured.[275:366], na.rm=TRUE)

mean(CAM$PM10.particulate.matter..Hourly.measured..1[1:91], na.rm=TRUE)
mean(CAM$PM10.particulate.matter..Hourly.measured..1[92:182], na.rm=TRUE)
mean(CAM$PM10.particulate.matter..Hourly.measured..1[183:274], na.rm=TRUE)
mean(CAM$PM10.particulate.matter..Hourly.measured..1[275:366], na.rm=TRUE)
sd(CAM$PM10.particulate.matter..Hourly.measured..1[1:91], na.rm=TRUE)
sd(CAM$PM10.particulate.matter..Hourly.measured..1[92:182], na.rm=TRUE)
sd(CAM$PM10.particulate.matter..Hourly.measured..1[183:274], na.rm=TRUE)
sd(CAM$PM10.particulate.matter..Hourly.measured..1[275:366], na.rm=TRUE)

mean(CAM$PM2.5.particulate.matter..Hourly.measured.[1:91], na.rm=TRUE)
mean(CAM$PM2.5.particulate.matter..Hourly.measured.[92:182], na.rm=TRUE)
mean(CAM$PM2.5.particulate.matter..Hourly.measured.[183:274], na.rm=TRUE)
mean(CAM$PM2.5.particulate.matter..Hourly.measured.[275:366], na.rm=TRUE)
sd(CAM$PM2.5.particulate.matter..Hourly.measured.[1:91], na.rm=TRUE)
sd(CAM$PM2.5.particulate.matter..Hourly.measured.[92:182], na.rm=TRUE)
sd(CAM$PM2.5.particulate.matter..Hourly.measured.[183:274], na.rm=TRUE)
sd(CAM$PM2.5.particulate.matter..Hourly.measured.[275:366], na.rm=TRUE)

mean(CAM$PM2.5.particulate.matter..Hourly.measured..1[1:91], na.rm=TRUE)
mean(CAM$PM2.5.particulate.matter..Hourly.measured..1[92:182], na.rm=TRUE)
mean(CAM$PM2.5.particulate.matter..Hourly.measured..1[183:274], na.rm=TRUE)
mean(CAM$PM2.5.particulate.matter..Hourly.measured..1[275:366], na.rm=TRUE)
sd(CAM$PM2.5.particulate.matter..Hourly.measured..1[1:91], na.rm=TRUE)
sd(CAM$PM2.5.particulate.matter..Hourly.measured..1[92:182], na.rm=TRUE)
sd(CAM$PM2.5.particulate.matter..Hourly.measured..1[183:274], na.rm=TRUE)
sd(CAM$PM2.5.particulate.matter..Hourly.measured..1[275:366], na.rm=TRUE)

mean(CAM$PM10.particulate.matter..Hourly.measured., na.rm=TRUE)
sd(CAM$PM10.particulate.matter..Hourly.measured., na.rm=TRUE)

mean(CAM$PM10.particulate.matter..Hourly.measured..1, na.rm=TRUE)
sd(CAM$PM10.particulate.matter..Hourly.measured..1, na.rm=TRUE)
mean(CAM$PM2.5.particulate.matter..Hourly.measured., na.rm=TRUE)
sd(CAM$PM2.5.particulate.matter..Hourly.measured., na.rm=TRUE)

mean(CAM$PM2.5.particulate.matter..Hourly.measured..1, na.rm=TRUE)
sd(CAM$PM2.5.particulate.matter..Hourly.measured..1, na.rm=TRUE)

#Scatterplot
fit1<- lm(CAM$PM10.particulate.matter..Hourly.measured. ~ CAM$PM2.5.particulate.matter..Hourly.measured., data=CAM)
ylab.text = expression(paste("Camden Kerbside PM10, µg m"^"-3"))
xlab.text = expression(paste("Camden Kerbside PM2.5, µg m"^"-3"))
plot(CAM$PM10.particulate.matter..Hourly.measured. ~ CAM$PM2.5.particulate.matter..Hourly.measured.,
     main="Camden Kerbside PM10 v PM2.5 concentrations, 2020", ylab="", 
     xlab=xlab.text,
     ylim=c(0,80),
     xlim=c(0,80))+abline(fit1)
integer(0)
mtext(ylab.text,side=2, line =2.5)

#This script provides the coefficients for the regression equation √
coefficients(fit1)

#Simple correlation of values for Camden Kerbside and London Bloomsbury (NB need add method = pearson  and some other details, but default = Pearson) √
cor.test(CAM$PM10.particulate.matter..Hourly.measured.,CAM$PM2.5.particulate.matter..Hourly.measured.)

#Time series plots for Camden Kerbside
#Plots a time series of PM10, versus, date, and joins the coordinates. 
ylab.text = expression('PM10, µg m'^"-3")
plot(CAM$PM10.particulate.matter..Hourly.measured..1 ~as.Date (CAM$Date, "%d/%m/%y"), 
     , pch=16,cex=1, lty=1, lwd="2", xlab="Month", ylab="", ylim=c(0,70), 
     main="Camden Kerbside, PM10 Concentrations, 2020")
lines(CAM$PM10.particulate.matter..Hourly.measured..1~as.Date(CAM$Date, "%d/%m/%y"),pch=16,cex=1)
mtext(ylab.text,side=2, line =2.5)

#Plots a time series of PM2.5, versus, date, and joins the coordinates. 

ylab.text = expression('PM2.5, µg m'^"-3")
plot(CAM$PM2.5.particulate.matter..Hourly.measured..1 ~as.Date (CAM$Date, "%d/%m/%y"), 
     , pch=16,cex=1, lty=1, lwd="2", xlab="Month", ylab="", ylim=c(0,70), 
     main="Camden Kerbside, PM2.5 Concentrations, 2020")
lines(CAM$PM2.5.particulate.matter..Hourly.measured..1~as.Date(CAM$Date, "%d/%m/%y"),pch=16,cex=1)
mtext(ylab.text,side=2, line =2.5)

