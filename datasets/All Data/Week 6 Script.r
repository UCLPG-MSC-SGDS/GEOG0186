rm(list = ls())
gc()

setwd("/Users/anwarmusah/Desktop/GEOG0186/Week 6")

URL_london_recycling <- "https://data.london.gov.uk/download/vd67o/15ddc38a-0a37-4f69-98b5-e69e549b39d3/Household-rcycling-borough.csv"
URL_london_flytipping <- "https://data.london.gov.uk/download/e5myg/536278ff-a391-4f20-bc79-9e705c9b3ec0/fly-tipping-borough.csv"

# create URL as a object

# ask RStudio to download the CSV file to your working directory
download.file(URL_london_recycling, destfile = "London_households_recycling_borough.csv", mode = "wb")
download.file(URL_london_flytipping, destfile = "London_flytipping_borough.csv", mode = "wb")

# read csv data
recycling_data <- read.csv("London_households_recycling_borough.csv")
flytipping_data <- read.csv("London_flytipping_borough.csv")

# inspect structure of datasets
# recycling
str(recycling_data)
head(recycling_data)

#
str(flytipping_data)
head(flytipping_data)

# Average spill duration by company
avg_recycling_rates <- tapply(recycling_data$Recycling_Rates, recycling_data$Area, mean, na.rm = TRUE)
avg_recycling_rates

