#resolução de exercicios

# Exercício 1 - carregar os dois data frames

laranja<- Orange

porco<- ToothGrowth


# Ex 2 - Estrutura dos data.frame
#Quais 
str(laranja)
str(porco)

table(laranja$Tree)
table(laranja$age)

table(porco$supp)
table(porco$dose)

#Gráficos (histogram, boxplot e gráfico de pontos)

#histograma
hist(laranja$circumference)
hist(porco$len)

#pontos
plot(laranja$age,laranja$circumference)

plot(porco$dose,porco$len)

#boxplot
boxplot(laranja$circumference)
boxplot(porco$len)

plot(laranja$Tree,laranja$circumference)
plot(porco$supp,porco$len)

#média e desvio padrão geral 
mean(laranja$circumference)
sd(laranja$circumference)

mean(porco$len)
sd(porco$len)


# diferenças específicas
tapply(laranja$circumference,laranja$Tree,mean)
tapply(laranja$circumference,laranja$age,mean)

tapply(porco$len,porco$supp,mean)
tapply(porco$len,porco$dose,mean)

#teste estatístico
#dietas
l2<- laranja[laranja$Tree==2,]
l3<- laranja[laranja$Tree==3,]
l4<- laranja[laranja$Tree==4,]

t.test(l2$circumference,l4$circumference)
t.test(l3$circumference,l4$circumference)


vc<- porco[porco$supp=="VC",]
oj<- porco[porco$supp=="OJ",]

t.test(vc$len,oj$len)

