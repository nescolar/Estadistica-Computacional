install.packages("tidyverse")
library(tidyverse)
# cargar los datos ----
# Censo de estados unidos del a?o 2015
setwd("/Users/nataliangaritaescolar/Documents/Manipulacion/dataset")
counties <- readRDS(file = "counties.rds")

# imprimir
counties

# use la funcion glimpse al igual que str() te da el resumen de la estructura de los datos
glimpse(counties)

# ahora, asignar Factor a las variables categóricas
counties$state  <- factor(counties$state)
counties$census_id <- factor(counties$census_id)
counties$county <- factor(counties$county)
counties$region <- factor (counties$region)
counties$metro <- factor(counties$metro)

# funcion select ----
# nos ayuda a seleccionar las columnas y así crear un nuevo frame
# Ejemplo 1 

counties %>%
  select(state,county, population,unemployment) -> counties_select

# estructura de counties_select
str(counties_select)

# funcion arrange ----
# nos ayuda a ordenar las columnas 

# Ejemplo 1 
counties_select %>%
  arrange(population)

# Ejemplo 2 
# ordenar de forma descendente unemployment
counties_select %>%
  arrange(desc(unemployment))

# funcion filter ----
# nos ayuda a seleccionar filas segun las operaciones logicas 

# Ejemplo 1 
counties_select %>%
  arrange(desc(population)) %>% 
  filter(state == "New York")

# Ejemplo 2 
counties_select %>%
  arrange(desc(population)) %>% 
  filter(unemployment < 6) %>% 
  arrange(desc(unemployment))

# Ejemplo 3 
# combinacion de condiciones
counties_select %>%
  arrange(desc(population)) %>% 
  filter(unemployment < 6,state == "New York")

# Ejercicio 1 ----
counties %>%
  # selecciona las columnas (state, county, population, public_work, self_employed)
  select(state, county, population, public_work, self_employed)%>% 
  # Filtrar por Texas y m?s de 10000 personas
 filter(state == "Texas", population > 10000) %>%
  # ordenar en orden descendente de public_work
  arrange(desc(public_work))

# funcion mutate
# esta funcion agrega columnas o cambia las existentes

# Ejemplo 1 
counties %>%
  select(state,county, population,unemployment)%>%
  mutate(population_unemployment = (population * unemployment )/100)

# Ejercicio 2 ----
counties %>%
  # selecciona las columnas (state, county, population, men, women)
  select(state, county, population, men, women)%>%
  # Calcula la proporcion de mujeres: proportion_women
  mutate(proportion_women = women/population)%>%
  # Filtrar por New York y menos de 30000 personas
  filter(state == "New York", population < 30000)%>%
  # ordenar en orden descendente por proporcion de mujeres
  arrange(desc(proportion_women))

# funcion count ----
# esta funcion nos sirve para contar

# Ejemplo 1 = Cuantas filas hay en el dataframe
counties %>%
  count()

# Ejemplo 2
counties %>%
  count(state)

# Ejemplo 3
counties %>%
  count(state, sort= TRUE)

# Ejemplo 4. Encontrar el numero total de personas cada estado
counties %>%
  count(state, wt = population, sort= TRUE)

# Ejercicio 3 ----
counties %>%
  # selecciona las columnas (county state, population, walk)
  select(county, state, population, walk)%>%
  # Adiciona la columna population_walk que contiene el numero de perosnas que caminan para el trabajo 
  mutate(population_walk =(population*walk)/100)%>%
  # Cuenta considerando la nueva columna y ordena de forma descendente
  count(state, wt = population_walk, sort = TRUE)


# funcion summarize ----
# esta funcion hace un resumen número por variable, donde toma muchas observaciones y las convierte
# en una sola observacion
# resumen de una variable
# Ejemplo 1 
counties %>%
  summarize(total = sum(population),
            average_unemployment = mean(unemployment),
            desv_estandar = sd(unemployment),
            mediana = median(unemployment),
            min = min(unemployment),
            max = max(unemployment),
            q1_unempl = quantile(unemployment)[2],
            q3_unempl = quantile(unemployment)[4]
            ) 


# funcion group_by ----
# esta funcion hace grupos, en especial para variables categoricas

# Calcular por estado, el promedio, desviación, etc...

# Ejemplo 1 
counties %>%
  group_by(state)%>%
  summarize(total = sum(population),
            average_unemployment = mean(unemployment),
            desv_estandar = sd(unemployment),
            mediana = median(unemployment),
            min = min(unemployment),
            max = max(unemployment),
            q1_unempl = quantile(unemployment)[2],
            q3_unempl = quantile(unemployment)[4]
  ) -> A

# Ejemplo 2 
counties %>%
  group_by(state)%>%
  summarize(total = sum(population),
            average_unemployment = mean(unemployment)) %>%
  arrange(average_unemployment)

