import pandas as pd

industrie = {
    "OCP": ["Phosphates", "Khouribga", 20000],
    "Renault": ["Automobile", "Tanger", 12000],
    "Stellantis": ["Automobile", "Kénitra", 8000],
    "Lesieur": ["Agroalimentaire", "Casablanca", 3000],
    "Cosumar": ["Sucre", "Casablanca", 2500],
    "Managem": ["Mines", "Marrakech", 5000],
    "societe": ["produit", "maroc", None]
}

DataFrame = pd.DataFrame(industrie)
print(DataFrame)


j = 0
liste = []
liste_entreprise = ["OCP", "Renault", "Stellantis", "Lesieur", "Cosumar", "Managem", "societe"]
while j < len(liste_entreprise):
    nom_entreprise = liste_entreprise[j]
    if industrie[nom_entreprise][2] != None:
        liste.append(industrie[nom_entreprise][2])
        j += 1
    else:
        j += 1
print(liste)

moyenne = sum(liste) / len(liste)
print(moyenne)

DataFrame.fillna(moyenne, inplace=True)

print(DataFrame)


