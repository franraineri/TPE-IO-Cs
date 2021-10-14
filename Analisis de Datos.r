

#-------------------- Comienza el an�lisis por ramas --------------------

#----- Rama Ids: Ingenier�a de Software -----

rama_IdS_nodo_1 <- list ("Algebra I", "An�lisis Matem�tico I", "Introducci�n a la Programaci�n I")
names(rama_IdS_nodo_1) <- c ("Algebra I", "An�lisis Matem�tico I", "Introducci�n a la Programaci�n I")

rama_IdS_nodo_2 <- list ("Ciencias de la Computaci�n I", "Matem�tica Discreta", "Introducci�n a la Programaci�n II", "F�sica General")
names(rama_IdS_nodo_2)<- c ("Ciencias de la Computaci�n I", "Matem�tica Discreta", "Introducci�n a la Programaci�n II", "F�sica General")

rama_IdS_nodo_3 <- list ("Ciencias de la Computaci�n II", "An�lisis y Dise�o de Algoritmos I", "An�lisis Matem�tico II", "Algebra Lineal", "Electricidad y Magnetismo")
names(rama_IdS_nodo_3) <- c ("Ciencias de la Computaci�n II", "An�lisis y Dise�o de Algoritmos I", "An�lisis Matem�tico II", "Algebra Lineal", "Electricidad y Magnetismo")

rama_IdS_nodo_4 <- list ("An�lisis y Dise�o de Algoritmos II", "Probabilidades y Estad�stica", "Electr�nica Digital", "Introducci�n a la Arquitectura de Sistemas")
names(rama_IdS_nodo_4) <- c ("An�lisis y Dise�o de Algoritmos II", "Probabilidades y Estad�stica", "Electr�nica Digital", "Introducci�n a la Arquitectura de Sistemas")

rama_IdS_nodo_5 <- list ("Estructuras de Almacenamiento de Datos", "Metodolog�as de Desarrollo de Software I", "Arquitectura de Computadoras I", 
                         "Algebra I - Final", "An�lisis Matem�tico I - Final", "Introducci�n a la Programaci�n I - Final", "Qu�mica - Final")
names(rama_IdS_nodo_5) <- c ("Estructuras de Almacenamiento de Datos", "Metodolog�as de Desarrollo de Software I", "Arquitectura de Computadoras I", 
                             "Algebra I - Final", "An�lisis Matem�tico I - Final", "Introducci�n a la Programaci�n I - Final", "Qu�mica - Final")

rama_IdS_nodo_6 <- list ("Bases de Datos I", "Programaci�n Orientada a Objetos", "Sistemas Operativos I", 
                         "An�lisis Matem�tico II - Final", "An�lisis y Dise�o de Algoritmos I - Final", "Ciencias de la Computaci�n II - Final", "Electricidad y Magnetismo - Final", "Introducci�n a la Arquitectura de Sistemas - Final", 
                         "Algebra Lineal - Final", "Ciencias de la Computaci�n I - Final", "Introducci�n a la Programaci�n II - Final", "F�sica General - Final", "Matem�tica Discreta - Final")
names(rama_IdS_nodo_6) <- c ("Bases de Datos I", "Programaci�n Orientada a Objetos", "Sistemas Operativos I", 
                             "An�lisis Matem�tico II - Final", "An�lisis y Dise�o de Algoritmos I - Final", "Ciencias de la Computaci�n II - Final", "Electricidad y Magnetismo - Final", "Introducci�n a la Arquitectura de Sistemas - Final", 
                             "Algebra Lineal - Final", "Ciencias de la Computaci�n I - Final", "Introducci�n a la Programaci�n II - Final", "F�sica General - Final", "Matem�tica Discreta - Final")

rama_IdS_nodo_7 <- list ("Dise�o de Sistemas de Software", 
                         "An�lisis y Dise�o de Algoritmos II - Final", "Comunicaci�n de Datos I - Final", "Probabilidades y Estad�stica - Final", "Electr�nica Digital - Final", "Ingl�s - Final")
names(rama_IdS_nodo_7) <- c ("Dise�o de Sistemas de Software", 
                             "An�lisis y Dise�o de Algoritmos II - Final", "Comunicaci�n de Datos I - Final", "Probabilidades y Estad�stica - Final", "Electr�nica Digital - Final", "Ingl�s - Final")