# Siempre se agrupa por variable categórica
# Ejemplo 3
counties %>%
  group_by(state, metro)%>%
  summarize(total_pop = sum(population))%>%
  ungroup()


# Ejercicio 4 ----
counties %>%
  # selecciona las columnas (state, county, population, land_area)
  select(state, county, population, land_area)%>%
  # realiza grupos por estados
  group_by(state)%>%
  # calcula el total del area y el total de la poblacion
  summarize(total_pop = sum(population), total_land = sum(land_area))%>%
  # Adiciona la columna density: es el numero de personas por metro cuadrado
  mutate(density = total_pop/total_land)%>%
  # Ordena de manera descendiente density
  arrange(desc(density))

# funcion top_n ----
# esta funci?n sirve para mantener las observaciones m?s extremas de cada grupo

# ejemplo 1
counties %>% 
  select(state, county, population, unemployment, income) %>%
  group_by(state) %>%
  top_n(1,population) # encuentra un condado con la poblaci?n m?s alta

# ejemplo 2
counties %>% 
  select(state, county, population, unemployment, income) %>%
  group_by(state) %>%
  top_n(3,unemployment)

# Ejercicio 5 ----
counties %>%
  # selecciona las columnas (region, state, county, metro, population, walk)
  select(region, state, county, metro, population, walk)%>%
  # realiza grupos por region
  group_by(region)%>%
  # Encuentra el numero m?s grande ciudadanos que caminan para trabajar
  mutate(population_walk =(population*walk)/100)%>%
  top_n(1, population_walk)

# Ejercicio 6 ----
counties %>%
  # selecciona las columnas (region, state, county, metro, population, walk)
  select(region, state, county, metro, population, walk,income)%>%
  # realiza grupos por region y estado
  group_by(state, region)%>%
  # Calcula el promedio income
  mutate(prom_income = mean(income))%>%
  # Encuentre el ingreso m?s alto por estado en cada region
  top_n(1, income)

# Ejercicio 7 ----
counties %>%
  # selecciona las columnas (state, county, population, land_area) 
  select(state, county, population, land_area, metro)%>%
  # Encuentre la poblacion total por la cada estado y metro
  group_by(state, metro)%>%
   summarize(total_pop_state = sum(population))%>%
  # Extrae la fila con mas poblaci?n por estado 
  top_n(1, total_pop_state)%>%
  # # Cuenta los estados con m?s personas en ?reas metropolitanas o no metropolitanas
  count(metro, wt = total_pop_state, sort = TRUE)

# Otras formas de usar select ----

# Ejemplo 1: Una forma
counties %>%
  select(state, county, population, unemployment)

# Ejemplo 2: seleccionando un rango
counties %>%
  select(state, county, drive:work_at_home)

# Ejemplo 3: Seleccionar y ordenar
counties %>%
  select(state, county, drive:work_at_home) %>%
  arrange(drive)

# Ejemplo 4: seleccionar usando contains
counties %>%
  select(state, county, contains("work"))

# Ejemplo 5: seleccionar usando starts_with
counties %>%
  select(state, county, starts_with("income"))

# Hay otras más ends_with() y last_col()
# puede apoyar de la ayuda buscando ?select_helpers

# Ejemplo 6: seleccionar removiendo
counties %>%
  select(-census_id)

# Ejercicio 8 ----
counties %>%
  # Selecciona el estado, el condado, la población y los que terminan en "trabajo
  select(state, county, population, ends_with('work'))%>%
  # Filtrar los condados que tienen al menos el 50% de la población dedicada al trabajo público
  group_by(county)%>%
  filter(public_work > 49.9)
  
# funcion rename ----
# Esta funcion puede cambiar el nombre de las columnas

# Ejemplo 1: una forma
counties %>%
  select(state, county, population, unemployment) %>%
  rename(unemployment_rate = unemployment)

# Ejemplo 2: segunda forma
counties %>%
  select(state, county, population, unemployment_rate = unemployment)

# Ejercicio 9 ----
counties%>%
  # Cuente el número de condados de cada estado
count(state)%>%
  # renombrar la columna n por num_counties
  rename(nun_counties = n)

# funcion transmute ----
# Esta funcion es una combinacion con select y mutate

# Ejemplo 1
counties %>%
  transmute(state, county, fraction_men = men / population)

# Ejemplo 2
counties %>%
  transmute(state, county, population,
            unemployed_people = population * unemployment / 100)


# Ejercicio 10 ----
counties %>%
  # Mantenga las columnas de state, state, county, y population,
  # y agregue la columna density (poblacion por metro cuadrado (land_area))
  transmute(state, county, population, 
            density = population*land_area) %>%
  # Filtrar por county con una población superior a un millón 
  filter(county == county, population > 1000000)%>%
  # Ordena la densidad en orden ascendente 
  arrange(density)
