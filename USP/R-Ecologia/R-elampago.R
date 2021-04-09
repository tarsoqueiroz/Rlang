#
# Curso Relâmpago de R
#
# Aprendendo R em 4668 Palavras
#
# Source: http://cmq.esalq.usp.br/wiki/doku.php?id=publico:tutoriais:r-relampago:start
#

for(i in 1:10000) prod(1:i)
i

#
# Primeiros Comandos
#
license()       # license2) detalha as condições de distribuição do R.
contributors()  # contributors lista a equipe do time-cerne de desenvolvimento.
citation()      # citation ensina como citar o R em trabalhos acadêmicos.
demo()          # demo inicia uma sessão interativa de demonstração do R.
help()          # help para obter uma página de ajuda on-line.
help.start()    # help.start para iniciar um navegador de internet com as páginas de auxílio.
q()             # q é o comando para encerrar a sessão e sair do R ( no inglês q = quit ).

help( "*" )         # auxílio sobre o símbolo "*"
help( sin )         # auxílio sobre a função "sin" = seno
?sin                # variante da função "help"
help( datasets )    # auxílio sobre os conjuntos de dados (datasets) que vêm com o R

#
# No R é fácil criar objetos numéricos
#
x = 2  
x
y = 7
y
z = x * y
z
w = x - y
w

# 
# Vejamos alguns exemplos com objetos vetoriais:
#
k = c(1.3, -5, 6.7, 4.8)
k
x * k
m = c(0, 1, 1, 0, 0, 1, 1, 0)
m
m * k

#
# Área de Trabalho
#
ls()
rm(x, m, k, amostrateste)

save.image()
save.image(file="./USP/R-Ecologia/sessao_R-elampago.RData")

#
# 4. Lendo Dados para Dentro do R: Formato CSV
#

cax = read.csv(file="./USP/R-Ecologia/Data/exemplo-caixeta.csv")
cax
head(cax)

cax2 = read.csv(file="./USP/R-Ecologia/Data/exemplo-caixeta-2.csv", sep=";")
cax2
head(cax2)

#
# 5. Manipulando e Criando Variáveis
#

cax$local
cax$cap

pi
head(cax)
cax$dap = (cax$cap/10) / pi               # cálculo do DAP (cm) a partir do CAP (mm)
cax$g = (pi/4) * (cax$dap/100)^2          # cálculo da área transversal (m2) a partir do DAP (cm)
cax$vol.cilindrico = cax$g * (cax$h/10)   # cálculo do volume cilíndrico a partir da área transv. e da altura (dm)
head(cax)

#
# 6. Descrevendo as Observações
#

cax
cax$local
table(cax$local)
table(cax$local, cax$parcela)
table( cax$especie, cax$local )

barplot( table(cax$local) )

barplot( table(cax$fuste) )
plot( table(cax$fuste) )

par( mar=c(5,10,4,2) )                                                # Define margens do gráfico, aumentando a esquerda
barplot(sort(table(cax$especie)), horiz=T, las=1, xlab="Abundância")  # Gráfico horizontal c/ nomes horizontais
dev.off()                                                             # Fecha a janela gráfica

dotchart( sort(table(cax$especie)), xlab="Abundância" )

# Sumário de Variáveis

summary(cax)
summary(cax$dap)
summary(cax$h)
summary(cax$especie)

# Estatísticas Descritivas:- O R também possui funções para as diversas estatísticas descritivas de variáveis quantitativas:
  
#   Estatística Descritiva    -	Nome da Função
#                    Média    -	mean
#                  Mediana    -	median
#                   Mínimo    -	min
#                   Máximo    -	max
#    Amplitude de variação    -	range
#        Quartis e quantis    -	quantile
#   Distância Interquartil 
#    (Inter Quarter Range)    -	IQR
#                Variância    -	var
#            Desvio padrão 
#     (Standard Deviation)    -	sd
#  Desvio abosluto mediano 
# (Mean Absolut Deviation)    -	mad

cax$cap
mean(cax$cap)
mdap = mean(cax$cap)
median(cax$cap)
min(cax$cap)
max(cax$cap)
range(cax$fuste)
quantile(cax$h)
IQR(cax$h)
var(cax$h)
sd(cax$h)

#
# Gráficos Exploratórios
#

head(cax)
cax$cap
hist( cax$cap )
hist( cax$h, col="red" )
hist( cax$h, col="blue", probability=T )


hist( cax$cap, probability=T , col="blue")
lines( density(cax$cap) , col="red")

stem(cax$cap)
stem(cax$h)

boxplot( cax$cap )
boxplot( cap ~ local, data=cax )

par( mar=c(5,10,4,2) )                                   # Altera as margens da janela gráfica
boxplot( cap ~ especie, data=cax , horizontal=T, las=1)  # Boxplot
dev.off()                                                # Fecha a janela gráfica

# Gráfico de Dispersão
plot( cax$cap, cax$h )
scatter.smooth( cax$cap, cax$h )

#
# Modelos Lineares
#

hipso1 = lm( formula = h ~  cap, data=cax )
hipso1
hipso1 = lm( h ~  cap, data=cax )
hipso1

























