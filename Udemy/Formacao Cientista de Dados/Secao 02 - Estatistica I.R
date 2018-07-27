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

#
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

# Score Z / Valor Z - número de desvios padrões de distância da média

# Como saber se é Normal?
# Gerar histograma

?rnorm()
?rbeta()
?qqnorm()
?qqline()
?shapiro.test()

amostra <- rbeta(10000, 5, 5)
hist(amostra, main = "Distribuído e equilibrado")
qqnorm(amostra)
shapiro.test(amostra)

amostra <- rbeta(10000, 2, 8)
hist(amostra, main = "Enviezamento à Esquerda")
qqnorm(amostra)
shapiro.test(amostra)

amostra <- rbeta(10000, 8, 2)
hist(amostra, main = "Enviezamento à Direita")
qqnorm(amostra)
shapiro.test(amostra)

# Media = 8, dp = 2. Objeto < 6?
pnorm(6, 8, 2)

# Media = 8, dp = 2. Objeto > 6?
pnorm(6, 8, 2, lower.tail = FALSE)
# or
1 - pnorm(6, 8, 2)

# Media = 8, dp = 2. Objeto < 6 ou > 10?
pnorm(6, 8, 2) + (1 - pnorm(10, 8, 2))
# or
pnorm(6, 8, 2) + pnorm(10, 8, 2, lower.tail = FALSE)

# Media = 8, dp = 2. Objeto < 10 e > 8?
pnorm(10, 8, 2) - pnorm(8, 8, 2)

#

x <- rnorm(100)
qqnorm(x)
qqline(x)
shapiro.test(x)

#
# Estatística Não Paramétrica
#
# Na Estatística Paramétrica os dados seguem um padrão (Ex. Distribuição Normal)
# 

#
# Intervalo de Confiança
#

# IC - margem de erro estimada

# Salário médio de um cientista de dados?
#   Pesquisados (n) 100
#   IC              95%
#   dp              R$1.100,00
#   média           R$5.800,00
#   Z               1,96
#   Margem de erro  +-215,60
#   Salário         R$5.584,40 e R$6.015,60 para IC de 95%
#
#   IC              99%
#   dp              R$1.100,00
#   média           R$5.800,00
#   Z               2,58
#   Margem de erro  +-283,8
#   Salário         R$5.516,20 e R$6.083,80 para IC de 99%
#
#   Pesquisados (n) 1000
#   IC              95%
#   dp              R$1.100,00
#   média           R$5.800,00
#   Z               1,96
#   Margem de erro  +-68,18
#   Salário         R$5.731,82 e R$5.868,18 para IC de 95%

# Proporção de eleitores que pretendem votar em Maria? 
#   Pesquisados (n) 1000
#   IC              95%
#   650 p/ Maria    p = 650 / 1000 = 0,65
#   330 p/ João     p = 330 / 1000 = 0,33
#   20 p/ nenhum    p =  20 / 1000 = 0,02
#   Z               1,95
#   p +- 0,03
#   Votos em Maria  Entre 62 e 68% para IC 95%

#
# Teste de Hipotese
#

# Ideal amostra grande
# Alfa pequeno

#
# T de Student
#

# Amostra menor do que 30 elementos
# Não se sabe o DP
# Custo: maior variabilidade

# Pesquisa cientistas ganham R$75/h, não sabe-se o dp e n < 30
# Amostra de 9 cientistas
# dp da amostra é 10
# Probabilidade salario < R$80/h
# u   75
# S   10 (dp da amostra)
# n   9
# t0  8 (grau de liberdade)
# t = 1,5
# P = 92,5%
# Calculadora P = 0,91 ou 91%
pt(1.5, 8)

# Pesquisa cientistas ganham R$75/h, não sabe-se o dp e n < 30
# Amostra de 9 cientistas
# dp da amostra é 10
# Probabilidade salario > R$80/h
# u   75
# S   10 (dp da amostra)
# n   9
# t0  8 (grau de liberdade)
# t = 1,5
# P = 1 - 0.91 = 0,08
# Calculadora P = 0,086 ou 8,6%
pt(1.5, 8, lower.tail = FALSE)

# No R
# P[X<x] - pt()
# P[X>x] - lower.tail = FALSE

#
# Questionário
#

# Pergunta 1: Executando a função sample, como no código abaixo
#             sample(2, 10, replace = F, prob=c(0.2,0.8))
#             obtemos um erro. Qual alternativa melhor explica o motivo de ter ocorrido o erro?
sample(2, 10, replace = F, prob=c(0.2,0.8))
?sample
sample(12, 10, replace = F, prob=c(1/12,1/12,1/12,1/12,1/12,1/12,1/12,1/12,1/12,1/12,1/12,1/12))
sample(2, 10, replace = T, prob=c(0.2,0.8))
# R) Estamos tentando gerar 10 números aleatório de 2 números, sem reposição

# Pergunta 2: Dado o conjunto de dados:
#             22,10,12,14,13,15
#             Qual alternativa apresenta a resposta correta para a mediana destes dados?
median(c(22,10,12,14,13,15))
# R) 13.5

# Pergunta 3: Em um baralho comum, qual a probabilidade de você escolher uma carta aleatoriamente, e ser do naipe de Espadas?
# R) 13/52 - 13 chances em 52 13/ 52 = 0,25
13/52

# Pergunta 4: Jogando uma moeda 10 vezes, quais as chances de dar cara 8 vezes?
# R) dbinom(8,10,0.5)
dbinom(8, 10, 0.5)
?dbinom

# Pergunta 5: Os preços de diversos modelos de celulares no estoque de uma loja são normalmente distribuídos, 
#             com média = 1250 e desvio padrão igual a 480.
#             Qual a chance de escolher aleatoriamente um aparelho que custe menos que 1500? 
# R) pnorm(1500,1250,480) [1] 0.6987586
pnorm(1500, 1250, 480)

# Pergunta 6: Uma notícia informa que entre 34% e 38% dos entrevistados não gostam de peixe.
#             Qual a margem de erro desta pesquisa?
# R) (38 - 34) / 2
  
# Pergunta 7: Qual afirmação é falsa com relação a teste de hipótese?
# R) A hipotese alternativa é por padrão, verdadeira

# Pergunta 8: Das condições para o uso da distribuição T de Student, qual é falsa?
# R) Se conhece o desvio padrão da população (FALSA)

# Pergunta 9: Qual opção abaixo, não é uma alternativa para analisar se uma distribuição de dados está normalmente distribuída?
# R) Diagrama de dispersão

# Pergunta 10: Qual alternativa abaixo melhor descreve o papel da estatística descritiva?
# R) Demonstrar dados através de resumos e gráficos








  
  





















