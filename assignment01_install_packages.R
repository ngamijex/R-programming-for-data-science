# Assignment 1: Installing packages
# packages we need for the class

# run once
# install.packages("ggplot2")
# install.packages("readr")
# install.packages("readxl")
# install.packages("haven")
# install.packages("dplyr")
# install.packages("tidyr")
# install.packages("nycflights13")

library(ggplot2)
library(readr)
library(dplyr)

# check they loaded
sessionInfo()

# quick test
data(mtcars)
head(mtcars)
ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()
