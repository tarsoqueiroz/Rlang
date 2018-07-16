#
# Udemy
#
#     R Programming for Absolute Beginners
#

stocks <- read.csv("./Udemy/R Programming For Absolute Beginners/datasets/stocks.csv")
View(stocks)

#
# Section 2
#
# 3. R Studio interface
#

?print
help(mean)

#
# 4. Installing and Activating R Packages
#

install.packages("vcd")
# using
library(vcd)
# or
require(vcd)
# deactivate
detach(package:vcd)

#
# 5. Setting the working directory
#

setwd("path/to/directory")

#
# 6. Basic operations in R
#

3+6
10 - 4
3 * 8
12 / 4

5 ^ 2

(7 + 3) * 9

((3+2)*5 + (10+5)/3) ^3

7/0  # Inf =  infinite

#
# 7. Working with variables
#

x <- 5
y <- 7
x + y
x - y
x * y
x / y
y / x
1 / (x / y)
x ^ y
z <- x + y
z
w <- x * y
w

class(x)
typeof(x)

strName <- "Tarso"
class(strName)
typeof(strName)

t <- "53"
class(t)
typeof(t)
t

m <- TRUE
n <- FALSE
class(m)
typeof(m)

m + n
m + m
m / n

X <- 100

Print("Hello")
print("Hello")

ls()
rm(x)
rm(y, z)
rm(list=ls())

#
# Section 3
#
# 8. Creating vectors with the c() function
#

x <- c(10, 20, 30, 40, 50)
x

class(x)
typeof(x)

y <- c("a", "b", "c")
class(y)
typeof(y)

z <- c(TRUE, FALSE, FALSE, TRUE)
class(z)
typeof(z)

n <- c(1, 2, "a", "b", TRUE, FALSE)
class(n)
typeof(n)
n

length(x)

x <- c(x, 100)
x

w <- c(c(1,2,3), 25)
w

s <- c(c(2,4,6), c(10,12,14))
s

#
# 9. Creating vectors using the colon operator
#

x <- 1:5
x
class(x)
typeof(x)

y <- c(1,2,3,4,5)
y
class(y)
typeof(y)

z <- 10:1
z

i <- 3
j <- 7
k <- i:j
k
typeof(k)

w <- c(3:9, 70)
w
typeof(w)
w1 <- c(3:9)
w1
typeof(w1)

z <- c(1:10, 20:-5)
z
typeof(z)

#
# 10. Creating vectors with the rep() function
#

x <- rep(5, 3)
x
y <- rep("ab", 3)
y
z <- rep(c(1,2,3), 3)
z
w <- rep(c(1,2,3), each = 5)
w
q <- rep(2:5, 3)
q
s <- rep(2:5, each=5)
s
t <- numeric(4)
t
k <- character(4)
k
u <- logical(4)
u

#
# 11. Creating vectors with the seq() function
#

x <- seq(from=1, to=10, by=0.5)
x
y <- seq(1, 10, 0.5)
z
z <- seq(0, 20, 2)
z
w <- seq(1, 10, 2)
w
t <- seq(11, 1, -2)
t
q <- seq(1, 5, length=10)
q
x <- seq(-3, 25, length=100) # step 0.282828
x
(25+3)/99
y <- c(seq(1,10,length=5), 30, 40)
y
z <- rep(seq(1,3,0.5), 3)
z
w <- rep(seq(1,3,0.5), each=3)
w

#
# 12. Creating vectors of random numbers
#

n <- sample(100, 12)
# or
n <- sample(1:100, 12)
n

h <- 100:300
h
n <- sample(h, 10)
n

n <- sample(30, 15, replace=TRUE)
n
n1 <- sample(30, 15, replace=FALSE)
n1

m <- sample(10, 50, replace=TRUE)
m
m <- sample(10, 50)

x <- rnorm(100, 10, 5)
x
x <- rnorm(100)
x

y <- runif(100, 1, 5)
y

z <- rexp(100, 1/50)
z

#
# 13. Creating empty vectors
#

x <- c()
x
typeof(x)
length(x)
y <- NULL
typeof(y)
z <- vector()
z
typeof(z)

x <- c(x, 1, 2)
x
typeof(x)
y <- c(y, 1, 2)
y
typeof(y)
z <- c(z, 1, 2)
z
typeof(z)

#
# 14. Indexing vectors with numeric indices
#

x <- c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100)
x
x[2]
x[c(1,3,8)]
x[2:5]
x[5:2]
x[c(1:4, 7)]
x[length(x)]
n <- 3:5
x[n]
x[-2]
x[c(-1,-3,-6)]
x[-2:-4]
x[c(-1:-5, -9)]
x[-length(x)]
x[c(3, -7)]
x[c(0, -7)]
x[-7]

x <- c(7,8,9,10)
x[5] <- 11
x
x[2] <- 100
x
x[7] <- 111
x

p[1] <- 3
p <- c()
p[2] <- 2
p

x <- c(9, 10, 11, 12)
x
x <- c(x[1:3], 50, x[4])
x

#
# 15. Indexing vectors with logical indices
#

x <- c(1, 2, 3, 4)
i <- c(FALSE, TRUE, TRUE, FALSE)
x[i]
x[c(FALSE, TRUE, TRUE, FALSE)]

#
# 16. Naming vectors with logical indices
#

salary <- c(4000, 2700, 3200)
names(salary) <- c("John", "Andrew", "Mary")
salary
salary["Andrew"]
salary[2]

names(salary) <- NULL
salary

#
# 17. Filtering vectors
#

x <- seq(10, 100, 10)
y <- x[x>45]
y <- x[x==30]
y <- x[x!=30]
y <- x[x>27 & x<83]
y <- x[x<35 | x>71]
y <- x[x<60 | x>20]
y <- x[x>20 & x!=80]
y <- x[x>20 | x!=80]

which(x==40)
which(x<54)
which(x>43)

i <- which(x>43)
i

40 %in% x
86 %in% x

#
# 18. The functions all() and any()
#

x <- seq(1, 15, 2)
x
all(x>0)
all(x<50)
all(x<8)
all(x>10)
all(x>0 & x<10)
all(x>0 & x<35)
all(x>0 | x<7)
all(x>4 | x<7)
all(x>4 | x<2)

any(x>4)
any(x<0)
any(x==11)
any(x==4)
any(x<10 & x>3)
any(x<4 & x>9)
any(x<4 | x>9)
any(x<0 | x>100)

#
# 19. Sum and product of vecotr components
#








