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

x <- c(2, 4, 6, 15, 17, 19)
sum(x)
y <- sum(x)
prod(x)
cumsum(x)
cumprod(x)
mean(x)
median(x)
var(x)
sd(x)
summary(x)

#
# 20. Vectorized operations
#

x <- c(1,2,3,4,5)
x
y <- x + 10
y
y <- x * 3
y
y <- x %% 2
y
y <- x ^2
x
exp(x)
sqrt(x)
x ^(1/2)
x ^(1/3)
log(x)
x
sin(x)
cos(x)
tan(x)
x
abs(x)

z <- c(1.3, 3.7, 9.5)
z
round(z)
floor(z)
ceiling(z)

w <- c(3.954, 7.200, 9.028)
w
signif(w, 1)
signif(w, 2)
signif(w, 3)

x
factorial(x)

#
# 21. Treating missing values in vectors
#

sal <- c(3500, 1800, 2400, NA, 2900)
sal
mean(sal)

sal2 <- na.omit(sal)
sal2
mean(sal2)
mean(sal, na.rm = TRUE)

length(sal)
y <- is.na(sal)
y

#
# 22. Sorting vectors
#

x <- c(6, 8, 3, 11, 5, 10, 2, 17)
x
sort(x)
order(x)

y <- sort(x)
y
order(y)
y <- sort(x, decreasing = TRUE)
y
order(y)

w <- c("z", "a", "n", "d")
sort(w)

q <- c(TRUE, FALSE, TRUE, FALSE)
sort(q)
sort(q, decreasing = TRUE)

#
# 23. Minimum and Maximum values
#

x <- c(4, 1, 7, 5, 12, 6)
min(x)
max(x)
which.min(x)
which.max(x)

y <- c(2, 9, 7, 6, 10, 14)
x
y
pmin(x, y)
pmax(x, y)

#
# 24. The ifelse() function
#

x <- c(6, 10, 9, 5, 20, 7, 16)
y <- ifelse(x%%2 == 0, x/2, x)
x
y

x <- c(2, 6, 15, 10, 20, 14)
y <- ifelse(x<=12, x * 5, x * 3)
x
y

x <- c(25, -36, 100, 0, -1, 49, 4, -68)
y <- ifelse(x>= 0, sqrt(x), sqrt(-x))
x
y
y <- ifelse(x>= 0, x, -x)
x
y

x <- c(15, 6, 10, 30, 4)
y <- ifelse(x^2 > 100, 1, 0)
x
y

#
# 25. Adding and multiplying vectors
#

x <- c(2, 4, 6, 8)
y <- c(10, 20, 30, 40)
z <- x + y
x
y
z
x - y
x * y
x / y
y / x
x %% y
y %% x

x <- c(1, 2, 3, 4)
y <- c(9, 10)
x + y
x * y
y %% x

#
# 26. Testing vector equality
#

x <- c(7, 10, 3, 9, 6)
y <- c(2, 14, 5, 15, 6)
x > y
y > x
y == x

x <- c(2, 4, 6)
y <- c(2, 4, 6)
all(y == x)
all(y >= x)
all(y > x)

x <- c(7, 8, 9)
y <- c(2, 4, 6)
all(y == x)
all(y >= x)
all(x >= y)
all(x > y)

x <- c(4, 5, 6, 8)
y <- c(2, 7, 10, 8)
any(x > y)
any(x < y)
any(x == y)

x <- c(1, 2, 3)
y <- c(1, 2, 3)
z <- c(1, 2, 5)
identical(x, y)
identical(x, z)
all.equal(x, y)
all.equal(x, z)

x <- c(4, 5, 6)
y <- 4:6
x
y
typeof(x)
typeof(y)
identical(x, y)
all.equal(x, y)

#
# 27. Vector correlation
#

sal <- c(80, 66, 42, 40, 75, 82, 54, 44, 85, 83)
edu <- c(15, 18, 12, 12, 16, 17, 13, 12, 17, 16)
cor.test(sal, edu)

#
# Section 4
#
# 30. Creating matrices with the matrix() function
#

m <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3)
m
m <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3, byrow = TRUE)
m

m <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2)
m
m <- matrix(c(1, 2, 3, 4, 5, 6), ncol = 3)
m

