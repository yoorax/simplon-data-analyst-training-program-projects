
Ch1 = "Le langage Python est très populaire"
Ch2 = "Python est un langage puissant"

list_Ch1 = Ch1.split(" ")
list_Ch2 = Ch2.split(" ")

list_common_words = []
for word in list_Ch1:
    if word in list_Ch2:
        list_common_words.append(word)
    else:
        continue

print(list_common_words)

