
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


##Neural Network

# se llenan los valores faltantes con un promedio propio de su columna.
# (Solo las columnas de rachas_max tienen NA's)

datos_nn <- datos_clima #copio los datos
datos_nn
datos_nn$`RACHAS MÁX`
mean(datos_nn$`RACHAS MÁX`, na.rm=TRUE)
datos_nn$`RACHAS MÁX`[is.na(datos_nn$`RACHAS MÁX`)] <- mean(datos_nn$`RACHAS MÁX`, na.rm=TRUE)

# ademas se elimina la columna lluvia y mes ya que no son necesarias
datos_nn$LLUVIA <- NULL
datos_nn$MES <- NULL


#Genero de valor mediano para cada columna
medv <- apply(datos_nn, 1, median)
datos_nn <- cbind (datos_nn, medv)

#genero un numero aleatorio y agarro la columna perteneciente al mismo para el entrenamiento
rand_index <- sample (1:nrow (datos_nn), round(0.75*nrow(datos_nn)))
train <- datos_nn [rand_index, ]
# y utilizo el opuesto para el testeo
test <- datos_nn [-rand_index, ]
#
#metodo maxmin elegido, con una escala de datos [0,1] para la red neuronal
maxs <- apply (datos_nn, 2, max)
mins <- apply (datos_nn, 2, min)
scaled <- as.data.frame (scale (datos_nn, center = mins, scale = maxs - mins))
train_ <- scaled [rand_index, ]
test_ <- scaled [-rand_index, ]
#red neuronal
library (neuralnet)
require(neuralnet)

#generamos los parametros para la red neuronal
atrib_names <- names (train_)
atrib_names


string_formula1 <-gsub(" ", "", paste("medv ~", paste( "`", atrib_names[!atrib_names %in% "medv"] ,"`", collapse = "+")), fixed = TRUE)
string_formula1
string_formula2 <-paste("medv ~", paste( "`", atrib_names[!atrib_names %in% "medv"] ,"`", collapse = "+"))
string_formula2
string_formula3 <-paste("medv ~", paste( atrib_names[!atrib_names %in% "medv"] , collapse = "+"))
string_formula3

string_formula4 <- "medv~`T. MEDIA`+`T. MÁX`+`T. MÍN`+`V. MEDIA VIENTO`+`RACHAS MÁX`+`PRESIÓN MEDIA`"

formula <- as.formula(string_formula4)
formula

#creamos y entrenamos la red neuronal nn
nn <- neuralnet(formula, data=train_, hidden = c(5,3), linear.output = T)
plot (nn)