rama_IdS_nodo_8 <- list ("Ingenier�a de Software")
names(rama_IdS_nodo_8) <- c ("Ingenier�a de Software")

#--- Agrupaci�n de los nodos ---

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

rama_OO_nodo_1 <- list ("Algebra I", "An�lisis Matem�tico I", "Introducci�n a la Programaci�n I")
names(rama_OO_nodo_1) <- c ("Algebra I", "An�lisis Matem�tico I", "Introducci�n a la Programaci�n I")

rama_OO_nodo_2 <- list ("Ciencias de la Computaci�n I", "Introducci�n a la Programaci�n II", "Matem�tica Discreta", "F�sica General")
names(rama_OO_nodo_2) <- c ("Ciencias de la Computaci�n I", "Introducci�n a la Programaci�n II", "Matem�tica Discreta", "F�sica General")

rama_OO_nodo_3 <- list ("An�lisis y Dise�o de Algoritmos I", "Ciencias de la Computaci�n II", "Electricidad y Magnetismo", "An�lisis Matem�tico II",  "Algebra Lineal")
names(rama_OO_nodo_3) <- c ("An�lisis y Dise�o de Algoritmos I", "Ciencias de la Computaci�n II", "Electricidad y Magnetismo", "An�lisis Matem�tico II",  "Algebra Lineal")

rama_OO_nodo_4 <- list ("Introducci�n a la Arquitectura de Sistemas", "An�lisis y Dise�o de Algoritmos II", "Electr�nica Digital", "Probabilidades y Estad�stica")
names(rama_OO_nodo_4) <- c ("Introducci�n a la Arquitectura de Sistemas", "An�lisis y Dise�o de Algoritmos II", "Electr�nica Digital", "Probabilidades y Estad�stica")

rama_OO_nodo_5 <- list ("Arquitectura de Computadoras I", "Estructuras de Almacenamiento de Datos", "Metodolog�as de Desarrollo de Software I", "Programaci�n Orientada a Objetos")
names(rama_OO_nodo_5) <- c ("Arquitectura de Computadoras I", "Estructuras de Almacenamiento de Datos", "Metodolog�as de Desarrollo de Software I", "Programaci�n Orientada a Objetos")

rama_OO_nodo_6 <- list ("Bases de Datos I", "Investigaci�n Operativa I", "Lenguajes de Programaci�n I", "Programaci�n Exploratoria", "Sistemas Operativos I")
names(rama_OO_nodo_6) <- c ("Bases de Datos I", "Investigaci�n Operativa I", "Lenguajes de Programaci�n I", "Programaci�n Exploratoria", "Sistemas Operativos I")


#--- Rama FEyPI: Fundamentos de Econom�a y Proyectos de Inversi�n ---

rama_FEyPI_nodo_7 <- list ("Fundamentos de Econom�a y Proyectos de Inversi�n")
names(rama_FEyPI_nodo_7) <- c ("Fundamentos de Econom�a y Proyectos de Inversi�n")


#--- Rama LyGA: Legislaci�n y Gesti�n Ambiental ---

rama_LyGA_nodo_7 <- list ("Legislaci�n y Gesti�n Ambiental")
names(rama_LyGA_nodo_7) <- c ("Legislaci�n y Gesti�n Ambiental")


#--- Rama OE: Organizaci�n Empresarial ---

rama_OE_nodo_7 <- list ("Organizaci�n Empresarial")
names(rama_OE_nodo_7) <- c ("Organizaci�n Empresarial")

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



#----- Rama DdC: Dise�o de Compiladores I ----- 

rama_DdC_nodo_1 <- list ("Algebra I", "Introducci�n a la Programaci�n I")
names(rama_DdC_nodo_1) <- c ("Algebra I", "Introducci�n a la Programaci�n I")

rama_DdC_nodo_2 <- list ("Ciencias de la Computaci�n I", "Introducci�n a la Programaci�n II", "Matem�tica Discreta")
names(rama_DdC_nodo_2) <- c ("Ciencias de la Computaci�n I", "Introducci�n a la Programaci�n II", "Matem�tica Discreta")

rama_DdC_nodo_3 <- list ("An�lisis y Dise�o de Algoritmos I", "Ciencias de la Computaci�n II")
names(rama_DdC_nodo_3) <- c ("An�lisis y Dise�o de Algoritmos I", "Ciencias de la Computaci�n II")

