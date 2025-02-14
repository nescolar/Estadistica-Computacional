new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 427.900)
return_jedi <- c(309.306, 165.8)

# 1) Se construye una matriz de 2x3 

star_wars_matrix <- matrix(c(460.998, 314.4, 290.475, 427.900, 309.306, 165.8), 
                     nrow = 2, ncol = 3, byrow = TRUE)
# 2) Se renombran las filas y columnas 
rownames(star_wars_matrix) <- c('US', 'Non Us')
colnames(star_wars_matrix) <- c('A New Hope', 'The empire Strikes Back','Return of the Jedi')
print(star_wars_matrix)

# 3) Vector con el total de ingresos mundiales
worldwide_vector <- c(sum(new_hope), sum(empire_strikes), sum(return_jedi))

# 4) Nueva matriz de 3x3 
all_wars_matrix <- rbind(star_wars_matrix, worldwide_vector = worldwide_vector)
print(all_wars_matrix)

# 5) Promedio de las ventas por fuera de US 
mean(all_wars_matrix[2,])

