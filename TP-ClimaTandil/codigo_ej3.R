
# print(datos_clima)

regresion1 <- lm(get('T. MEDIA')~MES,datos_clima)
print(regresion1)
# Coefficients: # (Intercept - MES) # 16.8787      -0.3583 

nrow(datos_clima)

getTemp <- function( mes = 1 ){
  return (16.8787 - 0.3583*mes)
}
print(paste("La temperatura media en el proximo mes será: ",getTemp(7)))

#falta armar montecarlo, y lo de redes neuronales :)
##MONTECARLO

#primero obtengo las probabilidades acumuladas de cada temperatura
size <- length(datos_clima$`T. MEDIA`)
print(paste(" size:", size))
dfAux <- as.data.frame(table(datos_clima$`T. MEDIA`))
print(paste("tabla de la temperatura media historica: ",dfAux))
distribucion <- dfAux$Freq/size
ocurrencias <- dfAux$Freq
auxMin <- min(datos_clima$`T. MEDIA`)

dado <- datos_clima$`T. MEDIA`[1:(size-1)]
resultado <- datos_clima$`T. MEDIA`[2:size]
myData <- data.frame(dado, resultado)

vecCond <- calcCondProb(myData)
vecCond <- vecCond[2:4]
vecCond <- vecCond[1:529,]

matCond <- matrix(vecCond$condProbVal,nrow = 23,ncol = 23)
#Matriz acumulada por columnas
matAcum <- apply(matCond,2,cumsum)

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

simulation <- function(matAcum, inicial, dias){
  muestras <- 0
  vecAnt <- replicate(nrow(matAcum),1)
  vecAct <- replicate(nrow(matAcum),0)
  salidas <- replicate(nrow(matAcum),0)
  while (!converge(vecAct, vecAnt)){
    actual <- inicial
    actual <- as.integer(actual)
    muestras <- muestras + 1
    for (i in 1:dias){
      actual = sigDadoAnterior(matAcum, actual)
    }
    salidas[actual] <- salidas[actual] + 1 
    vecAnt <- vecAct
    vecAct <- salidas/muestras
  }
  vecAct
}


simulacion <- simulation(matAcum, 1, 10)
simulacion