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
library(forecast)
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

#
# S05C20 - Avaliando Resíduos no R
#

library(forecast)
library(ggplot2)

autoplot(presidents)
prev <- auto.arima(presidents)

print(prev$residuals)
autoplot(prev$residuals)
hist(prev$residuals)
var(prev$residuals, na.rm = T)
mean(as.vector(prev$residuals), na.rm = T)

acf(prev$residuals, na.action = na.pass)

checkresiduals(prev)

shapiro.test(prev$residuals)

#
# S05C21 - Teste de Estacionariedade no R
#

library(urca)
library(forecast)

x <- ur.kpss(AirPassengers)
print(x)

z <- diff(AirPassengers)
x <- ur.kpss(z)
print(x)

ndiffs(AirPassengers)

split.screen(figs = c(2,1))
screen(1)
plot(AirPassengers)
screen(2)
plot(z)

#
# S05C22 - Decomposição
#

#
# S05C23 - Transformações
#

#
# S05C24 - Transformações no R
#

library(forecast)
library(ggplot2)

t1 <- BoxCox(AirPassengers, lambda = 0)
autoplot(t1)

t2 <- BoxCox(AirPassengers, lambda = 0.1)
autoplot(t2)

lbd <- BoxCox.lambda(AirPassengers)
print(lbd)
t3 <- BoxCox(AirPassengers, lambda = lbd)
autoplot(t3)

t4 <- diff(AirPassenger)
autoplot(t4)

t5 <- log10(AirPassengers)
autoplot(t5)

split.screen(figs = c(2,2))
screen(1)
plot(t1)
screen(2)
plot(t2)
screen(3)
plot(t3)
screen(4)
plot(t5)
close.screen(all = T)

#
# S05C25 - Médias Móveis
#

#
# S05C26 - Médias Móveis no R
#

library(forecast)
library(ggplot2)

autoplot(fdeaths)

fdeaths2 = ma(fdeaths, order = 5)
autoplot(fdeaths2)

fdeaths3 = ma(fdeaths, order = 12)
autoplot(fdeaths3)

fdeaths4 <- tsclean(fdeaths)
autoplot(fdeaths4)

plot(fdeaths)
lines(fdeaths2, col = 'red')
lines(fdeaths3, col = 'blue')
lines(fdeaths4, col = 'green')

legend('topright', 
       legend = c('Original', 'MA5', 'Ma12', 'Tsc'),
       col = c('black', 'red', 'blue', 'green'),
       lty = 1:2,
       cex = 0.8)

#
# S05C27 - Enquanto isso no Hotel Y Estrelas (PTII)
#

#
# Questionário 3
#

# P1: São pressupostos e recomendações para os resíduos de um modelo de previsão de 
#     séries temporais. Marque a opção falsa.
# R1: Autocorrelacionados

# P2: Qual opção abaixo é uma forma recomendada de avaliar se os resíduos de um modelo 
#     estão normalmente distribuídos?
# R2: Executar um teste de hipótese

# P3: Observe os dois gráficos abaixo. Trata-se da mesma serie temporal, porém, o segundo
#     gráfico foi transformado.
#     Marque a opção que indica a mais provável forma de transformação que o gráfico sofreu.
# R3: O componente sazonal foi removido

# P4: Analise atentamente os  gráficos abaixo.
#     O primeiro gráfico teve aplicado uma transformação por média móvel.
#     Qual é a mais provável ordem desta transformação?
# R4: 24

# P5: Assinale a alternativa falsa:
# R5: Médias móveis separam o componente sazonal da tendência

#
# S06C28 - Considerações Gerais sobre Previsões
#

#
# S06C29 - Resumo de Técnicas
#

#
# S06C30 - Naive
#

#
# S06C31 - Naive com R
#

library(forecast)
library(ggplot2)

set.seed(4312)
x <- cumsum(sample(c(-1, 1), 100, T))
print(x)
serie <- ts(x, start = c(1900), end = c(2000), frequency = 1)
print(serie)
autoplot(serie)

prev <- naive(serie, h = 5)
class(prev)
print(prev)
print(prev$fitted)
print(prev$residuals)
autoplot(prev)

prev2 <- naive(serie, h = 5, level = c(95, 99))
print(prev2)
autoplot(prev2)

split.screen(figs = c(2,1))
screen(1)
plot(prev)
screen(2)
plot(prev2)
close.screen(all = T)

autoplot(AirPassengers)
prev3 <- snaive(AirPassengers, h = 12)
print(prev3)
autoplot(prev3)

