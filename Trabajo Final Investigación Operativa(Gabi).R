#-------------------- Se cargan las librerías --------------------

#----- Se usa la librería readxl para leer los archivos excel -----

#install.packages("readxl")
library(readxl)

#----- Se usa la librería plyr para poder utilizar la funcion mapvalues -----

#install.packages("plyr")
library (plyr)

#----- Se usa la librería dplyr para poder utilizar algunos verbos como select, mutate, filter, arrange, entre otros, y además para poder utilizar los pipes (%>%) -----

#install.packages("dplyr")
library (dplyr)

#----- Se usa la librería lubridate para poder acceder al año de una fecha -----

#install.packages("lubridate")
library(lubridate)

#----- Se usa la librería sqldf para realizar consultas SQL -----

#install.packages("sqldf")
library(sqldf)

#----- Se usa la librería markovchain para realizar las cadenas de markov -----

#install.packages("markovchain")
library (markovchain)

#----- Se usa la librería diagram para graficar las cadenas de Markov -----

#install.packages("diagram")
library(diagram) 

#install.packages("ggplot2")
library(ggplot2)

#-------------------- Se definen las rutas que utiliza cada integrante del equipo --------------------

#ruta_1 <- "C:/Users/Benjamin Figeiredo/OneDrive - alumnos.exa.unicen.edu.ar/Documentos/Facultad/Data scientist/Promocion - analisis desgranamiento universitario/Datasets/AlumnosLegCodificado.xlsx" 
#ruta_2 <- "C:/Users/Benjamin Figeiredo/OneDrive - alumnos.exa.unicen.edu.ar/Documentos/Facultad/Data scientist/Promocion - analisis desgranamiento universitario/Datasets/Notas_cursadas.xlsx" 
#ruta_3 <- "C:/Users/Benjamin Figeiredo/OneDrive - alumnos.exa.unicen.edu.ar/Documentos/Facultad/Data scientist/Promocion - analisis desgranamiento universitario/Datasets/Notas_Finales.xlsx" 

#ruta_1 <- "C:/Users/Joaquin/OneDrive - alumnos.exa.unicen.edu.ar/Facultad/Cientificos/TPFinal/DatosGuarani2020/AlumnosLegCodificado.xlsx"
#ruta_2 <- "C:/Users/Joaquin/OneDrive - alumnos.exa.unicen.edu.ar/Facultad/Cientificos/TPFinal/DatosGuarani2020/Notas_cursadas.xlsx" 
#ruta_3 <- "C:/Users/Joaquin/OneDrive - alumnos.exa.unicen.edu.ar/Facultad/Cientificos/TPFinal/DatosGuarani2020/Notas_Finales.xlsx"
  
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


#-------------------- Se filtran los dataframes para que contengan los datos que son de interés para el trabajo --------------------

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

#----- Se filtran los datos de los alumnos para que solamente se muestren aquellos que corresponden al código de carrera 206 (Ingeniería de Sistemas), al plan 2011, que hallan ingresado entre 2012 y 2015 (cohortes a evaluar) antes de mayo, y que no ingresen por equivalencias a la carrera -----

datos_alumnos <- filtrar_datos_alumnos(datos_alumnos, 206, 2011, 2012, 2015, 05)

#----- Estos son los nombres de las materias obligatorias de la carrera. Se plantean estas ya que son las que producen el desgranamiento -----

nombre_materias_obligatorias <- c ("Algebra I", "Análisis Matemático I", "Introducción a la Programación I", "Química", 
                                   "Algebra Lineal", "Ciencias de la Computación I", "Introducción a la Programación II", "Física General", "Matemática Discreta", 
                                   "Análisis Matemático II", "Análisis y Diseño de Algoritmos I", "Ciencias de la Computación II", "Electricidad y Magnetismo", "Introducción a la Arquitectura de Sistemas", 
                                   "Análisis y Diseño de Algoritmos II", "Comunicación de Datos I", "Electrónica Digital", "Inglés", "Probabilidades y Estadística", 
                                   "Arquitectura de Computadoras I", "Estructuras de Almacenamiento de Datos", "Metodologías de Desarrollo de Software I", "Programación Orientada a Objetos", 
                                   "Bases de Datos I", "Investigación Operativa I", "Lenguajes de Programación I", "Programación Exploratoria", "Sistemas Operativos I",
                                   "Arquitectura de Computadoras y Técnicas Digitales", "Comunicación de Datos II", "Introducción al Cálculo Diferencial e Integral", "Teoría de la Información", 
                                   "Diseño de Compiladores I", "Diseño de Sistemas de Software", 
                                   "Ingeniería de Software",
                                   "Fundamentos de Economía y Proyectos de Inversión", "Legislación y Gestión Ambiental", "Organización Empresarial")

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

nombre_materias_finales <- c ("Algebra I - Final", "Análisis Matemático I - Final", "Introducción a la Programación I - Final", "Química - Final", 
                              "Algebra Lineal - Final", "Ciencias de la Computación I - Final", "Introducción a la Programación II - Final", "Física General - Final", "Matemática Discreta - Final", 
                              "Análisis Matemático II - Final", "Análisis y Diseño de Algoritmos I - Final", "Ciencias de la Computación II - Final", "Electricidad y Magnetismo - Final", "Introducción a la Arquitectura de Sistemas - Final", 
                              "Análisis y Diseño de Algoritmos II - Final", "Comunicación de Datos I - Final", "Electrónica Digital - Final", "Inglés - Final", "Probabilidades y Estadística - Final")

names(nombre_materias_finales) <- nombre_materias_finales

meses_para_hacer_a_tiempo_finales <- c(29, 29, 29, 29, 
                                       37, 37, 37, 37, 37, 
                                       41, 41, 41, 41, 41, 
                                       49, 49, 49, 49, 49)

#----- Se obtienen los datos de cursadas que corresponden únicamente a las materias obligatorias de la carrera, descartando por tanto las materias optativas ----- 

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

#----- Se obtienen los datos de finales que corresponden únicamente a las materias obligatorias de la carrera, descartando por tanto las materias optativas ----- 

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

obtener_meses_fecha <- function(fecha) 
{ 
  fecha_normalizada <- as.POSIXlt(as.Date(fecha, origin = "1900-01-01"))
  fecha_normalizada$year*12 + fecha_normalizada$mon 
} 

obtener_diferencia_meses_entre_fechas <- function(fecha_1, fecha_2) 
{ 
  obtener_meses_fecha(fecha_2) - obtener_meses_fecha(fecha_1) 
}

