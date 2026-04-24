

#dictionnaire First_dict
First_dict = { "Appareil": "Laptop", "Marque": "IBM", "Carte mère": "MSI Z490", "Carte Graphique":"GeForce RTX 3070", "RAM": "16G", "Processeur": "Intel core i7-G11", "SSD": "1 To" } 


print("\n")
print("1 - Écris un programme Python qui effectue les opérations suivantes :\n")
for word in First_dict:
    if word == "RAM":
        First_dict[word] = "32G"
    else: 
        continue 
print(First_dict)
print("\n")



print("\n")
print("2 - La liste des clés du dictionnaire")
print(f'La liste des clés du dictionnaire est : {First_dict.keys()}')
print("\n")



print("\n")
print("3 - La liste des valeurs")
print(f'La liste des valeurs est : {First_dict.values()}')
print("\n")


print("\n")
print("4 - La liste des paires clé-valeur")
print(f'La liste des paires clé-valeur est : {First_dict.items()}')
print("\n")


print("\n")
print("5 - Inverser les paires Processeur : Intel core i7-G11 et Carte Graphique : GeForce RTX 3070")
temp = First_dict["Processeur"] 
First_dict["Processeur"] = First_dict["Carte Graphique"] 
First_dict["Carte Graphique"] = temp 
print(f'Le dictionnaire modifié est : {First_dict}')
print("\n")


print("\n")
print("6 - Ajouter la paire clé-valeur suivante : \"Système d’exploitation\": \"Windows 10\"")
First_dict["Système d’exploitation"] = "Windows 10"
print(First_dict)
print("\n")

print("\n")
print("7 - les etudiants admits et non admis")
notes_eleves = { "Amine": 15.5, "Yassine": 19.0, "Reda": 14.2, "Malak": 8.7, "Manal": 20.0, "Ahmed": 7.5,"Saad": 11.3, "Hannae": 9.8 }
print("\n")

#dictionnaire des etudiants admits et non admis
etudiants_admits = {}
etudiants_non_admits = {}

for nom, note in notes_eleves.items():
    if note >= 10 :
        etudiants_admits[nom] = note
    else:
        etudiants_non_admits[nom] = note
    
print(f" les etudiants admits est {etudiants_admits}")
print(f" les etudiants non admis est {etudiants_non_admits}")

