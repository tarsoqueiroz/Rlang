#como lidar com valores inexistentes

dados<-data.frame("a"= c(1,3,NA), "b"= c(4,NA,4), "c"= c(3,3,3))
dados

mean(dados$c)
mean(dados$a)

mean(dados$a, na.rm=TRUE)
mean(dados$a, na.rm=T)

na.omit() #remove as linhas com NA

?complete.cases() # retorna observações completas
complete.cases(dados)
dados[complete.cases(dados),]

is.na(dados) # identifica os NA


na.rm #funções como mean, sd
dados[is.na(dados)==TRUE]<- 0
dados

dados<-data.frame("a"= c(1,3,NA), "b"= c("x",NA,"y"))
dados

na.omit(dados)

is.na(dados)
