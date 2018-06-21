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




