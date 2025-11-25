

library("openair")

# Question 1

dataset_aurn_CA1_CLL2 <- importAURN(
	site = c("CA1", "CLL2"), 
	year = 2025, 
	data_type = "daily", 
	pollutant = c("pm2.5", "pm10")
	)


# Question 2

dataset_aurn_CA1_CLL2$date_formatted <- as.Date(dataset_aurn_CA1_CLL2$date, format = "%Y-%m-%d")
class(dataset_aurn_CA1_CLL2$date_formatted)

# filter the dataset
dataset_aurn_CA1 <- dataset_aurn_CA1_CLL2[dataset_aurn_CA1_CLL2$code == "CA1",]
dataset_aurn_CLL2 <- dataset_aurn_CA1_CLL2[dataset_aurn_CA1_CLL2$code == "CLL2",]

# plot 1
plot(dataset_aurn_CA1$pm2.5 ~ dataset_aurn_CA1$date_formatted, 
	type="l", 
	lwd=1.5, 
	main="AURN: Camden Kerside (CA1)", 
	ylab = "PM2.5 [μg/m³, Daily Average]", 
	xlab = "Date [2025-01-01 to present]",
	bty = "L",
	xaxt = "n")

axis.Date(
	side=1, 
	at=seq(min(dataset_aurn_CA1$date_formatted), max(dataset_aurn_CA1$date_formatted), by = "months"), 
	format="%Y-%m-%d", 
	cex.axis = .9, 
	labels = TRUE)

# plot 2
plot(dataset_aurn_CLL2$pm2.5 ~ dataset_aurn_CLL2$date_formatted, 
	type="l", 
	lwd=1.5, 
	main="AURN: London Bloomsbury (CLL2)", 
	ylab = "PM2.5 [μg/m³, Daily Average]", 
	xlab = "Date [2025-01-01 to present]",
	bty = "L",
	xaxt = "n")

axis.Date(
	side=1, 
	at=seq(min(dataset_aurn_CLL2$date_formatted), max(dataset_aurn_CLL2$date_formatted), by = "months"), 
	format="%Y-%m-%d", 
	cex.axis = .9, 
	labels = TRUE)

# Question 3

# overall CA1
summary(dataset_aurn_CA1$pm2.5, na.rm = TRUE)
sd(dataset_aurn_CA1$pm2.5, na.rm = TRUE)
# overall CLL2
summary(dataset_aurn_CLL2$pm2.5, na.rm = TRUE)
sd(dataset_aurn_CLL2$pm2.5, na.rm = TRUE)

# generate a quarters columns
dataset_aurn_CA1$quarters <- quarters(dataset_aurn_CA1$date_formatted)
dataset_aurn_CLL2$quarters <- quarters(dataset_aurn_CLL2$date_formatted)

# by quarterly groups
# CA1
tapply(dataset_aurn_CA1$pm2.5, dataset_aurn_CA1$quarters, mean, na.rm = TRUE)
tapply(dataset_aurn_CA1$pm2.5, dataset_aurn_CLL2$quarters, sd, na.rm = TRUE)

# CLL2
tapply(dataset_aurn_CLL2$pm2.5, dataset_aurn_CLL2$quarters, mean, na.rm = TRUE)
tapply(dataset_aurn_CLL2$pm2.5, dataset_aurn_CLL2$quarters, sd, na.rm = TRUE)