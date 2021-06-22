##Neural Network




datos_nn <- datos_clima #copio los datos

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
datos_nn$MES <- NULL


#Genero de valor mediano para cada columna
medv <- apply(datos_nn, 1, median)
datos_nn <- cbind (datos_nn, medv)




#######para que? -------

#genero un numero aleatorio y agarro la columna perteneciente al mismo para el entrenamiento
rand_index <- sample (1:nrow (datos_nn), round(0.75*nrow(datos_nn)))
rand_index
train <- datos_nn [rand_index, ]
# y utilizo el opuesto para el testeo
test <- datos_nn [-rand_index, ]
#



######esto para que? ---------

#metodo maxmin elegido, con una escala de datos [0,1] para la red neuronal
maxs <- apply (datos_nn, 2, max)
mins <- apply (datos_nn, 2, min)
scaled <- as.data.frame (scale (datos_nn, center = mins, scale = maxs - mins))
train_ <- scaled [rand_index, ]
test_ <- scaled [-rand_index, ]
#red neuronal
library (neuralnet)
require(neuralnet)


##creo que no va
#generamos los parametros para la red neuronal
atrib_names <- names (train_)
atrib_names

####no es tan necesario, se podria realizar esto mismo, si pedimos por parametros los valores, ya que es para
####un enunciado lo podriamos cargar y dejar estatico.
string_formula1 <-gsub(" ", "", paste("medv ~", paste( "`", atrib_names[!atrib_names %in% "medv"] ,"`", collapse = "+")), fixed = TRUE)
string_formula1
string_formula2 <-paste("medv ~", paste( "`", atrib_names[!atrib_names %in% "medv"] ,"`", collapse = "+"))
string_formula2
string_formula3 <-paste("medv ~", paste( atrib_names[!atrib_names %in% "medv"] , collapse = "+"))
string_formula3

string_formula4 <- "medv~T.MEDIA+MÁX+T.MÍN+V.MEDIAVIENTO+RACHASMÁX+PRESIÓNMEDIA"

formula <- as.formula(string_formula4)
formula

### porque? se crea y desp se entrena o no?
#creamos y entrenamos la red neuronal nn 
nn <- neuralnet(formula, data=train_, hidden = c(5,3), linear.output = T)

#creamos la red neuronal con los datos
nn <- neuralnet(medv ~ T.MEDIA+T.MÁX+T.MÍN+V.MEDIAVIENTO+RACHASMÁX+PRESIÓNMEDIA, data=datos_nn, hidden = 10, linear.output = TRUE)
#grafico la red neuronal
plot (nn)


test_

##prediccion realiada basandonos en test_
predict = compute(nn,test_)
predict$net.result

