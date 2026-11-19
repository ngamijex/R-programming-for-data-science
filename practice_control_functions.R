# Practice from class notes
# https://rpubs.com/Mapara_lee/1434992

# ifelse on p-values
pvalues <- c(0.867, 0.0054, 0.0018, 0.1572, 0.0183, 0.5386)
results <- ifelse(pvalues < 0.05, "Significant", "Not significant")
data.frame(pvalues, results)

# if / else
x <- runif(1, 0, 10)
if (x > 3) {
  print("X is greater than three")
} else {
  print("X is less or equal to three")
}

# for loops
for (i in 1:10) {
  print(i)
}

letters_vec <- c("a", "b", "c", "d")
for (i in 1:4) {
  print(letters_vec[i])
}

# while
count <- 0
while (count < 5) {
  print(count)
  count <- count + 1
}

# break
for (i in 1:100) {
  print(i)
  if (i > 5) {
    break
  }
}

# small functions
f <- function(x, y) {
  result <- x + (2 * y) + 3
  return(result)
}
f(2, 3)

# summary stats function (exercise from notes)
my_summary <- function(x) {
  c(
    n = length(x),
    mean = mean(x, na.rm = TRUE),
    sd = sd(x, na.rm = TRUE),
    min = min(x, na.rm = TRUE),
    max = max(x, na.rm = TRUE)
  )
}
my_summary(mtcars$mpg)

# two sample t-test function (exercise from notes)
my_ttest <- function(x, y) {
  t.test(x, y)
}
my_ttest(mtcars$mpg[mtcars$am == 0], mtcars$mpg[mtcars$am == 1])
