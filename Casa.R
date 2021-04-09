
vold <- 52.47 / sqrt(252) / 100
vold

bbest <- function(stock) { 1 / pi / stock / 0.022 / sqrt(24)  }

valBB <- bbest(18)

petr4 <- seq(15, 22, 0.25)
petr4
bbPetr4 <- bbest(petr4)
bbPetr4
bb$petr4 <- petr4
bb$estBB <- bbPetr4
bb <- data.frame(petr4, bbPetr4)
bb
View(bb)


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