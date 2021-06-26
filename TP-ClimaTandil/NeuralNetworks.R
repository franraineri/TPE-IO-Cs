##Neural Network




datos_nn <- datos_clima #copio los datos
datos_nn
## modificacion de nombres de dataFrames quitando los espacios
nombres <- names(datos_nn)
for(i in 1:length(nombres)){
  nombres[i] <- gsub(" ", "", nombres[i])
}
#asigno los nuevos nombres de las columnas
names(datos_nn) <- nombres


# se llenan los valores faltantes con un promedio propio de su columna.
# (Solo las columnas de rachas_max tienen NA's)
datos_nn$`RACHASMÁX`
mean(datos_nn$`RACHASMÁX`, na.rm=TRUE)
datos_nn$`RACHASMÁX`[is.na(datos_nn$`RACHASMÁX`)] <- mean(datos_nn$`RACHASMÁX`, na.rm=TRUE)

# ademas se elimina la columna lluvia y mes ya que no son necesarias
datos_nn$LLUVIA <- NULL


#Genero de valor mediano para cada columna
#medv <- apply(datos_nn, 1, median)
#medv
#datos_nn <- cbind (datos_nn, medv)




#genero un numero aleatorio y agarro la columna perteneciente al mismo para el entrenamiento
rand_index <- sample (1:nrow (datos_nn), round(0.75*nrow(datos_nn)))
train <- datos_nn [rand_index, ]
# y utilizo el opuesto para el testeo
test <- datos_nn [-rand_index, ]


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


#creamos la red neuronal con los datos
nn <- neuralnet((MES+T.MEDIA+T.MÁX+T.MÍN+V.MEDIAVIENTO+RACHASMÁX+PRESIÓNMEDIA) ~ MES, data=datos_nn, hidden = c(5,3), linear.output = TRUE)
#grafico la red neuronal
plot (nn)

##prediccion realiada basandonos en test
vMes <- as.data.frame(test$MES)
names(vMes) <- "MES"
vMes
predict = compute(nn,vMes)
result <- predict$net.result
class(result)
colnames(result) <- c("MES","T.MEDIA","T.MÁX","T.MÍN","V.MEDIAVIENTO","RACHASMÁX","PRESIÓNMEDIA")
result

