
# Punto 1 ----
#Genere un vector aleatorio de distribucióń ga ma ero de observaciones 60,
#forma (shape) igual a 4 y escala (scale) igual a 1.5. 
#Use set.seed(2025). Realice los siguientes:

set.seed(2025)
A <- rgamma(60, shape = 4, scale = 1.5)

# i) Calcule la media y la desviaćion est ́ndar del vector. 
mean(A)
sd(A)

# ii) Extraiga los valores que son múltiplos de 2.
A_2 <- round(A)
multiplo_2 <- A_2[A_2 %% 2 == 0]
multiplo_2

# Ordenelos en orden ascendente.
sort(multiplo_2)

# Extraiga los valores que esta ́n entre 5 y 10.
A_2[A_2 > 5 & A_2 < 10]

# Punto 2 ----

# Indique el paquete al que pertenece cada conjunto de datos.

# a) airquality <- New York Air Quality Measurements
view(airquality)

# Medida diaria de la calidad del aire de New York, entre los meses de Mayo y septiembre de 1973
# Data frame con 153 observaciones en 6 variables (Ozono = numerica), (Solar.R = numerica), (Wind = numerica)
# (Temp = numerica), (Month = numerica), (Day = numerica)

# b) PlantGrowth <- Results from an Experiment on Plant Growth
view(PlantGrowth)

# Data frame con 30 observaciones en 2 varibales: (Peso = númerica) y (Grupo = Categórica)
# Resultados de un experimento para comparar los rendimientos (medidos por el peso seco de las plantas) 
# obtenidos  bajo un control y dos condiciones de tratamiento diferentes.

install.packages("tidyverse")
install.packages('dyplyr')

data(airquality)
airquality$Month <- factor(airquality$Month)

airquality %>%
  na.omit(x = Ozone(NA))%>%  
  group_by(Month) %>%  
  summarize(
    mean_ozone = mean(Ozone), 
    sd_ozone = sd(Ozone),       
    min_ozone = min(Ozone),     
    max_ozone = max(Ozone)    
  )

# Punto 3 ----

#Se define una variable example <- "learning R is both fun and challenging". 
# Esta variable se ha dividido en un vector que contiene letras separadas y se ha a
#almacenado en un vector chars con la funcio ́n strsplit().
# ¿Puedes escribir un co ́digo que cuente el nu ́mero de l’s que vienen
# antes de la primera f en example?

example <- 'learning R is both fun and challenging'
chars <- unlist(strsplit(example, ''))
grep(pattern = 'f', x = chars) 
num_l <- sum(chars[1:20] == 'l')
num_l 

# R: hay en total 1 letra 1 (posición 1), antes de la f (posición 20)

# Punto 4 ----

# Suponga que hay una urna con 5 bolas rojas, 3 bolas verdes y 2 bolas azules. 
#Realice un script que simule extracciones con reemplazo hasta que se extraigan 6 bolas rojas. 
#Debe mostrar el historial de colores extra ́ıdos.

urna <- c('rojo', 'rojo', 'rojo', 'rojo', 'rojo', 'verde', 'verde', 'verde', 'azul', 'azul')
historial <- c()
bola_roja <- 0
while (bola_roja < 6) {
  b_extraida <- sample(urna, 1, replace = T)
  historial <- c(historial, b_extraida)
  if (b_extraida == 'rojo') {
    bola_roja <- bola_roja + 1
  }
}
print(historial)

# Punto 5 ---- 

# Escriba una funcio ́n () r i c) que imprima el rango intercuart ́ılico
# de una variable aleatoria con distribucio ́n Poisson de longitud 100 y
# media igual a 7. Debe calcular el rango intercuart ́ılico desde su definici ́on
# sin usar la funcio ́n quantile dentro del cuerpo de la funcio ́
#. Dentro de la funcio ́n, debe utilizar. paste en su programa


data <- rpois( 100, lambda = 7)

q1 = quantile(data, 0.25)
q3 = quantile(data, 0.75)

r_i_c <- function() { 
    data <- rpois( 100, lambda = 7)
    IQR <- q3 - q1
    paste("El rango intercuartílico es:", IQR)
}

r_i_c()

# Punto 6 ----

# l conjunto de datos llamado honey production, que se encuentra en la carpeta de datos de Teams, 
#se refiere a la producci ́on de miel de dos especies de abejas (b73 = abeja italiana y b75 = abeja africana
# en dos ubicaciones (monta~na y valle) La variable produccion es la cantidad de miel producida 
#por cada colmena en kilogramos.

honey_production <- read.delim('honey_production.txt', 
                               sep = "", stringsAsFactors = TRUE
                               )
# Resumen de mi data frame
str(honey_production)

# 3 primeras filas 
head(honey_production, 3)
# Renombrar las especies 
honey_production %>% 
mutate(
  especie = sub(pattern = 'b73',replacement = 'abeja italiana', x = especie),
  especie = sub(pattern = 'b75',replacement = 'abeja africana', x = especie)
)

# # Colmenas con producción menor a 20 kg

baja_product <- honey_production %>%
  filter(produccion < 20) %>% 

baja_product 

# 5 colmenas con producción más alta
alta_product <- honey_production %>%
top_n(5, produccion) %>% 
arrange(desc(alta_product))

print(alta_product)

# Hay tratamientos recomendados para cada ubicaci ́on que mejoran la salud de las
# abejas y su produccion. La siguiente tabla muestra la relacio ́n entre ubicaci ́on y tratamiento:


ubicacion = c("montaña", "valle", "montaña", "valle")
tratamiento = c("Tratamiento-X", "Tratamiento-Y", "Tratamiento-Z", "Tratamiento-W") 
health_care = data.frame(ubicacion, tratamiento)
health_care

# Nuevo data frame

bee_treatment <- honey_production %>%
  left_join(health_care, by = "ubicacion")
print(bee_treatment) 

# Producción total 

prod_total_trat <- 
bee_treatment %>% 
  group_by(tratamiento) %>% 
  mutate(prod_total = sum(produccion))
  
print(prod_total_trat)

