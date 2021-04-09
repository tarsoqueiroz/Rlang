#
# Udemy - Formação Cientista de Dados
#
# Seção 08 - Grafos e Redes Sociais
#

# 
install.packages('igraph')
library(igraph)

grafo1 = graph(edges = c(1,2,2,3,3,4,4,1))
plot(grafo1)
grafo1 = graph(edges = c(1,2,2,3,3,4,4,1,1,4,4,3,3,2,2,1))
plot(grafo1)

grafo1 = graph(edges = c(1,2,2,3,3,4,4,1,1,1))
plot(grafo1)

grafo2 = graph_from_literal(1-+2, 2-+3, 3++4, 4-+1)
plot(grafo2)

grafo2 = graph_from_literal(1-2, 2-3, 3-4, 4-1)
plot(grafo2)

grafo2 = graph_from_literal(1-2, 2-3, 3-4, 4-1, 5)
plot(grafo2)

grafo2 = graph(edges = c(1,2,3,3,3,4,4,1))
plot(grafo2)
class(grafo2)
grafo2

grafo3 = graph(edges = c(1,2,3,3,3,4,4,1), directed = F)
plot(grafo3)
class(grafo3)
grafo3

grafo4 <- graph(edges =c(1,2,2,3,3,4,4,1), directed = F, n = 10)
plot(grafo4)

grafo5 <- graph(edges =c("A", "B", "B", "C", "C", "D", "D", "E", "E", "A", "A", "C", "C", "B"), 
                isolates = c("F", "G"))
plot(grafo5)
grafo5[]
grafo5[1,]
grafo5[,1]
grafo5[1,1]

V(grafo5)$name

grafo7 <- graph(edges = c("Fernando", "Pedro", "José","Antônio", "Fernando", "José", "Fernando", "Antônio"))
plot(grafo7)
V(grafo7)$Peso <- c(40, 30, 30, 25)
vertex_attr(grafo7)
E(grafo7)$TipoAmizade <- c("Amigo", "Inimigo", "Inimigo", "Amigo")
edge_attr(grafo7)$TipoAmizade
vertex_attr(grafo7)$Peso
V(grafo7)$weigth <- c(1,2,1,3)
vertex_attr(grafo7)
grafo7
V(grafo7)$type = "Humanos"
grafo7

vertex_attr(grafo7)$Peso
plot(grafo7, vertex.size = vertex_attr(grafo7)$Peso)
plot(grafo7, 
     vertex.size = vertex_attr(grafo7)$Peso,
     edge.width = edge_attr(grafo7)$weight)
vertex_attr(grafo7)$Cor <- c("Blue", "Red", "Yellow", "Green")
plot(grafo7, 
     vertex.size = vertex_attr(grafo7)$Peso,
     edge.width = edge_attr(grafo7)$weight,
     vertex.color = vertex_attr(grafo7)$Cor)
plot(grafo7, 
     vertex.size = vertex_attr(grafo7)$Peso,
     edge.width = edge_attr(grafo7)$weight,
     vertex.color = vertex_attr(grafo7)$Cor,
     edge.curved = 0.4)
plot(grafo7, 
     vertex.size = vertex_attr(grafo7)$Peso,
     edge.width = edge_attr(grafo7)$weight,
     vertex.color = vertex_attr(grafo7)$Cor,
     edge.curved = 0.4,
     frame = T,
     main = "Grafo")
plot(grafo7, 
     vertex.size = vertex_attr(grafo7)$Peso,
     edge.width = edge_attr(grafo7)$weight,
     vertex.color = vertex_attr(grafo7)$Cor,
     edge.curved = 0.4,
     frame = T,
     main = "Grafo",
     vertex.shapes = "square")

tkplot(grafo7)


grafo8 <- read_graph(file.choose(), format = c('graphml'))
grafo8
plot(grafo8)

