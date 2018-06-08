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
(1:10) -> myobject

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