#--- Se agrega la columna fecha_ingreso_institucion proveniente del dataframe datos_alumnos. Además se crean nuevas columnas de interés que serán utilizadas luego ---

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

cohorte_2012 <- filtrar_por_cohortes(datos_guarani_unidos, 2012, 2012)

#----- Cohorte 2013 -----

cohorte_2013 <- filtrar_por_cohortes(datos_guarani_unidos, 2013, 2013)

#----- Cohorte 2014 -----

cohorte_2014 <- filtrar_por_cohortes(datos_guarani_unidos, 2014, 2014)

#----- Cohorte 2015 -----

cohorte_2015 <- filtrar_por_cohortes(datos_guarani_unidos, 2015, 2015)


#-------------------- Comienza el análisis por ramas --------------------

#----- Rama Ids: Ingeniería de Software -----

rama_IdS_nodo_1 <- list ("Algebra I", "Análisis Matemático I", "Introducción a la Programación I")
names(rama_IdS_nodo_1) <- c ("Algebra I", "Análisis Matemático I", "Introducción a la Programación I")

rama_IdS_nodo_2 <- list ("Ciencias de la Computación I", "Matemática Discreta", "Introducción a la Programación II", "Física General")
names(rama_IdS_nodo_2)<- c ("Ciencias de la Computación I", "Matemática Discreta", "Introducción a la Programación II", "Física General")

rama_IdS_nodo_3 <- list ("Ciencias de la Computación II", "Análisis y Diseño de Algoritmos I", "Análisis Matemático II", "Algebra Lineal", "Electricidad y Magnetismo")
names(rama_IdS_nodo_3) <- c ("Ciencias de la Computación II", "Análisis y Diseño de Algoritmos I", "Análisis Matemático II", "Algebra Lineal", "Electricidad y Magnetismo")

rama_IdS_nodo_4 <- list ("Análisis y Diseño de Algoritmos II", "Probabilidades y Estadística", "Electrónica Digital", "Introducción a la Arquitectura de Sistemas")
names(rama_IdS_nodo_4) <- c ("Análisis y Diseño de Algoritmos II", "Probabilidades y Estadística", "Electrónica Digital", "Introducción a la Arquitectura de Sistemas")

rama_IdS_nodo_5 <- list ("Estructuras de Almacenamiento de Datos", "Metodologías de Desarrollo de Software I", "Arquitectura de Computadoras I", 
                         "Algebra I - Final", "Análisis Matemático I - Final", "Introducción a la Programación I - Final", "Química - Final")
names(rama_IdS_nodo_5) <- c ("Estructuras de Almacenamiento de Datos", "Metodologías de Desarrollo de Software I", "Arquitectura de Computadoras I", 
                             "Algebra I - Final", "Análisis Matemático I - Final", "Introducción a la Programación I - Final", "Química - Final")

rama_IdS_nodo_6 <- list ("Bases de Datos I", "Programación Orientada a Objetos", "Sistemas Operativos I", 
                         "Análisis Matemático II - Final", "Análisis y Diseño de Algoritmos I - Final", "Ciencias de la Computación II - Final", "Electricidad y Magnetismo - Final", "Introducción a la Arquitectura de Sistemas - Final", 
                         "Algebra Lineal - Final", "Ciencias de la Computación I - Final", "Introducción a la Programación II - Final", "Física General - Final", "Matemática Discreta - Final")
names(rama_IdS_nodo_6) <- c ("Bases de Datos I", "Programación Orientada a Objetos", "Sistemas Operativos I", 
                             "Análisis Matemático II - Final", "Análisis y Diseño de Algoritmos I - Final", "Ciencias de la Computación II - Final", "Electricidad y Magnetismo - Final", "Introducción a la Arquitectura de Sistemas - Final", 
                             "Algebra Lineal - Final", "Ciencias de la Computación I - Final", "Introducción a la Programación II - Final", "Física General - Final", "Matemática Discreta - Final")

rama_IdS_nodo_7 <- list ("Diseño de Sistemas de Software", 
                         "Análisis y Diseño de Algoritmos II - Final", "Comunicación de Datos I - Final", "Probabilidades y Estadística - Final", "Electrónica Digital - Final", "Inglés - Final")
names(rama_IdS_nodo_7) <- c ("Diseño de Sistemas de Software", 
                             "Análisis y Diseño de Algoritmos II - Final", "Comunicación de Datos I - Final", "Probabilidades y Estadística - Final", "Electrónica Digital - Final", "Inglés - Final")

rama_IdS_nodo_8 <- list ("Ingeniería de Software")
names(rama_IdS_nodo_8) <- c ("Ingeniería de Software")

#--- Agrupación de los nodos ---

rama_IdS <- list (rama_IdS_nodo_1, rama_IdS_nodo_2, rama_IdS_nodo_3, rama_IdS_nodo_4, 
                  rama_IdS_nodo_5, rama_IdS_nodo_6, rama_IdS_nodo_7, rama_IdS_nodo_8)
names(rama_IdS) <- c ("AG I, AM I, IPROG I",
                      "CC I, MD, IPROG II, FG",
                      "CC II, AyDA I, AM II, AL, EyM", 
                      "AyDA II, PyE, ED, IAdeS", 
                      "EAdeD, MDdeS I,\n AdeC I, AG I - F,\nAM I - F,\n IPROG I - F, Q - F", 
                      "BdeD I, PROGOO,\n SO I, AM II - F,\nAyDA I - F, CC II - F, EyM - F,\nIAdeS - F, AL - F, CC I - F,\nIPROG II - F, FG - F, MD - F", 
                      "DSdeS, AyDA II - F, CdD I - F,\nPyE - F, ED - F, IGL - F", 
                      "IdS")

#----- Rama OO: Optativas obligatorias -----

rama_OO_nodo_1 <- list ("Algebra I", "Análisis Matemático I", "Introducción a la Programación I")
names(rama_OO_nodo_1) <- c ("Algebra I", "Análisis Matemático I", "Introducción a la Programación I")

rama_OO_nodo_2 <- list ("Ciencias de la Computación I", "Introducción a la Programación II", "Matemática Discreta", "Física General")
names(rama_OO_nodo_2) <- c ("Ciencias de la Computación I", "Introducción a la Programación II", "Matemática Discreta", "Física General")

