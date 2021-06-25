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
datos_nn$`RACHASM�X`
mean(datos_nn$`RACHASM�X`, na.rm=TRUE)
datos_nn$`RACHASM�X`[is.na(datos_nn$`RACHASM�X`)] <- mean(datos_nn$`RACHASM�X`, na.rm=TRUE)

# ademas se elimina la columna lluvia y mes ya que no son necesarias
datos_nn$LLUVIA <- NULL


#genero un numero aleatorio y agarro la columna perteneciente al mismo para el entrenamiento
rand_index <- sample (1:nrow (datos_nn), round(0.75*nrow(datos_nn)))
train <- datos_nn [rand_index, ]
# y utilizo el opuesto para el testeo
test <- datos_nn [-rand_index, ]

datos_nn
#creamos la red neuronal con los datos
nn <- neuralnet(T.MEDIA+T.M�X+T.M�N+V.MEDIAVIENTO+RACHASM�X+PRESI�NMEDIA+(MES==MES+1) ~ MES+T.MEDIA+T.M�X+T.M�N+V.MEDIAVIENTO+RACHASM�X+PRESI�NMEDIA, data=datos_nn, hidden = c(5,5), linear.output = TRUE)
#grafico la red neuronal
plot (nn)

##prediccion realiada basandonos en test_
vMes <- as.data.frame(test$MES)
names(vMes) <- "MES"
vMes
predict = compute(nn,test)
result <- predict$net.result
class(result)
result

