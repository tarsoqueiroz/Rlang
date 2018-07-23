
trd = c(9, 16, 6, 49, 21, 16, 8)
median(trd)
deviance(trd)

pi

estimaBB <- function(distAsa, valorAcao, volDiaria, diasVencimento) {
  estBB <- distAsa / (pi * valorAcao * volDiaria * sqrt(diasVencimento))
  
  print(estBB)
}

volAno = 46.22 / 100
volDia = volAno / sqrt(252)
bb <- c(30:6)
bb
bbEst <- estimaBB(1, 20, volDia, bb)
plot(bbEst)

valorBB = estimaBB(1, 19, 0.0291189209627, 20)
valorBB = estimaBB(1, 19, volDia, 20)
