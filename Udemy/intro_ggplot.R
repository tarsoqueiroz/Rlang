#introdução ao ggplot
library(ggplot2)
#gráfico rápido

####Fórmula
#qplot(x,y,data,geom)
#eixos x,y, dados, tipo de gráfico

View(Orange)
#uma dimensão
qplot(x=circumference,data=Orange) #dado numérico
qplot(x=circumference,data=Orange,geom="histogram") 
qplot(x=circumference,data=Orange,geom="density") 


qplot(x=circumference,data=Orange,binwidth=5) #ajeitando bins

qplot(x=supp,data=ToothGrowth) # fator
qplot(x=supp,data=ToothGrowth,geom="bar") #padrão geom="bar"


#duas dimensões
qplot(x=age,y=circumference,data=Orange) # padrão geom="point"

qplot(x=age,y=circumference,data=Orange,geom="line") #linha entre os pontos
qplot(x=age,y=circumference,data=Orange,geom="path") #caminho

qplot(x=age,y=circumference,data=Orange,color=Tree) # cores de acordo com Tree
qplot(x=age,y=circumference,data=Orange,shape=Tree) # formato de acordo com Tree
qplot(x=age,y=circumference,data=Orange,shape=Tree,color=Tree,
      main= "Circunferência por idade de árvores",xlab= "Idade", ylab="Circunferência") 


