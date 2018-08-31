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
# S02C06 - Reading in our data
#

dat <- read.csv(file.choose())
head(dat)

#
# S02C07 - Fitting a line
#

dat <- read.csv(file.choose())
head(dat)

ggplot() + 
  geom_point(data = dat,
             aes(x = x, y = y))

lm(y~x, data = dat)
f <- function(x) {
  return(34.04 * x - 65.27)
}
ggplot() + 
  geom_point(data = dat,
             aes(x = x, y = y)) +
  stat_function(data = data.frame(x = c(-5, 15)),
                aes(x = x),
                fun = f)

#
# S02C08 - Plotting points along the least-square line
#

head(dat)
x <- dat$x
y <- f(x)
means <- data.frame(x, y)
ggplot() + 
  geom_point(data = dat,
             aes(x = x, y = y)) +
  stat_function(data = data.frame(x = c(-5, 15)),
                aes(x = x),
                fun = f) +
  geom_point(data = means,
             aes(x = x, y = y),
             color = 'red',
             size = 1)

#
# S02C09 - Visualizing the residuals
#

dat$group <- 1:100
head(dat)
means$group <- 1:100
head(means)
groups <- rbind(dat, means)
head(groups)
View(groups)
ggplot() + 
  geom_point(data = dat,
             aes(x = x, y = y)) +
  stat_function(data = data.frame(x = c(-5, 15)),
                aes(x = x),
                fun = f) +
  geom_point(data = means,
             aes(x = x, y = y),
             color = 'red',
             size = 1) +
  geom_line(data = groups,
            aes(x = x, y = y, group = group),
            color = 'yellow')

sum((dat$y-means$y)^2)  # residual para polinômio grau 1 = 158423.5

#
# S02C10 - Best fitting polynomil of degree 2
#

lm(y~x + I(x^2), data = dat)
f2 <- function(x) {
  return(2.9522 * x ^2 + 0.9719 * x -0.5685)
}
ggplot() + 
  geom_line(data = groups,
            aes(x = x, y = y, group = group),
            color = 'gray') +
  stat_function(data = data.frame(x = c(-5, 15)),
                aes(x = x),
                fun = f,
                color = 'gray') +
  geom_point(data = means,
             aes(x = x, y = y),
             color = 'gray',
             size = 1) +
  stat_function(data = data.frame(x = c(-5, 15)),
                aes(x = x),
                fun = f2,
                color = 'orange') +
  geom_point(data = dat,
             aes(x = x, y = y))

means2 <- data.frame(x = means$x, y = f2(means$x), group = means$group)
head(means2)
ggplot() + 
  geom_line(data = groups,
            aes(x = x, y = y, group = group),
            color = 'gray') +
  stat_function(data = data.frame(x = c(-5, 15)),
                aes(x = x),
                fun = f,
                color = 'gray') +
  geom_point(data = means,
             aes(x = x, y = y),
             color = 'gray',
             size = 1) +
  stat_function(data = data.frame(x = c(-5, 15)),
                aes(x = x),
                fun = f2,
                color = 'orange') +
  geom_point(data = means2,
             aes(x = x, y = y),
             color = 'orange',
             size = 1) +
  geom_point(data = dat,
             aes(x = x, y = y))

groups2 <- rbind(dat, means2)
ggplot() + 
  geom_line(data = groups,
            aes(x = x, y = y, group = group),
            color = 'gray') +
  stat_function(data = data.frame(x = c(-5, 15)),
                aes(x = x),
                fun = f,
                color = 'gray') +
  geom_point(data = means,
             aes(x = x, y = y),
             color = 'gray',
             size = 1) + 
  geom_line(data = groups2,
            aes(x = x, y = y, group = group),
            color = 'orange') +
  stat_function(data = data.frame(x = c(-5, 15)),
                aes(x = x),
                fun = f2,
                color = 'orange') +
  geom_point(data = means2,
             aes(x = x, y = y),
             color = 'orange',
             size = 1) +
  geom_point(data = dat,
             aes(x = x, y = y))

sum((dat$y-means$y)^2)  # residual para polinômio grau 1 = 158423.5
sum((dat$y-means2$y)^2) # residual para polinômio grau 2 =  34582.44

#
# S02C11 - Best fitting polynomil of degree 3
#

lm(y~x + I(x^2) + I(x^3), data = dat)
f3 <- function(x) {
  return(-1.67268 +2.49528 * x^1 +2.60142 * x^2 +0.02024 * x^3)
}
ggplot() + 
  geom_line(data = groups,
            aes(x = x, y = y, group = group),
            color = 'gray') +
  stat_function(data = data.frame(x = c(-5, 15)),
                aes(x = x),
                fun = f,
                color = 'gray') +
  geom_point(data = means,
             aes(x = x, y = y),
             color = 'gray',
             size = 1) + 
  geom_line(data = groups2,
            aes(x = x, y = y, group = group),
            color = 'orange') +
  stat_function(data = data.frame(x = c(-5, 15)),
                aes(x = x),
                fun = f2,
                color = 'orange') +
  geom_point(data = means2,
             aes(x = x, y = y),
             color = 'orange',
             size = 1) +
  stat_function(data = data.frame(x = c(-5, 15)),
                aes(x = x),
                fun = f3,
                color = 'red') +
  geom_point(data = dat,
             aes(x = x, y = y))

