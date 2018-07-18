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
# 38. Applying functions to matrices (1)
#

m <- matrix(1:16, nrow = 4)
m
apply(m, 1, sum)
apply(m, 2, sum)

apply(m, 1, prod)
apply(m, 2, prod)

apply(m, 1, mean)
apply(m, 2, mean)

apply(m, 1, sd)
apply(m, 2, sd)

#
# 39. Applying functions to matrices (2)
#

m <- matrix(1:16, nrow = 4, byrow = TRUE)
m

apply(m, 1, cumsum)

m1 <- matrix(apply(m, 1, cumsum), nrow = 4, byrow = TRUE)
m1

m
apply(m, 2, cumsum)
apply(m, 1, sqrt)
m
apply(m, 2, sqrt)
apply(m, 2, log)
apply(m, 2, exp)

m 
m1 <- matrix(apply(m, 1, sqrt), nrow = 4, byrow = TRUE)
m1

m 
m1 <- matrix(apply(m, 1, log), nrow = 4, byrow = TRUE)
m1

f <- function(x) { 2 * x + 3}
m
apply(m, 1, f)
m
apply(m, 2, f)

#
# 40. Applying functions to matrices (3)
#

m <- matrix(1:12, nrow = 3, byrow = TRUE)

m
sweep(m, 1, c(10,20,30), "+")
sweep(m, 1, c(10,20,30), "-")
sweep(m, 1, c(10,20,30), "*")
sweep(m, 1, c(10,20,30), "/")

m
sweep(m, 2, c(10,20,30,40), "+")
sweep(m, 2, c(10,20,30,40), "-")
sweep(m, 2, c(10,20,30,40), "*")
sweep(m, 2, c(10,20,30,40), "/")

#
# 41. Adding and Multiplying matrices
#

m1 <- matrix(1:9, nrow = 3, byrow = TRUE)
m2 <- matrix(101:109, nrow = 3, byrow = TRUE)

m <- m1 + m2
m1
m2
m

m1 <- matrix(1:15, nrow = 3, byrow = TRUE)
m2 <- matrix(1:20, nrow = 5, byrow = TRUE)
m1
m2

m <- m1 %*% m2
m

#
# 42. Other matrix operations
#

m <- matrix(1:20, nrow = 5, byrow = TRUE)
m
t(m)

m <- matrix(c(2,4,8,12,5,7,9,15,10), nrow = 3, byrow = TRUE)
m
det(m)

mi <- solve(m)
mi
m %*% mi

m
x <- diag(m)
x
class(x)

x <- c(10,12,14,16,18)
diag(x)

diag(rep(1,5))

#
# 43. Creating multidimensional Arrays
#

market1 <- matrix(c(22,44,66,9,11,5), nrow = 3)
market1
rownames(market1) <- c("brand1", "brand2", "brand3")
colnames(market1) <- c("code", "price")
market1

market2 <- matrix(c(55,77,99,10,14,20), nrow = 3)
market2
rownames(market2) <- c("brand1", "brand2", "brand3")
colnames(market2) <- c("code", "price")
market2

markets <- array(data=c(market1, market2), dim=c(3,2,2))
markets

markets2 <- array(data=c(market1, market2))
markets2

markets

markets <- array(data=c(market1, market2), dim=c(3,2,2),
                 dimnames = list(c("brand1", "brand2", "brand3"), c("code", "price"), c("smark1", "smark2")))
markets
dim(markets)
dimnames(markets)

#
# 44. Indexing multidimensional arrays
#

markets
markets[,,1]
markets[,,2]
markets[,2,1]
markets[,1,2]
markets[3,2,1]
markets[2,2,2]
markets[1,,1]
markets[3,,2]
markets[2,1,]
markets[3,,]
markets[,1,]

#
# Section 5
#
# 46. Create lists with the list() funcion
#

employees <- list(names=c("Mark", "Tom", "Laura", "Sandra"),
                  age=c(49, 28, 35, 25),
                  gender=c("m", "m", "f", "f"),
                  salary=c(75000, 62000, 55000, 46000),
                  manager=c(TRUE, FALSE, FALSE, FALSE))
employees

employees2 <- list(c("Mark", "Tom", "Laura", "Sandra"),
                   c(49, 28, 35, 25),
                   c("m", "m", "f", "f"),
                   c(75000, 62000, 55000, 46000),
                   c(TRUE, FALSE, FALSE, FALSE))
employees2

class(employees)
typeof(employees)

