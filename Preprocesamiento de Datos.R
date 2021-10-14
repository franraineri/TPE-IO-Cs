#-------------------- Se cargan las librer�as --------------------

#----- Se usa la librer�a readxl para leer los archivos excel -----

#install.packages("readxl")
library(readxl)

#----- Se usa la librer�a plyr para poder utilizar la funcion mapvalues -----

#install.packages("plyr")
library (plyr)

#----- Se usa la librer�a dplyr para poder utilizar algunos verbos como select, mutate, filter, arrange, entre otros, y adem�s para poder utilizar los pipes (%>%) -----

#install.packages("dplyr")
library (dplyr)

#----- Se usa la librer�a lubridate para poder acceder al a�o de una fecha -----

#install.packages("lubridate")
library(lubridate)

#----- Se usa la librer�a sqldf para realizar consultas SQL -----

#install.packages("sqldf")
library(sqldf)

#----- Se usa la librer�a markovchain para realizar las cadenas de markov -----

#install.packages("markovchain")
library (markovchain)

#----- Se usa la librer�a diagram para graficar las cadenas de Markov -----

#install.packages("diagram")
library(diagram) 

#install.packages("ggplot2")
library(ggplot2)

#-------------------- Se definen las rutas hacia los datos
  
ruta_1 <- "C:/Users/user/Downloads/Cientificos/AlumnosLegCodificado.xlsx"
ruta_2 <- "C:/Users/user/Downloads/Cientificos/Notas_cursadas.xlsx"
ruta_3 <- "C:/Users/user/Downloads/Cientificos/Notas_Finales.xlsx"


#-------------------- Se cargan los archivos excel en variables y se renombra algunas columnas para luego tener un mejor manejo de ellas --------------------

datos_alumnos <- read_excel(ruta_1)
datos_guarani_cursadas <- read_excel(ruta_2)
datos_guarani_finales <- read_excel(ruta_3)

names(datos_alumnos)[names(datos_alumnos) == 'legajo'] <- 'legajo_del_alumno'
names(datos_alumnos)[names(datos_alumnos) == 'fecha_ingreso'] <- 'fecha_ingreso_institucion'
names(datos_alumnos)[names(datos_alumnos) == 'calidad'] <- 'calidad_ingreso_institucion'

names(datos_guarani_cursadas)[names(datos_guarani_cursadas) == 'Legajo'] <- 'legajo_del_alumno'
names(datos_guarani_cursadas)[names(datos_guarani_cursadas) == 'nombre'] <- 'nombre_materia'

names(datos_guarani_finales)[names(datos_guarani_finales) == 'legajo'] <- 'legajo_del_alumno'
names(datos_guarani_finales)[names(datos_guarani_finales) == 'fecha'] <- 'fecha_regularidad'
names(datos_guarani_finales)[names(datos_guarani_finales) == 'nombre'] <- 'nombre_materia'


#-------------------- Se filtran los dataframes para que contengan los datos que son de inter�s para el trabajo --------------------
filtrar_datos_alumnos <- function(dataset, carrera_requerida, plan_requerido, anio_empieza_considerar, anio_finaliza_considerar, tope_mes_ingreso)
{
  datos_alumnos_filtrado <- 
                            dataset %>%
                            filter(carrera == carrera_requerida, plan == plan_requerido, year(fecha_ingreso_institucion) >= anio_empieza_considerar, year(fecha_ingreso_institucion) <= anio_finaliza_considerar, month(fecha_ingreso_institucion) <= tope_mes_ingreso, calidad_ingreso_institucion != 'E') %>%
                            select(legajo_del_alumno, fecha_ingreso_institucion) %>% 
                            mutate(fecha_ingreso_institucion = format(as.POSIXct(fecha_ingreso_institucion, format='%Y-%m-%d %H:%M:%S'), format='%Y-%m-%d')) %>%
                            arrange(legajo_del_alumno) 
  
  datos_alumnos_filtrado
}

#----- Se filtran los datos de los alumnos para que solamente se muestren aquellos que corresponden al c�digo de carrera 206 (Ingenier�a de Sistemas), al plan 2011, que hallan ingresado entre 2012 y 2015 (cohortes a evaluar) antes de mayo, y que no ingresen por equivalencias a la carrera -----

datos_alumnos <- filtrar_datos_alumnos(datos_alumnos, 206, 2011, 2012, 2015, 05)


