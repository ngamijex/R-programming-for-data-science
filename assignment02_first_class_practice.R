# Assignment 2: Practicing the first class programs
# notes: https://rpubs.com/Mapara_lee/1434996
# also class notes: https://rpubs.com/Mapara_lee/1432408

# vectors
age <- c(20, 35, 32, 29)
summary(age)
mean(age)

# matrix
x <- matrix(1:6, nrow = 2, ncol = 3)
y <- matrix(1:6, nrow = 3, ncol = 2)
x %*% y

# data frame
studentID <- c(1, 2, 3, 4, 5)
math_score <- c(12, 17, 10, 9, NA)
gender <- c("M", "F", "M", "M", "F")
it_score <- c(13, 18, 11, 10, 19)
scoredata <- data.frame(studentID, gender, math_score, it_score)
scoredata

# import class data
data_class <- read.table("data/class_data.txt", header = TRUE)
head(data_class)
summary(data_class)
c(Mean = mean(data_class$HEIGHT), SD = sd(data_class$HEIGHT))

# BMI
attach(data_class)
BMI <- round(WEIGHT / (HEIGHT / 100)^2, digit = 2)
new_data_class <- cbind(data_class, BMI)
head(new_data_class)
detach(data_class)

# built-in + plot
data("iris")
by(iris$Petal.Length, iris$Species, mean)
boxplot(iris$Sepal.Length ~ iris$Species, data = iris,
        main = "Sepal length by species")

plot(WEIGHT ~ HEIGHT, data = data_class)
abline(lm(WEIGHT ~ HEIGHT, data = data_class)$coefficient)
cor(data_class$HEIGHT, data_class$WEIGHT)
