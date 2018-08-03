#
# Ensaio para Volatilidade
#

# Source in "Mestre dos Derivativos/Ensaios"
tickDayPetr4 <- read.csv(file.choose(), se="\t", header = T)
View(tickDayPetr4)

tickClosePetr4 <- tickDayPetr4$X.CLOSE.
tickClosePetr4
plot(tickClosePetr4)

length(tickClosePetr4)
diffClosePetr4   <- c()
varClosePetr4    <- c()
logVarClosePetr4 <- c()
sd021Petr4       <- c()
sd063Petr4       <- c()
sd126Petr4       <- c()
sd252Petr4       <- c()
for (nSx1 in 1:length(tickClosePetr4)) {
  diffClosePetr4   <- c(diffClosePetr4,   0.0)
  varClosePetr4    <- c(varClosePetr4,    0.0)
  logVarClosePetr4 <- c(logVarClosePetr4, 0.0)
  sd021Petr4       <- c(sd021Petr4,       0.0)
  sd063Petr4       <- c(sd063Petr4,       0.0)
  sd126Petr4       <- c(sd126Petr4,       0.0)
  sd252Petr4       <- c(sd252Petr4,       0.0)
  if (nSx1 > 1) {
    temp1 <- nSx1 - 1
    diffClosePetr4[nSx1]   <- tickClosePetr4[nSx1] - tickClosePetr4[nSx1-1]
    varClosePetr4[nSx1]    <- tickClosePetr4[nSx1] / tickClosePetr4[nSx1-1]
    logVarClosePetr4[nSx1] <- log(varClosePetr4[nSx1])
    if (nSx1 > 21) {
      temp21 <- nSx1 - 21
      sd021Petr4[nSx1] <- sd(logVarClosePetr4[(nSx1-21):nSx1])
      if (nSx1 > 63) {
        temp63 <- nSx1 - 63
        sd063Petr4[nSx1] <- sd(logVarClosePetr4[(nSx1-63):nSx1])
        if (nSx1 > 126) {
          temp126 <- nSx1 - 126
          sd126Petr4[nSx1] <- sd(logVarClosePetr4[(nSx1-126):nSx1])
          if (nSx1 > 252) {
            temp252 <- nSx1 - 252
            sd252Petr4[nSx1] <- sd(logVarClosePetr4[(nSx1-252):nSx1])
          }
        }
      }
    }
  }
}
volPetr4 <- data.frame(tickDayPetr4$X.DATE.,
                       tickDayPetr4$X.CLOSE.,
                       diffClosePetr4,
                       varClosePetr4,
                       logVarClosePetr4,
                       sd021Petr4,
                       sd063Petr4,
                       sd126Petr4,
                       sd252Petr4)
colnames(volPetr4) <- c("Dt", "Close", "Diff", "Var", "Log", "sd21d", "sd63d", "sd126d", "sd252d")
View(volPetr4)
