import random
import pandas as pd

# Options for our categorical columns
produits = ["Action", "Obligation", "Crypto", "Devise"]
statuts = ["Terminé", "En attente", "Annulé"]
villes = ["Casablanca", "Rabat", "Tanger", "Marrakech", "Agadir"]

# Generating 20 rows of data
data_complet = {
    "ID_Transaction": range(101, 121),
    "Produit": [random.choice(produits) for _ in range(20)],
    "Montant_DH": [random.randint(200, 2000) for _ in range(20)],
    "Statut": [random.choice(statuts) for _ in range(20)],
    "Ville": [random.choice(villes) for _ in range(20)]
}

# Creating the DataFrame
dataframe = pd.DataFrame(data_complet)

# Displaying the DataFrame
print(f"{dataframe}\n")

# Filtering the DataFrame
dataframe = dataframe[dataframe["Montant_DH"] >=1000]
print(f" the dataframe after filtering : {dataframe}\n")



    
