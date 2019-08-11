# data_paso2019
Datos correspondientes a los resultados parciales de las elecciones PASO 2019, disponibilizados por la Dirección Nacional Electoral.

Indicaciones básicas:
En master están los archivos más recientes, es decir, los últimos resultados.
Las ramas (branch) que se abren están denominadas con el timestamp DDMMAA-HHMMSS en el que se dieron a conocer.

Para tomar estos datos con R, se puede ejecutar el siguiente código:
install.packages('tidyverse') # POR ÚNICA VEZ
library('readr') # POR ÚNICA VEZ

branch = 'master' # _master_ implica tener los datos más recientes, caso contrario reemplazar con el timestamp deseado

git_postulaciones = paste('https://raw.githubusercontent.com/ervinwilneder/data_paso2019/', branch, '/descripcion_postulaciones.dsv', sep = '')
git_regiones = paste('https://raw.githubusercontent.com/ervinwilneder/data_paso2019/', branch, '/descripcion_regiones.dsv', sep = '')
git_totales = paste('https://raw.githubusercontent.com/ervinwilneder/data_paso2019/', branch, '/medios_totales.dsv', sep = '')
git_totales_agrp = paste('https://raw.githubusercontent.com/ervinwilneder/data_paso2019/', branch, '/medios_totales_agrp_politica.dsv', sep = '')
git_totales_agrp_nac = paste('https://raw.githubusercontent.com/ervinwilneder/data_paso2019/', branch, '/medios_totales_agrp_politica_nac.dsv', sep = '')
git_totales_lista = paste('https://raw.githubusercontent.com/ervinwilneder/data_paso2019/', branch, '/medios_totales_lista.dsv', sep = '')

descripcion_postulaciones = read_delim(git_postulaciones, '|', col_names = TRUE)
descripcion_regiones = read_delim(git_postulaciones, '|', col_names = TRUE)
medios_totales = read_delim(git_postulaciones, '|', col_names = TRUE)
medios_totales_agrp_politica = read_delim(git_postulaciones, '|', col_names = TRUE)
medios_totales_agrp_politica_nac = read_delim(git_postulaciones, '|', col_names = TRUE)
medios_totales_lista = read_delim(git_postulaciones, '|', col_names = TRUE)