means3 <- data.frame(x = means$x, y = f3(means$x), group = means$group)
head(means3)
ggplot() + 
  geom_line(data = groups,
            aes(x = x, y = y, group = group),
            color = 'gray') +
  stat_function(data = data.frame(x = c(-5, 15)),
                aes(x = x),
                fun = f,
                color = 'gray') +
  geom_point(data = means,
             aes(x = x, y = y),
             color = 'gray',
             size = 1) + 
  geom_line(data = groups2,
            aes(x = x, y = y, group = group),
            color = 'orange') +
  stat_function(data = data.frame(x = c(-5, 15)),
                aes(x = x),
                fun = f2,
                color = 'orange') +
  geom_point(data = means2,
             aes(x = x, y = y),
             color = 'orange',
             size = 1) +
  stat_function(data = data.frame(x = c(-5, 15)),
                aes(x = x),
                fun = f3,
                color = 'red') +
  geom_point(data = means3,
             aes(x = x, y = y),
             color = 'red',
             size = 1) +
  geom_point(data = dat,
             aes(x = x, y = y))

groups3 <- rbind(dat, means3)
ggplot() + 
  geom_line(data = groups,
            aes(x = x, y = y, group = group),
            color = 'gray') +
  stat_function(data = data.frame(x = c(-5, 15)),
                aes(x = x),
                fun = f,
                color = 'gray') +
  geom_point(data = means,
             aes(x = x, y = y),
             color = 'gray',
             size = 1) + 
  geom_line(data = groups2,
            aes(x = x, y = y, group = group),
            color = 'orange') +
  stat_function(data = data.frame(x = c(-5, 15)),
                aes(x = x),
                fun = f2,
                color = 'orange') +
  geom_point(data = means2,
             aes(x = x, y = y),
             color = 'orange',
             size = 1) + 
  geom_line(data = groups3,
            aes(x = x, y = y, group = group),
            color = 'red') +
  stat_function(data = data.frame(x = c(-5, 15)),
                aes(x = x),
                fun = f3,
                color = 'red') +
  geom_point(data = means3,
             aes(x = x, y = y),
             color = 'red',
             size = 1) +
  geom_point(data = dat,
             aes(x = x, y = y))

sum((dat$y-means$y)^2)  # residual para polinômio grau 1 = 158423.5
sum((dat$y-means2$y)^2) # residual para polinômio grau 2 =  34582.44
sum((dat$y-means3$y)^2) # residual para polinômio grau 3 =  34483.81

#
# S02C12 - Smoothing splines
#

ggplot() + 
  geom_point(data = dat,
             aes(x = x, y = y))

library(splines)

fit <- smooth.spline(dat$x, dat$y, df = 10)
fit
predict(fit, 5)
predict(fit, 5)$y
predict(fit, 10)$y

fpred <- function(x) {
  return(predict(fit, x)$y)
}
ggplot() + 
  stat_function(data = data.frame(x = c(-2, 14)),
                aes(x = x),
                fun = fpred,
                color = 'red') +
  geom_point(data = dat,
             aes(x = x, y = y))

meanspred <- data.frame(x = means$x, y = fpred(means$x), group = means$group)
head(meanspred)
ggplot() + 
  stat_function(data = data.frame(x = c(-2, 14)),
                aes(x = x),
                fun = fpred,
                color = 'red') +
  geom_point(data = meanspred,
             aes(x = x, y = y),
             color = 'red',
             size = 1) +
  geom_point(data = dat,
             aes(x = x, y = y))

sum((dat$y-means$y)^2)     # residual para polinômio grau 1 = 158423.5
sum((dat$y-means2$y)^2)    # residual para polinômio grau 2 =  34582.44
sum((dat$y-means3$y)^2)    # residual para polinômio grau 3 =  34483.81
sum((dat$y-meanspred$y)^2) # residual para smooth spline 10 =  30879.84

fit50 <- smooth.spline(dat$x, dat$y, df = 50)
fit50
fpred50 <- function(x) {
  return(predict(fit50, x)$y)
}
meanspred50 <- data.frame(x = means$x, y = fpred50(means$x), group = means$group)
head(meanspred50)
ggplot() + 
  stat_function(data = data.frame(x = c(-2, 14)),
                aes(x = x),
                fun = fpred50,
                color = 'orange') +
  geom_point(data = meanspred50,
             aes(x = x, y = y),
             color = 'orange',
             size = 1) +
  geom_point(data = dat,
             aes(x = x, y = y))

sum((dat$y-means$y)^2)       # residual para polinômio grau 1 = 158423.5
sum((dat$y-means2$y)^2)      # residual para polinômio grau 2 =  34582.44
sum((dat$y-means3$y)^2)      # residual para polinômio grau 3 =  34483.81
sum((dat$y-meanspred$y)^2)   # residual para smooth spline 10 =  30879.84
sum((dat$y-meanspred50$y)^2) # residual para smooth spline 50 =  14244.2

#
# S02C12 - Smoothing splines
#















