
# solutions
# create vector objects
GoProID <- c("GOPRO0042", "GOPRO0061", "GOPRO0077", "GOPRO0098")
Latitude <- c(5.5547, 5.5545, 5.5552, 5.5538)
Longitude <- c(-0.2390, -0.2383, -0.2368, 0.2356)
Sanitation <- c("Clean", "Poor", "Poor", "Poor")
SolidWaste <- c("None", "Present", "Filled with Plastic", "Present")
Structure <- c("Not Damaged", "Not Damaged", "Not Damaged", "Run off")
Stagnation <- c("None", "Present", "None", "Present")
Mosquitoes <- c("None", "Breeding Spot", "None", "Breeding Spot")

# create data frame
drainage_data <- data.frame(GoProID, Latitude, Longitude, Sanitation, SolidWaste, Structure, Stagnation, Mosquitoes)

# subsetting on rows and columns
drainage_data_filter <- drainage_data[drainage_data$Sanitation == "Poor" & drainage_data$Mosquitoes == "Breeding Spot", c(1, 2, 3, 4, 8)]

# save
write.csv(drainage_data_filter, file = "Filtered_Drainage_Data.csv", row.names = FALSE)