rama_OO_nodo_3 <- list ("Análisis y Diseño de Algoritmos I", "Ciencias de la Computación II", "Electricidad y Magnetismo", "Análisis Matemático II",  "Algebra Lineal")
names(rama_OO_nodo_3) <- c ("Análisis y Diseño de Algoritmos I", "Ciencias de la Computación II", "Electricidad y Magnetismo", "Análisis Matemático II",  "Algebra Lineal")

rama_OO_nodo_4 <- list ("Introducción a la Arquitectura de Sistemas", "Análisis y Diseño de Algoritmos II", "Electrónica Digital", "Probabilidades y Estadística")
names(rama_OO_nodo_4) <- c ("Introducción a la Arquitectura de Sistemas", "Análisis y Diseño de Algoritmos II", "Electrónica Digital", "Probabilidades y Estadística")

rama_OO_nodo_5 <- list ("Arquitectura de Computadoras I", "Estructuras de Almacenamiento de Datos", "Metodologías de Desarrollo de Software I", "Programación Orientada a Objetos")
names(rama_OO_nodo_5) <- c ("Arquitectura de Computadoras I", "Estructuras de Almacenamiento de Datos", "Metodologías de Desarrollo de Software I", "Programación Orientada a Objetos")

rama_OO_nodo_6 <- list ("Bases de Datos I", "Investigación Operativa I", "Lenguajes de Programación I", "Programación Exploratoria", "Sistemas Operativos I")
names(rama_OO_nodo_6) <- c ("Bases de Datos I", "Investigación Operativa I", "Lenguajes de Programación I", "Programación Exploratoria", "Sistemas Operativos I")

#--- Rama FEyPI: Fundamentos de Economía y Proyectos de Inversión ---

rama_FEyPI_nodo_7 <- list ("Fundamentos de Economía y Proyectos de Inversión")
names(rama_FEyPI_nodo_7) <- c ("Fundamentos de Economía y Proyectos de Inversión")

#--- Rama LyGA: Legislación y Gestión Ambiental ---

rama_LyGA_nodo_7 <- list ("Legislación y Gestión Ambiental")
names(rama_LyGA_nodo_7) <- c ("Legislación y Gestión Ambiental")

#--- Rama OE: Organización Empresarial ---

rama_OE_nodo_7 <- list ("Organización Empresarial")
names(rama_OE_nodo_7) <- c ("Organización Empresarial")

#--- Agrupacion de los nodos ---

rama_FEyPI <- list (rama_OO_nodo_1, rama_OO_nodo_2, rama_OO_nodo_3, rama_OO_nodo_4, 
                    rama_OO_nodo_5, rama_OO_nodo_6, rama_FEyPI_nodo_7)
names(rama_FEyPI) <- c ("AG I, AM I, IPROG I",
                        "CC I, MD, IPROG II, FG",
                        "CC II, AyDA I, AM II, AL, EyM",
                        "AyDA II, PyE, ED, IAdeS",
                        "EAdeD, MDdeS I,\n AdeC I, PROGOO",
                        "BdeD I, IO I, SO I, PExp, LP I",
                        "FEyPI")

rama_LyGA <- list (rama_OO_nodo_1, rama_OO_nodo_2, rama_OO_nodo_3, rama_OO_nodo_4, 
                   rama_OO_nodo_5, rama_OO_nodo_6, rama_LyGA_nodo_7)
names(rama_LyGA) <- c ("AG I, AM I, IPROG I",
                       "CC I, MD, IPROG II, FG",
                       "CC II, AyDA I, AM II, AL, EyM",
                       "AyDA II, PyE, ED, IAdeS",
                       "EAdeD, MDdeS I,\n AdeC I, PROGOO",
                       "BdeD I, IO I, SO I, PExp, LP I",
                       "LyGA")

rama_OE <- list (rama_OO_nodo_1, rama_OO_nodo_2, rama_OO_nodo_3, rama_OO_nodo_4, 
                 rama_OO_nodo_5, rama_OO_nodo_6, rama_OE_nodo_7)
names(rama_OE) <- c ("AG I, AM I, IPROG I",
                     "CC I, MD, IPROG II, FG",
                     "CC II, AyDA I, AM II, AL, EyM",
                     "AyDA II, PyE, ED, IAdeS",
                     "EAdeD, MDdeS I,\n AdeC I, PROGOO",
                     "BdeD I, IO I, SO I, PExp, LP I",
                     "OEmp")


#----- Rama DdC: Diseño de Compiladores I ----- 

rama_DdC_nodo_1 <- list ("Algebra I", "Introducción a la Programación I")
names(rama_DdC_nodo_1) <- c ("Algebra I", "Introducción a la Programación I")

rama_DdC_nodo_2 <- list ("Ciencias de la Computación I", "Introducción a la Programación II", "Matemática Discreta")
names(rama_DdC_nodo_2) <- c ("Ciencias de la Computación I", "Introducción a la Programación II", "Matemática Discreta")

rama_DdC_nodo_3 <- list ("Análisis y Diseño de Algoritmos I", "Ciencias de la Computación II")
names(rama_DdC_nodo_3) <- c ("Análisis y Diseño de Algoritmos I", "Ciencias de la Computación II")

rama_DdC_nodo_4 <- list ("Análisis y Diseño de Algoritmos II")
names(rama_DdC_nodo_4) <- c ("Análisis y Diseño de Algoritmos II")

rama_DdC_nodo_5 <- list ("Programación Orientada a Objetos", 
                         "Algebra I - Final", "Análisis Matemático I - Final", "Introducción a la Programación I - Final", "Química - Final")
names(rama_DdC_nodo_5) <- c ("Programación Orientada a Objetos", 
                             "Algebra I - Final", "Análisis Matemático I - Final", "Introducción a la Programación I - Final", "Química - Final")

rama_DdC_nodo_6 <- list ("Lenguajes de Programación I", 
                         "Análisis Matemático II - Final", "Análisis y Diseño de Algoritmos I - Final", "Ciencias de la Computación II - Final", "Electricidad y Magnetismo - Final", "Introducción a la Arquitectura de Sistemas - Final", 
                         "Algebra Lineal - Final", "Ciencias de la Computación I - Final", "Introducción a la Programación II - Final", "Física General - Final", "Matemática Discreta - Final")
