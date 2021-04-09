#Funções

#criando dados
?sample

n<- sample(1:30,50,replace=TRUE)
m<- sample(1:30,50,replace=TRUE)


#Fórmula geral
#nome<- function (x){ transformar x}

teste<- function(x){ 
  x+1}


teste(4)
teste(0)

teste(m)

teste<- function(x){ 
  x+1
  x+5}

teste(4)
teste(0)

#dentro de uma função, R tenta ser o mais discreto possível, apenas retorna o último valor
#por isso o print() se faz necessário

teste<- function(x){ 
  print(x+1)
  print(x+5)}

teste(1)

teste(m)

#Em geral, escreve-se funções para evitar repetições de linhas e/ou comandos complicados

resumo<- function(x){
  print(mean(x))
  print(sd(x))
  hist(x)
  boxplot(x)
}

resumo(m)
resumo(n)

#detalhar um pouco mais

resumo<- function(x){
print("média")  
  print(mean(x))
  print("desvio padrão")
  print(sd(x))
  hist(x)
  boxplot(x)
}


resumo(n)
resumo(m)

resumo(1:20)
