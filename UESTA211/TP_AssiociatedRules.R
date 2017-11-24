install.packages("arules")

library(arules)

?apriori


data("Groceries")
summary(Groceries)

# Un graphique sur l'ensemble
itemFrequencyPlot(Groceries)

# Un graphique juste sur les N premiers
itemFrequencyPlot(Groceries, topN=30)

# Un graphique juste sur les N premiers, en valeur absolue
itemFrequencyPlot(Groceries, topN=30, type="absolute")

# Recherche des règles avec un support de 0.001 et une confiance de 7%
regles <- apriori(Groceries, parameter = list(supp=0.001, conf=0.7, target="rules"))

inspect(regles[1:5])
summary(Groceries)

# Regles triées par le nbr d'occurrence
inspect(sort(regles,by="count", decreasing = TRUE)[1:5])

# Regles triées par la confiance
inspect(sort(regles,by="confidence", decreasing = TRUE)[1:5])

#install.packages("arulesViz")
library(arulesViz)
