install.packages('tidyverse') # POR ÚNICA VEZ
library('readr') # POR ÚNICA VEZ

branch = 'master' # master implica tener los datos más recientes, caso contrario agregar el timestamp deseado (ver en GitHub). Ej: 'master/100819-220057'

git_postulaciones = paste('https://raw.githubusercontent.com/ervinwilneder/data_paso2019/', branch, '/descripcion_postulaciones.dsv', sep = '')
git_regiones = paste('https://raw.githubusercontent.com/ervinwilneder/data_paso2019/', branch, '/descripcion_regiones.dsv', sep = '')
git_totales = paste('https://raw.githubusercontent.com/ervinwilneder/data_paso2019/', branch, '/medios_totales.dsv', sep = '')
git_totales_agrp = paste('https://raw.githubusercontent.com/ervinwilneder/data_paso2019/', branch, '/medios_totales_agrp_politica.dsv', sep = '')
git_totales_agrp_nac = paste('https://raw.githubusercontent.com/ervinwilneder/data_paso2019/', branch, '/medios_totales_agrp_politica_nac.dsv', sep = '')
git_totales_lista = paste('https://raw.githubusercontent.com/ervinwilneder/data_paso2019/', branch, '/medios_totales_lista.dsv', sep = '')

descripcion_postulaciones = read_delim(git_postulaciones, '|', col_names = TRUE)
descripcion_regiones = read_delim(git_regiones, '|', col_names = TRUE)
medios_totales = read_delim(git_totales, '|', col_names = TRUE)
medios_totales_agrp_politica = read_delim(git_totales_agrp, '|', col_names = TRUE)
medios_totales_agrp_politica_nac = read_delim(git_totales_agrp_nac, '|', col_names = TRUE)
medios_totales_lista = read_delim(git_totales_lista, '|', col_names = TRUE)