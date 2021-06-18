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



#realizamos una limpieza de cada df
for(indice in 2010:2020){
  print(paste(" Limpieza del dataframe del aÃ±o: ", toString(indice)))
  df_aux <- as.data.frame(list_df[[toString(indice)]]) #tomo el dataframe del aÃ±o i
  
  for(j in 1:ncol(df_aux)){ #por cada elemento del dataframe 
    for(i in 1:nrow(df_aux)){
      df_aux[i,j]<-as.numeric(gsub("[^0-9.-]","",df_aux[i,j])) #tomo el elemento y lo combierto 
    }
    df_aux[,j]<-as.numeric(unlist(df_aux[,j]))
  }
  list_df[[toString(indice)]] <- df_aux #y lo vuelvo a guardar en la lista
  print(paste(" Guardado el dataframe del aÃ±o: ", toString(indice)))
  
}


##  EJERCICIO 2.1  ##

## Codigo para la grafica de lineas de la temperatura mensual máxima, mínima y media del año 2019 ##

#obtengo el DataFrame del clima del anio 2019 desde la lista
datos_clima_2019 <- as.data.frame(list_df[["2019"]])

##libreria para graficar
  #install.packages("ggplot2")
  #library(ggplot2)

#cargo la informacion de las distintas temperaturas de ese anio
Temperatura_media <- as.integer(datos_clima_2019[,2])
Temperatura_maxima <- as.integer(datos_clima_2019[,3])
Temperatura_minima <- as.integer(datos_clima_2019[,4])

#obtenemos la maxima y minmima temperatura para poder graficar
tempMax <- max(c(Temperatura_maxima,Temperatura_media,Temperatura_minima))
tempMin <- min(c(Temperatura_maxima,Temperatura_media,Temperatura_minima))

#grafico utilizando la funcion plot
#Grafica prinicipal (Temperatura media), titulo y nombre de las variables
plot(
  Temperatura_media,
  type= "o",
  col="Blue",
  ylim = c(tempMin,tempMax),
  main="Temperaturas minimas, maximas y medias: \n Temperatura maxima: Red | Temperatura media: Azul | Temperatura minima: Negro",
  col.main="Blue",
  font.main=1,
  xlab = "Meses",
  ylab = "Temperatura"
)
#segundo grafico (Temperatura minima)
lines(
  Temperatura_minima,
  type= "o",
  col="Red",
)
#tercer grafico (tempratura maxima)
lines(
  Temperatura_maxima,
  type= "o",
  col="Black",
)



## EJERCICIO 2.2

## Codigo para el grafico de barras donde se muestra la precipitación mensual acumulada
## durante el año 2010 ##
#datos_clima_2010 <- as.data.frame(list_df[["2010"]])





datos_clima <- as.data.frame(list_df[["2010"]])

#unimos todos los dataframe en uno solo
for(indice in 2011:2020){
  datos_clima <- rbind(datos_clima, list_df[[toString(indice)]])
}
print("----datos clima completos-----")
print(datos_clima)

