#
# Udemy - Formação Cientista de Dados
#
# Seção 08 - Grafos e Redes Sociais
#

# 
#
#
# Questionário 8
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



