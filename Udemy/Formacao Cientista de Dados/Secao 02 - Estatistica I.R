#
# Udemy - Formação Cientista de Dados
#
# Seção 02 - Estatistica I
#

# Estatística:- Descritiva, Probabilidade e Inferência
#
# Observação: não interfere nos elementos
# Experimentos: interfere nas condiçóes sob os elementos

# Amostra aleatória simples: retirada da população de forma aleatória
# Amostra estratificada: população separada em estratos para representação de grupos
# Amostra sistemática: seleção do 1º aleatório e a cada N seleciona novo elemento (quando não se sabe o total de registros)
# Amostra por unidade monetária: intervalo = total / qtd, a cada cumulativo superior ao intervalo é selecionado

?sample
?strata
?S.SY
sample(15:25, 20, replace = TRUE)

# Amostra simples
iris
dim(iris)
amostra <- sample(c(0, 1), 150, replace = TRUE, prob = c(0.5, 0.5))
amostra
length(amostra[amostra == 0])
length(amostra[amostra == 1])

# Repete o mesmo resultado
set.seed(2345)
sample(c(100), 1)

# Amostra estratificada
library(sampling)
amostrairis2 = strata(iris, c("Species"), size=c(25, 25, 25), method = "srswor")
summary(amostrairis2)

infert
summary(infert)
12  / (12 + 120 + 116) * 100
120 / (12 + 120 + 116) * 100
116 / (12 + 120 + 116) * 100
amostra = strata(infert, c("education"), size = c(5, 48, 47), method = "srswor")
summary(amostra)
 
# Amostra sistematica
install.packages("TeachingSampling")
library(TeachingSampling)

amostra = S.SY(150, 10)
amostra

amostrairis = iris[amostra,]
amostrairis

#
# Centralidade
#

# Média, Moda, Mediana
# Mediana vs Média: c(10,20,30,40,10000) -> média = 2020, mediana= 30

# Variabilidade
# Variância, Desvio Padrão, Amplitude, Não Centrais: Quartis

?quantile()  # quartis
?sd()        # desvio padrao
?var()       # variancia
?mean()      # media
?median()    # mediana

jogadores <- c(40000, 18000, 12000, 250000, 30000, 140000, 300000, 40000, 800000)
mean(jogadores)
median(jogadores)
quantile(jogadores)
sd(jogadores)
var(jogadores)
summary(jogadores)

carros <- c(45000, 45200, 45250, 48300, 52100)
mean(carros)
median(carros)

# Probabilidade
# 

probDadoJusto <- function(numJogadas) {
  x <- 0
  for (i in 1:numJogadas) {
    x <- x + sample(1:6, 1)
  }
  x <- x / numJogadas
  
  return (x)
}
probDadoJusto(6)
probDadoJusto(6)
probDadoJusto(6)
probDadoJusto(6)
probDadoJusto(100000)
probDadoJusto(100000)
probDadoJusto(100000)
probDadoJusto(100000)

# Distribuição
#

# 68% +- 1 desvio padrão da média
# 30% +- 2 desvio padrão da média

# Ex: X = 3, p = 0.5, n = 5
# f(x) = 0.3125

# Ex: X = 0/1/2/3/4, p = 0.25, n = 4
# 0 = 0,316406 / 1 = 0,421875 / 2 = 0,210938 / 3 = 0,046875 / 4 = 0,003906 / 5 = 1

# Ex: X = 7, p = 0.25, n = 12
# 0,01147127

dbinom(2, 2, 0.5) # Encontrar a probabilidade
pbinom()          # Cumulativa

numSucessos <- 3
numExperimentos <- 5
valProbabilidade <- 0.5

dbinom(numSucessos, numExperimentos, valProbabilidade)

# 4 sinais de 4 tempos, prob = 0,1,2,3,4

numSinaisVerdes <- c(0:4)
numSinais <- 4
probSinais <- 0.25

dbinom(numSinaisVerdes, numSinais, probSinais)
pbinom(numSinaisVerdes, numSinais, probSinais)

# prova 12 questões, acertar 7 questões com 4 alternativas cada

dbinom(7, 12, 0.25)
















