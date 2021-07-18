#Script: analises
fs::dir_tree() #vendo diretorio (pastas)

#githubiando-----------------------------------------------------------------

library(usethis)
use_git()
use_github()

#----------------------------------------------------------------------------
#----------------------------------------------------------------------------

#Trabalho Final | Introducao a programacao com R
#Nome: Davi Carneiro Geraldo
#e-mail: davicarneiro@ufrj.br
#github: @davicarneirobr
#fonte dos data: CDC-USA

# Instalando os pacotes------------------------------------------------------

install.packages("dplyr")
install.packages("readr")

# Lendo os pacotes-----------------------------------------------------------

library(dplyr)
library(readr)

# Lendo arquivos-------------------------------------------------------------

dados.heart <- read_csv("data/Heart_Disease_Mortality_Data_Among_US_Adults__35___by_State_Territory_and_County___2016-2018.csv")

dados.ave <- read_csv("data/Stroke_Mortality_Data_Among_US_Adults__35___by_State_Territory_and_County___2016-2018.csv")

# Analisando os dados--------------------------------------------------------

# tipos das colunas
str(dados.heart)
str(dados.ave)

# anos dos dados
unique(dados.heart$Year)
unique(dados.ave$Year)

if(unique(dados.heart$Year)==unique(dados.ave)){
  paste("Todos os dados sao referentes a", unique(dados.heart$Year))
}

# estados e territórios nos
estados.heart <- unique(dados.heart$LocationAbbr)
estados.ave <- unique(dados.ave$LocationAbbr)

estados.heart <- estados.heart[order(estados.heart)]#ordem alfabetica nos estados
estados.ave <- estados.ave[order(estados.ave)]#ordem alfabetica nos estados


identical(estados.heart, estados.ave) #os dois dados sao dos mesmos estados

#cidades nos dados
cidades.heart <- unique(dados.heart$LocationDesc)
cidades.ave <- unique(dados.ave$LocationDesc)

cidades.heart <- cidades.heart[order(cidades.heart)]#ordenando
cidades.ave <- cidades.ave[order(cidades.ave)]#ordenando

if(identical(cidades.heart, cidades.ave)){
  paste("Todas as cidades dos dois dados constam em ambos, sem nenhuma exceção ou adição (cidade em um dado e não em outro)")
}

dados.heart[, c("LocationAbbr", "LocationDesc")] #lista das cidades dos dados

#Filtrando as tabelas--------------------------------------------------------

#FILTRANDO dados.heart

#filtrando dados das cidades, topic e os valores
dados.heart.value <- select(dados.heart, LocationAbbr, LocationDesc, Topic, Data_Value, Data_Value_Unit)

if ( nrow(dados.heart) != nrow(dados.heart[dados.heart$Data_Value_Unit=="per 100,000 population", ])){
  paste("Existem dados que não estão por 100000 habitantes")
} else {
  paste("Todos os dados estão por 100000 habitantes")
}

#FILTRANDO dados.ave

dados.ave.value <- select(dados.ave, LocationAbbr, LocationDesc, Topic, Data_Value, Data_Value_Unit)

if ( nrow(dados.ave) != nrow(dados.ave[dados.ave$Data_Value_Unit=="per 100,000 population", ])){
  paste("Existem dados que não estão por 100000 habitantes")
} else {
  paste("Todos os dados estão por 100000 habitantes")
}