names(rama_DdC_nodo_6) <- c ("Lenguajes de Programación I", 
                             "Análisis Matemático II - Final", "Análisis y Diseño de Algoritmos I - Final", "Ciencias de la Computación II - Final", "Electricidad y Magnetismo - Final", "Introducción a la Arquitectura de Sistemas - Final", 
                             "Algebra Lineal - Final", "Ciencias de la Computación I - Final", "Introducción a la Programación II - Final", "Física General - Final", "Matemática Discreta - Final")

rama_DdC_nodo_7 <- list ("Diseño de Compiladores I")
names(rama_DdC_nodo_7) <- c ("Diseño de Compiladores I")

#--- Agrupacion de los nodos ---

rama_DdC <- list (rama_DdC_nodo_1, rama_DdC_nodo_2, rama_DdC_nodo_3, rama_DdC_nodo_4, 
                  rama_DdC_nodo_5, rama_DdC_nodo_6, rama_DdC_nodo_7)
names(rama_DdC) <- c ("AG I, IPROG I",
                      "CC I, IPROG II, MD",
                      "AyDA I, CC II",
                      "AyDA II",
                      "PROGOO, AG I - F, AM I - F,\n IPROG I - F, Q - F",
                      "LP I, AM II - F, AyDA I - F,\n CC II - F, EyM - F, IAdeS - F,\n AL - F, CC I - F,\n IPROG II -F, \n FG - F, MD - F",
                      "DdC")


#----- Rama TdI: Teoría de la Información -----

rama_TdI_nodo_1 <- list ("Introducción a la Programación I")
names(rama_TdI_nodo_1) <- c ("Introducción a la Programación I")

rama_TdI_nodo_2 <- list ("Introducción a la Programación II", "Análisis Matemático I", "Algebra I")
names(rama_TdI_nodo_2) <- c ("Introducción a la Programación II", "Análisis Matemático I", "Algebra I")

rama_TdI_nodo_3 <- list ("Introducción a la Arquitectura de Sistemas", "Análisis Matemático II", "Algebra Lineal", "Ciencias de la Computación I", "Matemática Discreta")
names(rama_TdI_nodo_3) <- c ("Introducción a la Arquitectura de Sistemas", "Análisis Matemático II", "Algebra Lineal", "Ciencias de la Computación I", "Matemática Discreta")

rama_TdI_nodo_4 <- list ("Comunicación de Datos I", "Probabilidades y Estadística", "Análisis y Diseño de Algoritmos I", 
                         "Algebra I - Final", "Análisis Matemático I - Final", "Introducción a la Programación I - Final", "Química - Final", 
                         "Algebra Lineal - Final", "Ciencias de la Computación I - Final", "Introducción a la Programación II - Final", "Física General - Final", "Matemática Discreta - Final")
names(rama_TdI_nodo_4) <- c ("Comunicación de Datos I", "Probabilidades y Estadística", "Análisis y Diseño de Algoritmos I", 
                             "Algebra I - Final", "Análisis Matemático I - Final", "Introducción a la Programación I - Final", "Química - Final", 
                             "Algebra Lineal - Final", "Ciencias de la Computación I - Final", "Introducción a la Programación II - Final", "Física General - Final", "Matemática Discreta - Final")

rama_TdI_nodo_5 <- list ("Teoría de la Información")
names(rama_TdI_nodo_5) <- c ("Teoría de la Información")

#--- Agrupacion de los nodos ---

rama_TdI <- list (rama_TdI_nodo_1, rama_TdI_nodo_2, rama_TdI_nodo_3, rama_TdI_nodo_4, rama_TdI_nodo_5)
names(rama_TdI) <- c ("IPROG I",
                      "IPROG II, AM I, AG I",
                      "IAdeS, AM II, AL, CC I, MD",
                      "CdD I, PyE, AyDA I, AG - F,\n AM I - F,IPROG I - F,\n Q - F, AL - F,\n CC I - F, IPROG II -F,\n FG - F, MD - F",
                      "TdI")


#----- Rama CdD2: Comunicación de Datos II -----

rama_CdD2_nodo_1 <- list ("Algebra I", "Análisis Matemático I", "Introducción a la Programación I")
names(rama_CdD2_nodo_1) <- c ("Algebra I", "Análisis Matemático I", "Introducción a la Programación I")

rama_CdD2_nodo_2 <- list ("Física General", "Ciencias de la Computación I", "Introducción a la Programación II", "Matemática Discreta")
names(rama_CdD2_nodo_2) <- c ("Física General", "Ciencias de la Computación I", "Introducción a la Programación II", "Matemática Discreta")

rama_CdD2_nodo_3 <- list ("Electricidad y Magnetismo", "Análisis y Diseño de Algoritmos I", "Ciencias de la Computación II", "Análisis Matemático II", "Algebra Lineal")
names(rama_CdD2_nodo_3) <- c ("Electricidad y Magnetismo", "Análisis y Diseño de Algoritmos I", "Ciencias de la Computación II", "Análisis Matemático II", "Algebra Lineal")

rama_CdD2_nodo_4 <- list ("Introducción a la Arquitectura de Sistemas", "Electrónica Digital", "Análisis y Diseño de Algoritmos II", "Probabilidades y Estadística")
names(rama_CdD2_nodo_4) <- c ("Introducción a la Arquitectura de Sistemas", "Electrónica Digital", "Análisis y Diseño de Algoritmos II", "Probabilidades y Estadística")

rama_CdD2_nodo_5 <- list ("Arquitectura de Computadoras I", "Estructuras de Almacenamiento de Datos", 
                         "Algebra I - Final", "Análisis Matemático I - Final", "Introducción a la Programación I - Final", "Química - Final")
names(rama_CdD2_nodo_5) <- c ("Arquitectura de Computadoras I", "Estructuras de Almacenamiento de Datos", 
                              "Algebra I - Final", "Análisis Matemático I - Final", "Introducción a la Programación I - Final", "Química - Final")

rama_CdD2_nodo_6 <- list ("Comunicación de Datos I", "Sistemas Operativos I", 
                          "Algebra Lineal - Final", "Ciencias de la Computación I - Final", "Introducción a la Programación II - Final", "Física General - Final", "Matemática Discreta - Final")
names(rama_CdD2_nodo_6) <- c ("Comunicación de Datos I", "Sistemas Operativos I", 
                              "Algebra Lineal - Final", "Ciencias de la Computación I - Final", "Introducción a la Programación II - Final", "Física General - Final", "Matemática Discreta - Final")

rama_CdD2_nodo_7  <- list ("Comunicación de Datos II")
names(rama_CdD2_nodo_7) <- c ("Comunicación de Datos II")

