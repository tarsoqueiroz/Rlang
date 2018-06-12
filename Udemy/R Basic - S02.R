#----------------------#
# R Basic - session 02 #
#----------------------#

#----------#
# Class 10 #
#----------#

# Giant calculator
4 + 4 + 5
4 + 4             + 5

# Operators: + - / * ^
4 + 2
4 - 2 
4 * 2 
4 / 2 
4 ^ 2 

 5 - 3  ^ 3
(5 - 3) ^ 3

# Creating objects
x <- c(4, 5, 6)
c(4, 5, 6) -> y
assign("z", c(4, 5, 6)) 

# See a object created
ls()
objects()

# Removing objects
rm("x")

# Working with vectors
x = c(y, 5, z)
x

# Sum and roots
sum(x)
sqrt(x)

# Values at a given position within the vector
x[1]

newobject <- x < 5; newobject

#----------#
# Class 11 #
#----------#

### Functions: seq, paste, rep

?seq # starting with the seq function
seq()
seq(3,5)
seq(from=3, to=5)
seq(to=5, from=3)
seq(to=5, from=3, by=0.5)

?paste # next funcion
paste(1:4)
class(paste(1:4))
paste("xyz", 1:10)
paste("xyz", c(2,5,7,"test",4.5))
paste("xyz", 1:10, sep=".")
paste("file", 1:10, sep="")
paste(paste("file", 1:10, sep=""), "ext", sep=".")

?rep #next function
rep(c(3,4,5), 3)
rep(1:10, times=3)
x = c(1,2,3)
rep(x, each=3)
rep(x, each=3, times=3)

## working with index positions
x=4:20
which(x==10)
x[6]
x[7]

#----------#
# Class 12 #
#----------#

### Exercices

# 1) Create the objetct "myobject" and assign the values 1:10 in at least 3 differente ways

myobject = c(1,2,3,4,5,6,7,8,9,10)
myobject <- (1:10)
myobject = (1:10)
(1:10) -> myobject#----------------------#
# R Basic - session 02 #
#----------------------#

#----------#
# Class 10 #
#----------#

# Giant calculator
4 + 4 + 5
4 + 4             + 5

# Operators: + - / * ^
4 + 2
4 - 2 
4 * 2 
4 / 2 
4 ^ 2 

5 - 3  ^ 3
(5 - 3) ^ 3

# Creating objects
x <- c(4, 5, 6)
c(4, 5, 6) -> y
assign("z", c(4, 5, 6)) 

# See a object created
ls()
objects()

# Removing objects
rm("x")

# Working with vectors
x = c(y, 5, z)
x

# Sum and roots
sum(x)
sqrt(x)

# Values at a given position within the vector
x[1]

newobject <- x < 5; newobject

#----------#
# Class 11 #
#----------#

### Functions: seq, paste, rep

?seq # starting with the seq function
seq()
seq(3,5)
seq(from=3, to=5)
seq(to=5, from=3)
seq(to=5, from=3, by=0.5)

?paste # next funcion
paste(1:4)
class(paste(1:4))
paste("xyz", 1:10)
paste("xyz", c(2,5,7,"test",4.5))
paste("xyz", 1:10, sep=".")
paste("file", 1:10, sep="")
paste(paste("file", 1:10, sep=""), "ext", sep=".")

?rep #next function
rep(c(3,4,5), 3)
rep(1:10, times=3)
x = c(1,2,3)
rep(x, each=3)
rep(x, each=3, times=3)

## working with index positions
x=4:20
which(x==10)
x[6]
x[7]

#----------#
# Class 12 #
#----------#

### Exercices

# 1) Create the objetct "myobject" and assign the values 1:10 in at least 3 differente ways

myobject = c(1,2,3,4,5,6,7,8,9,10)
myobject <- (1:10)
myobject = (1:10)
(1:10) -> myobject

# 2) Get teh sum of your object

sum(myobject)

# 3) Create the following vector by using the paste function
# "R is great 4 and I will love it"
# "R is great 7 and I will love it"

# 2) Get teh sum of your object

sum(myobject)

# 3) Create the following vector by using the paste function
# "R is great 4 and I will love it"
# "R is great 7 and I will love it"
# "R is great 45 and I will love it"

paste("R is great", c(4,7,45), "and I will love it")

# 4) Vector of 1,2,3 : repeat the vector to get 11 x 1, 10 x 2, and 10 x 3

x = rep(1:3, length = 31); x


# 5) What is teh value of this vector on position 7
x[7]

#----------#
# Class 12 #
#----------#

# Functions in R
#
# Description: R functions are OBJECTS the do calculations for you
# R function structure: name <- function (argument) { statements }
# the arguments specify the components to be used in the funcion

myfirstfn <- function(x) { x+ x }
myfirstfn(10)

mysecondfn <- function(t, z) {
  value = z * 3
  value = value * t
  print(value)
}

t = 5
z = 9
mysecondfn(t, z)

# Loops - loops and functions are a crucial part in programming

for (i in 1:15) { print(i) }
for (z in 1:15) { print(z) }

# Can be used for quite compplex calculations
# Example calculation of primes with the Eratosthenes method 
PrimVec = function(n) {
  # to start from 2
  if (n >= 2) {
    # to further specify the sequence we want to work with
    s = seq(2, n)
    # p will be the container for our primes,
    # numbers will be moved from s to p step by step if they meet the criteria
    p = c()
    # we start the loop
    for (i in seq(2, n)) {
      # we use any to check that i (of this loop round) is still in s, multiply
      if (any(s == i)) {
        # we store i if it meets our criteria in p together with the previous
        p = c(p, i)
        # to search for numbers with a remainder at modulus division
        s = c(s[(s %% i) != 0], i)
      }
    }
    return(p)
  }
  # to specify the output if n < 2 (optional)
  else {
    stop("Input at least 2")
  }
}

PrimVec (200)

# to learn more about loops and functions take a look an my level 1 course

#----------#
# Class 14 #
#----------#

# Datasets and Data.Frames

?airmiles
head(airmiles)
tail(airmiles)

summary(mtcars)
plot(mtcars)

airmiles
hist(airmiles)
head(mtcars)
sum(mtcars$wt)

attach(mtcars)
sum(wt)
detach(mtcars)
sum(wt)

mtcars[2, 6]
mtcars[c(2, 5, 8), 6]

#----------#
# Class 15 #
#----------#

# Data import

numbers = scan()
# 1: 45
# 2: 674
# 3: 454
# 4: 745
# 5: 345
# 6:
characters = scan(what = "character")
# 1: Hi
# 2: test 
# 3: names
# 4: T
# 5:

charNums = scan(what = "character")

#----------#
# Class 16 #
#----------#

library(data.table)

mydata = fread("./Udemy/Bug Frequency.csv")
mydata

df = fread("")




#----------#
# Class 17 #
#----------#



















