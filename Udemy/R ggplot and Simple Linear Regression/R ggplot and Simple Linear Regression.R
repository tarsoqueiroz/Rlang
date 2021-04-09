#
# Udemy - R, ggplot, and Simple Linear Regression
#

#
# S01C01 - intro
#
# S01C02 - installing R and RStudio
#
# S01C03 - tour on R and RStudio
#

## Ctrl + l
## Scripts
## Console
## Clear screens
## Set default directory

#
# S01C04 - vectors
#
x <- 3
y <- 5

x <- c(3, 7, 5)
y <- c(5, 7, 54, 2, 11, 31, 58)

x[1]
y[0]
y[1]
x[3]
y[2:4]
x[-2:-6]
y[-2:-6]
x[-1]
x[-2]
x[-3]

sequencia <- 1:1078

seq(0, 15, 1)
seq(0, 15, 5)

sample(1:10, 100, replace = TRUE)
sample(1:10, 100, replace = TRUE)

#
# S01C05 - data frames
#

x <- c(3, 6, 8)
y <- c(4, 7, 6)
s <- c(4, 5, 6)

X <- data.frame(x, y, s)
X
X$x
X$y
X$s

head(X)

## Save and load external file

#
# S02C06 - installing ggplot
#
install.packages('ggplot2')
library(ggplot2)

#
# S02C07 - plotting with ggplot
#

x <- 4
y <- 9
dat <- data.frame(x, y)
dat

ggplot()

ggplot()+
  geom_point(data = dat, aes(x = x , y = y), size = 5, color = 'blue')

ggplot()+
  geom_point(data = dat, aes(x = x , y = y), size = 10, color = 'red')

#
# S02C08 - controling axis properties
#

x <- c(2, 5, 1)
y <- c(6, 4, 9)
dat <- data.frame(x, y)
dat

ggplot()+
  geom_point(data = dat, 
             aes(x = x, y = y), 
             size = 5, 
             color = 'blue')

ggplot()+
  geom_point(data = dat, 
             aes(x = x, y = y), 
             size = 10, 
             color = 'red')

ggplot()+
  geom_point(data = dat, 
             aes(x = x, y = y), 
             size = 10, 
             color = 'red')+
  scale_x_continuous(limits = c(0, 15))+
  scale_y_continuous(limits = c(0, 15))

ggplot()+
  geom_point(data = dat, 
             aes(x = x, y = y), 
             size = 10, 
             color = 'red')+
  scale_x_continuous(limits = c(0, 15),
                     breaks = seq(0, 15, 1))+
  scale_y_continuous(limits = c(0, 15),
                     breaks = seq(0, 15, 1))

#
# S02C09 - more with color and shape
#

# Colors URL - http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
# Shapes URL - http://sape.inf.usi.ch/quick-reference/ggplot2/shape

ggplot()+
  geom_point(data = dat, 
             aes(x = x, y = y), 
             size = 10, 
             color = 'cadetblue1')+
  scale_x_continuous(limits = c(0, 15),
                     breaks = seq(0, 15, 3))+
  scale_y_continuous(limits = c(0, 15),
                     breaks = seq(0, 15, 3))

ggplot()+
  geom_point(data = dat, 
             aes(x = x, y = y), 
             size = 10, 
             color = 'forestgreen')+
  scale_x_continuous(limits = c(0, 15),
                     breaks = seq(0, 15, 3))+
  scale_y_continuous(limits = c(0, 15),
                     breaks = seq(0, 15, 3))

ggplot()+
  geom_point(data = dat, 
             aes(x = x, y = y), 
             size = 10, 
             color = 'forestgreen',
             shape = 10)+
  scale_x_continuous(limits = c(0, 15),
                     breaks = seq(0, 15, 3))+
  scale_y_continuous(limits = c(0, 15),
                     breaks = seq(0, 15, 3))

ggplot()+
  geom_point(data = dat, 
             aes(x = x, y = y), 
             size = 10, 
             color = 'forestgreen',
             shape = 25)+
  scale_x_continuous(limits = c(0, 15),
                     breaks = seq(0, 15, 3))+
  scale_y_continuous(limits = c(0, 15),
                     breaks = seq(0, 15, 3))


ggplot()+
  geom_point(data = dat, 
             aes(x = x, y = y), 
             size = 10, 
             color = 'forestgreen',
             shape = 112)+
  scale_x_continuous(limits = c(0, 15),
                     breaks = seq(0, 15, 3))+
  scale_y_continuous(limits = c(0, 15),
                     breaks = seq(0, 15, 3))

#
# S02C10 - more with color and shape
#

