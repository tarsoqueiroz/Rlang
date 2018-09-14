#
# @Cel
#

#
# Funções polinomiais
#
library(ggplot2)

fp0 <- function(x) {
  return(5)
}
fp1 <- function(x) {
  return(10 + 3 * x^1)
}
fp2 <- function(x) {
  return(12 - 3 * x^1 + 2 * x^2)
}
fp3 <- function(x) {
  return(1 - 23 * x^1 + 2 * x^2 + 5 * x^3)
}

ggplot() +
  stat_function(data = data.frame(x = c(-5, 5)),
                aes(x),
                fun = fp3,
                color = 'gray')


ggplot() +
  stat_function(data = data.frame(x = c(-5, 5)),
                aes(x),
                fun = fp0,
                color = 'red',
                size = 1) +
  stat_function(data = data.frame(x = c(-5, 5)),
                aes(x),
                fun = fp1,
                color = 'green') +
  stat_function(data = data.frame(x = c(-5, 5)),
                aes(x),
                fun = fp2,
                color = 'blue') +
  stat_function(data = data.frame(x = c(-5, 5)),
                aes(x),
                fun = fp3,
                color = 'gray')


?kmeans
dbinom(1, 3, 0.5)


vars <- c(1041, 881, 1007, 895, 761, 1036, 1114, 980, 970, 1062)
mean(c(6000, 5000, 3000, 5000, 4500))
mean(c(4000, 5000, 3000, 5000, 4000))
mean(c(6500, 5000, 3000, 5000, 4500))
mean(c(4000, 5000, 3000, 5000, 4500))
sd(vars)
quantile(vars)


slope <- lm(y~x, data = dat)$coefficients[2]
intercept <- lm(y~x, data = dat)$coefficients[1]
slope
intercept

intercept <- 2263.818 - 38.54545 * 32.18395
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


# 4 sinais de 4 tempos, prob = 0,1,2,3,4

numSinaisVerdes <- c(0, 4)
numSinais <- 4
probSinais <- 0.5

dbinom(numSinaisVerdes, numSinais, probSinais)

set.seed(2345)
sample(c(1000), 2)


# Media = 8, dp = 4. Objeto < 6 ou > 10?
pnorm(6, 8, 4) + (1 - pnorm(10, 8, 4))
pnorm(6, 8, 4)
# or
pnorm(6, 8, 2) + pnorm(10, 8, 2, lower.tail = FALSE)

# Media = 8, dp = 2. Objeto < 10 e > 8?
pnorm(10, 8, 2) - pnorm(8, 8, 2)


# Média 2 acidentes. Probabilidade de ocorrer 3 acidentes
dpois(3, lambda = 2)
# Probabilidade de ocorrer 3 ou menos acidentes
1 - ppois(3, lambda = 2)
# Probabilidade de ocorrer mais de 3 acidentes
ppois(3, lambda = 2, lower.tail = F)

x <- c(18,20,21,28,33,38,43,48,53,58,63)
y <- c(871,1132,5435,1200,1356,1488,1600,2130,2454,3066,4090)
cj <- data.frame(x, y)

lm(y~x, data = cj)

library(ggplot2)
ggplot() +
  geom_point(data = cj, aes(x = x, y = y))

?correlation

slope <- 1354.17 / 15.3348
c <- cor(x, y,use = "everything", method = c("person"))
c < cor(x, y, use = "everything", method = c("pearson", "kendall", "spearman"))
c
r <- c^2
r
?cor

#
# 
#
library(ggplot2)

x <- 1:(9 * 22)
data <- sample(x, replace = T)
tsdata <- ts(data, start = c(2018,1,1), end = c(2018,10,30), frequency = 22)
plot(tsdata)
head(tsdata)

