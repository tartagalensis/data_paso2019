###### POR ÚNICA VEZ ######
install.packages('tidyverse')
library('readr') 
library('dplyr')
###########################

branch = 'master' # master implica tener los datos más recientes, caso contrario agregar el timestamp deseado (ver en GitHub). Ej: 'master/100819-220057'

git_postulaciones = paste('https://raw.githubusercontent.com/ervinwilneder/data_paso2019/', branch, '/descripcion_postulaciones.dsv', sep = '')
git_regiones = paste('https://raw.githubusercontent.com/ervinwilneder/data_paso2019/', branch, '/descripcion_regiones.dsv', sep = '')
git_totales = paste('https://raw.githubusercontent.com/ervinwilneder/data_paso2019/', branch, '/medios_totales.dsv', sep = '')
git_totales_agrp = paste('https://raw.githubusercontent.com/ervinwilneder/data_paso2019/', branch, '/medios_totales_agrp_politica.dsv', sep = '')
git_totales_agrp_nac = paste('https://raw.githubusercontent.com/ervinwilneder/data_paso2019/', branch, '/medios_totales_agrp_politica_nac.dsv', sep = '')
git_totales_lista = paste('https://raw.githubusercontent.com/ervinwilneder/data_paso2019/', branch, '/medios_totales_lista.dsv', sep = '')
git_distritos = 'https://raw.githubusercontent.com/ervinwilneder/data_paso2019/master/descripcion_distritos.csv'

descripcion_postulaciones = read_delim(git_postulaciones, '|', col_names = TRUE)
descripcion_regiones = read_delim(git_regiones, '|', col_names = TRUE)
medios_totales = read_delim(git_totales, '|', col_names = TRUE)
medios_totales_agrp_politica = read_delim(git_totales_agrp, '|', col_names = TRUE)
medios_totales_agrp_politica_nac = read_delim(git_totales_agrp_nac, '|', col_names = TRUE)
medios_totales_lista = read_delim(git_totales_lista, '|', col_names = TRUE)
distritos = read_delim(git_distritos, ';' , col_names = TRUE)

regiones = rename(descripcion_regiones, CODIGO_SECCION = "CODIGO_REGION")
agrupacion = select(descripcion_postulaciones, CODIGO_AGRUPACION, NOMBRE_AGRUPACION) %>% distinct
categoria = select(descripcion_postulaciones, CODIGO_CATEGORIA, NOMBRE_CATEGORIA) %>% distinct
lista = select(descripcion_postulaciones, CODIGO_LISTA, NOMBRE_LISTA) %>% distinct

totales_agrp_politica = left_join(medios_totales_agrp_politica, agrupacion, by = NULL) %>% 
  left_join(categoria, by = NULL) %>% 
  left_join(distritos, by = NULL) %>% 
  left_join(regiones, by = NULL)
totales_agrp_politica = totales_agrp_politica %>% 
  select(NOMBRE_AGRUPACION, NOMBRE_CATEGORIA, NOMBRE_DISTRITO, NOMBRE_REGION, VOTOS_AGRUPACION, VOTOS_VALIDOS)
View(totales_agrp_politica)

totales_agrp_politica_nac = left_join(medios_totales_agrp_politica_nac, agrupacion, by = NULL) %>% 
  left_join(categoria, by = NULL) %>% 
  left_join(descripcion_regiones, by = NULL)
totales_agrp_politica_nac = totales_agrp_politica_nac %>% 
  select(NOMBRE_AGRUPACION, NOMBRE_CATEGORIA, NOMBRE_REGION, VOTOS_AGRUPACION, VOTOS_VALIDOS)
View(totales_agrp_politica_nac)

totales = left_join(medios_totales, categoria, by = NULL) %>% 
  left_join(regiones, by = NULL) %>% 
  left_join(distritos, by = NULL)
totales = totales %>% 
  select(NOMBRE_CATEGORIA, NOMBRE_REGION, NOMBRE_DISTRITO, MESAS_HABILITADAS, MESAS_COMPUTADAS, CONTADOR, VALOR)
View(totales)

totales_lista = left_join(medios_totales_lista, lista, by = NULL) %>% 
  left_join(agrupacion, by = NULL) %>% 
  left_join(categoria, by = NULL) %>% 
  left_join(regiones, by = NULL) %>% 
  left_join(distritos, by = NULL)
totales_lista = totales_lista %>% 
  select(NOMBRE_LISTA, NOMBRE_AGRUPACION, NOMBRE_CATEGORIA, NOMBRE_REGION, NOMBRE_DISTRITO, VOTOS_LISTA)
View(totales_lista)
