# Estatistica: Teoria e Prática - Seção 11, aula 18
#

# R$75,00/h, amostra de 9, desvio 10. Salário < R$80,00/h?
pt(1.5, 8)
pt((80 - 75)/(10/sqrt(9)), 9 - 1)

# R$75,00/h, amostra de 9, desvio 10. Salário > R$80,00/h?
pt(1.5, 8, lower.tail = F)
pt((80 - 75)/(10/sqrt(9)), 9 - 1, lower.tail = F)

# QUIZ

# 1) São condições para usar a distribuição T de Student
# R) n < 30 e desvio padrão desconhecido

# 2) Com relação a distribuição Normal, a distribuição T de Student (marque a verdadeira):
# R) Teste hipotes, P ou IC, desde que nas condições necessárias

# 3) Para se calcular a probabilidade de uma peça da linha de produção ter defeito, 
#    se calculou o valor de t em 1,119 para um tamanho de amostra igual a 8. 
#    Qual é a probabilidade desta amostra? 
# R) 85%
pt(1.119, 8)

# 4) Se a probabilidade é de 80%, o tamanho da amostra é de 4, qual é o valor de t?
# R) 0.978
pt(0.920, 4)
pt(1.061, 4)
pt(0.941, 4)
pt(0.978, 4)

# 5) Uma equipe de jogadores tem, em média, 80 Kg. São selecionados 5 jogadores e pesados. 
#    O desvio padrão destes jogadores é igual a 4. Qual a probabilidade de um jogador pesar
#    mais que 82 Kg?
# R) 16%
pt((82 - 80)/(4/sqrt(5)), 5 - 1, lower.tail = F)