rama_DdC_nodo_4 <- list ("An�lisis y Dise�o de Algoritmos II")
names(rama_DdC_nodo_4) <- c ("An�lisis y Dise�o de Algoritmos II")

rama_DdC_nodo_5 <- list ("Programaci�n Orientada a Objetos", 
                         "Algebra I - Final", "An�lisis Matem�tico I - Final", "Introducci�n a la Programaci�n I - Final", "Qu�mica - Final")
names(rama_DdC_nodo_5) <- c ("Programaci�n Orientada a Objetos", 
                             "Algebra I - Final", "An�lisis Matem�tico I - Final", "Introducci�n a la Programaci�n I - Final", "Qu�mica - Final")

rama_DdC_nodo_6 <- list ("Lenguajes de Programaci�n I", 
                         "An�lisis Matem�tico II - Final", "An�lisis y Dise�o de Algoritmos I - Final", "Ciencias de la Computaci�n II - Final", "Electricidad y Magnetismo - Final", "Introducci�n a la Arquitectura de Sistemas - Final", 
                         "Algebra Lineal - Final", "Ciencias de la Computaci�n I - Final", "Introducci�n a la Programaci�n II - Final", "F�sica General - Final", "Matem�tica Discreta - Final")
names(rama_DdC_nodo_6) <- c ("Lenguajes de Programaci�n I", 
                             "An�lisis Matem�tico II - Final", "An�lisis y Dise�o de Algoritmos I - Final", "Ciencias de la Computaci�n II - Final", "Electricidad y Magnetismo - Final", "Introducci�n a la Arquitectura de Sistemas - Final", 
                             "Algebra Lineal - Final", "Ciencias de la Computaci�n I - Final", "Introducci�n a la Programaci�n II - Final", "F�sica General - Final", "Matem�tica Discreta - Final")

rama_DdC_nodo_7 <- list ("Dise�o de Compiladores I")
names(rama_DdC_nodo_7) <- c ("Dise�o de Compiladores I")

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



#----- Rama TdI: Teor�a de la Informaci�n -----

rama_TdI_nodo_1 <- list ("Introducci�n a la Programaci�n I")
names(rama_TdI_nodo_1) <- c ("Introducci�n a la Programaci�n I")

rama_TdI_nodo_2 <- list ("Introducci�n a la Programaci�n II", "An�lisis Matem�tico I", "Algebra I")
names(rama_TdI_nodo_2) <- c ("Introducci�n a la Programaci�n II", "An�lisis Matem�tico I", "Algebra I")

rama_TdI_nodo_3 <- list ("Introducci�n a la Arquitectura de Sistemas", "An�lisis Matem�tico II", "Algebra Lineal", "Ciencias de la Computaci�n I", "Matem�tica Discreta")
names(rama_TdI_nodo_3) <- c ("Introducci�n a la Arquitectura de Sistemas", "An�lisis Matem�tico II", "Algebra Lineal", "Ciencias de la Computaci�n I", "Matem�tica Discreta")

rama_TdI_nodo_4 <- list ("Comunicaci�n de Datos I", "Probabilidades y Estad�stica", "An�lisis y Dise�o de Algoritmos I", 
                         "Algebra I - Final", "An�lisis Matem�tico I - Final", "Introducci�n a la Programaci�n I - Final", "Qu�mica - Final", 
                         "Algebra Lineal - Final", "Ciencias de la Computaci�n I - Final", "Introducci�n a la Programaci�n II - Final", "F�sica General - Final", "Matem�tica Discreta - Final")
names(rama_TdI_nodo_4) <- c ("Comunicaci�n de Datos I", "Probabilidades y Estad�stica", "An�lisis y Dise�o de Algoritmos I", 
                             "Algebra I - Final", "An�lisis Matem�tico I - Final", "Introducci�n a la Programaci�n I - Final", "Qu�mica - Final", 
                             "Algebra Lineal - Final", "Ciencias de la Computaci�n I - Final", "Introducci�n a la Programaci�n II - Final", "F�sica General - Final", "Matem�tica Discreta - Final")

rama_TdI_nodo_5 <- list ("Teor�a de la Informaci�n")
names(rama_TdI_nodo_5) <- c ("Teor�a de la Informaci�n")

#--- Agrupacion de los nodos ---

