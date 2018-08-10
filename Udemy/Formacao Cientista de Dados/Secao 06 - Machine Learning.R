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

# Agrupamentos

# kmeans
iris
dim(iris)
head(iris)
summary(iris)

cluster <- kmeans(iris[1:4], centers = 3)
cluster

table(iris$Species, cluster$cluster)
cluster$cluster

plot(iris[1:4], col = cluster$cluster)

# Fuzzy c-means
library(e1071)
cluster <- cmeans(iris[1:4], centers = 3)
cluster

table(iris$Species, cluster$cluster)

# K-medoids
#install.packages('cluster', dependencies = T)
library(cluster)

cluster <- pam(iris[1:4], k = 3)
cluster

plot(cluster)
table(iris$Species, cluster$clustering)

# Regras de associação - apriori
#install.packages("arules", dependencies = T)
library(arules)

transacoes <- read.transactions(file.choose(), format = 'basket', sep = ",")
transacoes

inspect(transacoes)
image(transacoes)

regras <- apriori(transacoes, parameter = list(supp=0.5, conf=0.5))
regras
inspect(regras)

#install.packages('arulesViz')
plot(regras)
plot(regras, mothod='graph', control=list(type="itens"))

# Regras de associação - eclad
#install.packages("arules", dependencies = T)
library(arules)

transacoes <- read.transactions(file.choose(), format = 'basket', sep = ",")
image(transacoes)

regras <- eclat(transacoes, parameter = list(supp=0.1, maxlen=15))
inspect(regras)
plot(regras, method='graph', control=list(type='itens'))

#
# Questionário 05
#

# Pergunta 01: Com relação ao aprendizado de Máquina, marque a opção falsa:
# R)           É um processo natural

# Pergunta 02: Marque a opção que melhor representa áreas de conhecimento que usam Machine Learning
# R)           Todas as alternativas

# Pergunta 03: Em Machine Learning, como é chamado um conjunto de dados que contém eventos, naturais
#              ou não, que se quer minerar?
# R)           Relação

# Pergunta 04: Quanto o a classe de uma relação, qual afirmação é falsa?
# R)           A classe não é um atributo

# Pergunta 05: Sobre Naive Bayes, é correto afirmar:
# R)           É um algoritmo de classificação

# Pergunta 06: Das tarefas de Machine Learning abaixo, marque a que não é supervisionada
# R)           Agrupamento

# Pergunta 07: Qual alternativa abaixo melhor descreve um modelo de Machine Learning?
# R)           Uma referência, criada através de um algoritmo, de como novos dados devem ser classificados

# Pergunta 08: Quando estamos preparando nosso modelo, devemos usar um conjunto de dados ainda não 
#              conhecido pelo modelo para testa-lo. Qual opção abaixo melhor justifica esta afirmação?
# R)           O objetivo é criar modelos genéricos, e por isso devemos testar o modelo com dados que ele
#              ainda "desconhece"

# Pergunta 09: Observando  a matriz de confusão abaixo, marque a opção com a correta taxa de acertos do 
#              modelo.
(50 + 45 + 43) / 150
# R)           .92 ou 92%

# Pergunta 10: O Analista de Negócios reclama que a campanha de marketing foi um fracasso, pois quase 
#              nenhum cliente aderiu a promoção. Você fica surpreso pois o modelo que a equipe criou tinha
#              um alto desempenho. O que provavelmente ocorreu?
# R)           Super ajuste

#
# Questionário 6
#

# Pergunta 01: Um algoritmo de Machine Learning classifica clientes como potencias fraudadores de compra
#              de crédito de celular pré-pago.
#              O valor do crédito é de R$ 15,00.
#              No teste do modelo houve 5% de falsos positivos.
#              Com esse modelo em produção e com a venda de créditos para 100.000 clientes, qual seria o
#              provável custo do modelo?
15 * 100000 * 0.05
# R)           75.000

# Pergunta 02: Marque a alternativa que não é uma opção que podemos tentar na busca de um melhor modelo 
#              de Machine Learning
# R)           Incluindo uma grande quantidade de novos atributos ao modelo

# Pergunta 03: Qual opção abaixo é verdadeira com relação a Aprendizado Baseado em Instância?
# R)           Não usa um modelo, classifica novas instância pela semelhança

# Pergunta 04: Observando a figura abaixo, que tipo de algoritmo de agrupamentos foi utilizado?
# R)           Hierárquico

# Pergunta 05: Qual afirmação abaixo é falsa com relação ao algoritmo de agrupamentos DBSCAN?
# R)           Agrupa todos os elementos, não gera ruídos (Não agrupados)

# Pergunta 06: Qual opção abaixo é falsa com relação ao algoritmo de agrupamento K-Means?
# R)           É baseado em um medóide: ponto mais representativo

# Pergunta 07: Observe a imagem abaixo, onde cada linha representa um carrinho de compras de um cliente.
#              Considerando a afirmação: "Quem compra Maça também compra Cerveja", marque a alternativa
#              que representa, respectivamente,  o suporte e a confiança dessa transação.
suporte <- 2 / 3
confianca <- 2 / 2
# R)           0.66 e 1

# Pergunta 08: Sobre regras de associação, a frase:
#              "Numero de transações que contem todos os itens da transação"
#              É a definição para?
# R)           Suporte

# Pergunta 09: A sentença:
#              "Proporção de vezes que, em uma transação contendo o elemento A, também tem o elemento B"
#              é a definição para:
# R)           Confiança

# Pergunta 10: Considerando transações A e B e B e A
#              Qual alternativa podemos afirmar que é verdadeira?
# R)           O suporte das duas transações deve ser o mesmo