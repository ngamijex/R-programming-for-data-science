# Assignment 4: Apply function variations (read & practice)
# notes: https://rpubs.com/Mapara_lee/1434992

# matrix + apply
set.seed(1)
c <- matrix(runif(12), nrow = 3)
c
mean(c)                 # one mean for all cells
apply(c, 1, mean)       # row means
apply(c, 2, mean)       # column means
apply(c, 1, sum)
apply(c, 2, sum)

# same idea with helpers
rowMeans(c)
colMeans(c)

# lapply / sapply on a list
nums <- list(a = 1:5, b = 10:12, c = c(2, 4, 6))
lapply(nums, mean)
sapply(nums, mean)
sapply(nums, summary)

# replace a missing code with NA (class example style)
fix_missing <- function(x) {
  x[x == -99] <- NA
  x
}
df <- data.frame(
  score1 = c(12, -99, 15, 10),
  score2 = c(18, 17, -99, 19),
  score3 = c(11, 14, 13, -99)
)
df[] <- lapply(df, fix_missing)
df

# square function + curve
function1 <- function(x) {
  x^2
}
curve(function1, -4, 4)

# Titanic array with apply
str(Titanic)
apply(Titanic, c(1, 3), sum)
apply(Titanic, c(1, 2), sum)[3:4, ]
apply(Titanic, c(1, 4), sum)[3:4, ]
apply(Titanic, c(1, 2, 4), sum)[3:4, , ]

# small roster example from notes
Student <- c("John ncuti", "Angela bakame", "Bruce wizeye",
             "Alexis aganze", "claude Rukundo", "Joel Kagabo", "Mary ineza")
Math <- c(600, 412, 358, 495, 512, 410, 522)
Science <- c(95, 99, 80, 82, 75, 89, 77)
English <- c(25, 22, 18, 20, 29, 30, 27)
roster <- data.frame(Student, Math, Science, English, stringsAsFactors = FALSE)

z <- scale(roster[, 2:4])
score <- apply(z, 1, mean)
roster <- cbind(roster, score)
roster

# split names with sapply
name <- strsplit(roster$Student, " ")
lastname <- sapply(name, "[", 2)
firstname <- sapply(name, "[", 1)
roster2 <- cbind(firstname, lastname, roster[, -1])
roster2 <- roster2[order(lastname, firstname), ]
roster2

# tapply / aggregate quick look
tapply(mtcars$mpg, mtcars$cyl, mean)
aggregate(mpg ~ cyl, data = mtcars, FUN = mean)
