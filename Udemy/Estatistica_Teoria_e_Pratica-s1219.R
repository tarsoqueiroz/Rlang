# Estatistica: Teoria e Prática - Seção 12, aula 19
#

cars
cor(cars)

modelo = lm(speed ~ dist, data=cars)
modelo

plot(speed ~dist, data=cars)
abline(modelo)
predict(modelo, data.frame(dist=22))

# QUIZ

# 1) A correlação entre duas variáveis é igual a -0,89. Qual opção melhor define este valor?
# R) A correlação é negativa, e está próxima de 1, portanto é forte

# 2) Observe o gráfico abaixo:
# R) O Gráfico mostra que enquanto X diminui, Y aumenta, portanto é uma correlação negativa.
#    A concentração dos pontos próxima a reta mostra uma correlação forte.

# 3) Observe o gráfico abaixo:
# R) A dispersarão dos pontos indica uma correlação fraca ou inexistente

# 4) Para criar a linha de melhor ajuste é preciso:
# R) Precisamos de interseção e inclinação para podermos fazer uma previsão

# 5) Para fazer uma previsão, além de “x” é preciso:
# R) Precisamos de interseção e inclinação

# 6) Na instalação padrão do R existe o conjunto de dados women, onde a altura (height)
#    está em polegadas e o peso (weight) em libras. Calcule a correlação.
# R) 0,99
cor(women)


# 7) Na instalação padrão do R existe o conjunto de dados women, onde a altura (height)
#    está em polegadas e o peso (weight) em libras. Preveja a altura de uma mulher que 
#    pese 124 libras.
# R) 61,34pol
women
wmodelo = lm(height ~ weight, data=women)
wmodelo
plot(height ~ weight, data=women)
abline(wmodelo)
predict(wmodelo, data.frame(weight=124))










