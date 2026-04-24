
villes_population = {"Casablanca": 3359818,"Rabat": 577827,"Marrakech": 928850,"Fes": 1112072,"Tanger": 947952,"Agadir": 421844}


villes_population_trier = {}

# transformation le dict a une liste:
items = list(villes_population.items())

# triage
items.sort(key=lambda x: x[1])  

#La saisie dans le dictionnaire

for ville, population in items:
    villes_population_trier[ville] = population

print(villes_population_trier)