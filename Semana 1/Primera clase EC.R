library(tidyverse)
# Ejemplo a ----
a = 3
4 -> b # nombrar objetos 
d <- 5 
b <- 6
A <- 5

# Ejemplo 1 ----
errores <- c(1.9, -2.6, 4.0, -9.5, -3.4, 7.3)
sum(abs(round(errores)))     # valores absolutos de los números abs
vec1 <- c(1.5, 2.5, 8.4, 3.7, 6.3)    
vec2 <- rev(vec1) 
vec3 <- c(vec1, vec2)     # C antes de parentesís es concatenar (unir)

mean(c(abs(vec1), abs(vec2)), trim = 0.2)
mean(0.2,c(abs(vec1), abs(vec2)))
     
mean(x = c(abs(vec1), abs(vec2), trim = 0.2)) 

# Ejemplo 2 ----
poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')


# Ejemplo 3 ----
poker_wednesday <- poker_vector[3]
poker_midweek <- poker_vector[c(2,3,4)]
rouette_select_vector <- roulette_vector [2:5]

# Ejemplo 4 ----
x <- c(2.1, 4.2, 3.3, 5.4)
x [c(3,1)] # especificar posiciones
x [c(3,1,1)]
order(x) # ordernar de menor a mayor 
x[order(x)] # ordenar de menor a mayor los elementos del vector
rev(X[order(x)]) # ordenar de mayor a menor los elementos del vector


# Ejemplo 5 ----
x[-1] # Quitar un elemento del vector. Debes incluir el menos y la posición del elemento a quitar
x[c(-1,-3)] # Tambien lo puedes escribir X[-c(1,3)]


# Ejemplo 6 ----
# Permite que el vector solo reconozca los elementos que entienda como verdaderos 

x[c(T,F)]
x[c(T,F,NA,F)]
x[c(T,NA)]


# Ejemplo 7 ----

y <- setNames(x, letters[1:4])
y[c('a', 'b', 'a')]
x[y[c('a', 'a', 'a')]]


# Ejemplo 8 ----

sort(poker_vector)
sort(x = poker_vector, decreasing = TRUE)
names(poker_vector) = c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
names(roulette_vector) <- days_vector
total_diario <- poker_vector+roulette_vector
total_poker <- sum(poker_vector)
total_roulette <- sum(roulette_vector)
total_week <- total_poker+total_roulette

# Promedio del poker de los días martes, miercoles y jueves
mean(poker_vector[2:4])

# Ejercicio 1 ----
# Sea x = (3, 4, 6, 9, 3, 9, 10, 7, 7, 2) Hallar (1/(n-1)*suma de las posiciones de h) donde n es el total de datos 

h <- c(3,4,6,9,3,9,10,7,7,2)
j <- sum(h)
n <- length(h)
(1/(n-1))*j

# Ejemplo 9 ----
# | = o 

2 == 2
'a' > 'b'
TRUE <= FALSE
5 + 3 == 8 & 4 == 8/2

# Qué dias has ganado jugando al poker
poker_vector > 0 
poker_vector < 0
poker_vector [poker_vector > 0]
roulette_vector < 0
roulette_vector [roulette_vector < 0]

x > 3
x [x > 3]

# Ejemplo 10 
# Crear un vector de secuencia de 1 a 10, es lo mismo que hacer 1:10
seq(1,10)
seq(1, 10, by=2)
# Vector de réplica
rep(1: 4,4)
rep(c('x', 'y', 'z'), 3)

# simular una distribución normal con media = 10, varianza = 4 
mu <- 10
sigma <- 2 
# Para generar de manera aleatoria un vector que siga los parámetros dados
set.seed(12)
rnorm(n = 10, mean = 10, sd = 2)

# Ejemplo 11 ----
# MATRICES 
# nrow es número de filas, y ncol número de columnas. Para que la matriz se escriba por numero de filas, se coloca nrow = TRUE

A <- matrix(1:9, nrow = 3, byrow = TRUE)
dim(A)
B <- matrix(c(1,2,3,-1,2,-5,8,3,2), nrow = 3, ncol = 3, byrow = FALSE)
A[2,1] # mirar la posición en la matriz
A[1,] # ver fila sin especificar columna
A [,2]
A [-3,-3] # quitar la columna y la fila 3 
A + B # suma de matrices 
A - B # resta de matrices 
A%*%B # multiplicación de matrices
det(A) # determinante de la matriz, ojo, que debe ser diferente de 0. En este caso A no cumple
det(B) # El resultado de B es diferente de 0, luego podemos calcular su inversa
solve(B) # Inversa de B

D <- matrix(c(1,1,3,-2), nrow = 2, ncol = 2, byrow = T)
R = matrix(c(1,3), nrow = 2, byrow = T)
det(D)
solve(D)
solve(D)%*%R #resultado 

## Ejemplo 12 ----
sex_vector <- c('Male', 'Female', 'Female', 'Male', 'Male')
factor_sex_vector <- factor(sex_vector)
summary(factor_sex_vector)
temperature_vector <- c('High', 'Low', 'High', 'Low', 'Medium')
factor_temperature_vector <- factor(temperature_vector, ordered = TRUE, levels = c('Low', 'Medium', 'High')) # Se organiza la variable categorica, ordinal (Es decir, se ordena)

# Ejemplo 13 ----
# Marco de datos 

mtcars
df <- mtcars
df$vs <- factor(df$vs) #convertir la variable en factor
df$am <- factor(df$am)
summary(df)

head(df) # 5 primeras filas 
tail(df) # 5 últimas filas
str(df) # resumen de los datos 

df$cyl_menorigual5 <- df[df$cyl <= 5,]
df[df$cyl == 5 | df$cyl == 6,] # Identificar autos con cilindraje de 5 o 6

# cambiar un elemento en una columna 
df$mpg[1] <- 25


#Ejemplo 14 ----
# Crear una lista 

my_vector <- 1:10
my_matrix <- matrix(1:9, ncol = 3)
my_df <- mtcars[1:10,]
my_list <- list(my_vector, my_matrix, my_df)
View(my_list)
my_list[[1]]
my_list[[2]]
my_list[[3]]


