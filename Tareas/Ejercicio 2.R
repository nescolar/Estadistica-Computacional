---
  title: "comp-stats_taller_1 - Ejercicio 1"
author: "Natali Angarita, Leyniker Escobar, Tulio Orozco"
date: "2025-01-26"
output: html_document
---

name <- c('Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 
'Saturn', 'Uranus', 'Neptune')
type <- c('Terrestrial planet', 'Terrestrial planet', 'Terrestrial planet',
           'Terrestrial planet', 'Gas giant', 'Gas giant', 'Gas giant', 
           'Gas giant')
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Crea un dataframe

planets_df <- data.frame(name, type, diameter, rotation, rings)
str(planets_df)
# Diámetro de Mercurio
planets_df [1,3]

# Datos de Marte
planets_df [4,]

# 5 primero valores de diámetro 
planets_df$diameter [1:5]

# Escriba 3 formas de seleccionar la variable rings de planets df y asignelo a rings vecto
rings_vector <- planets_df$rings
rings_vector <- planets_df [,5]
rings_vector <- planets_df[["rings"]]

# Planetas que tienen anillo
planetas_con_anillos <- planets_df[rings_vector, ]

# Planetas con diámetro menor a la tiera
subset(planets_df, planets_df$diameter < 1, drop = FALSE)

# Ordena de menor a mayor todos los planetas por el diametro
planets_df$name[order(planets_df$diameter)]