prev3$mean
window(AirPassengers, start = c(1960))

#
# S06C32 - Mean
#

# Meanf

#
# S06C33 - Mean com R
#

library(forecast)
library(ggplot2)

autoplot(fdeaths)
mean(fdeaths)

prev = meanf(fdeaths, h = 5)
print(prev)
autoplot(prev)

fdeaths2 <- window(fdeaths, start = c(1976, 1), end = c(1979, 12))
autoplot(fdeaths2)
mean(fdeaths2)
prev2 <- meanf(fdeaths2, h = 5)
print(prev2)
autoplot(prev2)

plot(prev)
lines(prev2$mean, col = 'red')

#
# S06C34 - Drift
#

#
# S06C35 - Drift com R
#

library(forecast)
library(ggplot2)

autoplot(austres)

prev <- rwf(austres, h = 12, drift = F)
autoplot(prev)

prev <- rwf(austres, h = 12, drift = T)
autoplot(prev)

print(prev)

#
# Questionário 4
#

# P1: As linhas verde, azul e vermelha, são três diferentes técnicas de previsão aplicados 
#     na série temporal abaixo.
#     Informa a opção que indica corretamente as técnicas utilizadas, considerando a ordem 
#     das cores citadas na linha acima.
# R1: Drift, Naive e Mean

# P2: Qual das premissas sobre previsões abaixo é falsa?
# R2: Uma previsão que gera apenas pontos de previsão é melhor do que uma que também gera
#     intervalos de previsão

#
# S07C36 - Previsão com Decomposição no R
#

library(forecast)
library(ggplot2)

autoplot(AirPassengers)
previ <- stlf(AirPassengers, h = 48)
print(previ)
autoplot(previ)

#
# S07C37 - Suavização Exponencial
#

#
# S07C38 - Suavização Exponencial no R
#

library(forecast)
library(ggplot2)

autoplot(austres)
mdl1 <- holt(austres, h = 16)
autoplot(mdl1)

mdl1$model

mdl2 <- holt(austres, h = 16, alpha = 0.2)
autoplot(mdl2)

plot(mdl1)
lines(mdl2$mean, col = 'red')

mdl3 <- holt(austres, damped = T, phi = 0.9, h = 16)
autoplot(mdl3)

mdl4 <- holt(austres, damped = T, phi = 0.8, h = 16)
autoplot(mdl4)

plot(mdl3)
lines(mdl4$mean, col = 'red')

print(mdl3$mean)
print(mdl4$mean)

#
# S07C39 - Suavização Exponencial no R parte II
#

mdl5 <- hw(JohnsonJohnson, seasonal = 'additive', h = 16)
autoplot(mdl5)

mdl6 <- hw(JohnsonJohnson, seasonal = 'multiplicative', h = 16)
autoplot(mdl6)

plot(mdl5)
lines(mdl6$mean, col = 'red')

print(mdl5$mean)
print(mdl6$mean)

mdl7 <- hw(JohnsonJohnson, seasonal = 'multiplicative', damped = T, phi = 0.9, h = 16)
autoplot(mdl7)

mdl8 <- ets(JohnsonJohnson)
print(mdl8)

prev <- forecast(mdl8, h = 16, levels = c(85, 90))
autoplot(prev)

print(prev$mean)
autoplot(mdl8$residuals)
autoplot(mdl8$fitted)

autoplot(decompose(JohnsonJohnson))

mdl9 <- ets(JohnsonJohnson, model = 'ZAA', damped = T)
print(mdl9)

mdl10 <- ets(JohnsonJohnson, model = 'ZZZ', damped = T)
print(mdl10)

#
# S07C40 - Arima
#

#
# S07C41 - Auto-arima 
#

#
# S07C42 - Auto-arima no R 
#

library(forecast)
library(ggplot2)

modelo <- auto.arima(co2, trace = T) # Best model: ARIMA(1,1,1)(1,1,2)[12]
print(modelo)                        # AIC=180.78   AICc=180.97   BIC=205.5

modelo2 <- auto.arima(co2, trace = T, stepwise = F, approximation = F)
                                     # Best model: ARIMA(0,1,3)(0,1,1)[12]
print(modelo2)                       # AIC=176.86   AICc=177   BIC=197.47

#
# S07C43 - Auto-arima no R parte II 
#

prev1 <- forecast(modelo, h = 12)
autoplot(prev1)

prev2 <- forecast(modelo2, h = 12)
autoplot(prev2)