degree(grafo8, mode = 'all')
degree(grafo8, mode = 'in')
degree(grafo8, mode = 'out')
grau <- degree(grafo8, mode = 'in')
plot(grafo8, vertex.size = grau)

diameter(grafo8, directed = T)
diameter(grafo8, directed = F)
get_diameter(grafo8, directed = T)

neighborhood(grafo8, 0, mode = c('all'))

grafo9 <- grafo8
isomorphic(grafo8, grafo9)


dist <- graph(edges = c("A","C","A","B","B","E","B","F","C","D","G","H","D","H","E","H","F","G"),
              directed = T)
E(dist)$weight <- c(2,1,2,1,2,1,1,3,1)
plot(dist, edge.label = E(dist)$weight)

distances(dist, V(dist)$name == "A", V(dist)$name == "H")
caminho <- shortest_paths(dist, V(dist)$name == "A", V(dist)$name == "H", output = c("both"))
caminho
caminho$vpath


for (i in 1:length(V(dist))) {
  V(dist)$color[i] <- ifelse(i %in% as.vector(unlist(caminho$vpath)), "green", "gray")
}
for (i in 1:length(E(dist))) {
  E(dist)$color[i] <- ifelse(i %in% as.vector(unlist(caminho$epath)), "green", "gray")
}
plot(dist, edge.label = E(dist)$weight)


comum <- cluster_edge_betweenness(grafo8)
comum
comum$membership
plot(grafo8, vertex.color = comum$membership)

comun <- cluster_edge_betweenness(dist)
comun
comun$membership
plot(dist, vertex.color = comun$membership, edge.color = 'gray')

cli = cliques(as.undirected(grafo8), min=4)
length(cli)
cli

#
#
#
#install.packages('igraphdata')
library(igraphdata)

data(Koenigsberg)
plot(Koenigsberg)
degree(Koenigsberg, mode = 'all')

data(kite)
plot(kite)

data(UKfaculty)
plot(UKfaculty)
comun = cluster_edge_betweenness(UKfaculty)
plot(comun, UKfaculty)

# 
#
#
# Questionário 8
#

# Pergunta  1: Dado o grafo na imagem abaixo, marque a opção que apresenta o valor correto 
#              para seu n (número de vértices):
# Resposta  1: 10

# Pergunta  2: Dado o grafo da imagem abaixo, marque a opção com o valor correto para o grau do vértice A:
# Resposta  2: 4

# Pergunta  3: Dado o grafo direcionado da imagem abaixo, qual resposta contém o grau de saída do vértice A?
# Resposta  3: 2

# Pergunta  4: Observa a figura abaixo e responda:
#              Os grafos A e B são isomórficos. A afirmação é:
# Resposta  4: Verdadeira

# Pergunta  5: Leia a sentença abaixo e responda verdadeiro ou falso:
#              O grafo da imagem é conexo.
# Resposta  5: ???????? Segundo slides é Conexo, mas resposta é falso

# Pergunta  6: Sobre a sentença abaixo responda verdadeiro ou falso:
#              No grafo abaixo, existe um ciclo igual a E={ (A,E) , (E,B), (B,A) }
# Resposta  6: Verdadeiro (????) Acho que é um caminho

# Pergunta  7: Sobre a sentença abaixo responda verdadeiro ou falso:
#              No grafo abaixo, existe um caminho igual a E={ (J,H) , (H,I), (I,D) }
# Resposta  7: Falso

# Pergunta  8: Observando os grafos da imagem abaixo, qual possui maior densidade?
# Resposta  8: A (Relação aresta/vertices)

# Pergunta  9: Observando o grafo da imagem, marque a opção que apresenta a lista de arrestas corretamente.
# Resposta  9: C - 1-4,2-1,2-3,2-4,3-1,3-2,4-1,4-2

# Pergunta 10: Marque a afirmação verdadeira
# Resposta 10: O paradoxo da amizade mostra que, em média, seus amigos tem mais conexões do que você.















