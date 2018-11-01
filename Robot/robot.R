#
# Analise de resultado do Robot SmarttBot
#

#install.packages("ggplot2")
library(ggplot2)

smarttbot <- read.csv(file.choose(), se=",", header = T)

dfRobot <- data.frame(Sequencia=seq(1,732,by=1),
                      Ordens=(smarttbot[1]),
                      Resultado=(smarttbot[2]))

ggplot(dfRobot, aes(x=Sequencia))+
  geom_line(aes(y=Ordens,            colour='Ordens')) +
  geom_line(aes(y=Resultado,         colour='Resultado')) +
  geom_line(aes(y=(M1=c(-66)))) +
  geom_line(aes(y=(M1=c(-75)))) +
  labs(title="Smarttbot")
