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

# 























