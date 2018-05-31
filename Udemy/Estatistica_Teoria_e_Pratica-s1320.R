# Estatistica: Teoria e Prática - Seção 13, aula 20
#

trees
InsectSprays

hist(trees$Height, main="Árvores", ylab="Frequência", xlab="Altura", col="blue")

densidade = density(trees$Height)
plot(densidade)

plot(trees$Girth, trees$Volume, main="Árvores", col="red", pch=20)

boxplot(trees$Volume, main="Árvores", col = "yellow")

spray =  aggregate(. ~ spray, data=InsectSprays, sum)
spray
barplot(spray$count, col = gray.colors(6), names.arg = spray$spray)
box()

pie(spray$count, col=c(1:6), labels=spray$spray, main="Spray")
box()

# QUIZ

# 1) Gráfico ideal para comparar variáveis categóricas
# R) Setores - Por mostrar as informações em ângulos próximos, é ideal para comparação

# 2) Gráfico recomendado para comparação de duas variáveis numéricas
# R) O gráfico de dispersão permite comprar duas variáveis numéricas em dois eixos: X e Y

# 3) Ideal para analisar a distribuição dos dados
# R) Um histograma mostra como os dados estão distribuídos

# 4) Gráfico utilizado para avaliar a distribuição dos dados, capaz de mostrar valores 
#    fora do padrão (outliers)
# R) Assim como o histograma, o box plot é útil para analisar a distribuição de variáveis. 
#    Porém, ele permite comparar mais de uma variável e mostra outliers.

# 5) Um problema com este tipo de gráfico é a sobreposição de valores de variáveis
# R) Dispersão - Se duas variáveis tiverem valores iguais ou muito próximos para X e Y, 
#    ocorre sobreposição








