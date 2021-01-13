
library(tidyverse)
library(data.table)
library(lubridate)
library(openxlsx)

setwd("C:/Users/Carlos/Documents/MEA/Bienestar y Politica Social/Clase 1")

penn_table <- read.xlsx("Bases input/pwt91.xlsx", sheet = 3, startRow = 1, colNames = TRUE)

glimpse(penn_table)

# Generamos la variable del PIB Percapita y ordenamos para ver 
# que pais tenia un PIB per capita similar al de Mexico en 1990
penn_table_1990 <- penn_table%>%filter(year==1990)%>%
  mutate(PIB_percapita = rgdpo/pop)%>%
  arrange(-PIB_percapita)%>%
  select(countrycode,country,currency_unit,year,PIB_percapita,everything()) 

#Se observa que en 1990 se tenia un PIB per capita similar al de Croacia


# Queda pendiente graficar la evolucion de ambos paises a traves de los anios