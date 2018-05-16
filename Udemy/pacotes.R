#instalar pacote
install.packages("dplyr")
install.packages("Matrix")

#carregar pacote
library(dplyr)
require(dplyr)

ap <- available.packages()
options(available_packages_filters = c("R_version", "OS_type", "subarch", "duplicates", "license/FOSS"))
