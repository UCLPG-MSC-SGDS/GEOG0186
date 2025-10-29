
setwd("/Users/anwarmusah/Documents/Websites/GEOG0186/datasets/All Data/")

# pollution dataset cleaning
pollution_data <- read.csv("Barcelona_Air_Pollution_DayNight-Time_data.csv")
pollution_data$Day <- substr(pollution_data$ReadingDate, 1, 2)
pollution_agg_data <- aggregate(
	list(pollution_data$NO2_est, pollution_data$PM10_est), 
	FUN = mean, by = list(pollution_data$Day, pollution_data$Type)) 

pollution_agg_data <- pollution_agg_data[!is.na(pollution_agg_data$c.61L..59L..29L..75L..23L..49L..43L..35L..83L..75L..71L..56L..),]
pollution_agg_data$Group.1 <- paste(pollution_agg_data$Group.1, "-09-2018", sep = "")

colnames(pollution_agg_data)[1] <- "DateObservation"
colnames(pollution_agg_data)[2] <- "DayType"
colnames(pollution_agg_data)[3] <- "NO2_Daily_Average"
colnames(pollution_agg_data)[4] <- "PM10_Daily_Average"

pollution_agg_data <- pollution_agg_data[order(pollution_agg_data$DateObservation, pollution_agg_data$DayType),]
row.names(pollution_agg_data) <- 1:nrow(pollution_agg_data)

write.csv(pollution_agg_data, file = "Barcelona_Air_Pollution_DayNight-Time_data.csv", row.names = FALSE)

air_pollution_daily_data <- read.csv("Barcelona_Air_Pollution_DayNight-Time_data.csv")

# Barebones
plot(pollution_agg_data$NO2_Daily_Average, pollution_agg_data$PM10_Daily_Average)

# Insert the relevant information with regards to labelling for xy-axes, and title 
plot(pollution_agg_data$NO2_Daily_Average, pollution_agg_data$PM10_Daily_Average,
	xlab = "Daily Average NO2 (ppb)", 
	ylab = "Daily Average PM10 (μm)",
	main = "Scatterplot: Examining the impacts of NO2 on PM10 in Barcelona (all points)"
)

# adding a subscript to text of labels
plot(pollution_agg_data$NO2_Daily_Average, pollution_agg_data$PM10_Daily_Average,
	xlab = expression("Daily Average NO"[2]*" (ppb)"), 
	ylab = expression("Daily Average PM"[10]*" (μm)"),
	main = expression("Scatterplot: Examining the impacts of NO"[2]*" on PM"[10]*" in Barcelona (all points)")
)

# what about making the labels boldface
# You can wrap the text labeling with the bold() function inside the expression()
plot(pollution_agg_data$NO2_Daily_Average, pollution_agg_data$PM10_Daily_Average,
	xlab = expression(bold("Daily Average NO"[2]*" (ppb)")), 
	ylab = expression(bold("Daily Average PM"[10]*" (μm)")),
	main = expression(bold("Scatterplot: Examining the impacts of NO"[2]*" on PM"[10]*" in Barcelona (all points)"))
)

# You can do the same thing with apply bolditalic() function wrapped on text labeling inside the expression()
plot(pollution_agg_data$NO2_Daily_Average, pollution_agg_data$PM10_Daily_Average,
	xlab = expression(bold("Daily Average "*bolditalic(NO)[2]*" (ppb)")), 
	ylab = expression(bold("Daily Average PM"[10]*" (μm)")),
	main = expression(bold("Scatterplot: Examining the impacts of NO"[2]*" on PM"[10]*" in Barcelona (all points)"))
)

# they only work within the expression() function!

# controlling the limits for x-y axes
summary(pollution_agg_data$NO2_Daily_Average)
summary(pollution_agg_data$PM10_Daily_Average)

plot(pollution_agg_data$NO2_Daily_Average, pollution_agg_data$PM10_Daily_Average,
	xlab = expression(bold("Daily Average NO"[2]*" (ppb)")), 
	ylab = expression(bold("Daily Average PM"[10]*" (μm)")),
	main = expression(bold("Scatterplot: Examining the impacts of NO"[2]*" on PM"[10]*" in Barcelona (all points)")), 
	ylim = c(20, 40),
	xlim = c(40, 80)
)

# controlling the frame/box type
# you can control this by using the bty = in plot()

#o: complete box (default parameter),
#n: no box
#7: top + right
#L: bottom + left
#C: top + left + bottom
#U: left + bottom + right
# But your go to option is "L"

plot(pollution_agg_data$NO2_Daily_Average, pollution_agg_data$PM10_Daily_Average,
	xlab = expression(bold("Daily Average NO"[2]*" (ppb)")), 
	ylab = expression(bold("Daily Average PM"[10]*" (μm)")),
	main = expression(bold("Scatterplot: Examining the impacts of NO"[2]*" on PM"[10]*" in Barcelona (all points)")), 
	ylim = c(20, 40),
	xlim = c(40, 80),
	bty = "L"
)

# controlling the symbol type 1-25
plot(pollution_agg_data$NO2_Daily_Average, pollution_agg_data$PM10_Daily_Average,
	xlab = expression(bold("Daily Average NO"[2]*" (ppb)")), 
	ylab = expression(bold("Daily Average PM"[10]*" (μm)")),
	main = expression(bold("Scatterplot: Examining the impacts of NO"[2]*" on PM"[10]*" in Barcelona (all points)")),
	ylim = c(20, 40),
	xlim = c(40, 80),
	bty = "L",
	pch = 25,
)

# Changing the overall orientation of the labels on both axes. Here, we use the las = [integer] argument

#0: parallel to the axes
#1: horizontal
#2: perpendicular to the axes
#3: vertical

