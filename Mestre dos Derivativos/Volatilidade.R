#
# Ensaio para Volatilidade
#

# Source in "Mestre dos Derivativos/Ensaios"

# Vol BMF&Bovespa - 2018.08.13 0.0203835155197 0.0466064087617 0.0372254792514 0.0299117135965 <=
# Base MT5        - 2018.08.08 0.02071104      0.04883672      0.03799101      0.03005564
#                   2018.08.09 0.02042073      0.04778096      0.03775854      0.03005287 ***
#                   2018.08.10 0.02182746      0.04767734      0.03766033      0.03014030
# Vol BMF&Bovespa - 2018.08.14 0.0220324806313 0.0466104580764 0.0371338926280 0.0299686443762 <=
# Base MT5        - 2018.08.10 0.02187254892   0.04769893185   0.03768746170   0.03015367214
#                   2018.08.13 0.02150177215   0.04780651293   0.03766180030   0.03013223562
#                   2018.08.14 0.02152028894   0.04760380083   0.03761695170   0.03011460879
# Vol BMF&Bovespa - 2018.08.15 0.0215387569771 0.0464104720842 0.0370694165307 0.0299651303758
# Base MT5        - 2018.08.13 0.02150177215   0.04780651293   0.03766180030   0.03013223562
#                   2018.08.14 0.02152028894   0.04760380083   0.03761695170   0.03011460879
#                   2018.08.15 0.02400055762   0.04780177191   0.03783459221   0.03027172255
# Vol BMF&Bovespa - 2018.08.16 0.0236100678421 0.0466216860583 0.0373072960817 0.0301250864515
# Base MT5        - 2018.08.14 0.02152029      0.04760380      0.03761695      0.03011461
#                   2018.08.15 0.02400056      0.04780177      0.03783459      0.03027172
#                   2018.08.16 0.02364351      0.04767408      0.03777023      0.03026831 ***

c(0.02042073, 0.04778096, 0.03775854, 0.03005287) * (sqrt(252) * 100)
c(0.0203835155197, 0.0466064087617, 0.0372254792514, 0.0299117135965) * (sqrt(252) * 100)

tickDayPetr4 <- read.csv(file.choose(), se="\t", header = T)
head(tickDayPetr4)

tickClosePetr4 <- tickDayPetr4$X.CLOSE.
tickClosePetr4
plot(tickClosePetr4, 
     type = 'l', 
     main = "PETR4",
     xlab = "Data",
     ylab = "R$")

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
tail(volPetr4)





