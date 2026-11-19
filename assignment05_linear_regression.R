# Assignment 5: Linear regression (read & practice)
# notes: https://rpubs.com/Mapara_lee/1436418

# ---- simple linear regression (women) ----
data("women")
fit <- lm(weight ~ height, data = women)
summary(fit)
fitted(fit)
residuals(fit)

plot(women$height, women$weight,
     xlab = "Height (in inches)", ylab = "Weight (in pounds)")
abline(fit)

# ---- polynomial ----
fit2 <- lm(weight ~ height + I(height^2), data = women)
summary(fit2)
plot(women$height, women$weight,
     xlab = "Height (in inches)", ylab = "Weight (in pounds)")
lines(women$height, fitted(fit2))

# diagnostics
par(mfrow = c(2, 2))
plot(fit)
plot(fit2)
par(mfrow = c(1, 1))

# without some points
newfit <- lm(weight ~ height + I(height^2), data = women[-c(13, 15), ])
par(mfrow = c(2, 2))
plot(newfit)
par(mfrow = c(1, 1))

# ---- mtcars ----
plot(mpg ~ wt, data = mtcars)
model <- lm(mpg ~ wt, data = mtcars)
abline(model)
summary(model)
predict(model, newdata = data.frame(wt = 6))

# multiple linear (practice)
model2 <- lm(mpg ~ wt + hp + cyl, data = mtcars)
summary(model2)

# ---- simulate a linear model ----
set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 - 2 * x + e
plot(x, y, main = "Simulated linear model")
sim_fit <- lm(y ~ x)
abline(sim_fit, col = "red")
summary(sim_fit)

# random numbers reminder
set.seed(1)
rnorm(5)
sample(1:10, 4)
sample(letters, 5)

# ---- class data regression practice ----
data_class <- read.table("data/class_data.txt", header = TRUE)
plot(WEIGHT ~ HEIGHT, data = data_class)
fit_class <- lm(WEIGHT ~ HEIGHT, data = data_class)
abline(fit_class)
summary(fit_class)
cor(data_class$HEIGHT, data_class$WEIGHT)
