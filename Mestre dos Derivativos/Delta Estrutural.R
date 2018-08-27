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



lStock <- seq(17, 25, by=0.01)

lRatio15J21 <- (callBuy(lStock, 18) + callSell(lStock, 21) * 2 + callBuy(lStock, 22))
lRatio15J22 <- (callBuy(lStock, 19) + callSell(lStock, 22) * 2 + callBuy(lStock, 23))
lRatio15J23 <- (callBuy(lStock, 20) + callSell(lStock, 23) * 2 + callBuy(lStock, 24))

lRatio15All <- (lRatio15J21 + lRatio15J22 + lRatio15J23)

dfRatio <- data.frame(Stock=lStock, 
                      DeltaR15J21=lRatio15J21, 
                      DeltaR15J22=lRatio15J22, 
                      DeltaR15J23=lRatio15J23, 
                      DeltaR15All=lRatio15All)
ggplot(dfRatio, aes(Stock))+
  geom_line(aes(y = DeltaR15J21, colour = 'RT15 miolo J21')) +
  geom_line(aes(y = DeltaR15J22, colour = 'RT15 miolo J22')) +
  geom_line(aes(y = DeltaR15J23, colour = 'RT15 miolo J23')) +
  geom_line(aes(y = DeltaR15All, colour = 'Malha')) + 
  theme(plot.title   = element_text(color="red",     size=18, face="bold"),
        axis.title.x = element_text(color="blue",    size=14, face="bold"),
        axis.title.y = element_text(color="blue",    size=14, face="bold")) +
  labs(title = "Delta Estrutural",
       x = "Ação",
       y = "Delta",
       colour = "Estruturas")
  


#
# Iron Condor
#
lStock <- seq(12, 17, by=0.01)
lIronCondor <- (callBuy(lStock, 15) + callSell(lStock, 16) +
                  putBuy(lStock, 14)  + putSell(lStock, 13))
plot(x = lStock,
     y = lIronCondor, 
     type = 'l', 
     main = "Structural Delta of Iron Condor",
     xlab = "Value of Stock",
     ylab = "Delta")

dfIronCondor <- data.frame(Stock=lStock, Delta=lIronCondor)
ggplot(dfIronCondor, aes(Stock, Delta))+
  geom_line()

#
# Iron Butterfly
#
lStock <- seq(13, 17, by=0.01)
lIronBB <- (callBuy(lStock, 15) + callSell(lStock, 16) +
              putBuy(lStock, 15)  + putSell(lStock, 14))
plot(x = lStock,
     y = lIronBB, 
     type = 'l', 
     main = "Structural Delta of Iron Condor",
     xlab = "Value of Stock",
     ylab = "Delta")

dfIronBB <- data.frame(Stock=lStock, Delta=lIronBB)
ggplot(dfIronBB, aes(Stock, Delta))+
  geom_line()

#
# Ratio 15% - I19 J22 I230
#
lStock <- seq(15, 30, by=0.01)
lDelta <- (callBuy(lStock, 18) + 
           callSell(lStock, 22) * 2 +
           callBuy(lStock, 23))
dfDelta <- data.frame(Stock=lStock, Delta=lDelta)
ggplot(dfDelta, aes(Stock, Delta))+
  geom_line()

#
# Ratio 20%
#
lStock <- seq(15, 24, by=0.01)
lDelta <- (callBuy(lStock, 16) + 
             callSell(lStock, 20) * 2 +
             callBuy(lStock, 22))
dfDelta <- data.frame(Stock=lStock, Delta=lDelta)
ggplot(dfDelta, aes(Stock, Delta))+
  geom_line()

#
# Box
#
lStock <- seq(14, 17, by=0.01)
lDelta <- (callBuy(lStock, 15) + callSell(lStock, 16) +
             putBuy(lStock, 16)  + putSell(lStock, 15))
plot(x = lStock,
     y = lDelta, 
     type = 'l', 
     main = "Structural Delta of Box",
     xlab = "Value of Stock",
     ylab = "Delta")

dfDelta <- data.frame(Stock=lStock, Delta=lDelta)
ggplot(dfDelta, aes(Stock, Delta))+
  geom_line()

#
# Malha de Ratio
#
dfDelta <- data.frame(Stock=seq(15, 30, by=0.01))
dfDelta <- data.frame(dfDelta, 
                      DeltaRT15m21=(callBuy (dfDelta$Stock, 18) + 
                                    callSell(dfDelta$Stock, 21) * 2 +
                                    callBuy (dfDelta$Stock, 22)), 
                      DeltaRT15m22=(callBuy (dfDelta$Stock, 19) + 
                                    callSell(dfDelta$Stock, 22) * 2 +
                                    callBuy (dfDelta$Stock, 23)), 
                      DeltaRT15m23=(callBuy (dfDelta$Stock, 20) + 
                                    callSell(dfDelta$Stock, 23) * 2 +
                                    callBuy (dfDelta$Stock, 24)))
dfDelta <- data.frame(dfDelta, 
                      DeltaMalhaRT212223=(dfDelta$DeltaRT15m21+
                                            dfDelta$DeltaRT15m22+
                                            dfDelta$DeltaRT15m23))
ggplot(dfDelta, aes(x=Stock))+
  geom_line(aes(y=DeltaRT15m21,       colour='RT15 miolo 21')) +
  geom_line(aes(y=DeltaRT15m22,       colour='RT15 miolo 22')) +
  geom_line(aes(y=DeltaRT15m23,       colour='RT15 miolo 23')) + 
  geom_line(aes(y=DeltaMalhaRT212223, colour='Malha'), size = 2) +
  xlim(c(17, 25)) +
  ylim(c( 0,  7)) +
  labs(title="Malha de Ratio",
       subtitle="Miolos em 21, 22 e 23",
       x="Valor da Ação",
       y="Delta Estrutural",
       caption="Sala do Mestre dos Derivativos")
