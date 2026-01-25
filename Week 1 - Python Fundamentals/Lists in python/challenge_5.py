

liste = [7 , 23 , 5 , 23 , 7 , 19 , 23 , 12 , 29]

##_________________function to count occurences________________
def occurence(liste):
    liste_new = []
    liste_done = []
    for num in liste:
        if num in liste_done:
            continue
        else:
            j = 0
            i = 0
            while i < len(liste):
                if num == liste[i]:
                    j = j + 1
                    i += 1
                else:
                    i += 1
            liste_new.append(f"{num} : {j}")
            liste_done.append(num)
    
    return liste_new

print(f" List with occurences : {occurence(liste)}")


#_________________function to delete duplicates________________

def delete_duplicates(liste):
    liste_without_duplicates = []
    for number in liste:
        if number in liste_without_duplicates:
            continue
        else:
            liste_without_duplicates.append(number)
    return liste_without_duplicates


print(f" List without duplicates : {delete_duplicates(liste)}")



