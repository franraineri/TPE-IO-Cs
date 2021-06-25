
# print(datos_clima)

regresion1 <- lm(get('T. MEDIA')~MES,datos_clima)
print(regresion1)
# Coefficients: (Intercept - MES) : 16.8787      -0.3583 

getTemp <- function( mes = 1 ){
  return (16.8787 - 0.3583*mes)
}
print(paste("La temperatura media en el proximo mes será: ",getTemp(7)))