print(prev1$mean)
print(prev2$mean)

plot(prev1)
lines(prev2$mean, col = 'red')

#
# S07C44 - Enquanto isso no Hotel Y Estrelas (PTIII) 
#

#
# Questionário 5
#

# P1: Qual opção abaixo é o principio básico da suavização exponencial?
# R1: Observações mais recentes possuem maior peso

# P2: Observando a imagem abaixo, qual técnica de previsão foi utilizada?
# R2: Arima

# P3: Para uma variação sazonal constante, qual modelo de Holt-Winters 
#     devemos utilizar em uma previsão de séries temporais?
# R3: Aditivo

# P4: No modelo arima(P,D,Q), qual elemento representa a letra P?
# R4: Parte autoagressiva sazonal

#
# S08C45 - Regressão com séries temporais
#

# lm - Linear model, (variável dependente) ~ (variáveis independentes)
# tslm - Pack Forecast

#
# S08C46 - Escolhendo as variáveis independentes
#

# CV *, AIC *, AICC, BIC - Menor melhor (* prioridade para estes)
# AdjR2                  - Maior melhor

#
# S08C47 - Regressão com séries temporais no R
#

library(forecast)
library(ggplot2)

plot(Seatbelts)

x1 <- tslm(DriversKilled ~ trend, data = Seatbelts)
x2 <- tslm(DriversKilled ~ season, data = Seatbelts)
x3 <- tslm(DriversKilled ~ trend + season, data = Seatbelts)
CV(x1)
CV(x2)
CV(x3)

r1 <- forecast(x1, h = 12)
r2 <- forecast(x2, h = 12)
r3 <- forecast(x3, h = 12)

autoplot(r1)
autoplot(r2)
autoplot(r3)

plot(r1)
lines(r2$mean, col = 'red')
lines(r3$mean, col = 'green')
legend('topright', 
       legend = c('Tend', 'Seas', 'Tend + Seas'), 
       col = c('blue', 'red', 'green'), lty = 1:2, cex = 0.8)

#
# S09C48 - Redes Neurais para Séries Temporais
#

# NNAR - apenas previsão pontual

#
# S09C49 - Redes Neurais para Séries Temporais no R
#

library(forecast)
library(ggplot2)

modelo <- nnetar(co2)
print(modelo)

prev <- forecast(modelo, h = 24)

autoplot(prev)

#
# S09C50 - Incluindo uma variável independente
#

# No forecast via parm XREG

#
# S09C51 - Incluindo uma variável independente no R
#

library(forecast)
library(ggplot2)

plot(Seatbelts)

autoplot(Seatbelts[, c('DriversKilled')])

cintos <- window(Seatbelts[, c('DriversKilled')], start = c(1980, 1), end = c(1983, 12))
print(cintos)

modelo1 <- auto.arima(cintos)
print(modelo1)

prev1 <- forecast(modelo1, h = 12)
autoplot(prev1)

motoristas <- as.vector(window(Seatbelts[, c('drivers')], start = c(1980, 1), end = c(1983, 12)))
print(motoristas)

modelo2 <- auto.arima(cintos, xreg = motoristas)
print(modelo2)

motoristas2 <- as.vector(window(Seatbelts[, c('drivers')], start = c(1984, 1), end = c(1984, 12)))
prev2 <- forecast(modelo2, xreg = motoristas2)
print(prev2)
autoplot(prev2)

plot(prev1)
lines(prev2$mean, col = 'red')

#
# S10C52 - Métricas de Desempenho
#

# Separar dados treinar e testar

#
# S10C53 - Métricas de Desempenho no R
#

library(forecast)
library(ggplot2)

treino <- window(fdeaths, start = c(1974,1), end = c(1977,12))
teste  <- window(fdeaths, start = c(1978,1), end = c(1979,12))

modelo1 <- tslm(treino ~ season + trend, data = treino)
prev1   <- forecast(modelo1, h = 24)
autoplot(prev1)

modelo2 <- nnetar(treino)
prev2   <- forecast(modelo2, h = 24)
autoplot(prev2)

plot(fdeaths)
lines(prev1$mean, col = 'blue')
lines(prev2$mean, col = 'red')
lines(teste,      col = 'green')
legend('topright', 
       legend = c('Reg', 'Rn', 'Teste'), 
       col = c('blue', 'red', 'green'), 
       lty = 1:2, cex = 0.8)

accuracy(prev1, teste)
accuracy(prev2, teste)

