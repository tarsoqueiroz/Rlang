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