rama_TdI <- list (rama_TdI_nodo_1, rama_TdI_nodo_2, rama_TdI_nodo_3, rama_TdI_nodo_4, rama_TdI_nodo_5)
names(rama_TdI) <- c ("IPROG I",
                      "IPROG II, AM I, AG I",
                      "IAdeS, AM II, AL, CC I, MD",
                      "CdD I, PyE, AyDA I, AG - F,\n AM I - F,IPROG I - F,\n Q - F, AL - F,\n CC I - F, IPROG II -F,\n FG - F, MD - F",
                      "TdI")



#----- Rama CdD2: Comunicaci�n de Datos II -----

rama_CdD2_nodo_1 <- list ("Algebra I", "An�lisis Matem�tico I", "Introducci�n a la Programaci�n I")
names(rama_CdD2_nodo_1) <- c ("Algebra I", "An�lisis Matem�tico I", "Introducci�n a la Programaci�n I")

rama_CdD2_nodo_2 <- list ("F�sica General", "Ciencias de la Computaci�n I", "Introducci�n a la Programaci�n II", "Matem�tica Discreta")
names(rama_CdD2_nodo_2) <- c ("F�sica General", "Ciencias de la Computaci�n I", "Introducci�n a la Programaci�n II", "Matem�tica Discreta")

rama_CdD2_nodo_3 <- list ("Electricidad y Magnetismo", "An�lisis y Dise�o de Algoritmos I", "Ciencias de la Computaci�n II", "An�lisis Matem�tico II", "Algebra Lineal")
names(rama_CdD2_nodo_3) <- c ("Electricidad y Magnetismo", "An�lisis y Dise�o de Algoritmos I", "Ciencias de la Computaci�n II", "An�lisis Matem�tico II", "Algebra Lineal")

rama_CdD2_nodo_4 <- list ("Introducci�n a la Arquitectura de Sistemas", "Electr�nica Digital", "An�lisis y Dise�o de Algoritmos II", "Probabilidades y Estad�stica")
names(rama_CdD2_nodo_4) <- c ("Introducci�n a la Arquitectura de Sistemas", "Electr�nica Digital", "An�lisis y Dise�o de Algoritmos II", "Probabilidades y Estad�stica")

rama_CdD2_nodo_5 <- list ("Arquitectura de Computadoras I", "Estructuras de Almacenamiento de Datos", 
                         "Algebra I - Final", "An�lisis Matem�tico I - Final", "Introducci�n a la Programaci�n I - Final", "Qu�mica - Final")
names(rama_CdD2_nodo_5) <- c ("Arquitectura de Computadoras I", "Estructuras de Almacenamiento de Datos", 
                              "Algebra I - Final", "An�lisis Matem�tico I - Final", "Introducci�n a la Programaci�n I - Final", "Qu�mica - Final")

rama_CdD2_nodo_6 <- list ("Comunicaci�n de Datos I", "Sistemas Operativos I", 
                          "Algebra Lineal - Final", "Ciencias de la Computaci�n I - Final", "Introducci�n a la Programaci�n II - Final", "F�sica General - Final", "Matem�tica Discreta - Final")
names(rama_CdD2_nodo_6) <- c ("Comunicaci�n de Datos I", "Sistemas Operativos I", 
                              "Algebra Lineal - Final", "Ciencias de la Computaci�n I - Final", "Introducci�n a la Programaci�n II - Final", "F�sica General - Final", "Matem�tica Discreta - Final")

rama_CdD2_nodo_7  <- list ("Comunicaci�n de Datos II")
names(rama_CdD2_nodo_7) <- c ("Comunicaci�n de Datos II")

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



#----- Rama ICDI: Introducci�n al C�lculo Diferenci�l e Integral -----

rama_ICDI_nodo_1 <- list ("An�lisis Matem�tico I")
names(rama_ICDI_nodo_1) <- c ("An�lisis Matem�tico I")

rama_ICDI_nodo_2 <- list ("An�lisis Matem�tico II", 
                          "Algebra I - Final", "An�lisis Matem�tico I - Final", "Introducci�n a la Programaci�n I - Final", "Qu�mica - Final", 
                          "Algebra Lineal - Final", "Ciencias de la Computaci�n I - Final", "Introducci�n a la Programaci�n II - Final", "F�sica General - Final", "Matem�tica Discreta - Final")