str(employees)
str(employees2)
names(employees)
names(employees2)

lunch <- list(Fred=c("omelette", "fried potatoes", "chicken", "icecream"),
              Jack=c("salada", "beef steak"),
              Peter=c("salad", "lasagna", "pancakes"),
              bill=100)
lunch
str(lunch)

#
# 47. Create lists with the vector() funcion
#

employ <- vector(mode = "list")
class(employ)

employ[["names"]]   <- c("Mark", "Tom", "Laura", "Sandra")
employ[["age"]]     <- c(49, 28, 35, 25)
employ[["gender"]]  <- c("m", "m", "f", "f")
employ[["salary"]]  <- c(75000, 62000, 55000, 46000)
employ[["manager"]] <- c(TRUE, FALSE, FALSE, FALSE)
employ

#
# 48. Indexing lists with brackets
#

employees <- list(names=c("Mark", "Tom", "Laura", "Sandra"),
                  age=c(49, 28, 35, 25),
                  gender=c("m", "m", "f", "f"),
                  salary=c(75000, 62000, 55000, 46000),
                  manager=c(TRUE, FALSE, FALSE, FALSE))
employees[["names"]]
x <- employees[["names"]]
x
class(x)
typeof(x)

employees[["age"]]
employees[[1]]
employees[[5]]

employees[["names"]][3]
employees[[1]][3]
employees[[c(1,3)]]

employees[["salary"]][2]
employees[[4]][2]
employees[[c(4,2)]]

employees[["salary"]][1:3]
employees[["salary"]][c(1,4)]

employees[["salary"]][-2]
employees
employees[["age"]][-1:-3]

#
# 49. Indexing lists using objects names
#

employees <- list(names=c("Mark", "Tom", "Laura", "Sandra"),
                  age=c(49, 28, 35, 25),
                  gender=c("m", "m", "f", "f"),
                  salary=c(75000, 62000, 55000, 46000),
                  manager=c(TRUE, FALSE, FALSE, FALSE))
employees

employees$names
employees$gender
employees$salary

employees$salary[2]
employees$salary[2:4]

employees$salary[-1]

emp2 <- list(age=employees$age, salary=employees$salary)
emp2
class(emp2)

#
# 50. Editing values in lists
#

employees <- list(names=c("Mark", "Tom", "Laura", "Sandra"),
                  age=c(49, 28, 35, 25),
                  gender=c("m", "m", "f", "f"),
                  salary=c(75000, 62000, 55000, 46000),
                  manager=c(TRUE, FALSE, FALSE, FALSE))
employees

employees[["salary"]][2] <- 64000
employees

employees$salary[2] <- 66000
employees

employees[["manager"]][3] <- TRUE
employees

employees[["salary"]] <- c(85000, 7000, 69000, 49000)
employees

#
# 51. Adding and removing list objects
#

employees <- list(names=c("Mark", "Tom", "Laura", "Sandra"),
                  age=c(49, 28, 35, 25),
                  gender=c("m", "m", "f", "f"),
                  salary=c(75000, 62000, 55000, 46000),
                  manager=c(TRUE, FALSE, FALSE, FALSE))
employees

employees$hours <- c(200, 220, 235, 215)
employees

employees$hours <- NULL
employees

employees[["names"]][5] <- "Ken"
employees[["age"]][5] <- 58
employees[["gender"]][5] <- "M"
employees[["salary"]][5] <- 43000
employees[["manager"]][5] <- FALSE
employees

#
# 52. Applying functions to lists
#

carspec <- list(engine=c(1.8, 3.2, 3.5, 1.8, 2.8, 4.2),
                horse=c(140, 225, 210, 150, 200, 310),
                weight=c(2639, 3517, 3850, 2998, 3561, 3902))
carspec

lapply(carspec, mean)
l <- lapply(carspec, mean)
l
class(l)
typeof(l)

lapply(carspec, sd)

lapply(carspec, sum)
lapply(carspec, prod)

lapply(carspec, cumsum)
lapply(carspec, cumprod)

lapply(carspec, log)

f <- function(x) { x^2 + 3 * x }
lapply(carspec, f)

sapply(carspec, mean)
s <- sapply(carspec, mean)
s
class(s)
typeof(s)
names(s)

sapply(carspec, mean, simplify = FALSE)
s <- sapply(carspec, mean)
s
class(s)
typeof(s)
names(s)