#--- Agrupacion de los nodos ---

rama_CdD2 <- list (rama_CdD2_nodo_1, rama_CdD2_nodo_2, rama_CdD2_nodo_3, 
                   rama_CdD2_nodo_4, rama_CdD2_nodo_5, rama_CdD2_nodo_6, rama_CdD2_nodo_7)
names(rama_CdD2) <- c ("AG I, AM I, IPROG I",
                       "FG, CC I, IPROG II, MD",
                       "EyM, AyDA I, CC II, AM II, AL",
                       "IAdeS, ED, AyDA II, PyE",
                       "AdC I, EAdD, AG I - F, AM I - F,\nIPROG I - F, Q - F",
                       "CdD I, SO I, AL - F, CC I - F,\n IPROG II - F,FG - F, MD - F", 
                       "CdD II")


#----- Rama ICDI: Introducción al Cálculo Diferenciál e Integral -----

rama_ICDI_nodo_1 <- list ("Análisis Matemático I")
names(rama_ICDI_nodo_1) <- c ("Análisis Matemático I")

rama_ICDI_nodo_2 <- list ("Análisis Matemático II", 
                          "Algebra I - Final", "Análisis Matemático I - Final", "Introducción a la Programación I - Final", "Química - Final", 
                          "Algebra Lineal - Final", "Ciencias de la Computación I - Final", "Introducción a la Programación II - Final", "Física General - Final", "Matemática Discreta - Final")
names(rama_ICDI_nodo_2) <- c ("Análisis Matemático II", 
                              "Algebra I - Final", "Análisis Matemático I - Final", "Introducción a la Programación I - Final", "Química - Final", 
                              "Algebra Lineal - Final", "Ciencias de la Computación I - Final", "Introducción a la Programación II - Final", "Física General - Final", "Matemática Discreta - Final")

rama_ICDI_nodo_3 <- list ("Introducción al Cálculo Diferencial e Integral")
names(rama_ICDI_nodo_3) <- c ("Introducción al Cálculo Diferencial e Integral")

#--- Agrupacion de los nodos ---

rama_ICDI <- list (rama_ICDI_nodo_1, rama_ICDI_nodo_2, rama_ICDI_nodo_3)
names(rama_ICDI) <- c ("AM I",
                       "AM II, AG I - F,\n AM I - F, IPROG I - F,\n Q - F, AL - F,\n CC I - F, IPROG II - F,\n FG - F, MD - F",
                       "ICDI")


#----- Rama AdCyTD: Arquitectura de Computadoras y Técnicas Digitales -----

rama_AdCyTD_nodo_1 <- list ("Análisis Matemático I")
names(rama_AdCyTD_nodo_1) <- c ("Análisis Matemático I")

rama_AdCyTD_nodo_2 <- list ("Física General", "Introducción a la Programación I")
names(rama_AdCyTD_nodo_2) <- c ("Física General", "Introducción a la Programación I")

rama_AdCyTD_nodo_3 <- list ("Electricidad y Magnetismo", "Introducción a la Programación II")
names(rama_AdCyTD_nodo_3) <- c ("Electricidad y Magnetismo", "Introducción a la Programación II")

rama_AdCyTD_nodo_4 <- list ("Electrónica Digital", "Introducción a la Arquitectura de Sistemas")
names(rama_AdCyTD_nodo_4) <- c ("Electrónica Digital", "Introducción a la Arquitectura de Sistemas")

rama_AdCyTD_nodo_5 <- list ("Arquitectura de Computadoras I", 
                            "Algebra I - Final", "Análisis Matemático I - Final", "Introducción a la Programación I - Final", "Química - Final", 
                            "Algebra Lineal - Final", "Ciencias de la Computación I - Final", "Introducción a la Programación II - Final", "Física General - Final", "Matemática Discreta - Final")
names(rama_AdCyTD_nodo_5) <- c ("Arquitectura de Computadoras I", 
                                "Algebra I - Final", "Análisis Matemático I - Final", "Introducción a la Programación I - Final", "Química - Final", 
                                "Algebra Lineal - Final", "Ciencias de la Computación I - Final", "Introducción a la Programación II - Final", "Física General - Final", "Matemática Discreta - Final")


rama_AdCyTD_nodo_6 <- list ("Arquitectura de Computadoras y Técnicas Digitales")
names(rama_AdCyTD_nodo_6) <- c ("Arquitectura de Computadoras y Técnicas Digitales")


#--- Agrupacion de los nodos ---

rama_AdCyTD <- list (rama_AdCyTD_nodo_1, rama_AdCyTD_nodo_2, rama_AdCyTD_nodo_3, 
                     rama_AdCyTD_nodo_4, rama_AdCyTD_nodo_5, rama_AdCyTD_nodo_6)
names(rama_AdCyTD) <- c ("AM I",
                         "FG, IPROG I",
                         "EyM, IPROG II",
                         "ED, IAdeS",
                         "AdC I, AG I - F, AM I - F,\n IPROG I - F, Q - F,\n AL -F, CC I - F,\n IPROG II - F, FG - F, MD - F",
                         "AdCyTD")


#-------------------- Agrupacion de todas las ramas en una lista --------------------

ramas_correlatividades <- list(rama_IdS, rama_FEyPI, rama_LyGA, rama_OE, rama_DdC, rama_TdI, rama_CdD2, rama_ICDI, rama_AdCyTD)
names(ramas_correlatividades) <- c("Ingeniería de Software", "Fundamentos de Economía y Proyectos de Inversión", "Legislación y Gestión Ambiental", "Organización Empresarial", 
                                   "Diseño de Compiladores I", "Teoría de la Información", "Comunicación de Datos II", "Introducción al Cálculo Diferencial e Integral", "Arquitectura de Computadoras y Técnicas Digitales")


#-------------------- Funciones para calcular la probabilidad de aprobar cada uno de los nodos que componen las ramas --------------------

#----- Generar matriz de probabilidades -----

generar_matriz_probabilidades <- function (probabilidades_aprobacion)
{
  matriz <- matrix(0, length (probabilidades_aprobacion) + 1, length (probabilidades_aprobacion) + 1)
  
  for(i in 1 : length(probabilidades_aprobacion))
  {
    matriz[i,i + 1] <- probabilidades_aprobacion[[i]]
    matriz[i,i] <- (1 - probabilidades_aprobacion[[i]])
  }
  matriz[length (probabilidades_aprobacion) + 1,length (probabilidades_aprobacion) + 1] <- 1
  
  matriz
}