names(rama_ICDI_nodo_2) <- c ("An�lisis Matem�tico II", 
                              "Algebra I - Final", "An�lisis Matem�tico I - Final", "Introducci�n a la Programaci�n I - Final", "Qu�mica - Final", 
                              "Algebra Lineal - Final", "Ciencias de la Computaci�n I - Final", "Introducci�n a la Programaci�n II - Final", "F�sica General - Final", "Matem�tica Discreta - Final")

rama_ICDI_nodo_3 <- list ("Introducci�n al C�lculo Diferencial e Integral")
names(rama_ICDI_nodo_3) <- c ("Introducci�n al C�lculo Diferencial e Integral")

#--- Agrupacion de los nodos ---

rama_ICDI <- list (rama_ICDI_nodo_1, rama_ICDI_nodo_2, rama_ICDI_nodo_3)
names(rama_ICDI) <- c ("AM I",
                       "AM II, AG I - F,\n AM I - F, IPROG I - F,\n Q - F, AL - F,\n CC I - F, IPROG II - F,\n FG - F, MD - F",
                       "ICDI")



#----- Rama AdCyTD: Arquitectura de Computadoras y T�cnicas Digitales -----

rama_AdCyTD_nodo_1 <- list ("An�lisis Matem�tico I")
names(rama_AdCyTD_nodo_1) <- c ("An�lisis Matem�tico I")

rama_AdCyTD_nodo_2 <- list ("F�sica General", "Introducci�n a la Programaci�n I")
names(rama_AdCyTD_nodo_2) <- c ("F�sica General", "Introducci�n a la Programaci�n I")

rama_AdCyTD_nodo_3 <- list ("Electricidad y Magnetismo", "Introducci�n a la Programaci�n II")
names(rama_AdCyTD_nodo_3) <- c ("Electricidad y Magnetismo", "Introducci�n a la Programaci�n II")

rama_AdCyTD_nodo_4 <- list ("Electr�nica Digital", "Introducci�n a la Arquitectura de Sistemas")
names(rama_AdCyTD_nodo_4) <- c ("Electr�nica Digital", "Introducci�n a la Arquitectura de Sistemas")

rama_AdCyTD_nodo_5 <- list ("Arquitectura de Computadoras I", 
                            "Algebra I - Final", "An�lisis Matem�tico I - Final", "Introducci�n a la Programaci�n I - Final", "Qu�mica - Final", 
                            "Algebra Lineal - Final", "Ciencias de la Computaci�n I - Final", "Introducci�n a la Programaci�n II - Final", "F�sica General - Final", "Matem�tica Discreta - Final")
names(rama_AdCyTD_nodo_5) <- c ("Arquitectura de Computadoras I", 
                                "Algebra I - Final", "An�lisis Matem�tico I - Final", "Introducci�n a la Programaci�n I - Final", "Qu�mica - Final", 
                                "Algebra Lineal - Final", "Ciencias de la Computaci�n I - Final", "Introducci�n a la Programaci�n II - Final", "F�sica General - Final", "Matem�tica Discreta - Final")


rama_AdCyTD_nodo_6 <- list ("Arquitectura de Computadoras y T�cnicas Digitales")
names(rama_AdCyTD_nodo_6) <- c ("Arquitectura de Computadoras y T�cnicas Digitales")



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
names(ramas_correlatividades) <- c("Ingenier�a de Software", "Fundamentos de Econom�a y Proyectos de Inversi�n", "Legislaci�n y Gesti�n Ambiental", "Organizaci�n Empresarial", 
                                   "Dise�o de Compiladores I", "Teor�a de la Informaci�n", "Comunicaci�n de Datos II", "Introducci�n al C�lculo Diferencial e Integral", "Arquitectura de Computadoras y T�cnicas Digitales")



#-------------------- Funciones para calcular la probabilidad de aprobar cada uno de los nodos que componen las ramas --------------------

#----- Funcion para generar matriz de probabilidades -----

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

calcular_probabilidades_de_aprobar_por_rama <- function (rama, cohorte, anios_retraso_considerados)
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
    probabilidades_por_rama_de_aprobar <- calcular_probabilidades_de_aprobar_por_rama(lista_ramas[[i]], cohorte, anios_retraso_considerados)
    matriz <- generar_matriz_probabilidades(probabilidades_por_rama_de_aprobar)
    matrices_probabilidades_cohorte[[i]] <- matriz
    rownames(matrices_probabilidades_cohorte[[i]]) <- c(sprintf(" nodo_%d ", 1:length(lista_ramas[[i]])), " nodo_final ")
    colnames(matrices_probabilidades_cohorte[[i]]) <- c(sprintf(" nodo_%d ", 1:length(lista_ramas[[i]])), " nodo_final ")
  }
  
  names(matrices_probabilidades_cohorte) <- names(lista_ramas)
  matrices_probabilidades_cohorte
}

