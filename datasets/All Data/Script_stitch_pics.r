
install.packages("magick")   # run once if not installed
library(magick)

setwd("/Users/anwarmusah/Downloads/Ethiopia UG Diss")

img1 <- image_read("SSP1.26 Climate Scenario.png")
img2 <- image_read("SSP3.70 Climate Scenario.png")
img3 <- image_read("SSP5.85 Climate Scenario.png")

portrait <- image_append(c(img1, img2, img3), stack = TRUE)

image_write(portrait, "SSP_combined Climate Scenario.png")
