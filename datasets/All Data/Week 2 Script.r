
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

# dataframe[ Row, Column ]

data11 <- school_data[ 1, 1 ]

data1 <- school_data[ 1, ]

dataCol1 <- school_data[ , 1]

# c( )
row_filter <- school_data[c(2,7,19) , ]

column_filter <- school_data[ , c(1,5,6)]

full_filter <- school_data[c(2,7,19), c(1,5,6)]


schools_500plus <- school_data[school_data$TotalStudents >= 500,  ]
schools_ofsted1 <- school_data[school_data$OfstedGrade == 1, ]
schools_650_ofsted2 <- school_data[school_data$TotalStudents > 650 & school_data$OfstedGrade == 2,]


write.csv(schools_650_ofsted2, file = "Filtered Dataset.csv", row.names = FALSE)








