
# setting my working directory
setwd("/Users/anwarmusah/Desktop/GEOG0186/Week 3")

# read.csv() for importing comma separated file (csv)
air_quality_data <- read.csv(file = "Barcelona_Air_Pollution_data.csv")

# See the data viewer
View(air_quality_data)
head(air_quality_data)