
#___________initialisation___________

print("Bonjour et Bienvenue!")

#___________inputs___________________
Nom_salarie = str(input("Entrez votre nom : "))
salaire_horaire = float(input("Entrez votre salaire horaire (Dh/h) : "))
heures_travail = float(input("Entrez le nombre d'heures travaillées : ")) 

#___________conditions_________________ 
if heures_travail <= 40:
    salaire = salaire_horaire * heures_travail
    print(f"Monsieur {Nom_salarie},votre salaire total est de {salaire} Dh")

elif heures_travail > 40:
    #calcule des heures supplémentaires
    heures_supp = heures_travail - 40

    #calcule du salaire des heures supplémentaires (1.5x) seulment pour les heures supplémentaires
    salaire_horaire_supp = salaire_horaire * 1.5

    #calcule du salaire des heures supplémentaires
    salaire_supp = salaire_horaire_supp * heures_supp

    #calcule du salaire total
    salaire = salaire_horaire * 40 + salaire_supp
    print(f"Monsieur {Nom_salarie.upper()}, votre salaire est de {salaire_horaire * 40 } Dh")
    print(f"En plus de votre heures supplémentaires {heures_supp} h, avec une montent accumulée de {salaire_supp} Dh")
    print(f"Alors, votre salaire total est de {salaire} Dh")
else: 
    print(f"Monsieur {Nom_salarie.upper()}, une erreur est survenue")