carspec2 <- list(make=c("Toyota", "Honda", "Renault", "Mazda", "Volkswagen", "BMW"),
                engine=c(1.8, 3.2, 3.5, 1.8, 2.8, 4.2),
                horse=c(140, 225, 210, 150, 200, 310),
                weight=c(2639, 3517, 3850, 2998, 3561, 3902))
carspec2
lapply(carspec2, mean)
sapply(carspec2, mean)

#
# 53. Practical example of list: the regression analysis output
#

price  <- c(21.5, 28.4, 42.0, 23.9, 33.9, 62.0, 26.9, 33.4, 39, 21.9)
engine <- c(1.8, 3.2, 3.5, 1.8, 2.8, 4.2, 2.5, 2.8, 2.8, 3.1)
horse  <- c(140, 225, 210, 150, 200, 310, 170, 193, 195, 175)

fit <- lm(price~engine+horse)
fit
typeof(fit)
names(fit)

fit$coefficients
fit$coefficients[2]
fit$coefficients[1]
fit$call
fit$model
fit$fitted.values
fit$residuals

#
# Section 6
#
# 56. Working with factors
#

x <- c(4,4,6,5,6,6,6,4,4,5,4,5,6,4)
f <- factor(x)
f

y <- c("a","b","c","b","a","c","b","a","a","c")
ff <- factor(y)
ff

levels(f)
levels(ff)

x
f <- factor(x, labels = c("Ford", "Toyota", "Mercedes"))
f

f <- factor(x, levels = c(5,6,4), labels = c("Ford", "Toyota", "Mercedes"))
x
f

x <- c(1,1,3,2,2,1,3,3,2,1,1,2,3)
f <- ordered(x, levels=c(1,2,3), labels=c("elementary","middle","high"))
f
f <- ordered(x, levels=c(3,2,1), labels=c("elementary","middle","high"))
f
f <- ordered(x, labels=c("elementary","middle","high"))
f

length(f)
f[10]
f[14] <- "elementary"
f
f <- ordered(x, levels=c(1,2,3,4), labels=c("elementary","middle","high","doctoral"))
f
f[14] <- "doctoral"
f
f[15] <- "unknown"
f

#
# 57. Splitting a vector by a factor levels
#

sal <-          c(1000, 1800, 2500, 1750, 1900, 2700, 2100, 1100)
categ <- factor(c("W",  "MM", "TM", "MM", "W",  "TM", "MM", "W"))
split(sal, categ)
s <- split(sal, categ)
class(s)
names(s)
s["MM"]

gender <- factor(c("Male", "Female", "Male", "Male", "Female", "Female", "Male", "Female"))
s <- split(sal, list(categ, gender))
s
class(s)

#
# 58. The tapply() function
#

sal <-          c(1000, 1800, 2500, 1750, 1900, 2700, 2100, 1100)
categ <- factor(c("W",  "MM", "TM", "MM", "W",  "TM", "MM", "W"))

tapply(sal, categ, mean)
t <- tapply(sal, categ, mean)
t
class(t)
gender <- factor(c("Male", "Female", "Male", "Male", "Female", "Female", "Male", "Female"))
t <- tapply(sal, list(categ, gender), mean)
t
class(t)

#
# 59. The by() function
#

sal <-          c(1000, 1800, 2500, 1750, 1900, 2700, 2100, 1100)
categ <- factor(c("W",  "MM", "TM", "MM", "W",  "TM", "MM", "W"))

by(sal, categ, mean)
b <- by(sal, categ, mean)
b
class(b)
typeof(b)

b[2]

b <- as.list(b)
b

b$TM

#
# Section 7
#
# 61. Creating Data Frames
#

x <- 1:10
y <- rnorm(10)
x
y
dt <- data.frame(x, y)
dt
View(dt)

z <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j")
w <- c(TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE)
dt <- data.frame(x, y, z, w, stringsAsFactors = FALSE)
dt
View(dt)

dt <- data.frame(x, y, z, w, 
                 row.names = c("row1","row2","row3","row4","row5","row6","row7","row8","row9","row10"),
                 stringsAsFactors = FALSE)
View(dt)
class(dt)
typeof(dt)

dim(dt)
nrow(dt)
ncol(dt)

str(dt)

#
# 62. Loading Data Frames from external files
#

bm <- read.csv("./Udemy/R Programming For Absolute Beginners/datasets/bank-marketing.csv", 
               header = TRUE,
               sep = ";",
               stringsAsFactors = FALSE)
bm
View(bm)

