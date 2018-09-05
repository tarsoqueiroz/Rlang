#
# Udemy - Séries Temporais e Análises Preditivas
#

#
# S01C01 - O caso do Hotel Y Estrela
#

#
# S01C02 - Orientações Gerais
#

#
# S01C03 - Apresentação
#

# Dados coletados em intervalos regulares
# Depende da ordem
# Medida - Fato- Temporalidade
# Compreender um fenômeno

#
# S01C04 - Exemplos de Séries Temporais
#

# Geração aleatória via comando >>> rnorm <<<

#
# S01C05 - Criando uma Série Temporal
#

# Função ts

#
# S01C06 - Criando uma Série Temporal no R
#

install.packages('forecast')
install.packages('ggplot2')
install.packages('urca')
install.packages('lmtest')
install.packages('seasonal')
install.packages('openxlsx') #
install.packages('seasonalview') # 
library(ggplot2)
library(urca)
library(lmtest)
library(seasonal)
library(seasonalview)

# http://cran-r.c3sl.ufpr.br
# http://cran.r-project.org/   ### Proxy block


myts <- rnorm(60)
myts

myts <- ts(myts, start = c(2012, 1), end = c(2016, 12), frequency = 12)
myts
class(myts)

plot(myts)

#
# S01C07 - Importando uma Série Temporal no R
#

tempts <- read.csv(file.choose(), sep = ',', header = F)
print(tempts)

tempts <- ts(tempts[2], start = c(1884), end = c(1939), frequency = 1)
class(tempts)
plot(tempts)

#
# Questionário 1
#

# P1: Marque a opção abaixo que não representa dados de uma serie temporal:
# R1: Pesquisa de intenção de votos para presidente

# P2: Qual opção não é um componente de uma serie temporal?
# R2: Média

# P3: Marque a opção verdadeira:
# R3: Uma série temporal é dependente de ordem

#
# S02C08 - Medidas de Centralidade e Variabilidade
#

# Média - x = soma de (x) / qtd de x {n}
# Mediana - valor central, em conjunto par é a média dos dois valores centrais
# Variância - dispersão com relação a média - s²
# Desvio Padrão - variação dos dados - sqrt(s²)

#
# S02C09 - Distribuição Normal
#

# dp

#
# S02C10 - Teste de Hipótese
#

#
# S02C11 - Passeio Aleatório
#

#
# S03C12 - Analises Exploratórias no R
#

print(sunspots)
class(sunspots)
help('sunspots')
max(sunspots)
min(sunspots)
mean(sunspots)
median(sunspots)
summary(sunspots)
length(sunspots)

start(sunspots)
end(sunspots)

frequency(sunspots)

sun2 <- window(sunspots, start = c(1749, 1), end = c(1763, 12))
print(sun2)

#
# S03C13 - Gráficos Básicos no R
#

plot(sunspots)
hist(sunspots)
boxplot(sunspots)

library(ggplot2)
library(forecast)

autoplot(AirPassengers)

sun2 <- window(sunspots, start = c(1749, 1), end = c(1763, 12))
plot(sun2)
hist(sun2)
boxplot(sun2)

plot(aggregate(AirPassengers, FUN = mean))

#
# S04C14 - Séries Estacionárias
#

# Média e Variância constantes ao longo do tempo
# Como saber: testes estatísticos
# Valor-p menor que alfa -> série estacionária

#
# S04C15 - Componentes de uma Série Temporal
#

#
# S04C16 - Correlação
#

# Força e direção da relação entre variáveis
# Relação - r
# Coeficiente de Determinação - r²

#
# S04C17 - Autocorrelação
#

#
# S04C18 - Resíduos, Valor Ajustado e Erro
#

#
# Questionário 2
#

# P1: Qual opção representa as características de uma serie temporal estacionária?
# R1: Variância e média constantes durante o tempo

# P2: Com relação a série temporal da imagem abaixo, marque a opção verdadeira:
# R2: Série não estacionária

# P3: Sobre a imagem de decomposição da série temporal abaixo, marque a opção que 
#     apresenta os componentes na ordem correta.
# R3: Série original, sazonalidade, tendência, ruído

# P4: Analisando o diagrama PACF abaixo, podemos concluir que: (marque a melhor opção):
# R4: Não existe autocorrelação significativa

# P5: "Diferença entre o modelo de previsão e a variável utilizada para criar o modelo"
#     A qual opção se refere a frase acima?
# R5: Resíduos

# P6: Quando utilizamos dados para criar um modelo, a referência de previsão normalmente
#     não coincide com estes dados.
#     Aos valores de referência criado pelo modelo, chamamos de:
# R6: Valor ajustado

#
# S05C19 - Avaliando Resíduos
#

























