#
# Ensaio para Ratio
#

# Source in "Mestre dos Derivativos/Ensaios"

options(scipen = 999)

tickHourPetrH17 <- read.csv(file.choose(), se="\t", header = T)
tickHourPetrI20 <- read.csv(file.choose(), se="\t", header = T)
tickHourPetrH21 <- read.csv(file.choose(), se="\t", header = T)

tickHourPetrH17$X.DATE. <- paste(tickHourPetrH17$X.DATE., tickHourPetrH17$X.TIME., sep = ' ')
tickHourPetrI20$X.DATE. <- paste(tickHourPetrI20$X.DATE., tickHourPetrI20$X.TIME., sep = ' ')
tickHourPetrH21$X.DATE. <- paste(tickHourPetrH21$X.DATE., tickHourPetrH21$X.TIME., sep = ' ')

tickHourPetrH17[c(2,3,4,5,7,9)] <- list(NULL)
tickHourPetrI20[c(2,3,4,5,7,9)] <- list(NULL)
tickHourPetrH21[c(2,3,4,5,7,9)] <- list(NULL)

colnames(tickHourPetrH17) <- c("DataHora", "closeH17", "volH17")
colnames(tickHourPetrI20) <- c("DataHora", "closeI20", "volI20")
colnames(tickHourPetrH21) <- c("DataHora", "closeH21", "volH21")

head(tickHourPetrH17)
head(tickHourPetrI20)
head(tickHourPetrH21)

tickHourTmp <- merge(tickHourPetrH17, tickHourPetrI20, by = 'DataHora')
tickHourRT  <- merge(tickHourTmp,     tickHourPetrH21, by = 'DataHora')


tickHourRT$closeH17
tickHourRT$closeI20
tickHourRT$closeH21

tickHourRT$closeRT <- round((tickHourRT$closeH17) - (2 * tickHourRT$closeI20) + (tickHourRT$closeH21), 3)
head(tickHourRT, 20)
View(tickHourRT)
ggplot(tickHourRT, aes(x=DataHora, group = 1))+
  geom_line(aes(y=closeRT,        colour='Ratio'), size = 1) +
  labs(title="Malha de Ratio",
       subtitle="Miolos em 21, 22 e 23",
       x="Valor da Ação",
       y="Delta Estrutural",
       caption="Sala do Mestre dos Derivativos")+
  ylim(c(-0.2,  .8))

geom_line(aes(y=closeH17,       colour='PetrH17')) +
  geom_line(aes(y=closeI20,       colour='PetrI20')) +
  geom_line(aes(y=closeH21,       colour='PetrH21'))+
  
xlim(c(17, 25)) +
  