car <- read.csv("./Udemy/R Programming For Absolute Beginners/datasets/carsales.csv", 
               stringsAsFactors = FALSE)
car
View(car)

cpu <- read.csv("./Udemy/R Programming For Absolute Beginners/datasets/cpu-performance-data.txt", 
                sep = ",",
                header = FALSE,
                stringsAsFactors = FALSE)
cpu
View(cpu)
# or
cpu <- read.delim("./Udemy/R Programming For Absolute Beginners/datasets/cpu-performance-data.txt", 
                sep = ",",
                header = FALSE,
                stringsAsFactors = FALSE)
cpu
View(cpu)

#
# 63. Writing Data Frames in external files
#

x <- 1:10
y <- rnorm(10)
z <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j")
w <- c(TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE)
dt <- data.frame(x, y, z, w, stringsAsFactors = FALSE)
dt
View(dt)

write.csv(dt, 
          file = "./Udemy/R Programming For Absolute Beginners/datasets/example.csv")
write.csv(dt, 
          file = "./Udemy/R Programming For Absolute Beginners/datasets/example2.csv",
          row.names = FALSE)
write.table(dt, 
            file = "./Udemy/R Programming For Absolute Beginners/datasets/example3.csv",
            row.names = FALSE)

#
# 64. Indexing Data Frames as lists
#

bm <- read.csv("./Udemy/R Programming For Absolute Beginners/datasets/bank-marketing.csv", 
               header = TRUE,
               sep = ";",
               stringsAsFactors = FALSE)
bm
View(bm)

bm[[2]]
bm[[2]][10]

bm[["balance"]]
bm[["balance"]][4]
bm$balance
bm$balance[4]

balance <- bm$balance[2:7]
balance
class(balance)

#
# 65. Indexing Data Frames as matrices
#

bm <- read.csv("./Udemy/R Programming For Absolute Beginners/datasets/bank-marketing.csv", 
               header = TRUE,
               sep = ";",
               stringsAsFactors = FALSE)
bm
View(bm)

bm[3,]
bm[,6]
x <- bm[,6]
class(x)

y <- bm[6]
y
View(y)
class(y)

bm[3,4]
bm[1:4,]
bm[,1:3]
bm[2,1:3]
bm[1:4,5:8]
bm[1:4, c(5:8,11)]
bm1 <- bm[-1]
View(bm1)
bm1 <- bm[,-3]
View(bm1)
bm1 <- bm[-1:-5,-3:-5]
View(bm1)

#
# 66. Selecting a random sample of entries
#

bm <- read.csv("./Udemy/R Programming For Absolute Beginners/datasets/bank-marketing.csv", 
               header = TRUE,
               sep = ";",
               stringsAsFactors = FALSE)
bm
View(bm)

nrows <- nrow(bm)
nrows

i <- sample(nrows, 100)
i
bm1 <- bm[i,]
bm1
View(bm1)
vm

bm2 <- bm[-i,]
View(bm2)

#
# 67. Filtering Data Frames
#

bm <- read.csv("./Udemy/R Programming For Absolute Beginners/datasets/bank-marketing.csv", 
               header = TRUE,
               sep = ";",
               stringsAsFactors = FALSE)
View(bm)

bm1 <- bm[bm$balance > 1000,]
View(bm1)
bm1 <- bm[bm$duration < 150,]
View(bm1)
bm1 <- bm[bm$duration == 185,]
View(bm1)
bm1 <- bm[bm$education == "tertiary",]
View(bm1)
bm1 <- bm[bm$education == "tertiary" & bm$balance > 2000,]
View(bm1)
bm1 <- bm[bm$education == "tertiary" & bm$marital == "married",]
View(bm1)
bm1 <- bm[bm$education == "tertiary" & bm$marital == "married", c(1:4,6)]
View(bm1)

#
# 68. Editing values in Data Frames
#

bm <- read.csv("./Udemy/R Programming For Absolute Beginners/datasets/bank-marketing.csv", 
               header = TRUE,
               sep = ";",
               stringsAsFactors = FALSE)
View(bm)

bm[2,3] <- "married"
View(bm)

bm$balance[1] <- 1000
bm$loan[7] <- "no"

bm$balance[4:6] <- c(400,500,600)

#
# 69. Adding rows and columns to Data Frames
#

car <- read.csv("./Udemy/R Programming For Absolute Beginners/datasets/carsales.csv", 
                header = TRUE,
                stringsAsFactors = FALSE)
View(car)




































