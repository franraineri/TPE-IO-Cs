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

#creo la lista que contiene los dataFrames del clima de tandil
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

#print(class(list_df[[toString(2010)]]))
#print(class(datos_clima_tandil_2010))


#libreria para manejo de string
#library(stringr)

#muestro los primeros y ultimos datos de cada df recorriendo la lista

#for(indice in 2010:2020){
#  print(paste(" Primeros elementos del Anio: ", toString(indice)))
#  print(head(list_df[[toString(indice)]],10))
#  print(paste(" Ultimos elementos del Anio: ", toString(indice)))
#  print(tail(list_df[[toString(indice)]],10))
#}


#realizamos una limpieza de cada df
for(indice in 2010:2020){
  print(paste(" Limpieza del dataframe del Anio: ", toString(indice)))
  df_aux <- as.data.frame(list_df[[toString(indice)]]) #tomo el dataframe del aÃ±o i
  
  for(j in 1:ncol(df_aux)){ #por cada elemento del dataframe 
    for(i in 1:nrow(df_aux)){
      df_aux[i,j]<-as.numeric(gsub("[^0-9.-]","",df_aux[i,j])) #tomo el elemento y lo combierto 
    }
    df_aux[,j]<-as.numeric(unlist(df_aux[,j]))
  }
  list_df[[toString(indice)]] <- df_aux #y lo vuelvo a guardar en la lista
}



## Codigo para la grafica de lineas de la temperatura mensual máxima, mínima y media del año 2019 ##
#creamos una variable DataFrame de los climas que obtuvimos en el anio 2019

datos_clima_2019 <- data.frame(datos_clima_tandil_2019)
#visualizamos esos datos
datos_clima_2019
#libreria para graficar
#install.packages("ggplot2")
#library(ggplot2)

Mes <- c(1:12)
Temperatura <- c(4,5,6,1,2,3,6,7,8,9,3,4)
datos_clima_2019_media <- data.frame(Mes,Temperatura)
##grafico de
ggplot(data = datos_clima_2019_media, aes(x=Mes , y=Temperatura)) +
  geom_line() + 
  geom_point(size=2, shape=21, fill="black", colour="red") +
  theme_minimal()

str(datos_clima_2019)
##grafico de
ggplot(data = datos_clima_2019, aes(x=MES , y=T..MEDIA)) +
  geom_line() + 
  geom_point(size=2, shape=21, fill="black", colour="red") +
  theme_minimal()





datos_clima <- as.data.frame(datos_clima_tandil_2010)
#unimos todos los dataframe en uno solo
for(indice in 2010:2020){
  datos_clima <- rbind(datos_clima, list_df[[toString(indice)]])
}
print(datos_clima)
