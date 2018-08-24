#
# Udemy - Formação Cientista de Dados
#
# Seção 09 - Mineração de Textos
#

#install.packages('openssl')
#install.packages('devtools')
#library(devtools)
#slam_url <- "https://cran.r-project.org/src/contrib/Archive/slam/slam_0.1-37.tar.gz"
#install_url(slam_url)
#install.packages('tm')
library(tm)

getSources()
getReaders()

corpus <- VCorpus(DirSource('./Udemy/Formacao Cientista de Dados/Resources/Dados 09', encoding = 'UTF-8'), 
          readerControl = list(reader = readPlain, language = 'eng'))
inspect(corpus)
inspect(corpus[1:100])
meta(corpus[[1]])
inspect(corpus[[2]])
as.character(corpus[[2]])
as.character(corpus[[2]])[1]

stopwords('portuguese')

corpus <- tm_map(corpus, removeWords, stopwords('english'))
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)

#install.packages('wordcloud')
library(wordcloud)

wordcloud(corpus, 
          max.words = 100, 
          random.order = T, 
          colors = rainbow(8), 
          rot.per = 0.5,
          use.r.layout = T)

freq <- TermDocumentMatrix(corpus)
matriz <- as.matrix(freq)
matriz <- sort(rowSums(matriz), decreasing = T)
matriz <- data.frame(word = names(matriz), freq = matriz)
matriz

head(matriz, n = 100)


#
# Questionário 9
#

# Pergunta  1: Qual opção abaixo melhor define um Corpus?
# Resposta  1: Um conjunto de documentos de texto

# Pergunta  2: Qual das opções abaixo não é uma aplicação de técnicas de Mineração de Texto?
# Resposta  2: Calcular a probabilidade de uma fraude

# Pergunta  3: Qual item abaixo é falsa, com relação as características de um corpus volátil?
# Resposta  3: Persitência

# Pergunta  4: Qual opção abaixo é a melhor definição para Stopwords?
# Resposta  4: Palavras sem valor semântico que devem ser removidas

# Pergunta  5: Qual a melhor opção para definir uma matriz de termos frequentes?
# Resposta  5: Relação de palavras com maior ocorrência no texto









