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

# Ctrl + l
# Scripts
# Console

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


















