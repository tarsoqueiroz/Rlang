

# Probabilidade de jogar 5x uma moeda e dar CARA 3x
dbinom(3, 5, 0.5)

# Probabilidade de pegar 0,1,2,3,4 sinais verdes
sv0 = dbinom(0, 4, 0.25)
sv1 = dbinom(1, 4, 0.25)
sv2 = dbinom(2, 4, 0.25)
sv3 = dbinom(3, 4, 0.25)
sv4 = dbinom(4, 4, 0.25)
# somatoria das probabilidades deve ser 100%
somasinais = sum(sv0, sv1, sv2, sv3, sv4)
# probabilidade comulativa
pbinom(4, 4, 0.25)

# Probabilidade de acertar 7 questões em 12, sendo 4 alternativas em cada questão
chute = dbinom(7, 12, 0.25)
chute

# QUIZ

# 01 - Qual a probabilidade de jogar um dado 6 vezes, e dar 6 a metade das jogadas?
dbinom(3, 6, 0.16)
dbinom(3, 6, 1/6)
dbinom(3, 6, 0.17)

# 02 - Considerando uma distribuição binomial, qual a probabilidade de um veículo que
#      alcança 100 km por hora uma vez em cada 10 corridas, alcanças 110 km por hora?
# R)   NÃO TEM REQUISITOS DE DISTRIBUIÇÃO BINOMIAL

# 03 - Você vai fazer uma prova que contém 10 questões com quatro alternativas cada. 
#      Você precisa acertar 6. Você não estudou. Qual sua chance de passar?
dbinom(6, 10, 1/4)

# 04 - Você dirige uma ambulância. Do trajeto do acidente até o hospital existem 3 
#      sinaleiras de 3 tempos cada. Qual a probabilidade de você pegar todas as 
#      sinaleiras abertas?
dbinom(3, 3, 0.33)
dbinom(3, 3, 1/3)
dbinom(3, 3, 0.333333)

# 05 - Se você passar 4 sinais de 2 tempo cada, qual a probabilidade de pegar 0,1,2,3,
#      e 4 sinais abertos, respetivamente:
dbinom(0, 4, 0.5)
dbinom(1, 4, 0.5)
dbinom(2, 4, 0.5)
dbinom(3, 4, 0.5)
dbinom(4, 4, 0.5)

# 06 - Se você passar 4 sinais de 2 tempo cada, qual a probabilidade de pegar 0,1,2,3,
#      e 4 sinais abertos, respetivamente. Quanto a esta afirmação, é correto afirmar:
# R)   As respostas representam o espaço amostral do problema

# 07 - Um determinado tratamento de câncer cura 25% dos pacientes. Em um experimento
#      feito com 10 pacientes, qual a chance de 4 se curarem e de 6 não se curarem, 
#     respectivamente
# 
# Como são 10 pacientes, havendo 4 curas, 6 não se curam, e vice-versa. 
# Portanto a probabilidade é a mesma para os dois casos
dbinom(4, 10, 0.25)
dbinom(6, 10, 0.75)

# 08 - Cada 10 vezes que um homem atira contra um alvo, em 3 ele acerta na mosca.
#      Atirando 5 vezes, qual a probabilidade, respectivamente,  de:
#      1 – Acertar na mosca 1 vez apenas
#      2 – Acertar na mosca as nenhuma vez
#      3 – Acertar na mosca as 5 vezes
dbinom(1, 5, 3/10)
dbinom(0, 5, 3/10)
dbinom(5, 5, 3/10)

# 09 - Em um país, para cada 3 meninas nascem 2 meninos. Qual a probabilidade de 
#      uma família com 5 crianças ter 4 meninas e 1 menino?
dbinom(4, 5, 3/5)
dbinom(4, 5, 0.6)

# 10 - Em uma linha de produção, de cada 100 peças produzidas, 2 tem defeito. 
#      Durante a produção de 10 lotes de 100 peças cada, qual a probabilidade, 
#      respectivamente, de se retirar aleatoriamente do lote:
#      1 – Nenhuma peça com defeito
#      2 – 1 peça com defeito
#      3 – 2 peças com defeito
dbinom(0, 10, 2/100)
dbinom(1, 10, 2/100)
dbinom(2, 10, 2/100)
# R)   A probabilidade de uma peça ter defeito é de 2 para 100, ou 2%. 
#      Então temos 10 experimentos cuja probabilidade é de 2% de sucesso cada
