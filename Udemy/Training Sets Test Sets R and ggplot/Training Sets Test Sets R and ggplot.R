#
# Udemy - Training Sets, Test Sets, R and ggplot
#

#
# S01C01 - Introduction
#

#
# S01C02 - Row-slicing data frames
#

dat <- read.csv(file.choose())
head(dat)

dat[732,2]
dat[732,]
dat[54,]

indices <- c(605, 3, 321)
dat[indices,]

-indices
dat[-indices,]
head(dat[-3,])
head(dat)

indices <- 400:500
indices
dat[indices,]

sample(10, 4)
sample(20, 11)
indices <- sample(1000, 500)
indices
dat[indices,]

train <- dat[indices,]
test  <- dat[-indices,]

#
# S01C03 - Plotting the training and test sets
#

head(dat)
length(dat[,1])

indices <- sample(1000, 500)
train <- dat[indices,]
test  <- dat[-indices,]

ggplot() +
  geom_point(data = train,
             aes(x = x, y = y)) +
  ggtitle('TRAINING SET')

ggplot() +
  geom_point(data = test,
             aes(x = x, y = y)) +
  ggtitle('TEST SET')

ggplot() +
  geom_point(data = train,
             aes(x = x, y = y),
             color = 'yellow') +
  geom_point(data = test,
             aes(x = x, y = y)) +
  ggtitle('DAT SET')

#
# S01C04 - Plotting the least-squares line
#

library(readxl)

train <- read_excel(file.choose())
test  <- read_excel(file.choose())

Test <- read_excel("Udemy/Training Sets Test Sets R and ggplot/Test.xlsx")
head(Test)
head(test)

model <- lm(y~x, data = train)
model

x = 4
predict(model, data.frame(x))

x <- c(1, 9)
y <- predict(model, data.frame(x))
y
endpoints <- data.frame(x, y)
endpoints

ggplot() +
  geom_point(data = train,     aes(x = x, y = y)) +
  geom_line (data = endpoints, aes(x = x, y = y), color = 'red', size = 1) +
  ggtitle('TRAINING SET')

#
# S01C05 - Calculating the teste MSE
#

x <- test$x
predict(model, data.frame(x))
predict(model, test)
sum((test$y - predict(model, test))^2)
mse_test <- mean((test$y - predict(model, test))^2)
mse_test ## 117.1437

#
# S01C06 - Generating a Quadratic Model
#

model <- lm(y~x + I(x^2), data = train)
model

f <- function(x) {
  return(predict(model, data.frame(x)))
}

ggplot() +
  geom_point(data = train,     aes(x = x, y = y)) +
  geom_line (data = endpoints, aes(x = x, y = y), color = 'red', size = 1) +
  stat_function(data = data.frame(x = c(1,9)), aes(x = x), fun = f, color = 'blue') +
  ggtitle('TRAINING SET')

ggplot() +
  geom_point(data = test,      aes(x = x, y = y)) +
  geom_line (data = endpoints, aes(x = x, y = y), color = 'red', size = 1) +
  stat_function(data = data.frame(x = c(1,9)), aes(x = x), fun = f, color = 'blue') +
  ggtitle('TEST SET')

#
# S01C07 - Calculating the test MSE for the quadratic model
#

mseq_test <- mean((test$y - predict(model, test))^2)
mseq_test ## 100.5743
























