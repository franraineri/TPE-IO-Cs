
# print(datos_clima)

regresion1 <- lm(get('T. MEDIA')~MES,datos_clima)
print(regresion1)
# Coefficients: (Intercept - MES) : 16.8787      -0.3583 

nrow(datos_clima)

getTemp <- function( mes = 1 ){
  return (16.8787 - 0.3583*mes)
}
print(paste("La temperatura media en el proximo mes será: ",getTemp(7)))

#falta armar montecarlo, y lo de redes neuronales :)
##MONTECARLO
library(DisimForMixed)
#primero obtengo las probabilidades acumuladas de cada temperatura

size <- length(datos_clima$`T. MEDIA`) # cdad total de datos
print(paste(" cantidad total de datos:", size))
dfAux <- as.data.frame(table(datos_clima$`T. MEDIA`))
print(paste("tabla de la temperatura media historica: ",dfAux))

distribucion <- dfAux$Freq/size
ocurrencias <- dfAux$Freq
print('tabla de distribucion de probabilidades de la temperatura media historica: ')
print(distribucion)
min <- min(datos_clima$`T. MEDIA`) #tomo el menor de los valores

dado <- datos_clima$`T. MEDIA`[1:(size-1)]
resultado <- datos_clima$`T. MEDIA`[2:size]
data_Condicional <- data.frame(dado, resultado)

vecCond <- calcCondProb(data_Condicional)
#vecCond <- vecCond[2:4]
#print(vecCond)
#vecCond <- vecCond[1:529,]

#Armo la matriz condicional
matCond <- matrix(vecCond$condProbVal,nrow = 23,ncol = 23)
#print(matCond)

#Armo la matriz acumulada por columnas
matAcum <- apply(matCond,2,cumsum)
#print(matAcum)

#las funciones CONVERGE y SIG DADO ANTERIOR son utilizadas en la simulacio montecarlo 
converge <- function(vecAct, vecAnt){
  epsilon <- 0.0001
  resultado <- TRUE
  vecAux <- vecAct - vecAnt
  for (nro in vecAux){
    if (abs(nro) > epsilon){
      resultado <- FALSE
    }   
  }
  resultado
}

sigDadoAnterior <- function(matAcum, actual){
  x <- runif(1, 0, 1)
  resultado <-0
  for (fila in 1:(nrow(matAcum))){
    if (matAcum[fila,actual] > x){
      resultado <- fila
      break
    }
  }
  resultado
}

simulacionMC <- function(matAcum, inicial = 1, n_dias = 10, MinTries = 100){
  muestras <- 0
  vecAnt <- replicate(nrow(matAcum),1)
  vecAct <- replicate(nrow(matAcum),0)
  salidas <- replicate(nrow(matAcum),0)
  while ((!converge(vecAct, vecAnt)) && muestras < MinTries){
    actual <- as.integer(inicial)
    muestras <- muestras + 1
    for (i in 1:n_dias){
      actual = sigDadoAnterior(matAcum, actual)
      #print(paste("la clase de actual ", actual))
    }
    salidas[actual] <- salidas[actual] + 1 
    vecAnt <- vecAct
    vecAct <- salidas/muestras
  }
  print(paste('muestras tomadas: ', muestras))
  vecAct
}

res_simulacion <- simulacionMC(matAcum, 1, 10)
print(res_simulacion)
res_simulacion
