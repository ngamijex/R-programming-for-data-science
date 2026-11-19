# small practice - vectors, lists, factors
# from class 1 notes

# numeric
age <- c(35, 24, 18, 24)
mean(age)
summary(age)

# character
x <- c("a", "b", "c")

# logical
x <- c(T, F)

# complex
x <- c(1 + 0i, 2 + 4i)

# factor
x <- factor(c("yes", "yes", "no", "yes", "no"))
x

# NA check
x <- c(1, 2, NA, 10, 3)
is.na(x)
x[!is.na(x)]
