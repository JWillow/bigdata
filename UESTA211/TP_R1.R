library(FactoMineR)

data("decathlon")
head(decathlon)

summary(decathlon)

# Pour obtenir de l'aide sur la fonction PCA
?PCA

# On fait une ACP sur les 11 premières colonnes
res.pca <- PCA(decathlon, quanti.sup = 11:12, quali.sup=13)

?write.csv

write.csv(decathlon, "dec.csv")
