#
# Ensaio para curva de Delta Estrutural
#

#install.packages("ggplot2")
library(ggplot2)

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

lStock <- seq(17, 31, by=0.01)
lHA <- (callSell(lStock, 18) + callBuy(lStock, 19) * 1.3)
plot(x = lStock,
     y = lHA, 
     type = 'l', 
     main = "Structural Delta",
     xlab = "Value of Stock",
     ylab = "Delta")
dfHA <- data.frame(Stock=lStock, Delta=lHA)
View(dfHA)
ggplot(dfHA, aes(Stock, Delta))+
  geom_line()

lStock <- seq(17, 21, by=0.01)
lTA <- (callBuy(lStock, 18) + callSell(lStock, 20))
plot(x = lStock,
     y = lTA, 
     type = 'l', 
     main = "Structural Delta of TA",
     xlab = "Value of Stock",
     ylab = "Delta")

dfTA <- data.frame(Stock=lStock, Delta=lTA)
ggplot(dfTA, aes(Stock, Delta))+
  geom_line()

lStock <- seq(15, 30, by=0.01)
lRatio <- (callBuy(lStock, 20) + callSell(lStock, 23) * 2 + callBuy(lStock, 24))
plot(x = lStock,
     y = lRatio, 
     type = 'l', 
     main = "Structural Delta of TA",
     xlab = "Value of Stock",
     ylab = "Delta")

dfRatio <- data.frame(Stock=lStock, Delta=lRatio)
ggplot(dfRatio, aes(Stock, Delta))+
  geom_line()

lStock <- seq(15, 30, by=0.01)
lRatio <- (callBuy(lStock, 20) + callSell(lStock, 23) * 2 + callBuy(lStock, 24) +
           callBuy(lStock, 21) + callSell(lStock, 22) * 2 + callBuy(lStock, 25) +
           callBuy(lStock, 22) + callSell(lStock, 25) * 2 + callBuy(lStock, 26))
plot(x = lStock,
     y = lRatio, 
     type = 'l', 
     main = "Structural Delta of TA",
     xlab = "Value of Stock",
     ylab = "Delta")

dfRatio <- data.frame(Stock=lStock, Delta=lRatio)
ggplot(dfRatio, aes(Stock, Delta))+
  geom_line()



lStock <- seq(23, 28, by=0.01)

lPetrX250 <- (3 * putBuy(lStock, 24.39) + 2 * putSell(lStock, 26.98))
lPetrX280 <- (3 * putBuy(lStock, 27.39) + 3 * putSell(lStock, 26.98))
lTHLp     <- (lPetrX250 + lPetrX280)

dfTHLp    <- data.frame(Stock  =lStock, 
                      DeltaX250=lPetrX250, 
                      DeltaX280=lPetrX280, 
                      DeltaTHLp=lTHLp)

ggplot(dfTHLp, aes(Stock))+
  geom_line(aes(y = DeltaX250, colour = 'THLp X250')) +
  geom_line(aes(y = DeltaX280, colour = 'THLp X280')) +
  geom_line(aes(y = DeltaTHLp, colour = 'THLp')) +
  theme(plot.title   = element_text(color="red",     size=18, face="bold"),
        axis.title.x = element_text(color="blue",    size=14, face="bold"),
        axis.title.y = element_text(color="blue",    size=14, face="bold")) +
  labs(title = "Delta Estrutural",
       x = "Ação",
       y = "Delta",
       colour = "Estruturas")
  
