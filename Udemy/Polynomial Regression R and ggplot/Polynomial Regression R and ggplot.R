#
# Udemy - Polynomial Regression, R, and ggplot
#

#
# S01C01 - Introduction
#

#
# S01C02 - A review of Functions
#

## s01c02-a.png
## s01c02-a.png
## s01c02-a.png

#
# S01C03 - Creating Functions in R
#

f <- function(x) {
  return(x^2 + 1)
}
f(1)
f(3)
f(-2)

f <- function(x) {
  return(6 * x^3 -5 * x + 3)
}
f(1)
f(13)

#
# S01C04 - Plotting functions with ggplot
#

library(ggplot2)

f <- function(x) {
  return(5 * x + 1)
}
f(1)

x <- c(0, 10)
x
axis <- data.frame(x)
axis
ggplot() + 
  stat_function(data = axis,
                aes(x),
                fun = f)
ggplot() + 
  stat_function(data = data.frame(x = c(0, 10)),
                aes(x),
                fun = f)
ggplot() + 
  stat_function(data = data.frame(x = c(-10, 10)),
                aes(x),
                fun = f)

f <- function(x) {
  return(x ^ 2)
}
f(1)
ggplot() + 
  stat_function(data = data.frame(x = c(0, 5)),
                aes(x),
                fun = f)
ggplot() + 
  stat_function(data = data.frame(x = c(-5, 5)),
                aes(x),
                fun = f)

f <- function(x) {
  return(x ^ 3 - 7 * x + 3)
}
f(1)
ggplot() + 
  stat_function(data = data.frame(x = c(-5, 5)),
                aes(x),
                fun = f)

#
# S01C05 - Polynomials
#

## Slope
## Intersection
## f(x) = B0.x^0  + B1.x^1  + B2.x^2  + B3.x^3  + ... + Bn.x^n

#
# S02C05 - Reading in our data
#

dat <- read.csv(file.choose())
head(dat)

#
# S02C06 - Fitting a line
#


















