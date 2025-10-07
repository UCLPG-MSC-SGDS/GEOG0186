
setwd('/Users/anwarmusah/Desktop/GEOG0186/Week 2')

school_data <- read.csv(file = "Primary Schools in Ealing.csv")

names(school_data)
str(school_data)
school_data$OfstedGrade <- as.factor(school_data$OfstedGrade)
head(school_data, n = 10)
tail(school_data, n = 10)
nrow(school_data)
ncol(school_data)
dim(school_data)