#----- Se cargan los nombres de las materias obligatorias de la carrera. Se plantean estas ya que son las que producen el desgranamiento -----
nombre_materias_obligatorias <- c ("Algebra I", "An�lisis Matem�tico I", "Introducci�n a la Programaci�n I", "Qu�mica", 
                                   "Algebra Lineal", "Ciencias de la Computaci�n I", "Introducci�n a la Programaci�n II", "F�sica General", "Matem�tica Discreta", 
                                   "An�lisis Matem�tico II", "An�lisis y Dise�o de Algoritmos I", "Ciencias de la Computaci�n II", "Electricidad y Magnetismo", "Introducci�n a la Arquitectura de Sistemas", 
                                   "An�lisis y Dise�o de Algoritmos II", "Comunicaci�n de Datos I", "Electr�nica Digital", "Ingl�s", "Probabilidades y Estad�stica", 
                                   "Arquitectura de Computadoras I", "Estructuras de Almacenamiento de Datos", "Metodolog�as de Desarrollo de Software I", "Programaci�n Orientada a Objetos", 
                                   "Bases de Datos I", "Investigaci�n Operativa I", "Lenguajes de Programaci�n I", "Programaci�n Exploratoria", "Sistemas Operativos I",
                                   "Arquitectura de Computadoras y T�cnicas Digitales", "Comunicaci�n de Datos II", "Introducci�n al C�lculo Diferencial e Integral", "Teor�a de la Informaci�n", 
                                   "Dise�o de Compiladores I", "Dise�o de Sistemas de Software", 
                                   "Ingenier�a de Software",
                                   "Fundamentos de Econom�a y Proyectos de Inversi�n", "Legislaci�n y Gesti�n Ambiental", "Organizaci�n Empresarial")

names(nombre_materias_obligatorias) <- nombre_materias_obligatorias

meses_para_hacer_a_tiempo_materias_obligatorias <- c(5, 5, 5, 29, 
                                                     17, 13, 13, 13, 13, 
                                                     17, 17, 17, 17, 17, 
                                                     25, 37, 25, 49, 25, 
                                                     29, 29, 29, 29,
                                                     41, 41, 41, 41, 37, 
                                                     53, 53, 53, 53,
                                                     61, 49,
                                                     53, 
                                                     61, 53, 53)

nombre_materias_finales <- c ("Algebra I - Final", "An�lisis Matem�tico I - Final", "Introducci�n a la Programaci�n I - Final", "Qu�mica - Final", 
                              "Algebra Lineal - Final", "Ciencias de la Computaci�n I - Final", "Introducci�n a la Programaci�n II - Final", "F�sica General - Final", "Matem�tica Discreta - Final", 
                              "An�lisis Matem�tico II - Final", "An�lisis y Dise�o de Algoritmos I - Final", "Ciencias de la Computaci�n II - Final", "Electricidad y Magnetismo - Final", "Introducci�n a la Arquitectura de Sistemas - Final", 
                              "An�lisis y Dise�o de Algoritmos II - Final", "Comunicaci�n de Datos I - Final", "Electr�nica Digital - Final", "Ingl�s - Final", "Probabilidades y Estad�stica - Final")

names(nombre_materias_finales) <- nombre_materias_finales

meses_para_hacer_a_tiempo_finales <- c(29, 29, 29, 29, 
                                       37, 37, 37, 37, 37, 
                                       41, 41, 41, 41, 41, 
                                       49, 49, 49, 49, 49)

#----- Se obtienen los datos de cursadas que corresponden �nicamente a las materias obligatorias de la carrera, descartando por tanto las materias optativas ----- 

filtrar_datos_notas <- function(dataset, carrera_requerida, plan_requerido)
{
  datos_notas_filtrado <- 
                          dataset %>%
                          filter(carrera == carrera_requerida, plan == plan_requerido, legajo_del_alumno %in% datos_alumnos$legajo_del_alumno, nombre_materia %in% nombre_materias_obligatorias) %>%
                          select(legajo_del_alumno, nombre_materia, fecha_regularidad, resultado)  %>% 
                          mutate(fecha_regularidad = format(as.POSIXct(fecha_regularidad, format='%Y-%m-%d %H:%M:%S'), format='%Y-%m-%d'))
  
  datos_notas_filtrado
}

#--- fecha_regularidad -> cuando se paso la nota de cursadas ---

datos_guarani_cursadas <- filtrar_datos_notas(datos_guarani_cursadas, 206, 2011)

#----- Se obtienen los datos de finales que corresponden �nicamente a las materias obligatorias de la carrera, descartando por tanto las materias optativas ----- 

finales <- filtrar_datos_notas(datos_guarani_finales, 206, 2011)

datos_guarani_finales <- 
                        finales %>% 
                        mutate(nombre_materia = paste(nombre_materia, "Final", sep = " - ")) 

