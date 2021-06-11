library(readr)
#leo los dataFrame desde los archivos .csv dados por la catedra
datos_clima_tandil_2010 <- read_csv("DataFrames/datos-clima-tandil - 2010.csv", na = "NA")
datos_clima_tandil_2011 <- read_csv("DataFrames/datos-clima-tandil - 2011.csv", na = "NA")
datos_clima_tandil_2012 <- read_csv("DataFrames/datos-clima-tandil - 2012.csv", na = "NA")
datos_clima_tandil_2013 <- read_csv("DataFrames/datos-clima-tandil - 2013.csv", na = "NA")
datos_clima_tandil_2014 <- read_csv("DataFrames/datos-clima-tandil - 2014.csv", na = "NA")
datos_clima_tandil_2015 <- read_csv("DataFrames/datos-clima-tandil - 2015.csv", na = "NA")
datos_clima_tandil_2016 <- read_csv("DataFrames/datos-clima-tandil - 2016.csv", na = "NA")
datos_clima_tandil_2017 <- read_csv("DataFrames/datos-clima-tandil - 2017.csv", na = "NA")
datos_clima_tandil_2018 <- read_csv("DataFrames/datos-clima-tandil - 2018.csv", na = "NA")
datos_clima_tandil_2019 <- read_csv("DataFrames/datos-clima-tandil - 2019.csv", na = "NA")
datos_clima_tandil_2020 <- read_csv("DataFrames/datos-clima-tandil - 2020.csv", na = "NA")

#creo la lista que contiene los dataFrames de los climas
list_df <- list()
list_df[["2010"]] <- datos_clima_tandil_2010
list_df[["2011"]] <- datos_clima_tandil_2011
list_df[["2012"]] <- datos_clima_tandil_2012
list_df[["2013"]] <- datos_clima_tandil_2013
list_df[["2014"]] <- datos_clima_tandil_2014
list_df[["2015"]] <- datos_clima_tandil_2015
list_df[["2016"]] <- datos_clima_tandil_2016
list_df[["2017"]] <- datos_clima_tandil_2017
list_df[["2018"]] <- datos_clima_tandil_2018
list_df[["2019"]] <- datos_clima_tandil_2019
list_df[["2020"]] <- datos_clima_tandil_2020


#libreria para manejo de string
#library(stringr)

#muestro los datos recorriendo la lista
for(indice in 2010:2020){
  print(str_c("Anio: ", toString(indice)))
  print(list_df[[toString(indice)]])
}