x <- c(1, 8)
y <- c(3, 10)
dat <- data.frame(x, y)
dat

ggplot()+
  geom_line(data = dat, 
            aes(x = x, y = y))

dat$x <- c(-2, 7)
dat$y <- c(13, -5)
dat
ggplot()+
  geom_line(data = dat, 
            aes(x = x, y = y))

#
# S02C11 - more with lines
#

## y = 3 x + 1
## y = -5 x - 7
## y = 0.5 x - .73

x <- c(0, 10)
x
y <- 3 * x + 1
y
dat <- data.frame(x, y)
dat

ggplot()+
  geom_line(data = dat, 
            aes(x = x, y = y))

x
y <- -5 * x - 7
y
dat <- data.frame(x, y)
dat

ggplot()+
  geom_line(data = dat, 
            aes(x = x, y = y))

x
y <- 0.5 * x - .73
y
dat <- data.frame(x, y)
dat

ggplot()+
  geom_line(data = dat, 
            aes(x = x, y = y))

#
# S03C12 - normal populations
#

sample(1:10, 100, replace = TRUE)
sample(1:10, 100, replace = TRUE)

rnorm(100, 50, 10)
rnorm(100, 50, 90)

#
# S03C13 - plotting a vertical sample
#

rep(1, 100)

x <- rep(1, 100)
y <- rnorm(100, 50, 10)
x
y
dat <- data.frame(x, y)
head(dat)

x <- 1
y <- 50
mean <- data.frame(x, y)
mean

ggplot()+
  geom_point(data = dat, 
            aes(x = x, y = y))+
  geom_point(data = mean,
            aes(x = x, y = y),
            size = 7,
            color = 'red')

#
# S03C14 - plotting several vertical samples
#

## three distinct vertical samples of 100 point each
##
## sample 1:- x=1,  mean=50, st.dev=10
## sample 2:- x=9,  mean=30, st.dev=10
## sample 3:- x=15, mean=78, st.dev=10

x <- c(rep(1, 100),        rep(9, 100),        rep(15, 100))
y <- c(rnorm(100, 50, 10), rnorm(100, 30, 10), rnorm(100, 78, 10))
dat <- data.frame(x, y)
dat

x <- c(1,  9,  15)
y <- c(50, 30, 78)
means <- data.frame(x, y)
means

ggplot()+
  geom_point(data = dat, 
             aes(x = x, y = y))+
  geom_point(data = means,
             aes(x = x, y = y),
             size = 7,
             color = 'red')

#
# S03C15 - samples along a line
#

## TASK:        Create fou vertical samples of 100 points each.
## REQUIREMENT: Means must lie on the line y = 3x + 1
## X-LOCATIONS: 1, 9, 15, 22

x <- c(0, 25)
y <- 3 * x + 1
y
line <- data.frame(x, y)

ggplot()+
  geom_line(data = line, 
            aes(x = x, y = y))

x <- c(1, 9, 15, 22)
y <- 3 * x + 1
y
means <- data.frame(x, y)

ggplot()+
  geom_line (data = line, 
             aes(x = x, y = y)) +
  geom_point(data = means, 
             aes(x = x, y = y),
             size = 7,
             color = 'red')

means
x <- c(rep(1, 100), rep(9, 100), rep(15, 100), rep(22, 100))
y <- c(rnorm(100, 4, 10), rnorm(100, 28, 10), rnorm(100, 46, 10), rnorm(100, 67, 10))
dat <- data.frame(x, y)
dat
ggplot()+
  geom_line (data = line, 
             aes(x = x, y = y)) +
  geom_point(data = means, 
             aes(x = x, y = y),
             size = 7,
             color = 'red') +
  geom_point(data = dat, 
             aes(x = x, y = y))

#
# S03C16 - sapply
#

x <- c(2, 4, 9, 15)

sqrt(x)
sapply(x, function(x) sqrt(x))
x^2
sapply(x, function(x) x ^ 2)

rnorm(1, x, 10)
sapply(x, function(x) rnorm(1, x, 10))

#
# S03C17 - cloud of points
#

## Generate 100 data points in the following away:
##   The x-coordinates are drawn from a normal population
##   of mean 10 and standard deviation 5
##   For each x-value, one y-value is drawn from a normal
##   population with mean 3x + 1 and standard deviation 10

x <- rnorm(100, 10, 5)
y <- 3 * x + 1
means <- data.frame(x, y)
ggplot()+
  geom_point(data = means, 
             aes(x = x, y = y),
             color = 'red')

