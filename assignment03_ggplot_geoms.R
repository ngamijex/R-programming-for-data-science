# Assignment 3: Geom package variations (read & practice)
# notes: https://rpubs.com/Mapara_lee/1432408

# install.packages("ggplot2")
# install.packages("lattice")   # for singer data
library(ggplot2)

data(mtcars)

# basic point
ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  labs(title = "Automobile Data", x = "Weight", y = "Miles per Gallon")

# point + smooth line
ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point(pch = 21, color = "blue", size = 2) +
  geom_smooth(method = "lm", color = "green") +
  labs(title = "Automobile Data", x = "Weight", y = "Miles per Gallon")

# theme practice
f0 <- ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point(shape = 24, fill = 1, size = 2) +
  geom_smooth(method = "lm", color = "blue")
f0
f1 <- f0 + theme_bw()
f1
f2 <- f1 + theme(panel.grid = element_line(linetype = "dotted", color = "black"))
f2

# grouping / facets
mtcars$am <- factor(mtcars$am, levels = c(0, 1), labels = c("Automatic", "Manual"))
mtcars$vs <- factor(mtcars$vs, levels = c(0, 1), labels = c("V-Engine", "Straight Engine"))
mtcars$cyl <- factor(mtcars$cyl)

ggplot(data = mtcars, aes(x = hp, y = mpg, shape = cyl, color = cyl)) +
  geom_point(size = 3) +
  facet_grid(vs ~ am) +
  labs(title = "Automobile Data by Engine Type",
       x = "HorsePower", y = "Miles per Gallon")

# try a few other geoms
ggplot(mtcars, aes(x = mpg)) + geom_histogram(bins = 10, fill = "steelblue")
ggplot(mtcars, aes(x = mpg)) + geom_density(fill = "lightblue")
ggplot(mtcars, aes(x = cyl, y = mpg)) + geom_boxplot()
ggplot(mtcars, aes(x = cyl)) + geom_bar()
ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point() + geom_hline(yintercept = mean(mtcars$mpg))
ggplot(mtcars, aes(x = wt, y = mpg)) + geom_jitter(width = 0.05) + geom_smooth(method = "lm")
ggplot(mtcars, aes(x = cyl, y = mpg)) + geom_violin(fill = "grey80")

# boxplot from lattice singer data (if package is installed)
# data(singer, package = "lattice")
# ggplot(singer, aes(x = voice.part, y = height)) + geom_boxplot()

# base R plots from class 2 notes (covid style barplots - small example)
data1 <- read.table(text = "A B C D
1 4 6 30 140
2 10 2 29 164", header = TRUE)
barplot(as.matrix(data1), main = "Example cases by group",
        beside = TRUE, col = c("gold3", "red"))
legend("topright", c("Male", "Female"), cex = 0.7, bty = "n",
       fill = c("gold3", "red"))
