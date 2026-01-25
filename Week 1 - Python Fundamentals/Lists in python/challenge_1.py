
notes = [12, 4, 14, 11, 18, 13, 7, 10, 5, 9, 15, 8, 14, 16]

Average = sum(notes)/len(notes)
i=0
Above_average_List = []
Under_average_List = []

while i < len(notes):
    if notes[i] >= Average:
        Above_average_List.append(notes[i])
        i+= 1
    else :
        Under_average_List.append(notes[i])
        i+= 1

print(f"Average of the class : {Average}/20")
print(f"Above average : {Above_average_List} with count of {len(Above_average_List)}")
print(f"Under average : {Under_average_List} with count of {len(Under_average_List)}")
