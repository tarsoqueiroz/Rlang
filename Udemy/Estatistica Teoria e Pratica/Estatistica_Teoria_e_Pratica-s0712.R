#
# Estatistica: Teoria e Prática - Seção 07, aula 12
#

# Para o exemplo onde ocorrem 2 acidentes de carro por dia.

# Ocorrência de 0 acidente em 1 dia
dpois(0, 2)
# Ocorrência de 1 acidente em 1 dia
dpois(1, 2)
# Ocorrência de 2 acidentes em 1 dia
dpois(2, 2)
# Ocorrência de 3 acidentes em 1 dia
dpois(3, 2)

# Ocorrência de 3 acidentes ou mais em 1 dia
ppois(2, 2, FALSE)
ppois(3, 2, lower.tail=FALSE)

dpois(0, 2)+dpois(1, 2)+dpois(2, 2)-1

dpois(0, 2)+dpois(1, 2)+dpois(2, 2)

# P[X<=2]
ppois(2, 2) 
# P[X>2]
ppois(2, 2, lower.tail=FALSE)

# QUIZ

# 1 - A cada dia 3 pessoas morrem de câncer em um hospital. 
#     Qual a probabilidade de não morrer nenhuma pessoa em determinado dia?
dpois(0, 3)

# 2 - Em país ocorrem 5 acidentes aéreos por semana. 
#     Qual a probabilidade de, em uma semana, ocorrerem menos de 5 acidentes?
ppois(4, 5)

# 3 - Em média, 4 ganhadores ganham a loteria por semana. 
#     Qual a probabilidade de em uma semana, haver zero, um, dois e três 
#     ganhadores respectivamente.
dpois(0, 4)
dpois(1, 4)
dpois(2, 4)
dpois(3, 4)

# 4 - Três prisioneiros fogem, em média, de um presidio por ano. 
#     Qual a probabilidade de fugirem 4 ou mais em determinado ano?
dpois(0,3)
dpois(1,3)
dpois(2,3)
dpois(3,3)
ppois(4,3,lower.tail = FALSE)
ppois(3,3,lower.tail = FALSE)










