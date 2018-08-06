#
# Udemy - Formação Cientista de Dados
#
# Seção 06 - Machine Learning
#

# e1071 e k1ar
#install.packages("el071", dependencies = T)
library(e1071)

credito <- read.csv(file.choose(), se = ",", header = T)
View(credito)
dim(credito)

amostra <- sample(2, 1000, replace = T, prob = c(0.7, 0.3))
amostra
creditotreino <- credito[amostra == 1,]
creditoteste  <- credito[amostra == 2,]

modelo = naiveBayes(class ~ . , credito)
modelo
class(modelo)

predicao <- predict(modelo, creditoteste)
#predicao <- predict(modelo, credito)
predicao

confusao <- table(creditoteste$class, predicao)
#confusao <- table(credito$class, predicao)
confusao

taxaacerto <- (confusao[1] + confusao[4]) / sum(confusao)
taxaacerto
taxaerro <- (confusao[2] + confusao[3]) / sum(confusao)
taxaerro

# Simulando em Produção

novocredito <- read.csv(file.choose(), sep = ',', header = T)
novocredito
dim(novocredito)

predict(modelo, novocredito)

# Árvore de deciosao Rpart

#install.packages('rpart', dependencies = T)
library(rpart) 

credito <- read.csv(file.choose(), se = ",", header = T)
View(credito)
dim(credito)

amostra <- sample(2, 1000, replace = T, prob = c(0.7, 0.3))
amostra
creditotreino <- credito[amostra == 1,]
creditoteste  <- credito[amostra == 2,]

arvore <- rpart(class ~ ., data = creditotreino, method = 'class')
print(arvore)
plot(arvore)
text(arvore, use.n = T, all = T, cex = .8)

teste <- predict(arvore, newdata = creditoteste)
teste
cred <- cbind(creditoteste, teste)
cred
cred['Result'] = ifelse(cred$bad >= 0.5, 'bad', 'good')
cred
confusao = table(cred$class, cred$Result)
confusao

taxaacerto <- (confusao[1] + confusao[4]) / sum(confusao)
taxaacerto
taxaerro <- (confusao[2] + confusao[3]) / sum(confusao)
taxaerro

# Aprendizado baseado em instância

#installed.packages('class', dependencies = T)
library(class)

head(iris)
summary(iris)

amostra <- sample(2, 150, replace = T, prob = c(0.7, 0.3))
iristreino <- iris[amostra == 1,]
classificar <- iris[amostra == 2,]
dim(iristreino)
dim(classificar)
previsao <- knn(iristreino[, 1:4], classificar[, 1:4], iristreino[, 5], k = 3)
table(classificar[, 5], previsao)

# Ensamble Learning

installed.packages('randomForest', dependencies = T)
library(randomForest)

credito <- read.csv(file.choose(), se = ",", header = T)
amostra <- sample(2, 1000, replace = T, prob = c(0.7, 0.3))
creditotreino <- credito[amostra == 1,]
creditoteste  <- credito[amostra == 2,]

floresta <- randomForest(class ~ ., data = creditotreino, ntree = 100, importance = T)
varImpPlot(floresta)

previsao <- predict(floresta, creditoteste)
confusao <- table(previsao, creditoteste$class)
confusao

taxaacerto <- (confusao[1] + confusao[4]) / sum(confusao)
taxaacerto
taxaerro <- (confusao[2] + confusao[3]) / sum(confusao)
taxaerro

# Seleção de atributos

library(e1071)

modelo = svm(class ~ ., creditotreino)
modelo

predicao = predict(modelo, creditoteste)
predicao
confusao <- table(creditoteste$class, predicao)  
confusao  
taxaacerto <- (confusao[1] + confusao[4]) / sum(confusao)
taxaacerto # 72,44% com todos os atributos
taxaerro <- (confusao[2] + confusao[3]) / sum(confusao)
taxaerro

# install.packages('FSelector', dependencies = T)
library(FSelector)

random.forest.importance(class ~ ., credito)
modelo = svm(class ~ checking_status + duration + credit_history + purpouse, creditotreino)
predicao = predict(modelo, creditoteste)
predicao
confusao <- table(creditoteste$class, predicao)  
confusao  
taxaacerto <- (confusao[1] + confusao[4]) / sum(confusao)
taxaacerto # 77,38% com alguns atributos
taxaerro <- (confusao[2] + confusao[3]) / sum(confusao)
taxaerro












