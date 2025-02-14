# CONDICIONALES 

# Ejemplo 1 ----

# IF - Si la condición se cumple

x <- -3
if (x < 0) { 
  print('x es un número negativo')
  }

# IF/ELSE 
# Cuando hay dos condiciones, o es una o es la otra 
x <- -1

if (x < 0) {
  print('x es un número negativo')
} else {
  print('x es un número positivo o cero') 
}

ifelse(x < 0,
       ('x es un número negativo'), 
       ('x es un número positivo o cero'))

#ELSE IF 

x <- -2
if (x < 0) {
  print('x es un número negativo')
} else if (x == 0) {
  print('x es cero')
} else {
  print( 'x es un número positivo')
}
  
# FUNCIONES

# Ejemplo 11 ----
suma <- function(x,y) {
  res <- x + y
  return(res)
}
suma (1,3)


fun <- function(){
  suma <- 0
  veces <- 0
  while (suma <= 3) {
    suma <- suma + runif(1)
    veces <- veces + 1
  }
  return(veces)
}
fun ()


# Ejemplo 12 ----
# aplica una lista
nyc <- list(pop = 8405837, 
            boroughs = c('Manhattan', 'Bronx', 'Brooklyn', 'Queens', 'Staten Island'),
            capital = FALSE)

for (info in nyc) {
  print( class (info))
}
unlist(lapply(nyc, class)) 
sapply(nyc, class) # arroja un vector

# Ejemplo 13 ----

unlist(lapply(cities, nchar))
sapply(cities, nchar)

# Ejemplo 14 ----
animales <- c('gato','raton','hormiga','oso','tigre') 
# funcion grepl = vector lógico de quienes cumplen la condición
grepl(pattern = 'a', x = animales)
grepl(pattern = '^o', x = animales)
grepl(pattern = 'o$', x = animales) 
# funcion grep = posición de los que cumplen 
grep(pattern = 'a', x = animales) 
grep(pattern = '^o', x = animales) 
grep(pattern = 'o$', x = animales) 
# funcion sub
sub(pattern = 'a',replacement = 'o', x = animales)
gsub(pattern = 'a',replacement = 'o', x = animales) 
gsub(pattern = 'a|i',replacement = '-', x = animales) 
gsub(pattern = 'a|e|i|o',replacement = '_', x = animales)

