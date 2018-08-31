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