m2 <- matrix(c(1, 2, 3, 4, 5, 6, 7), nrow = 2)
m2

class(m)
typeof(m)
dim(m)
nrow(m)
ncol(m)

m <- matrix(1:12, nrow = 4, byrow = TRUE)
m
typeof(m)

m <- matrix(rep(8, 9), nrow = 3)
m

m <- matrix(seq(1, 5, length = 20), nrow = 5, byrow = TRUE)
m

m <- matrix(rnorm(20), nrow = 5, byrow = TRUE)
m

#
# 31. Creating matrices with the rbind() and cbind() functions
#

x <- c(1, 2, 3, 4)
y <- c(10,11, 12, 13)
z <- c(20, 30, 40, 50)

m <- rbind(x, y, z)
m
class(m)
typeof(m)

m <- rbind(y, z, x)
m

m <- rbind(x, y, x, z)
m

m <- rbind(c(1, 2, 3), c(7, 8, 9), c(21, 22, 23))
m

m <- cbind(x, y, z)
m

#
# 32. Naming matrix row and columns
#

m <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, dimnames = list(c("row1", "row2"), c("col1", "col2", "col3")))
m

m <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2)
m

rownames(m) <- c("row1", "row2")
m
colnames(m) <- c("col1", "col2", "col3")
m
rownames(m) <- NULL
colnames(m) <- NULL
m

#
# 33. Indexing matrices
#

m <- matrix(1:16, nrow = 4, byrow = TRUE)
m
m[2, 3]
m[4, 1]
c(m[2, 2], m[4, 3])

m[2,]
x <- m[2,]
x

m[, 3]
m[2, 2:4]

m[c(1, 4), 3]
m[c(2, 4), c(2, 4)]
m[2:4, 3:4]

m
c(m[1:2, 1:2], m[3:4, 3:4])

m[5]
m[c(5, 7)]
m[5:7]

m[2, -3]
m[4, c(-2, -4)]

m[2:4, -1]

#
# 34. Filtering matrices
#

i <- sample(100, 16, replace = TRUE)
m <- matrix(i, nrow = 4, byrow = TRUE)
i
m
m[m > 50]
m[m < 70]
m[m < 70 & m > 30]
m[m > 70 | m < 20]
m[m == 0 | m < 30]
m[m == 83 | m < 30]

m
which(m == 14)
which(m > 50)

#
# 35. Editing values in matrices
#

m <- matrix(1:16, nrow = 4, byrow = TRUE)
m

m[3, 4] <- 100
m
m[7] <- 100
m
m[1, 2:4] <- 100
m
m[2,] <- 0
m
m[1, 2:4] <- c(31, 32, 33)
m
m[c(7, 9)] <- c(1000, 2000)
m

#
# 36. Adding and deleting rows and columns
#

m <- matrix(1:16, nrow = 4, byrow = TRUE)
m
m <- rbind(m, c(50, 60, 70, 80))
m
x <- c(8, 10 ,12, 14)
x
m <- rbind(m, x)
m
rownames(m) <- NULL
m
m2 <- matrix(21:28, nrow = 2, byrow = TRUE)
m <- rbind(m, m2)
m

m <- matrix(1:16, nrow = 4, byrow = TRUE)
m
m <- cbind(m, c(100, 101, 102, 103))
m
m2 <- matrix(51:58, nrow = 4, byrow = TRUE)
m2
m <- cbind(m, m2)
m

m <- matrix(1:16, nrow = 4, byrow = TRUE)
m
m1 <- m[-2,]
m1
m1 <- m[, -1]
m1
m1 <- m[c(-1, -3), ]
m1
m1 <- m[, c(-1, -3)]
m1
m1 <- m[-1:-3, ]
m1
m1 <- m[, -1:-3]
m1

#
# 37. Minima and Maxima in matrices
#

i <- sample(100, 20)
m <- matrix(i, nrow = 4, byrow = TRUE)
m

min(m)
max(m)

min(m[3, ])
max(m[, 4])

m
which.min(m)
which.max(m)
which.min(m[3, ])
which.max(m[, 5])

pmin(m[2, ], m[3, ])
pmax(m[2, ], m[3, ])

#
# 38. Applying functions to matrices
#


























