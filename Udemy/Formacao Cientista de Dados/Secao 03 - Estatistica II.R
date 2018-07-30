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























