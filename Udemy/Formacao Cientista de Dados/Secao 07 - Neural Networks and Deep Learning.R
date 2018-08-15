#
# Udemy - Formação Cientista de Dados
#
# Seção 07 - Neural Networks and Deep Learning
#

# 
#install.packages('neuralnet')
library(neuralnet)

myiris <- iris

myiris <- cbind(myiris, myiris$Species=='setosa')
myiris <- cbind(myiris, myiris$Species=='versicolor')
myiris <- cbind(myiris, myiris$Species=='virginica')
head(myiris)
summary(myiris)
names(myiris)[6] = 'setosa'
names(myiris)[7] = 'versicolor'
names(myiris)[8] = 'virginica'
head(myiris)
summary(myiris)

amostra <- sample(2, 150, replace = T, prob = c(0.7, 0.3))
myiristreino <- myiris[amostra == 1,]
myiristeste  <- myiris[amostra == 2,]
dim(myiristreino)
dim(myiristeste)

modelo = neuralnet(setosa + versicolor + virginica ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, myiristreino, hidden = c(5, 4))
print(modelo)
plot(modelo)

teste <- compute(modelo, myiristeste[, 1:4])
teste$net.result

resultado <- as.data.frame(teste$net.result)
names(resultado)[1] = 'setosa'
names(resultado)[2] = 'versicolor'
names(resultado)[3] = 'virginica'
head(resultado)
resultado$class = colnames(resultado[, 1:3])[max.col(resultado[, 1:3], ties.method = 'first')]
head(resultado)

confusao <- table(resultado$class, myiristeste$Species)
sum(diag(confusao) * 100 / sum(confusao))

#
# Deep learning na prática
# 

digitos <- read.csv(gzfile(file.choose()), header = F)
dim(digitos)
head(digitos)

split.screen(figs = c(2,2))
dig <- t(matrix(unlist(digitos[20, -785]), nrow = 28, byrow = F))
dig <- t(apply(dig, 2, rev))
dig

screen(1)
image(dig, col=grey.colors(255))
digitos[20, 785]

screen(2)
dig <- t(matrix(unlist(digitos[2, -785]), nrow = 28, byrow = F))
dig <- t(apply(dig, 2, rev))
image(dig, col=grey.colors(255))

screen(3)
dig <- t(matrix(unlist(digitos[4, -785]), nrow = 28, byrow = F))
dig <- t(apply(dig, 2, rev))
image(dig, col=grey.colors(255))

screen(4)
dig <- t(matrix(unlist(digitos[5, -785]), nrow = 28, byrow = F))
dig <- t(apply(dig, 2, rev))
image(dig, col=grey.colors(255))

close.screen(all = T)
image(dig, col=grey.colors(255))

# 
# install.packages("h2o")
library(h2o)

h2o.init()

treino <- h2o.importFile(file.choose())
teste <- h2o.importFile(file.choose())
dim(treino)
head(treino)
dim(teste)

treino[, 785] = as.factor(treino[, 785])
teste[, 785] = as.factor(teste[, 785])

modelo <- h2o.deeplearning(x = colnames(treino[, 1:784]), 
                           y = "C785", 
                           training_frame = treino, 
                           validation_frame = teste, 
                           distribution = "AUTO", 
                           activation = "RectifierWithDropout", 
                           hidden = c(64,64,64), 
                           sparse = TRUE, 
                           epochs = 20)
plot(modelo)

h2o.performance(modelo)

treino[20, 785] # [1] 4
pred <- h2o.predict(modelo, newdata = treino[20, 1:784])
pred$predict # predict 4

#
# Questionário 7
#

# Pergunta 1: Assim como neurônios naturais, neurônios artificiais possuem uma função de ativação. 
#             Qual opção abaixo melhor descreve o objetivo dessa função?
# R)          Verificar se a entrada do neurônio atingiu um limiar (um parâmetro mínimo). Em caso
#             positivo, o neurônio gera uma sinapse com outro neurônio.

# Pergunta 2: Na imagem abaixo, qual opção tem a nomenclatura correta do elemento em vermelho em 
#             uma rede neural?
# R)          Sinapse

# Pergunta 3: Considerando que a função mod extrai o decimal do resultado de uma divisão, qual é 
#             a função do Neurônio Artificial abaixo?
# R)          Calcular se o número é par

# Pergunta 4: Das alternativas abaixo, qual é a melhor definição para Backpropagation?
# R)          Cálculo de erro que é utilizado para ajustar os pesos nas entradas para tentar
#             melhorar a performance da rede

# Pergunta 5: Qual opção melhor descreve o funcionamento de Convolutional Neural Networks?
# R)          No processo de aprendizado, características dos objetos formam filtros, que na
#             classificação são utilizados para buscar estas mesmas características em novas
#             imagens. Quanto mais características de um objeto forem identificadas, maiores
#             as chances de classificação com aquela classe.












