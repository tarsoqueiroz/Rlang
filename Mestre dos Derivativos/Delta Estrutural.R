#
# Ensaio para curva de Delta Estrutural
#

resultOption <- function(nValStock, nValStrike) { 
  ifelse (nValStrike < nValStock, nValStock - nValStrike, 0)
}

print(resultOption(20, 17))
print(resultOption(20, 19.96))
print(resultOption(19.96, 20))

nStrike <- 19.96
lStock <- seq((nStrike-1), (nStrike+1), by=0.01)
lStock

lDelta <- resultOption(lStock, nStrike)
plot(x = lStock,
     y = lDelta, 
     type = 'l', 
     main = "Structural Delta",
     xlab = "Value of Stock",
     ylab = "Delta")
