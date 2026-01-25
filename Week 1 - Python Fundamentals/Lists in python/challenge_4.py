

def rechercheElement(liste, element):
    if element in liste:
        return print(f" we found ur element : {element} at index {liste.index(element)}")
    else:
        return print(f" sorry we didn't found ur element ( {element} ) in the list")

liste = list(input(f'Enter a list of numbers separated by commas ",": ').split(","))
element = str(input("Enter an element to search for: "))


rechercheElement(liste, element)
    