#----- Funcion para calcular los aprobados por cada nodo de la rama -----

calcular_probabilidades_por_rama_de_aprobar <- function (rama, cohorte, anios_retraso_considerados)
{
  probabilidades_por_rama_de_aprobar <- c()
  
  for (i in 1 : length (rama))
  {
    #--- Se obtiene el total de alumnos que cursaron dicho conjunto de materias ---
    
    total_rama <-
                  cohorte %>%
                  group_by(legajo_del_alumno) %>%
                  filter((nombre_materia %in% rama [[i]]) & (meses_transcurridos_para_regularizar <= meses_requeridos_para_regularizar + 12 * anios_retraso_considerados)) %>%
                  distinct(nombre_materia) %>%
                  filter (n() == length(rama [[i]])) %>%
                  distinct(legajo_del_alumno) %>%
                  nrow()
    
    #--- Se obtienen los que aprobaron dicho conjunto de materias ---
    
    aprobados_rama <- 
                      cohorte %>%
                      group_by(legajo_del_alumno) %>%
                      filter((nombre_materia %in% rama[[i]]) & (resultado == "A" | resultado == "P") & (meses_transcurridos_para_regularizar <= meses_requeridos_para_regularizar + 12 * anios_retraso_considerados)) %>%
                      distinct(nombre_materia) %>%
                      filter (n() == length(rama [[i]])) %>%
                      distinct(legajo_del_alumno) %>%
                      nrow()
    
    if (total_rama == 0)
    {
      probabilidades_por_rama_de_aprobar[i] <- 0
    }
    else
    {
      probabilidades_por_rama_de_aprobar[i] <- aprobados_rama / total_rama
    }
    
  }
  
  probabilidades_por_rama_de_aprobar
}

#----- Funcion para calcular las matrices de transicion de un mismo anio -----

calcular_matrices_probabilidades <- function (lista_ramas, cohorte, anios_retraso_considerados)
{
  matrices_probabilidades_cohorte <- list()
  
  for(i in 1:length(lista_ramas))
  {
    probabilidades_por_rama_de_aprobar <- calcular_probabilidades_por_rama_de_aprobar(lista_ramas[[i]], cohorte, anios_retraso_considerados)
    matriz <- generar_matriz_probabilidades(probabilidades_por_rama_de_aprobar)
    matrices_probabilidades_cohorte[[i]] <- matriz
    rownames(matrices_probabilidades_cohorte[[i]]) <- c(sprintf("nodo_%d", 1:length(lista_ramas[[i]])), "nodo_final")
    colnames(matrices_probabilidades_cohorte[[i]]) <- c(sprintf("nodo_%d", 1:length(lista_ramas[[i]])), "nodo_final")
  }
  
  names(matrices_probabilidades_cohorte) <- names(lista_ramas)
  matrices_probabilidades_cohorte
}

#----- Calculo de las matrices de cada anio -----

matrices_probabilidades_cohorte_2012 <- calcular_matrices_probabilidades(ramas_correlatividades, cohorte_2012, 0)
matrices_probabilidades_cohorte_2013 <- calcular_matrices_probabilidades(ramas_correlatividades, cohorte_2013, 0)
matrices_probabilidades_cohorte_2014 <- calcular_matrices_probabilidades(ramas_correlatividades, cohorte_2014, 0)
matrices_probabilidades_cohorte_2015 <- calcular_matrices_probabilidades(ramas_correlatividades, cohorte_2015, 0)

#----- Funcion para hacer un promedio de aprobados de cada una de las cohortes -----

obtener_promedio_probabilidades <- function(lista_matrices, cantidad_ramas)
{
  promedio_matrices <- list()
  
  for(k in 1:cantidad_ramas)
  {
    promedio_matrices[[k]] <- matrix(0, nrow(lista_matrices[[k]]), ncol(lista_matrices[[k]]))
  }
  
  cont = 0
  for(i in 1:(length(lista_matrices)/cantidad_ramas))
  {
    for(j in 1:cantidad_ramas)
    {
      cont <- cont + 1
      promedio_matrices[[j]] <- promedio_matrices[[j]] + lista_matrices[[cont]]
    }
  }
  
  for(l in 1:cantidad_ramas)
  {
    promedio_matrices[[l]] <- promedio_matrices[[l]] / (length(lista_matrices)/cantidad_ramas)
  }
  
  names(promedio_matrices) <- names(lista_matrices[1:9])
  promedio_matrices
}

lista_matrices <- c(matrices_probabilidades_cohorte_2012, matrices_probabilidades_cohorte_2013, matrices_probabilidades_cohorte_2014, matrices_probabilidades_cohorte_2015)
promedio_probabilidades_cohortes <- obtener_promedio_probabilidades(lista_matrices, length(ramas_correlatividades))

#-------------------- Realizando las cadenas de Markov --------------------

#----- Funcion para crear las cadenas de Markov -----

obtener_cadenas <- function (matrices)
{
  cadenas_markov <- list()
  
  for(i in 1:length(matrices))
  {
    cadenas_markov[[i]] <- new("markovchain", transitionMatrix = matrices[[i]], states = colnames(matrices[[i]]), name = names(matrices[i]))
  }
  
  cadenas_markov
}

#----- Funcion para graficar las cadenas de Markov -----

