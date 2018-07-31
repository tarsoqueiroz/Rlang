#
# Udemy - Formação Cientista de Dados
#
# Seção 04 - Estatistica III
#

# Analise Exploratória de Dados - AED / EDA
# John Wilder Tukey

# Distribuição de Poisson
#   P(X = x)
#   P(X < x)
#   P(X >  x)

# Média 2 acidentes. Probabilidade de ocorrer 3 acidentes
dpois(3, lambda = 2)
# Probabilidade de ocorrer 3 ou menos acidentes
ppois(3, lambda = 2)
# Probabilidade de ocorrer mais de 3 acidentes
ppois(3, lambda = 2, lower.tail = F)

# Qui Quadrado
# 
novela <- matrix(c(19,6,43,32), nrow = 2, byrow = T)
novela
rownames(novela) <- c("Masculino", "Feminino")
colnames(novela) <- c("Assiste", "NaoAssiste")
novela
chisq.test(novela)
# Não há diferença significativa além do acaso

# Anova - usada para comparar 3 ou mais grupos

tratamento <- read.csv(file.choose(), se=";", header = T)
View(tratamento)
boxplot(tratamento$Horas ~tratamento$Remedio)

an <- aov(Horas ~ Remedio, data = tratamento)
summary(an)

an <- aov(Horas ~ Remedio * Sexo, data = tratamento)
summary(an)

an <- aov(Horas ~ Remedio, data = tratamento)
tukey <- TukeyHSD(an)
tukey
plot(tukey)

# Outliers - valores fora do padrão, afastados dos demais elementos

boxplot(iris$Sepal.Width)
boxplot(iris$Sepal.Width, outline = F)
boxplot.stats(iris$Sepal.Width)$out

#install.packages('outliers')
library(outliers)
outlier(iris$Sepal.Width)
outlier(iris$Sepal.Width, opposite = T)

#
# Questionário
#

# Pergunta 1: Marque a opção que não faz parte dos objetivos da analise de dados exploratória
# R)          Prever o valor de ações na bolsa de valores

# Pergunta 2: Em média ocorrem 10 mortes por mês em um hospital.
#             Qual a probabilidade de, em um determinado mês, ocorrerem 12 mortes?
dpois(12, lambda = 10)
# R)          dpois(12,lambda=10) [1] 0.09478033

# Pergunta 3: Na imagem abaixo, quantas anomalias inferiores foram encontradas?
# R)          Uma

# Pergunta 4: Você precisa estudar o comportamento de homens e mulheres com relação a jogo de azar.
#             Você faz uma pesquisa e tabula os seguintes resultados, para fazer um teste de qui quadrado.
#             Qual o valor de p obtido com a tabulação destes dados?
jogodeazar <- matrix(c(41,34,18,7), nrow = 2, byrow = T)
jogodeazar
rownames(jogodeazar) <- c("Masculino", "Feminino")
colnames(jogodeazar) <- c("Joga", "NaoJoga")
jogodeazar
chisq.test(jogodeazar)
# R)          jogo = matrix(c(41,34,18,7),nrow=2, byrow=T) 
#             rownames(jogo) = c("Masculino","Feminino") 
#             colnames(jogo) = c("Joga","NaoJoga")
#             chisq.test(jogo)

# Pergunta 5: Quando devemos utilizar a analise de variância (Anova) em vez de um Teste T 
#             para analisar a variação de médias?
# R)          Quando temos mais de dois grupos
