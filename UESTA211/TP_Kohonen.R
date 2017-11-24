#install.packages("kohonen")
library(kohonen)
#Aide
#??kohonen

data(wines)
head(wines)
summary(wines)

#Centrer / Reduire les données
scaledWines <- scale(wines, center = TRUE, scale = TRUE)
# Les moyennes sont à 0, les données sont bien centrées
summary(scaledWines)

#construction d'une carte de kohonen
carte <- som(scaledWines, grid=somgrid(5,4,"hexagonal"))

carte
plot(carte)

# Graphique par comptage
plot(carte, type="count")

plot(carte, type="code")

#Affichage des points dans chaque neurone
plot(carte, type="mapping")

values <- unlist(carte$codes)

values <- matrix(values, nrow = 20, ncol = 13)
#application d'une classification ascendante hierarchique
cah <- hclust(dist(values))

plot(cah)

cutedCah <- cutree(tree = cah, 3)

plot(carte, type="code")
add.cluster.boundaries(carte, cutedCah)
