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
