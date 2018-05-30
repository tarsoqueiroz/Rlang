# Estatistica: Teoria e Prática - Seção 08, aula 13, 14 E 15
#

# Conjunto de objetos em uma caixa com média de 8kg e desvio de 2.
#
# 1) Retirar objeto com -6kg
pnorm(6, 8, 2)
# 2) Retirar objeto com +6kg
pnorm(6, 8, 2, lower.tail = F)
# 3) Retirar objeto com -6kg e +10kg
pnorm(6, 8, 2) + pnorm(10, 8, 2, lower.tail = F)
# 4) Retirar objeto com -10kg e +8kg
pnorm(10, 8, 2) - pnorm(8, 8, 2, lower.tail = F)

# QUIZ

# 1) Uma distribuição normal tem média igual a 100 quilos. Sabemos que a
#    probabilidade de se encontrar um objeto com menos de 10 quilos é de 0,2%. 
#    Qual a probabilidade de tirar um objeto com menos de 100 quilos?
# r) Como a média é 100, e na distribuição normal ela está ao centro,
#    tirar um objeto com menos de 100 quilos tem probabilidade de 50%.

# 2) Objetos pesados tem média igual a 150 e desvio padrão igual a 25 quilos e
#    são normalmente distribuídos. Qual a probabilidade de se retirar um objeto
#    com menos de 130 quilos?
pnorm(130, 150, 25)

# 3) Objetos pesados tem média igual a 150 e desvio padrão igual a 25 e são
#    normalmente distribuídos. Qual a probabilidade de se retirar um objeto que
#    tenha mais de 170 quilos?
pnorm(170, 150, 25, lower.tail = F)

# 4) Objetos pesados tem média igual a 150 e desvio padrão igual a 25 e são
#    normalmente distribuídos. Qual a probabilidade se retirar um objeto que 
#    tenho menos de 130 quilos ou mais de 170 quilos?
pnorm(130, 150, 25) + pnorm(170, 150, 25, lower.tail = F)

# 5) Objetos pesados tem média igual a 150 e desvio padrão igual a 25 e são 
#    normalmente distribuídos. Qual a probabilidade de se tirar um objeto que
#    pese entre 150 e 180 quilos?
pnorm(180, 150, 25) - pnorm(150, 150, 25, lower.tail = F)

# 6) Alunos fizeram uma prova cuja média foi 70 e o desvio padrão 10. Os dados 
#    estão normalmente distribuídos. Com essas informações, calcule o percentual
#    de alunos que tirou mais de 80 na prova.
pnorm(80, 70, 10, lower.tail = F)

# 7) Alunos fizeram uma prova cuja média foi 70 e o desvio padrão 10. Os dados 
#    estão normalmente distribuídos. Com essas informações, calcule o percentual
#    de alunos que tirou menos de 50 na prova.
pnorm(50, 70, 10)

# 8) Alunos fizeram uma prova cuja média foi 70 e o desvio padrão 10. Os dados 
#    estão normalmente distribuídos. Com essas informações, calcule o percentual
#    de alunos que tirou mais de 50 na prova.
pnorm(50, 70, 10, lower.tail = F)
