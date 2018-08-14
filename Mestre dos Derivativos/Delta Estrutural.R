#
# Ensaio para curva de Delta Estrutural
#

callBuy <- function(nValStock, nValStrike) { 
  ifelse (nValStrike < nValStock, nValStock - nValStrike, 0)
}
callSell <- function(nValStock, nValStrike) { 
  (callBuy(nValStock, nValStrike) * -1)
} 
putBuy <- function(nValStock, nValStrike) { 
  ifelse (nValStrike > nValStock, nValStrike - nValStock, 0)
}
putSell <- function(nValStock, nValStrike) { 
  (putBuy(nValStock, nValStrike) * -1)
}

print(callBuy(20, 17))
print(callSell(20, 17))
print(callBuy(17, 20))
print(callSell(17, 20))
print(callBuy(20, 19.96))
print(callSell(20, 19.96))
print(callBuy(19.96, 20))
print(callSell(19.96, 20))

print(putBuy(20, 17))
print(putSell(20, 17))
print(putBuy(17, 20))
print(putSell(17, 20))
print(putBuy(20, 19.96))
print(putSell(20, 19.96))
print(putBuy(19.96, 20))
print(putSell(19.96, 20))

nStrike <- 20.0
lStock <- seq((nStrike-5), (nStrike+5), by=0.01)
lStock

lDelta <- callBuy(lStock, nStrike)
plot(x = lStock,
     y = lDelta, 
     type = 'l', 
     main = "Structural Delta",
     xlab = "Value of Stock",
     ylab = "Delta")
lDelta <- callSell(lStock, nStrike)
plot(lDelta~lStock,
     type = 'l', 
     main = "Structural Delta",
     xlab = "Value of Stock",
     ylab = "Delta")

lDelta <- putBuy(lStock, nStrike)
plot(x = lStock,
     y = lDelta, 
     type = 'l', 
     main = "Structural Delta",
     xlab = "Value of Stock",
     ylab = "Delta")

nAsa1 <- nStrike -1
nMiolo <- nStrike
nAsa2 <- nStrike +1

lAsa1 <- callBuy(lStock, nAsa1)
lMiolo <- callSell(lStock, nMiolo) * 2
lAsa2 <- callBuy(lStock, nAsa2)
lBb <- (lAsa1 + lMiolo + lAsa2)
plot(x = lStock,
     y = lAsa1, 
     type = 'l', 
     main = "Structural Delta",
     xlab = "Value of Stock",
     ylab = "Delta")
plot(x = lStock,
     y = lMiolo, 
     type = 'l', 
     main = "Structural Delta",
     xlab = "Value of Stock",
     ylab = "Delta")
plot(x = lStock,
     y = lAsa2, 
     type = 'l', 
     main = "Structural Delta",
     xlab = "Value of Stock",
     ylab = "Delta")

lBb <- (callBuy(lStock, nAsa1) + callSell(lStock, nMiolo) * 2 + callBuy(lStock, nAsa2))
plot(x = lStock,
     y = lBb, 
     type = 'l', 
     main = "Structural Delta",
     xlab = "Value of Stock",
     ylab = "Delta")

lHA <- (callSell(lStock, 17.5) + callBuy(lStock, 18.5) * 1.3)
plot(x = lStock,
     y = lHA, 
     type = 'l', 
     main = "Structural Delta",
     xlab = "Value of Stock",
     ylab = "Delta")
