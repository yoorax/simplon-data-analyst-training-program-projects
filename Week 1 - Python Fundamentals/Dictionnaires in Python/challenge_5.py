#Création d'un tuple vide
etudiant_info = ()

#Ajout des informations dans le tuple
etudiant_info = etudiant_info + ("Prénom : Yasmine", "Âge : 22", "Filière : Informatique", "Moyenne générale : 17.4")


print("\n")
#Affichage des informations
print(etudiant_info)

print("\n")
#Affichage des informations "un par ligne"
for item in etudiant_info:
    print(f'"{item}"')


#Tente de modifier la filière dans le tuple. Que se passe-t-il ? Explique pourquoi.
# le reponse : 
# Si on tente de modifier la filière, une erreur TypeError s'affiche car les tuples sont immuables. 
# Cela signifie qu'on ne peut pas modifier, ajouter ou supprimer d'éléments une fois le tuple créé.
# Cette propriété garantit l'intégrité des données en empêchant les changements accidentels dans le code.


print("\n")
# Extraction des informations personnelles (Prénom et Âge) avec le slicing
etudiant_info_personelle = etudiant_info[0:2]
print(etudiant_info_personelle)

print("\n")
#Création d'un nouveau tuple avec des informations complémentaires
extra_etudiant_infos = ()
extra_etudiant_infos = extra_etudiant_infos + ("Mention : Très Bien", "Année d'obtention du diplôme : 2024")
print(extra_etudiant_infos)

print("\n")
#fusion des deux tuples

etudiant_infos_complete = etudiant_info + extra_etudiant_infos
print(etudiant_infos_complete)

