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
  main="Temperaturas minimas, maximas y medias del anio 2019: \n Temperatura maxima: Red | Temperatura media: Azul | Temperatura minima: Negro",
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
datos_clima_2010 <- as.data.frame(list_df[["2010"]])
precipitacion_mensual <- datos_clima_2010[,8]
#buscamos la precipitacion maxima para graficar
pMax <- max(precipitacion_mensual)

barplot(
  precipitacion_mensual,
  xlab = "Meses",
  ylim = c(0,pMax),
  ylab = "Precipitacion",
  main = "Precipitacion mensual del anio 2010",
  names.arg = c(1:12),
)

## EJERCICIO 2.3

## cargo el DataFrame necesario
datos_clima_2017 <- as.data.frame(list_df[["2017"]])
#limpieza de datos sobre los NA
for(f in 1:nrow(datos_clima_2017))
  for(c in 1:ncol(datos_clima_2017)){
    if(is.na(datos_clima_2017[f,c])){
      #ES NA
      datos_clima_2017[f,c]=0
    }else{
      #NO ES NA
    }
  }

#obtengo los datos de las velocidad maximas en el año 2017
velocidad_maximas_viento_2017 <- datos_clima_2017[,6]
#velocidad maxima y minima para darle limites a la grafica
velMax <- max(datos_clima_2017[,6])
velMin <- min(datos_clima_2017[,6])
#grafico de lineas sobre las velocidades maximas del año 2017
plot(
  velocidad_maximas_viento_2017,
  type="o",
  ylim = c(velMin,velMax),
  main = "Velocidades maximas del año 2017",
  xlab="meses",
  ylab = "velocidades maximas"
  
)


## EJERCICIO 2.4

##creo el dataFrame necesario para las temperaturas desde el año 2010 al 2019
datos_clima_2010_2019 <- data.frame("Año" = 2010:2019, "PROM_T_MEDIA"=0,"PROM_T_MÁX"=0,"PROM_T_MÍN"=0)
#cargo el promedio de cada año de las temperaturas maximas, minimas y medias
for(indice in 2010:2019){
  datos_clima_2010_2019[indice-2009,2] <- mean(list_df[[toString(indice)]][,2])
  datos_clima_2010_2019[indice-2009,3] <- mean(list_df[[toString(indice)]][,3])
  datos_clima_2010_2019[indice-2009,4] <- mean(list_df[[toString(indice)]][,4])
  
}


## EJERCICIO 2.5

#grafico de las temperaturas medias de los años 2010 a 2019
datos_2010_2019_prom_t_media <- datos_clima_2010_2019[,2]
prom_max <- max(datos_2010_2019_prom_t_media)
barplot(
  datos_2010_2019_prom_t_media,
  ylim = c(0,prom_max),
  xlab = "Años",
  ylab = "Prom_tem_media",
  main = "Promedio anual de la temperatura media",
  names.arg = c(2010:2019)
)
#grafico de las temperaturas maximas de los años 2010 a 2019
datos_2010_2019_prom_t_max <- datos_clima_2010_2019[,3]
prom_max <- max(datos_2010_2019_prom_t_max)
barplot(
  datos_2010_2019_prom_t_max,
  xlab = "Años",
  ylim = c(0,prom_max),
  ylab = "Prom_tem_max",
  main = "Promedio anual de la temperatura maxima",
  names.arg = c(2010:2019)
)
#grafico de las temperaturas minimas de los años 2010 a 2019
datos_2010_2019_prom_t_min <- datos_clima_2010_2019[,4]
prom_max <- max(datos_2010_2019_prom_t_min)
prom_min <- min(datos_2010_2019_prom_t_min)
barplot(
  datos_2010_2019_prom_t_min,
  xlab = "Años",
  ylim = c(prom_min,prom_max),
  ylab = "Prom_tem_min",
  main = "Promedio anual de la temperatura minima",
  names.arg = c(2010:2019)
)


##  EJERCICIO 2.6
#funcion que contiene los ejercicos 2.3 y 2.4
## parametros de funcion:
  #list_datos_clima: es una lista que contiene los dataFrames de cada año requerido
  #anio: si es la operacion 1, se utilizara para ver en ese año las velocidades de los climas, si es la operacion 2, se
    #la utiliza como el rango inferior de fechas sobre el promedio de los años
  #anioFin: rango maximo de año de las fechas a buscar por la operacion 2.
  #tipo_grafico: 1 para grafico linea, 2 para grafico de barra
  #titulo_grafico: es el titutlo del grafico
  #operacion: 1 para la operacion de velocidades maximas y la operacion 2 busca en un rango de fechas los promedios de las distintas temperaturas anuales