#----- Calculo de las matrices de cada anio -----

matrices_probabilidades_datos_cohorte_2012 <- calcular_matrices_probabilidades(ramas_correlatividades, datos_cohorte_2012, 0)
matrices_probabilidades_datos_cohorte_2013 <- calcular_matrices_probabilidades(ramas_correlatividades, datos_cohorte_2013, 0)
matrices_probabilidades_datos_cohorte_2014 <- calcular_matrices_probabilidades(ramas_correlatividades, datos_cohorte_2014, 0)
matrices_probabilidades_datos_cohorte_2015 <- calcular_matrices_probabilidades(ramas_correlatividades, datos_cohorte_2015, 0)

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

lista_matrices <- c(matrices_probabilidades_datos_cohorte_2012, matrices_probabilidades_datos_cohorte_2013, matrices_probabilidades_datos_cohorte_2014, matrices_probabilidades_datos_cohorte_2015)
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
    text_legend <- c("Algebra I - AG I, An�lisis Matem�tico I - AM I", "Introducci�n a la Programaci�n I - IPROG I, Qu�mica - Q", 
                     "Algebra Lineal - AL, Ciencias de la Computaci�n I - CC I", "Introducci�n a la Programaci�n II - IPROG II, F�sica General - FG", "Matem�tica Discreta - MD, An�lisis Matem�tico II - AM II", 
                     "An�lisis y Dise�o de Algoritmos I - AyDA I, Ciencias de la Computaci�n II - CC II", "Electricidad y Magnetismo - EyM, Introducci�n a la Arquitectura de Sistemas - IAdeS", 
                     "An�lisis y Dise�o de Algoritmos II - AyDA II, Comunicaci�n de Datos I - CdD I", "Electr�nica Digital - ED, Ingl�s - I", "Probabilidades y Estad�stica - PyE, Arquitectura de Computadoras I - AdC I", 
                     "Estructuras de Almacenamiento de Datos - EAdD", "Metodolog�as de Desarrollo de Software I - MDdeS I", "Programaci�n Orientada a Objetos - PROGOO I, Bases de Datos I - BdD I", 
                     "Investigaci�n Operativa I - IO I, Lenguajes de Programaci�n I - LdP I", "Programaci�n Exploratoria - PE, Sistemas Operativos I - SO I",
                     "Arquitectura de Computadoras y T�cnicas Digitales - AdCyTD", "Comunicaci�n de Datos II - CdD II", "Introducci�n al C�lculo Diferencial e Integral - ICDI, Teor�a de la Informaci�n - TdI", 
                     "Dise�o de Compiladores I - DdC I, Dise�o de Sistemas de Software - DSdeS", 
                     "Ingenier�a de Software - IdS, Fundamentos de Econom�a y Proyectos de Inversi�n - FeyPI", 
                     "Legislaci�n y Gesti�n Ambiental - LyGA, Organizaci�n Empresarial - OE")
    legend("center",
           legend = text_legend,
           cex=0.55, 
           y.intersp = 0.27,
           text.width = strwidth(text_legend)[4]/4,
           lty)
  }
}

cadenas_markov_2012 <- obtener_cadenas(matrices_probabilidades_datos_cohorte_2012)
cadenas_markov_2013 <- obtener_cadenas(matrices_probabilidades_datos_cohorte_2013)
cadenas_markov_2014 <- obtener_cadenas(matrices_probabilidades_datos_cohorte_2014)
cadenas_markov_2015 <- obtener_cadenas(matrices_probabilidades_datos_cohorte_2015)
cadenas_markov_promedio <- obtener_cadenas(promedio_probabilidades_cohortes)

