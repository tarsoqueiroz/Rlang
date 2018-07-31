#
# Udemy - Formação Cientista de Dados
#
# Seção 03 - Estatistica II
#

# Variáveis
# Existe uma relação entre variáveis?
# Se sim, como medir sua força?
# Relação pode ser utilizada para previsão?

idade <- c(18,23,28,33,38,43,48,53,58,63)
custo <- c(871,1132,1242,1356,1488,1638,2130,2454,3066,4090)
length(idade)
length(custo)
?plot

# Regressão Linear

# Correlação (R)
#    Relação entre as variáveis, valores entre -1 e 1, A~B é a mesma que B~A

#        1            0.7         0.5         0.25       0       -0.25        -0.5         -0.7            -1
# Positiva    Forte       Moderada     Fraca        Inexistente         Fraca      Moderada      Forte     Negativa
# Perfeita                                                                                                 Perfeita 

preco <-  c(100,105,109,111,114,115,117,120)
vendas <- c(524,521,523,518,505,506,503,499)

# Coeficiente de Determinação (R^2)
#   R^2 > 0.7       ótimo
#   0.7 > R^2 > 0.3 ???
#   R^2 < 0.3       ruim

R <- 0.93
R2 <- R ^2

idade
custo

plot(idade~custo)
modidadecusto <- lm(idade~custo)
abline(modidadecusto)
modidadecusto
# Outliers - valores muito fora dos padrões
# Extrapolação - valores para elementos fora dos elementos que compõem a amostra

dim(cars)
head(cars)
cor(cars)
modelo <- lm(speed~dist, data=cars)
modelo
plot(modelo)
plot(speed~dist, data = cars)
abline(modelo)
modelo$coefficients
modelo$coefficients[1] + modelo$coefficients[2] * 22
predict(modelo, data.frame(dist=22))

summary(modelo)
modelo$coefficients
modelo$residuals
modelo$fitted.values
plot(modelo$fitted.values)
plot(modelo$fitted.values, cars$dist)

# Regressão Linear Simples  - 1 variável para explicar/prever uma variável dependente
# Regressão Linear Múltipla - 2 ou + variáveis explanatórias para prever uma variável dependente
#    Requisitos - 1) Linearidade entre variável dependente a as independentes
#                 2) Variáveis normalmente distribuídas
#                 3) Pouca ou nenhuma colinearidade
#    Residuais -  1) Próximos a distribuição normal
#                 2) Variância constante em relação a linha de melhor ajuste
#                 3) Independentes (sem padrão)

colnames(mtcars)
dim(mtcars)

cor(mtcars[1:4])
modelo <- lm(mpg~disp, data = mtcars)
modelo
summary(modelo)$r.squared
summary(modelo)$adj.r.squared
plot(mpg~disp, data = mtcars)
abline(modelo)
predict(modelo, data.frame(disp = 200))

modelo <- lm(mpg~disp+hp+cyl, data = mtcars)
modelo
summary(modelo)$r.squared
summary(modelo)$adj.r.squared
predict(modelo, data.frame(disp = 200, hp = 100, cyl = 4))

# Fórmulas
# 1) Correlação
#    r = cov(X, Y) / sqrt(var(x).var(y))
# 2) Inclinação
#    m = r(Sy / Sx) ... r - correlação, S - desvio padrão
# 3) Interceptação
#    b = y - m.x ... y - média de y, x - média de x
# 4) Previsão
#    P = b + (m.v) ... b - interceptação, m - inclinação, v - variável dependente

# Regressão Logística
#    Resposta binária (1 - sucesso / 0 - fracasso)
#    Através de probabilidade
#    Pode ser simples ou múltipla

eleicao <- read.csv(file.choose(), sep = ";", header = T)
fix(eleicao)
View(eleicao)
plot(eleicao$DESPESAS, eleicao$SITUACAO)
summary(eleicao)
cor(eleicao$DESPESAS, eleicao$SITUACAO)
modelo <- glm(SITUACAO ~ DESPESAS, data = eleicao, family = "binomial")
summary(modelo)
plot(eleicao$DESPESAS, eleicao$SITUACAO, col = 'red', pch = 20)
points(eleicao$DESPESAS, modelo$fitted, pch = 4)

prevereleicao <- read.csv(file.choose(), sep = ";", header = T)
View(prevereleicao)
prevereleicao$RESULT <- predict(modelo, newdata = prevereleicao, type = "response")
prevereleicao$RESULT
View(prevereleicao)

#
# Questionário
#

# Pergunta 1: Uma correlação de -0,75 é:
# R) Negativa e forte

# Pergunta 2: Sendo a correlação igual a -0,89, qual será o coeficiente de determinação?
(-0.89)^2
# R) 0,7921

# Pergunta 3: O coeficiente de determinação entre duas variáveis é igual a 0,73.
#             Qual opção abaixo melhor descreve este coeficiente?
# R)          73% da variável dependente consegue ser explicada pelas variáveis
#             explanatórias presentes no modelo

# Pergunta 4: Observando a linha de regressão no gráfico de dispersão abaixo, 
#             escolha a alternativa correta:
#
#             |.
#             |  . 
#             |    .
#             |      .
#             |        .
#             |          .
#             .____________.__
# R)          Correlação Negativa

# Pergunta 5: Qual opção melhor descreve o conceito de inclinação da reta na regressão linear?
# R)          A cada unidade de aumento de X, a variável de resposta aumenta (ou diminui) 
#             o valor da inclinação
  
# Pergunta 6: Dada as variáveis 
#             X = 15,18,20,25,30,44
#             Y = 240,255,270,283,300,310
#             Calcule a coeficiente de correlação.
eixoX <- c(15,18,20,25,30,44)
eixoY <- c(240,255,270,283,300,310)
cor(eixoX, eixoY, method = "pearson")
# R)          x = c(15,18,20,25,30,44) 
#             y = c(240,255,270,283,300,310) 
#             cor(x,y) [1] 0.9237806


# Pergunta 7: No R existe nativamente o conjunto de dados women (mulheres), com os atributos  
#             height e weight (altura e peso, em polegadas e libras respectivamente)
#             Usando regressão linear, preveja a altura de uma mulher com peso = 30
mulheres <- women
View(mulheres)
cor(mulheres)
cor(women)
modelo <- lm(height~weight, data = women)
modelo
predict(modelo, data.frame(weight = 30))
# R)          modelo = lm(height ~ weight, data=women) 
#             predict(modelo, data.frame(weight=30)) ## 34.34093

# Pergunta 8: Marque a alternativa falsa:
# R)          Uma correlação = 1,9 é positiva e forte (varia entre -1 e 1)

# Pergunta 9: Em uma temperatura de 2 graus centigrados, uma loja vende em média 10 casacos.
#             Em um modelo de regressão linear, a inclinação da reta é igual a -3.
#             Considerando que neste problema existe uma correlação negativa e consequentemente
#             a linha de regressão esta inclinada para a esquerda, quantos casacos serão vendidos
#             com uma temperatura de 3 grau centigrados?
# R)          2 --> 3   10 --> 10 -3 = 7

# Pergunta 10: Observando a linha de regressão no gráfico abaixo, qual opção melhor representa 
#              o provável valor da interseção desta linha?
#
#             |         .
#             |        .
#             |       .
#             |      .
#             |     .   
#             |    .      
#             .___.___________
# R)           -12 