funcion_clima <- function(list_datos_clima,titulo_grafico="titulo del grafico", tipo_grafico=1 ,operacion=1,anio=2010,anioFin=3000){
  
  ## cargo el DataFrame necesario desde la lista recibida por parametro
  datos_clima <- as.data.frame(list_datos_clima[[toString(anio)]])
  #limpieza de datos sobre los NA
  if(operacion == 1){
    for(f in 1:nrow(datos_clima))
      for(c in 1:ncol(datos_clima)){
        if(is.na(datos_clima[f,c])){
          #ES NA
          datos_clima[f,c]=0
        }else{
          #NO ES NA
        }
      }
    
    #obtengo los datos de las velocidad maximas en el año dado por la funcion
    velocidad_maximas_viento <- datos_clima[,6]
    #velocidad maxima y minima para darle limites a la grafica
    velMax <- max(datos_clima[,6])
    velMin <- min(datos_clima[,6])
    
    if(tipo_grafico == 1){
      #grafico de lineas sobre las velocidades maximas del año dado por la funcion
      plot(
        velocidad_maximas_viento,
        type="o",
        ylim = c(velMin,velMax),
        main = titulo_grafico,
        xlab="meses",
        ylab = "velocidades maximas"
        
      )
    }else if (tipo_grafico == 2){
      barplot(
        velocidad_maximas_viento,
        xlab = "meses",
        ylim = c(0,velMax),
        ylab = "velocidades maximas",
        main = titulo_grafico,
        names.arg = c(1:12)
      )
      
    }
    
    ##se elije la operacion del ejercicio 2.4
  }else if(operacion == 2){
    ##creo el dataFrame necesario para las temperaturas desde el año 2010 al 2019
    datos_clima_anioRango <- data.frame("Año" = anio:anioFin, "PROM_T_MEDIA"=0,"PROM_T_MÁX"=0,"PROM_T_MÍN"=0)
    #cargo el promedio de cada año de las temperaturas maximas, minimas y medias
    for(indice in anio:anioFin){
      datos_clima_anioRango[indice-anio-1,2] <- mean(list_datos_clima[[toString(indice)]][,2])
      datos_clima_anioRango[indice-anio-1,3] <- mean(list_datos_clima[[toString(indice)]][,3])
      datos_clima_anioRango[indice-anio-1,4] <- mean(list_datos_clima[[toString(indice)]][,4])
    }
    
    #cargo los dataFrame necesarios para mostrar el promedio de temperatura de los años anio y aniFin
    #tambien se cargan los maximos y minimos de cada dataFrame para realizar el grafico mas preciso
    datos_anio_anioFin_prom_t_media <- datos_clima_anioRango[,2]
    prom_max_t_media <- max(datos_2010_2019_prom_t_media)
    
    datos_anio_anioFin_prom_t_max <- datos_clima_anioRango[,3]
    prom_max_t_max <- max(datos_anio_anioFin_prom_t_max)
    
    datos_anio_anioFin_prom_t_min <- datos_clima_anioRango[,4]
    prom_max_t_min <- max(datos_anio_anioFin_prom_t_min)
    prom_min_t_min <- min(datos_anio_anioFin_prom_t_min)
    
    print(prom_max_t_max)
    print(prom_min_t_min)
    ## se elije el grafico de lineas
    if(tipo_grafico == 1){
      plot(
        datos_anio_anioFin_prom_t_media,
        type= "o",
        col="Blue",
        ylim = c(prom_min_t_min,prom_max_t_max), ##se usan los limites para que las 3 graficas se adapten
        main="Promedio anual de la temperatura media",
        col.main="Blue",
        font.main=1,
        xlab = "Año",
        ylab = "prom_temp_media"
      )
      #segundo grafico (Temperatura minima)
      lines(
        datos_anio_anioFin_prom_t_min,
        type= "o",
        col="Red",
      )
      #tercer grafico (tempratura maxima)
      lines(
        datos_anio_anioFin_prom_t_max,
        type= "o",
        col="Black",
      )
      
    }else if(tipo_grafico == 2){
      valor <- 0
      
      while(valor != 4){
        cat("\nAL INGRESAR EL VALOR, PRESIONE DOS VECES ENTER!!\n",
            "\nIngrese 1 si quiere mostrar el grafico del promedio medio de las fechas requeridas.",
            "\nIngrese 2 si quiere mostrar el grafico del promedio maximo de las fechas requeridas.",
            "\nIngrese 3 si quiere mostrar el grafico del promedio minimo de las fechas requeridas.",
            "\nIngrese 4 si quiere salir de los graficos.")
        valor <- scan()
        
        if(valor == 1){
          #grafico de las temperaturas medias de los años anio y anioFin
          barplot(
            datos_anio_anioFin_prom_t_media,
            ylim = c(0,prom_max_t_media),
            xlab = "Años",
            ylab = "Prom_tem_media",
            main = "Promedio anual de la temperatura media",
            names.arg = c(anio:anioFin)
          )
        }else if(valor == 2){
          #grafico de las temperaturas maximas de los años anio a anioFin
          barplot(
            datos_anio_anioFin_prom_t_max,
            xlab = "Años",
            ylim = c(0,prom_max_t_max),
            ylab = "Prom_tem_max",
            main = "Promedio anual de la temperatura maxima",
            names.arg = c(anio:anioFin)
          )
        }else if(valor == 3){
          #grafico de las temperaturas minimas de los años anio a anioFin
          barplot(
            datos_anio_anioFin_prom_t_min,
            xlab = "Años",
            ylim = c(prom_min_t_min,prom_max_t_min),
            ylab = "Prom_tem_min",
            main = "Promedio anual de la temperatura minima",
            names.arg = c(anio:anioFin)
          )
        }
      }
      
      
    }
    
  }
  
}

##  EJEMPLOS DE LA FUNCION DEL 2.6
#ejemplo de funcion en linea y barra de el ejercicio 3 con funcion
funcion_clima(list_df,"grafico de linea operacion 1",1,1,2017)
funcion_clima(list_df,"grafico de barra operacion 1",2,1,2017)

##ejemplo de las funciones de linea y barra del ejercicio 2.5 con la funcion
funcion_clima(list_df,"grafico de linea operacion 2",1,2,2012,2019)
funcion_clima(list_df,"grafico de barra operacion 2",2,2,2012,2019)





## modificacion de nombres de dataFrames
datos_clima_2017 <- as.data.frame(list_df[["2017"]])
nombres <- names(datos_clima_2017)
for(i in 1:length(nombres)){
  nombres[i] <- gsub(" ", "", nombres[i])
}
nombres
names(datos_clima_2017) <- nombres
datos_clima_2017




