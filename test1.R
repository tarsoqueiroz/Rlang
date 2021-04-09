#
# Testes sobre a linguagem R
#

funSimpleParm <- function(x) { x * 10 + 1 }
funDoubleParm <- function(x, y) { x * 100 + y }

funSimpleParm(10)
funDoubleParm(1, 2)
sqRange1 <- seq(1, 10)
sqRange2 <- seq(1, 20, 2)
sqRange1
sqRange2 
funSimpleParm(sqRange1)
funDoubleParm(sqRange1, sqRange2)
funDoubleParm(12, sqRange2)
funDoubleParm(sqRange1, 34)
