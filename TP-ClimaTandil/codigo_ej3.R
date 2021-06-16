
# print(datos_clima)

regresion <- lm(get('T. MEDIA')~MES,datos_clima)
regresion
# Coefficients:
# (Intercept)          MES  
# 16.8787      -0.3583 


#falta armar la formula, montecarlo, y lo de redes neuronales :)