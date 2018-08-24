#
# Udemy - Formação Cientista de Dados
#
# Seção 10 - Visualização, Gráficos e Dashboards
#

trees
head(trees)
hist(trees$Height)
hist(trees$Height,
     main = "Árvores",
     ylab = "Frequência", 
     xlab = "Altura",
     col = "blue")
hist(trees$Height,
     main = "Árvores",
     ylab = "Frequência", 
     xlab = "Altura",
     col = "blue",
     density = 20,
     breaks = 20)
hist(trees$Height,
     main = "Árvores",
     ylab = "Frequência", 
     xlab = "Altura",
     col = "blue",
     density = 30,
     breaks = 10)


densidade <- density(trees$Height)
densidade
plot(densidade)
hist(trees$Height,
     main = NULL,
     xlab = NULL)
par(new = TRUE)
plot(densidade)


plot(trees$Girth, trees$Volume)
plot(trees$Girth, trees$Volume,
     main = 'Árvores',
     ylab = 'Circunferência',
     xlab = 'Volume',
     col = 'blue')
plot(trees$Girth, trees$Volume,
     main = 'Árvores',
     ylab = 'Circunferência',
     xlab = 'Volume',
     col = 'blue',
     pch = 20)
plot(trees$Girth, trees$Volume,
     main = 'Árvores',
     ylab = 'Circunferência',
     xlab = 'Volume',
     col = 'blue',
     pch = 20,
     type = 'l')
plot(jitter(trees$Girth), trees$Volume,
     main = 'Árvores',
     ylab = 'Circunferência',
     xlab = 'Volume',
     col = 'blue',
     pch = 20)


CO2
head(CO2)
plot(CO2$conc, CO2$uptake,
     pch = 20,
     col = CO2$Treatment)
legend('bottomright', 
       legend = c('nonchilled', 'chilled'), cex = 1, fill = c('black', 'red'))


plot(trees)
split.screen(figs = c(2,2))
screen(1)
plot(trees$Girth, trees$Volume)
screen(2)
plot(trees$Girth, trees$Height)
screen(3)
plot(trees$Height, trees$Volume)
screen(4)
hist(trees$Volume)
close.screen(all = TRUE)


boxplot(trees$Volume,
        main = 'Árvores',
        xlab = 'Volume')
boxplot(trees$Volume,
        main = 'Árvores',
        xlab = 'Volume',
        col = 'blue',
        horizontal = T)
boxplot(trees$Volume,
        main = 'Árvores',
        xlab = 'Volume',
        col = 'blue',
        horizontal = T,
        outline = F)
boxplot(trees$Volume,
        main = 'Árvores',
        xlab = 'Volume',
        col = 'blue',
        horizontal = T,
        outline = F,
        notch = T)
boxplot.stats(trees$Height)
boxplot(trees)
boxplot(trees,
        horizontal = T)


InsectSprays
head(InsectSprays)
spray <- aggregate(. ~ spray, data = InsectSprays, sum)
spray
barplot(spray$count,
        col = gray.colors(6),
        xlab = 'Spray',
        ylab = 'Total',
        names.arg = spray$spray)
box()

pie(spray$count,
    labels = spray$spray,
    main = 'Spray',
    col = c(1:6))
pie(spray$count,
    labels = NA,
    main = 'Spray',
    col = c(1:6))
legend('bottomright', legend = spray$spray, cex = 1, fill = c(1:6))
## 'bottomright', 'bottom', 'bottomleft', 'left', 'topleft', 'top', 'topright', 'right', 'center'


library(lattice)
bwplot(trees$Volume)
bwplot(trees$Volume,
       main = 'Árvore',
       xlab = 'Volume')


histogram(trees$Volume,
          main = 'Árvores',
          xlab = 'Volume',
          aspect = 2,
          type = 'count', 
          nint = 10)
histogram(trees$Volume,
          main = 'Árvores',
          xlab = 'Volume',
          aspect = 1,
          type = 'count', 
          nint = 10)
histogram(trees$Volume,
          main = 'Árvores',
          xlab = 'Volume',
          aspect = 0.5,
          type = 'count', 
          nint = 10)

chickwts
aggregate(chickwts$weight,
          by = list(chickwts$feed),
          FUN = sum)
histogram(chickwts$weight | chickwts$feed, data = chickwts)


densityplot(CO2$conc)
densityplot(~ CO2$conc | CO2$Treatment)
densityplot(~ CO2$conc | CO2$Treatment, plot.points= F)


xyplot(CO2$conc ~ CO2$uptake)
xyplot(CO2$conc ~ CO2$uptake | CO2$Type)
xyplot(CO2$conc ~ CO2$uptake | CO2$Treatment)

esoph
head(esoph)
dotplot(esoph$alcgp ~ esoph$ncontrols, data = esoph)
dotplot(esoph$alcgp ~ esoph$ncontrols | esoph$tobgp, data = esoph)



cloud(decrease ~ rowpos * colpos, 
      data = OrchardSprays)
cloud(decrease ~ rowpos * colpos, 
      groups = treatment,
      data = OrchardSprays)


#
# Questionário 10
#

# Pergunta  1: Marque a opção falsa com relação a capacidade de percepção do cérebro humano:
# Resposta  1: O cérebro tem maior capacidade de perceber volume do que Ãngulos

# Pergunta  2: Você precisa montar um Dashbord financeiro com 5 gráficos.
#              Observando a imagem abaixo, em quais áreas você colocaria os 2 gráficos mais importantes?
# Resposta  2: 1 e 3

# Pergunta  3: Qual opção melhor define o conceito de Data-Ink Ratio, criado por Edward Tufte?
# Resposta  3: Maximizar o uso da tinta para mostrar dados

# Pergunta  4: Das opções abaixo, qual o melhor gráfico para comparar dois valores contínuos?
# Resposta  4: Gráfico de dispersão

# Pergunta  5: Com relação a gráficos de setores, marque a afirmação falsa:
# Resposta  5: Não devem ser usados

# Pergunta  6: São gráficos recomendados para analisar a distribuição de uma variável contínua.
# Resposta  6: Boxplot e Histograma

# Pergunta  7: São gráficos recomendados para visualizar dados discretos.
# Resposta  7: Barras e Setores

# Pergunta  8: Você criou um Dashboard e resolve verificar se ele atende as boas práticas recomendadas. 
#              Dos itens abaixo, qual você não aplicaria em seu Dashboard?
# Resposta  8: Verificaria se todos os elementos do Dashboard estão nas áread de mais enfase (superior
#              esquerda e central)

# Pergunta  9: Gráfico ideal para comparar variáveis contínuas, mas que pode apresentar problema de 
#              sobreposição de dados.
# Resposta  9: Dispersão

# Pergunta 10: Observando o gráfico abaixo, o que está representado pelo ponto indicado pela seta?
# Resposta 10: Variável fora do padrão