graficar_cadenas <- function (cadenas, lista_ramas, anio, color_vertex)
{
  
  for(i in 1:length(cadenas))
  {
    rownames(cadenas[[i]]) <- c(names(lista_ramas[[i]]), "nodo_final")
    colnames(cadenas[[i]]) <- c(names(lista_ramas[[i]]), "nodo_final")
    plotmat(cadenas[[i]],
            main = paste(names (cadenas[i]), anio, sep  = " - cohorte "), 
            lwd = 1, 
            box.lwd = 2,
            cex.txt = 0.5,
            box.size = 0.08,
            box.cex = 0.9, 
            box.type = "square",
            shadow.size = 0, 
            box.prop = 0.5,
            box.col = color_vertex,
            arr.length=.2,
            arr.width=.2,
            arr.type = "T",
            mx = -0.02,
            my = -0.009, 
            self.cex = .15,
            self.shifty = .02,
            self.shiftx = c(-0.09, -0.09, 0.094, -0.09, 0.094, 0.094, 0.094, 0.094),
            curve = 0.15,
            dtext = 0.2)
    text_legend <- c("Algebra I - AG I, Análisis Matemático I - AM I", "Introducción a la Programación I - IPROG I, Química - Q", 
                     "Algebra Lineal - AL, Ciencias de la Computación I - CC I", "Introducción a la Programación II - IPROG II, Física General - FG", "Matemática Discreta - MD, Análisis Matemático II - AM II", 
                     "Análisis y Diseño de Algoritmos I - AyDA I, Ciencias de la Computación II - CC II", "Electricidad y Magnetismo - EyM, Introducción a la Arquitectura de Sistemas - IAdeS", 
                     "Análisis y Diseño de Algoritmos II - AyDA II, Comunicación de Datos I - CdD I", "Electrónica Digital - ED, Inglés - I", "Probabilidades y Estadística - PyE, Arquitectura de Computadoras I - AdC I", 
                     "Estructuras de Almacenamiento de Datos - EAdD", "Metodologías de Desarrollo de Software I - MDdeS I", "Programación Orientada a Objetos - PROGOO I, Bases de Datos I - BdD I", 
                     "Investigación Operativa I - IO I, Lenguajes de Programación I - LdP I", "Programación Exploratoria - PE, Sistemas Operativos I - SO I",
                     "Arquitectura de Computadoras y Técnicas Digitales - AdCyTD", "Comunicación de Datos II - CdD II", "Introducción al Cálculo Diferencial e Integral - ICDI, Teoría de la Información - TdI", 
                     "Diseño de Compiladores I - DdC I, Diseño de Sistemas de Software - DSdeS", 
                     "Ingeniería de Software - IdS, Fundamentos de Economía y Proyectos de Inversión - FeyPI", 
                     "Legislación y Gestión Ambiental - LyGA, Organización Empresarial - OE")
    legend("center",
           legend = text_legend,
           cex=0.55, 
           y.intersp = 0.27,
           text.width = strwidth(text_legend)[4]/4,
           lty)
  }
}

cadenas_markov_2012 <- obtener_cadenas(matrices_probabilidades_cohorte_2012)
cadenas_markov_2013 <- obtener_cadenas(matrices_probabilidades_cohorte_2013)
cadenas_markov_2014 <- obtener_cadenas(matrices_probabilidades_cohorte_2014)
cadenas_markov_2015 <- obtener_cadenas(matrices_probabilidades_cohorte_2015)
cadenas_markov_promedio <- obtener_cadenas(promedio_probabilidades_cohortes)

graficar_cadenas(matrices_probabilidades_cohorte_2012, ramas_correlatividades, "2012", "light blue")
graficar_cadenas(matrices_probabilidades_cohorte_2013, ramas_correlatividades, "2013", "pink")
graficar_cadenas(matrices_probabilidades_cohorte_2014, ramas_correlatividades, "2014", "light yellow")
graficar_cadenas(matrices_probabilidades_cohorte_2015, ramas_correlatividades, "2015", "gray")
graficar_cadenas(promedio_probabilidades_cohortes, ramas_correlatividades, "promedio", "light green")

#-------------------- Realizando un relevamiento sobre la cantidad de alumnos que finalizan todas las materias a tiempo por cohorte --------------------

#----- Funcion para obtener los alumnos de una cohorte que aprueban el ultimo nodo de una rama en particular -----

alumnos_aprobados_ultimo_nodo <- function (rama, dataset, anios_retraso_considerados)
{
  
  aprobados <- 
              dataset %>%
              group_by(legajo_del_alumno) %>%
              filter((nombre_materia %in% rama[[length (rama)]]) & (resultado == "A" | resultado == "P") & (meses_transcurridos_para_regularizar <= meses_requeridos_para_regularizar + 12 * anios_retraso_considerados)) %>%
              distinct(nombre_materia) %>%
              filter (n() == length(rama [[length (rama)]])) %>%
              distinct(legajo_del_alumno) 
  
  aprobados
}

#----- Funcion para obtener los legajos de los alumnos de una cohorte que aprueban cada una de las ramas de la carrera a tiempo -----

obtener_legajos_alumnos_terminan_cada_rama <- function (lista_ramas, dataset_anio, anios_retraso_considerados)
{
  alumnos_terminan_cada_rama <- list()
  
  for(i in 1:length(lista_ramas))
  {
    alumnos_terminan_cada_rama[[i]] <- alumnos_aprobados_ultimo_nodo(lista_ramas[[i]], dataset_anio, anios_retraso_considerados)
  }
  
  names(alumnos_terminan_cada_rama) <- names(lista_ramas[1:9])
  alumnos_terminan_cada_rama
}

#----- Funcion para obtener los legajos de los alumnos de una cohorte que aprueban todas las ramas de la carrera a tiempo -----

obtener_legajos_alumnos_terminan <- function (alumnos_terminan_anio)
{
  alumnos_terminan <- alumnos_terminan_anio[[1]]
  for(i in 2:length(alumnos_terminan_anio))
  {
    alumnos_terminan <- 
                        alumnos_terminan %>% 
                        inner_join(alumnos_terminan_anio[[i]], by = c("legajo_del_alumno"))
  }
  
  alumnos_terminan
}

#----- Funcion para determinar la probabilidad de que alumnos de una misma cohorte finalicen juntos todas las ramas de la carrera -----

obtener_probabilidad_de_terminar <- function(alumnos_terminan_anio, dataset_anio)
{
  aprobados <- 
              alumnos_terminan_anio %>% 
              nrow()
  
  total <- 
          dataset_anio %>% 
          distinct(legajo_del_alumno) %>%
          nrow()
  
  if (total == 0)
  {
    prob_aprobar <- 0
  }
  else
  {
    prob_aprobar <- aprobados/total
  }
  
  prob_aprobar
}
         
graficar_torta <- function (alumnos_terminan_anio, dataset_anio, anio_retraso, anio_cohorte)
{
  aprobados <- 
    alumnos_terminan_anio %>% 
    nrow()
  
  total <- 
    dataset_anio %>% 
    distinct(legajo_del_alumno) %>%
    nrow()
  
  if (total == 0)
  {
    porcentaje <- 0
  }
  else
  {
    porcentaje <- (aprobados / total) * 100
  }
  
  etiquetas <- c(paste ("terminaron con",paste (anio_retraso, " años de retraso", sep = " "), sep = " "), "no terminaron")
  etiquetas <- paste (etiquetas, porcentaje, sep = "\n")
  etiquetas <- paste (etiquetas, "%", sep = "")
  pie (c(aprobados, total), labels = etiquetas, col = c("green", "red"),  main = paste (paste ("Estudiantes que finalizaron vs Estudiantes que no finalizaron\n - Cohorte", anio_cohorte, sep = " "), anio_retraso, sep = " . Años de retraso: "))
}

