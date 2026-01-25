#dictionnaire des joueurs marocains
joueurs_marocains = {"Achraf Hakimi": 2,"Hakim Ziyech": 7,"Yassine Bounou": 1,"Sofyan Amrabat": 4,"Romain Saïss": 6,"Youssef En-Nesyri": 19}

#dictionnaire des villes et population
villes_population = {"Casablanca": 3359818,"Rabat": 577827,"Marrakech": 928850,"Fes": 1112072,"Tanger": 947952,"Agadir": 421844}

#dictionnaire des plats marocains
plats_marocains = {"Couscous": "Vendredi","Tajine": "Quotidien","Pastilla": "Occasions spéciales","Rfissa": "Fêtes familiales","Harira": "Ramadan","Mechoui": "Mariages"}

#fusion des dictionnaires
mix = {}
mix.update(villes_population)
mix.update(joueurs_marocains)
mix.update(plats_marocains)

print(f'Le mix des dictionnaires est : {mix}')









