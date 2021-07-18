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

dados.cardio <- read_csv("data/Heart_Disease_Mortality_Data_Among_US_Adults__35___by_State_Territory_and_County___2016-2018.csv")

dados.ave <- read_csv("data/Stroke_Mortality_Data_Among_US_Adults__35___by_State_Territory_and_County___2016-2018.csv")

# Analisando os dados--------------------------------------------------------

# tipos das colunas
str(dados.cardio)
str(dados.ave)

# anos dos dados
unique(dados.cardio$Year)
unique(dados.cardio$Year)

if(unique(dados.cardio$Year)==unique(dados.ave)){
  paste("Todos os dados sao referentes a", unique(dados.cardio$Year))
}

# estados e territórios na pesquisa
estados.cardio <- unique(dados.cardio$LocationAbbr)
estados.ave <- unique(dados.ave$LocationAbbr)

estados.cardio <- estados.cardio[order(estados.cardio)]#ordem alfabetica nos estados
estados.ave <- estados.ave[order(estados.ave)]#ordem alfabetica nos estados


identical(estados.cardio, estados.ave) #os dois dados sao dos mesmos estados


