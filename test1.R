
trd = c(9, 16, 6, 49, 21, 16, 8)
median(trd)
deviance(trd)

pi

estimaBB <- function(distAsa, valorAcao, volDiaria, diasVencimento) {
  estBB <- distAsa / (pi * valorAcao * (volDiaria / 100) * sqrt(diasVencimento))
  
  print(estBB)
}

valorBB = estimaBB(1, 19, 1.89, 7)
bb <- c(30:6)
bb
plot(estimaBB(1, 20, 1.89, bb))
bb
