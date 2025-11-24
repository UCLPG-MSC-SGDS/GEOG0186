
#
install.packages("openair")
install.packages("openairmaps")
install.packages("lubridate")

library("openair")
library("openairmaps")
library("lubridate")

# Camden Kerside
# ca1

# London Bloomsbury
# cll2

data <- importAURN(site = c("ca1", "cll2"),
	year = 2025,
	data_type = "daily",
	pollutant = c("pm2.5", "pm10"))

# view list of all points
all_airpollution_aurn <- importMeta(source = "aurn", all = TRUE)
View(all_airpollution_aurn)


# map of all air pollution monitors
networkMap(source = "aurn", control = "site_type")

# let extract the following measures at the following network

# London Westminter (HORS)
# London Farringdon Street (LOFS)

#NO2 PM2.5 NOX temp Ozone

# as demonstration

# we going to pull the records from 2024 to present

air_KC1 <- importAURN(
	site = "KC1", 
	year = 2025, 
	data_type = "daily", 
	pollutant = c("no2", "nox", "pm2.5", "pm10"))


# let format the date column and render it into a proper date format

air_KC1$date_formatted <- as.Date(air_KC1$date, format = "%Y-%m-%d")
# class() confirms if the column is a date formate
class(air_KC1$date_formatted)

# let's generate the time series plot

# use 'DateFixed' column AND RUN TWO LINES TOGETHER
plot(air_KC1$no2 ~ air_KC1$date_formatted, 
	type="l", lwd=1.5, main="AURN: London North Kensington", 
	ylab = "NO2 [PPB, Daily Average]", 
	xlab = "Date [2025-01-01 to 2025-11-22]", xaxt = "n")
axis.Date(side=1, 
	at=seq(min(air_KC1$date_formatted), max(air_KC1$date_formatted), by = "months"), 
	format="%Y-%m-%d", cex.axis = .9, labels = TRUE)

# it is possible to calculate the overall mean and standard deviation of NO2 across the time period by simply using the summary() function
summary(air_KC1$no2, na.rm = TRUE)
sd(air_KC1$no2, na.rm = TRUE)

# This basically produces an overall description of the distribution of NO2. But, because it is time series data, it is best practice to 
# report these summaries in quarterly, or monthly, to see if their a distinct pattern that is temporally apparent.

# lets see quarterly summaries

air_KC1$quarters <- quarters(air_KC1$date_formatted)

# New column will be generated with each date defined as Q1, Q2, Q3 or Q4.
# now we can use tapply() function to compute mean and sd across these quarters

tapply(air_KC1$no2, air_KC1$quarters, mean, na.rm = TRUE)
tapply(air_KC1$no2, air_KC1$quarters, sd, na.rm = TRUE)

# If you want break it down by month - the coding a little bit involved. Unlike the `quarters()` function, a version of that to get 
# breakdown by month do not exist. So we will be a bit creative and pull the month value from the actual date to group the dataset accordingly.

# In the "date" column (i.e., YYYY-MM-DD) month string is contained as 6th and 7th character in this string. We are going to extract 6th and 7th character
# to create a month column only - so we can group the measures to get the monthly means of NO2. Here, we can use the `substr()` function to achieve
# this.

air_KC1$months <- substr(air_KC1$date, 6, 7)


# now we can use tapply() function to compute mean and sd across these months

tapply(air_KC1$no2, air_KC1$months, mean, na.rm = TRUE)
tapply(air_KC1$no2, air_KC1$months, sd, na.rm = TRUE)



# Remove the default axes for full control by adding `axes = FALSE` in the `plot()`
plot(air_KC1$no2, air_KC1$pm2.5,
	xlab = "Daily Average NO2 (ppb)", 
	ylab = "Daily Average PM2.5 (μg/m³)",
	main = "Scatterplot: NO2 versus  PM2.5 [Code: KCL]",
	bty = "L",
	pch = 16,
	las = 1,
)

# Here, we have full control of the x-axis - add the major ticks
axis(1, at = seq(40, 80, by = 10), labels = seq(40, 80, by = 10), tcl = -0.7)
# Here, we have full control of the y-axis - add the major ticks
axis(2, at = seq(20, 40, by = 5), labels = seq(20, 40, by = 5), las = 1, tcl = -0.7)

# Again, full control of the x-axis - add the minor ticks
axis(1, at = seq(40, 80, by = 1), labels = FALSE, tcl = -0.3)
# Again, full control of the y-axis - add the minor ticks
axis(2, at = seq(20, 40, by = 1), labels = FALSE, tcl = -0.3)

# Add "L" box back
box(bty = "L")