x <- c(-5, 25)
y <- 3 * x + 1
line <- data.frame(x, y)
ggplot()+
  geom_point(data = means, 
             aes(x = x, y = y),
             color = 'red') +
  geom_line(data = line,
            aes(x = x, y = y)) +
  scale_x_continuous(limits = c(-10, 30)) +
  scale_y_continuous(limits = c(-20, 80))
  
x <- means$x
y <- sapply(x, function(x) rnorm(1, 3 * x + 1, 10))
dat <- data.frame(x, y)
ggplot()+
  geom_point(data = means, 
             aes(x = x, y = y),
             color = 'red') +
  geom_line(data = line,
            aes(x = x, y = y)) +
  scale_x_continuous(limits = c(-10, 30)) +
  scale_y_continuous(limits = c(-20, 80)) +
  geom_point(data = dat, 
             aes(x = x, y = y))
ggplot()+
  scale_x_continuous(limits = c(-10, 30)) +
  scale_y_continuous(limits = c(-20, 80)) +
  geom_point(data = dat, 
             aes(x = x, y = y))

#
# S04C18 - father and son heights
#

#installed.packages('UsingR')
library(UsingR)

head(father.son)

ggplot() +
  geom_point(data = father.son,
             aes(x = fheight, y = sheight))

x <- c(60, 75)  ## from teacher 
y <- c(63, 78)  ## from teacher 
line <- data.frame(x, y)
x <- c(60, 75)
y <- c(62, 77)
lineT <- data.frame(x, y)
ggplot() +
  geom_point(data = father.son,
             aes(x = fheight, y = sheight)) +
  geom_line(data = line,
            aes(x = x, y = y),
            color = 'blue') +
  geom_line(data = lineT,
            aes(x = x, y = y),
            color = 'red')

#
# S04C20 - residual visualization
#

head(father.son)
x <- father.son$fheight
y <- father.son$sheight
group <- 1:1078
dat <- data.frame(x, y, group)

y <- x + 3
means <- data.frame(x, y, group)
ggplot() +
  geom_point(data = dat,
             aes(x = x, y = y)) +
  geom_point(data = means,
            aes(x = x, y = y),
            color = 'red')

x <- c(50, 80)
y <- x + 3
line <- data.frame(x, y)
ggplot() +
  geom_point(data = dat,
             aes(x = x, y = y)) +
  geom_point(data = means,
             aes(x = x, y = y),
             color = 'red') +
  geom_line(data = line,
            aes(x = x, y = y))

d <- rbind(dat, means)
?rbind
head(dat)
head(means)
head(d)
ggplot() +
  geom_point(data = dat,
             aes(x = x, y = y)) +
  geom_point(data = means,
             aes(x = x, y = y),
             color = 'red') +
  geom_line(data = line,
            aes(x = x, y = y)) +
  geom_line(data = d,
            aes(x = x, y = y, group = group))

#
# S04C21 - sum of squared residuals
#

head(means$y)
head(dat$y)
head(means$y - dat$y)
head((means$y - dat$y)^2)
sum((means$y - dat$y)^2)

#
# S04C22 - the least squares line
#

lm(y~x, data = dat)
slope <- lm(y~x, data = dat)$coefficients[2]
intercept <- lm(y~x, data = dat)$coefficients[1]
slope
intercept

x <- c(57,78)
y <- slope * x + intercept
line <- data.frame(x, y)
ggplot() +
  geom_point(data = dat,
             aes(x = x, y = y)) +
  geom_point(data = means,
             aes(x = x, y = y),
             color = 'red') +
  geom_line(data = line,
            aes(x = x, y = y)) +
  geom_line(data = d,
            aes(x = x, y = y, group = group))

x <- means$x
y <- slope * x + intercept
means <- data.frame(x, y, group)
ggplot() +
  geom_point(data = dat,
             aes(x = x, y = y)) +
  geom_point(data = means,
             aes(x = x, y = y),
             color = 'red') +
  geom_line(data = line,
            aes(x = x, y = y)) +
  geom_line(data = d,
            aes(x = x, y = y, group = group))

d <- rbind(dat, means)
ggplot() +
  geom_point(data = dat,
             aes(x = x, y = y)) +
  geom_point(data = means,
             aes(x = x, y = y),
             color = 'red') +
  geom_line(data = line,
            aes(x = x, y = y)) +
  geom_line(data = d,
            aes(x = x, y = y, group = group))

#
# S04C23 - prediction
#

ggplot() +
  geom_line(data = line,
            aes(x = x, y = y))

head(dat)
tail(dat)
lm(y~x, data = dat)

y <- 0.5141 * 70 + 33.8866
y

#
# S04C24 - reading in excel files
#

dat <- read.csv(file.choose())
dat

#---------#
# THE END #
#---------#