#----- Se obtienen los datos de finales libres para luego agregarle a los alumnos que rindieron libre la nota de cursada para que no figure como que nunca aprobaron la cursada ----- 

finales_aprobados <- finales %>% 
                     filter(resultado == "A")

finales_libres <- sqldf('
                        SELECT * 
                        FROM finales_aprobados
                        WHERE NOT EXISTS(SELECT * 
                                         FROM datos_guarani_cursadas
                                         WHERE (finales_aprobados.legajo_del_alumno = datos_guarani_cursadas.legajo_del_alumno and
                                                finales_aprobados.nombre_materia = datos_guarani_cursadas.nombre_materia and 
                                                finales_aprobados.resultado = datos_guarani_cursadas.resultado)
                                         )
                        ')

#----- Se obtienen los datos de cursadas promocionadas para luego agregarle a los alumnos que promocionaron la nota de final para que no figure como que nunca aprobaron el final de la materia promocionada ----- 

materias_promocionadas <- 
                          datos_guarani_cursadas %>%
                          filter(resultado == "P")

for (i in 1:nrow(materias_promocionadas))
{
  materias_promocionadas [i, 2] <- paste (materias_promocionadas [i, 2], "Final", sep = " - ")
}

#----- Se unen todos los dataframes en uno solo para luego trabajar con este ----- 

datos_guarani_unidos <- 
                        datos_guarani_cursadas %>% 
                        union_all(finales_libres) %>%
                        union_all(datos_guarani_finales) %>%
                        union_all (materias_promocionadas) %>%
                        arrange(legajo_del_alumno, fecha_regularidad)

#--- Funciones para determinar la cantidad de meses entre dos fechas ---

obtener_meses_entre_fechas <- function(fecha) 
{ 
  fecha_normalizada <- as.POSIXlt(as.Date(fecha, origin = "1900-01-01"))
  fecha_normalizada$year*12 + fecha_normalizada$mon 
} 

obtener_diferencia_meses_entre_fechas <- function(fecha_1, fecha_2) 
{ 
  obtener_meses_entre_fechas(fecha_2) - obtener_meses_entre_fechas(fecha_1) 
}

#--- Se agrega la columna fecha_ingreso_institucion proveniente del dataframe datos_alumnos. Adem�s se crean nuevas columnas de inter�s que ser�n utilizadas luego ---

datos_guarani_unidos <-
                        datos_guarani_unidos %>%
                        left_join(datos_alumnos, by = c ("legajo_del_alumno" = "legajo_del_alumno"), suffix = c(".alum", ".cursada")) %>% 
                        mutate(fecha_regularidad = as.Date(fecha_regularidad)) %>% 
                        mutate(fecha_ingreso_institucion = as.Date(fecha_ingreso_institucion)) %>%
                        filter(fecha_regularidad - fecha_ingreso_institucion > 0) %>%
                        mutate(meses_requeridos_para_regularizar = mapvalues(nombre_materia, 
                                                                             from = c(nombre_materias_obligatorias, nombre_materias_finales), 
                                                                             to = c(meses_para_hacer_a_tiempo_materias_obligatorias, meses_para_hacer_a_tiempo_finales)), 
                               meses_transcurridos_para_regularizar = obtener_diferencia_meses_entre_fechas(fecha_ingreso_institucion, fecha_regularidad))

datos_guarani_unidos$meses_requeridos_para_regularizar <- as.numeric(datos_guarani_unidos$meses_requeridos_para_regularizar)

datos_guarani_unidos <- 
                        datos_guarani_unidos %>% 
                        mutate(regularizo_a_tiempo = ifelse(meses_transcurridos_para_regularizar <= meses_requeridos_para_regularizar, "si", "no"))


#-------------------- Obteniendo cada una de las cohortes --------------------

filtrar_por_cohortes <- function(dataset, anio_empieza_considerar, anio_finaliza_considerar)
{
  cohorte <- 
            dataset %>% 
            filter(year(fecha_ingreso_institucion) >= anio_empieza_considerar & year(fecha_ingreso_institucion) <= anio_finaliza_considerar)
  cohorte
}

#----- Cohorte 2012 -----

datos_cohorte_2012 <- filtrar_por_cohortes(datos_guarani_unidos, 2012, 2012)

#----- Cohorte 2013 -----

datos_cohorte_2013 <- filtrar_por_cohortes(datos_guarani_unidos, 2013, 2013)

#----- Cohorte 2014 -----

datos_cohorte_2014 <- filtrar_por_cohortes(datos_guarani_unidos, 2014, 2014)

#----- Cohorte 2015 -----

datos_cohorte_2015 <- filtrar_por_cohortes(datos_guarani_unidos, 2015, 2015)
