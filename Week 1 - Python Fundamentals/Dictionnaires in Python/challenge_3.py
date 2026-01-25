#listes
liste_1 = ['WAC', 'Raja', 'FAR', 'Hassania', 'MAS', 'IR']
liste_2 = ['Casablanca', 'Casablanca', 'Rabat', 'Agadir', 'Fès', 'Tanger']

#zip des listes
zip_deux_listes = zip(liste_1,liste_2)

#dictionnaire
dict_1 = dict(zip_deux_listes)
print(f'Le dictionnaire est : {dict_1}')