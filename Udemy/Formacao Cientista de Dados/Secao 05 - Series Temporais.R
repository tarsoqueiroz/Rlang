#
# Udemy - Formação Cientista de Dados
#
# Seção 05 - Series Temporais
#


# Estudo de variável contínua ao longo do tempo
# Coleta de forma regular
# Intervalo sempre o mesmo (segundos, dias, horas, semanas, ...)

# Econometria, previsão do tempo, previsão financeira, ...
# Estacionárias e Não Estacionárias
# Estocática:- fator aleatório não explicável
# Determinística:-  explicada através de uma fórmula
# Componentes - Tendência, Sazonalidade, Aleatoriedade

AirPassengers
start(AirPassengers)
end(AirPassengers)
plot(AirPassengers)
plot(aggregate(AirPassengers))
monthplot(AirPassengers)
subst <- window(AirPassengers, start = c(1960,1), end=c(1960,12))
subst
plot(subst)

plot(AirPassengers)
dec = decompose(AirPassengers)
dec
dec$seasonal
dec$trend
dec$random
plot(dec$seasonal)
plot(dec$trend)
plot(dec)

# Previsão
AirPassengers
mean(AirPassengers)
window(AirPassengers, start=c(1960,1), end=c(1960,12))
mean(window(AirPassengers, start=c(1960,1), end=c(1960,12)))

install.packages("http://cran-r.c3sl.ufpr.br/src/contrib/RcppArmadillo_0.8.600.0.0.tar.gz")
install.packages("forecast")
library(forecast)

mediamovel <- ma(AirPassengers, order = 12)
mediamovel
previsao <- forecast(mediamovel, h=12)
previsao
plot(previsao)

arima <- auto.arima(AirPassengers)
arima
previsao <- forecast(arima, h=12)
previsao
plot(previsao)

#
# Questionário
#

# Pergunta 1: Entre os motivos para analisar dados temporais, qual opção é falsa?
# R)          Buscar relação de causa e efeito

# Pergunta 2: Entre os componentes de uma série temporal, um deles mostra qual a propensão 
#             dos dados em intervalos de tempos futuros. Qual componente é este?
# R)          Tendência

# Pergunta 3: Qual componente, em um serie temporal, não pode ser explicado através de uma
#             equação/fórmula?
# R)          Aleatoriedade

# Pergunta 4: Os gráficos na imagem, mostram, respectivamente, quais componentes de uma 
#             série temporal?
# R)          Tendência, sazonalidade, aleatório

# Pergunta 5: Qual afirmação é verdadeira sobre a diferença entre series temporais 
#             estocásticas e determinísticas?
# R)          Estocásticas possuem um componente aleatório, o que torna sua previsão mais difícil. 
#             As determinísticas podem ser explicadas por uma função.







