#
# S10C54 - Métricas: ME MAE RMSE MPE MAPE
#

library(forecast)

previsto  <- c(3.34, 4.18, 3, 2.99, 4.51, 5.18, 8.18)
realizado <- c(3,    4,    3, 3,    4.5,  4,    4.5)

diferenca <- realizado - previsto
me        <- sum(diferenca) / length(diferenca)
difabs    <- abs(realizado - previsto)
mae       <- sum(difabs) / length(difabs)
difaoquad <- (realizado - previsto)^2
rmse      <- sqrt(sum(difaoquad) / length(difaoquad))
erroperc  <- ((realizado - previsto) / realizado) * 100
mpe       <- sum(erroperc) / length(erroperc)
erroabs   <- (abs(realizado - previsto) / realizado) * 100
mape      <- sum(erroabs) / length(erroabs)

metricas  <- data.frame(mycalc = c(me, rmse, mae, mpe, mape), accuracy = temp[1,])

#
# Questionário 6
#

# P1: Com relação a fórmula de Regressão Linear para séries temporais abaixo:
#        Jobs  ~ trend + season
#     Marque a opção verdadeira:
# R1: Jobs é a variável dependente, trend e season as variáveis explanatórias

# P2: Podemos criar previsões para séries temporais de várias formas. A maneira mais usual e
#     encontrar um padrão na série e extrapolar este padrão para o futuro. O pacote forecast
#     permite que se inclua uma variável explanatória em um modelo através de um parâmetro 
#     específico. Que parâmetro é este?
# R2: xreg

# P3: Qual afirmação abaixo é verdadeira sobre MAE (mean absolute erro )?
# R3: É uma métrica dependente de escala

#
# S11C55 - Caso Prático no R
#

library(forecast)
library(ggplot2)
library(seasonal)
library(seasonalview)
library(urca)

dados <- read.csv(file.choose(), header = F)
print(dados) # 12 meses em 15 anos = 180 linhas

ocupacao <- ts(dados, start = c(2003, 1), end = c(2017, 12), frequency = 12)
summary(ocupacao)

autoplot(ocupacao)
hist(ocupacao)
boxplot(ocupacao)

dec <- decompose(ocupacao)
autoplot(dec)

autoplot(dec$trend)

autoplot(window(dec$trend, start = c(2015, 9)))
# inicio de tendência de alta

ggseasonplot(ocupacao)
# maior ocupacao em julho e agosto

ggseasonplot(window(ocupacao, start = c(2016)))

#
# S11C56 - Caso Prático no R parte II
#

est <- ur.kpss(ocupacao)
print(est)
# dúvida se são estacionários

ndiffs(ocupacao)
# são estacionários

tsdisplay(ocupacao)
# vários pontos de autocorrelação

modelo <- auto.arima(ocupacao, trace = T, stepwise = F, approximation = F)
print(modelo)

checkresiduals(modelo)
# aparenta estar distribuído normalmente

shapiro.test(modelo$residuals)
# p-value alto ---> dados normalmente distribuídos
var(modelo$residuals)
mean(modelo$residuals)
# modelo eficiente para previsão

previsao <- forecast(modelo, h = 24)
print(previsao)
autoplot(previsao)

#
# S11C57 - Caso Prático no R parte III
#

ocupacaotreino <- ts(dados, start = c(2003, 1), end = c(2015, 12), frequency = 12)
ocupacaoteste  <- ts(dados, start = c(2016, 1), end = c(2017, 12), frequency = 12)

modeloarima <- auto.arima(ocupacaotreino, trace = T, stepwise = F, approximation = F)
preverarima <- forecast(modeloarima, h = 24)

modeloets <- ets(ocupacaotreino)
preverets <- forecast(modeloets, h = 24)

plot(preverarima)
lines(preverets$mean, col = 'red')

accuracy(preverarima, ocupacaoteste)
accuracy(preverets,   ocupacaoteste)

plot(ocupacao)
lines(preverarima$mean, col = 'blue')
lines(preverets$mean,   col = 'green')

#
# S12C58 - De volta ao Hotel Y Estrelas
#

#
# S12C59 - Atividade Final
#

# Analise a série temporal nottem (presente no R core)
# 
# História dos dados
# Analise exploratórias inclusive com gráficos
# Teste a estacionaridade
# Previsões com modelos de suavização exponencial, arima e redes neurais autoregressivas
# Avalie performance dos modelos

#
# S12C60 - Encerramento
#

# CRAN Task View: Time Series Analysis