plot(pollution_agg_data$NO2_Daily_Average, pollution_agg_data$PM10_Daily_Average,
	xlab = expression(bold("Daily Average NO"[2]*" (ppb)")), 
	ylab = expression(bold("Daily Average PM"[10]*" (μm)")),
	main = expression(bold("Scatterplot: Examining the impacts of NO"[2]*" on PM"[10]*" in Barcelona (all points)")), 
	ylim = c(20, 40),
	xlim = c(40, 80),
	bty = "L",
	pch = 25,
	las = 1
)

# We have full control of the colours

# col
# col.main
# col.lab

plot(pollution_agg_data$NO2_Daily_Average, pollution_agg_data$PM10_Daily_Average,
	xlab = expression(bold("Daily Average NO"[2]*" (ppb)")), 
	ylab = expression(bold("Daily Average PM"[10]*" (μm)")),
	main = expression(bold("Scatterplot: Examining the impacts of NO"[2]*" on PM"[10]*" in Barcelona (all points)")), 
	ylim = c(20, 40),
	xlim = c(40, 80),
	bty = "L",
	pch = 25,
	las = 1,
	col = "darkolivegreen",
	col.main = "darkolivegreen",
	col.lab = "darkolivegreen",
)

# fully customised graph - coded fully
# Remove the default axes so we can fully control them
plot(pollution_agg_data$NO2_Daily_Average, pollution_agg_data$PM10_Daily_Average,
	xlab = expression(bold("Daily Average NO"[2]*" (ppb)")), 
	ylab = expression(bold("Daily Average PM"[10]*" (μm)")),
	main = expression(bold("Scatterplot: Examining the impacts of NO"[2]*" on PM"[10]*" in Barcelona (all points)")), 
	ylim = c(20, 40),
	xlim = c(40, 80),
	bty = "L",
	pch = 25,
	las = 1,
	col = "darkolivegreen",
	col.main = "darkolivegreen",
	col.lab = "darkolivegreen",
	axes = FALSE
)

# Add Major ticks
axis(1, at = seq(40, 80, by = 10), labels = seq(40, 80, by = 10), tcl = -0.7)
axis(2, at = seq(20, 40, by = 5), labels = seq(20, 40, by = 5), las = 1, tcl = -0.7)

# Add Minor ticks
axis(1, at = seq(40, 80, by = 1), labels = FALSE, tcl = -0.3)
axis(2, at = seq(20, 40, by = 1), labels = FALSE, tcl = -0.3)

# Add box back
box(bty = "L")


# Add legends according to category

# save the names of the categories - this will be used inside the legend
categories <- c("Day-time", "Night-time")
# This line of code is a compact way to map categories to colours automatically in base R.
colours <- c("lightblue", "grey")[as.factor(pollution_agg_data$DayType)]
# The same thing for the symbols. Similarly, this is compact way to map categories to the desired symbols automatically in base R.
shapes <- c(25, 17)[as.factor(pollution_agg_data$DayType)]


# final plot
plot(pollution_agg_data$NO2_Daily_Average, pollution_agg_data$PM10_Daily_Average,
	xlab = expression(bold("Daily Average NO"[2]*" (ppb)")), 
	ylab = expression(bold("Daily Average PM"[10]*" (μm)")),
	main = expression(bold("Scatterplot: Examining the impacts of NO"[2]*" on PM"[10]*" in Barcelona (all points)")), 
	ylim = c(20, 40),
	xlim = c(40, 80),
	bty = "L",
	pch = shapes,
	bg = colours,
	col = colours,
	las = 1,
	col.main = "darkolivegreen",
	col.lab = "darkolivegreen",
	axes = FALSE
)

# Add Major ticks
axis(1, at = seq(40, 80, by = 10), labels = seq(40, 80, by = 10), tcl = -0.7)
axis(2, at = seq(20, 40, by = 5), labels = seq(20, 40, by = 5), las = 1, tcl = -0.7)

# Add Minor ticks
axis(1, at = seq(40, 80, by = 1), labels = FALSE, tcl = -0.3)
axis(2, at = seq(20, 40, by = 1), labels = FALSE, tcl = -0.3)

# Add box back
box(bty = "L")

# Add legend
legend("topright", legend = categories, bty = "n",
	pch = c(25, 17), 
	col = c("lightblue", "grey"),
	pt.bg = c("lightblue", "grey"),
	title = expression(bold("Observation Type"))
)

boxplot(air_pollution_daily_data$NO2_Daily_Average ~ air_pollution_daily_data$DayType,
	col = c("lightblue", "grey"),
	main = expression(bold("NO"[2]*" Concentrations")),
	ylab = expression(bold("Concentration (μg/m³)")),
	xlab = ""
	)

boxplot(air_pollution_daily_data$PM10_Daily_Average ~ air_pollution_daily_data$DayType,
	col = c("lightblue", "grey"),
	main = expression(bold("PM"[10]*" Concentrations")),
	ylab = expression(bold("Concentration (μg/m³)")),
	xlab = ""
	)



par(mfrow = c(1, 2))

boxplot(air_pollution_daily_data$NO2_Daily_Average ~ air_pollution_daily_data$DayType,
	col = c("lightblue", "grey"),
	main = expression(bold("NO"[2]*" Concentrations")),
	ylab = expression(bold("Concentration (μg/m³)")),
	xlab = ""
)

boxplot(air_pollution_daily_data$PM10_Daily_Average ~ air_pollution_daily_data$DayType,
	col = c("lightblue", "grey"),
	main = expression(bold("PM"[10]*" Concentrations")),
	ylab = expression(bold("Concentration (μg/m³)")),
	xlab = ""
)


par(mfrow = c(1, 1))  # Reset layout