graficar_cadenas(matrices_probabilidades_datos_cohorte_2012, ramas_correlatividades, "2012", "light blue")
graficar_cadenas(matrices_probabilidades_datos_cohorte_2013, ramas_correlatividades, "2013", "pink")
graficar_cadenas(matrices_probabilidades_datos_cohorte_2014, ramas_correlatividades, "2014", "light yellow")
graficar_cadenas(matrices_probabilidades_datos_cohorte_2015, ramas_correlatividades, "2015", "gray")
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
  
  etiquetas <- c(paste ("terminaron con",paste (anio_retraso, " a�os de retraso", sep = " "), sep = " "), "no terminaron")
  etiquetas <- paste (etiquetas, porcentaje, sep = "\n")
  etiquetas <- paste (etiquetas, "%", sep = "")
  pie (c(aprobados, total), labels = etiquetas, col = c("green", "red"),  main = paste (paste ("Estudiantes que finalizaron vs Estudiantes que no finalizaron\n - Cohorte", anio_cohorte, sep = " "), anio_retraso, sep = " . A�os de retraso: "))
}

alumnos_terminan_cada_rama_2012 <- obtener_legajos_alumnos_terminan_cada_rama(ramas_correlatividades, datos_cohorte_2012, 0)
alumnos_terminan_2012 <- obtener_legajos_alumnos_terminan(alumnos_terminan_cada_rama_2012)

graficar_torta (alumnos_terminan_2012, datos_cohorte_2012, 0, "2012")

alumnos_terminan_2012
obtener_probabilidad_de_terminar(alumnos_terminan_2012, datos_cohorte_2012)

alumnos_terminan_cada_rama_2013 <- obtener_legajos_alumnos_terminan_cada_rama(ramas_correlatividades, datos_cohorte_2013, 0)
alumnos_terminan_2013 <- obtener_legajos_alumnos_terminan(alumnos_terminan_cada_rama_2013)

graficar_torta (alumnos_terminan_2013, datos_cohorte_2013, 0, "2013")

alumnos_terminan_2013
obtener_probabilidad_de_terminar(alumnos_terminan_2013, datos_cohorte_2013)

alumnos_terminan_cada_rama_2014 <- obtener_legajos_alumnos_terminan_cada_rama(ramas_correlatividades, datos_cohorte_2014, 0)
alumnos_terminan_2014 <- obtener_legajos_alumnos_terminan(alumnos_terminan_cada_rama_2014)

graficar_torta (alumnos_terminan_2014, datos_cohorte_2014, 0, "2014")

alumnos_terminan_2014
obtener_probabilidad_de_terminar(alumnos_terminan_2014, datos_cohorte_2014)

alumnos_terminan_cada_rama_2015 <- obtener_legajos_alumnos_terminan_cada_rama(ramas_correlatividades, datos_cohorte_2015, 0)
alumnos_terminan_2015 <- obtener_legajos_alumnos_terminan(alumnos_terminan_cada_rama_2015)

graficar_torta (alumnos_terminan_2015, datos_cohorte_2015, 0, "2015")

alumnos_terminan_2015
obtener_probabilidad_de_terminar(alumnos_terminan_2015, datos_cohorte_2015)


#-------------------- Analizando cada materia en particular --------------------

#----- Funcion para obtener cuantos aprueban, promocionan, reprueban, y est�n ausentes o abandonaron por materia -----

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

#----- Funcion para graficar cuantos aprueban, promocionan, reprueban, y est�n ausentes o abandonaron una materia en particular -----

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


resultados_2012 <- obtener_resultados_cursadas_por_materia(datos_cohorte_2012, 0)
resultados_2013 <- obtener_resultados_cursadas_por_materia(datos_cohorte_2013, 0)
resultados_2014 <- obtener_resultados_cursadas_por_materia(datos_cohorte_2014, 0)
resultados_2015 <- obtener_resultados_cursadas_por_materia(datos_cohorte_2015, 0)

graficar_resultado_cursada(resultados_2012, "2012", "Algebra I")

probabilidades_por_materia_2012 <- calcular_probabilidades_por_materia(datos_cohorte_2012, 0, c("R"))
probabilidades_por_materia_2012

probabilidades_por_materia_2013 <- calcular_probabilidades_por_materia(datos_cohorte_2013, 0, c("R"))
probabilidades_por_materia_2013

probabilidades_por_materia_2014 <- calcular_probabilidades_por_materia(datos_cohorte_2014, 0, c("R"))
probabilidades_por_materia_2014

probabilidades_por_materia_2015 <- calcular_probabilidades_por_materia(datos_cohorte_2015, 0, c("R"))
probabilidades_por_materia_2015