alumnos_terminan_cada_rama_2012 <- obtener_legajos_alumnos_terminan_cada_rama(ramas_correlatividades, cohorte_2012, 0)
alumnos_terminan_2012 <- obtener_legajos_alumnos_terminan(alumnos_terminan_cada_rama_2012)

graficar_torta (alumnos_terminan_2012, cohorte_2012, 0, "2012")

alumnos_terminan_2012
obtener_probabilidad_de_terminar(alumnos_terminan_2012, cohorte_2012)

alumnos_terminan_cada_rama_2013 <- obtener_legajos_alumnos_terminan_cada_rama(ramas_correlatividades, cohorte_2013, 0)
alumnos_terminan_2013 <- obtener_legajos_alumnos_terminan(alumnos_terminan_cada_rama_2013)

graficar_torta (alumnos_terminan_2013, cohorte_2013, 0, "2013")

alumnos_terminan_2013
obtener_probabilidad_de_terminar(alumnos_terminan_2013, cohorte_2013)

alumnos_terminan_cada_rama_2014 <- obtener_legajos_alumnos_terminan_cada_rama(ramas_correlatividades, cohorte_2014, 0)
alumnos_terminan_2014 <- obtener_legajos_alumnos_terminan(alumnos_terminan_cada_rama_2014)

graficar_torta (alumnos_terminan_2014, cohorte_2014, 0, "2014")

alumnos_terminan_2014
obtener_probabilidad_de_terminar(alumnos_terminan_2014, cohorte_2014)

alumnos_terminan_cada_rama_2015 <- obtener_legajos_alumnos_terminan_cada_rama(ramas_correlatividades, cohorte_2015, 0)
alumnos_terminan_2015 <- obtener_legajos_alumnos_terminan(alumnos_terminan_cada_rama_2015)

graficar_torta (alumnos_terminan_2015, cohorte_2015, 0, "2015")

alumnos_terminan_2015
obtener_probabilidad_de_terminar(alumnos_terminan_2015, cohorte_2015)


#-------------------- Analizando cada materia en particular --------------------

#----- Funcion para obtener cuantos aprueban, promocionan, reprueban, y están ausentes o abandonaron por materia -----

obtener_resultados_cursadas_por_materia <- function(dataset_anio, anios_retraso_considerados)
{
  resultados <- list()
  
  for(i in 1:length(nombre_materias_obligatorias))
  {
    resultados[[i]] <- 
                      dataset_anio %>% 
                      group_by(resultado) %>% 
                      filter((nombre_materia == nombre_materias_obligatorias[[i]]) & (meses_transcurridos_para_regularizar <= meses_requeridos_para_regularizar + 12 * anios_retraso_considerados)) %>% 
                      distinct(legajo_del_alumno) %>% 
                      count(resultado)
  }
  names(resultados) <- names(nombre_materias_obligatorias)
  
  resultados
}

#----- Funcion para graficar cuantos aprueban, promocionan, reprueban, y están ausentes o abandonaron una materia en particular -----

graficar_resultado_cursada <- function(resultados, anio, materia)
{
  df <- data.frame(x = resultados[materia])
  names(df) <- c("resultado", "n")
  ggplot(data = df, aes(x = resultado, y = n)) + geom_bar(stat = "identity", color = "blue", fill = "white") + scale_y_continuous(limits = c(0, 100)) + ggtitle (paste ("Resultados", paste (anio, materia, sep = " - "), sep = " "))
}

#----- Funcion para obtener la probabilidad acorde a un/varios resultado/s (aprobar, reprobar, promocionar, ausente o abandono) por materia -----

calcular_probabilidades_por_materia <- function (cohorte, anios_retraso_considerados, resultados_considerados)
{
  probabilidades_por_materia <- c()
  
  for (i in 1 : length (nombre_materias_obligatorias))
  {
    #--- Se obtiene el total de alumnos que cursaron la materia ---
    
    total <-
            cohorte %>%
            group_by(resultado) %>%
            filter((nombre_materia == nombre_materias_obligatorias[[i]]) & (meses_transcurridos_para_regularizar <= meses_requeridos_para_regularizar + 12 * anios_retraso_considerados)) %>%
            distinct(legajo_del_alumno) %>%
            nrow()
    
    #--- Se obtienen los que cumplen el/los resultado/s considerado/s ---
    
    cumplen_resultado <- 
                        cohorte %>%
                        group_by(resultado) %>%
                        filter((nombre_materia == nombre_materias_obligatorias[[i]]) & resultado %in% resultados_considerados & (meses_transcurridos_para_regularizar <= meses_requeridos_para_regularizar + 12 * anios_retraso_considerados)) %>%
                        distinct(legajo_del_alumno) %>%
                        nrow()
    
    if (total == 0)
    {
      probabilidades_por_materia[i] <- 0
    }
    else
    {
      probabilidades_por_materia[i] <- cumplen_resultado / total
    }
    
  }
  names(probabilidades_por_materia) <- names(nombre_materias_obligatorias)
  
  probabilidades_por_materia
}


resultados_2012 <- obtener_resultados_cursadas_por_materia(cohorte_2012, 0)
resultados_2013 <- obtener_resultados_cursadas_por_materia(cohorte_2013, 0)
resultados_2014 <- obtener_resultados_cursadas_por_materia(cohorte_2014, 0)
resultados_2015 <- obtener_resultados_cursadas_por_materia(cohorte_2015, 0)

graficar_resultado_cursada(resultados_2012, "2012", "Algebra I")


probabilidades_por_materia_2012 <- calcular_probabilidades_por_materia(cohorte_2012, 0, c("R"))
probabilidades_por_materia_2012

probabilidades_por_materia_2013 <- calcular_probabilidades_por_materia(cohorte_2013, 0, c("R"))
probabilidades_por_materia_2013

probabilidades_por_materia_2014 <- calcular_probabilidades_por_materia(cohorte_2014, 0, c("R"))
probabilidades_por_materia_2014

probabilidades_por_materia_2015 <- calcular_probabilidades_por_materia(cohorte_2015, 0, c("R"))
probabilidades_por_materia_2015

