#============= task(1)========================================
def factoriel_calculation(n):
    import math
    return print(f"the factoriel of {n} is: {math.factorial(n)}")

# test task (1)
print("task(1)")
factoriel_calculation(4)
print("\n")



#============= task(2)========================================
def multiplication_table(m):
    for i in range(1,11):
        iteration = m * i
        print(iteration)

# test task (2)
print("task(2)")
multiplication_table(5)
print("\n")


#============= task(3)========================================
def square_root_check(l):
    import math
    if math.sqrt(l).is_integer():
        print(f'the Number you choose has an int square root of {math.sqrt(l)}')
    else:
        print(f'the number you choose has a float square root of {math.sqrt(l)}')

# test task (3)
print("task(3)")
square_root_check(4)
print("\n")


#============= task(4)========================================
def show_char_by_char(string):
    i = 0
    while i in range(len(string)):
        print(string[i])
        i += 1

#test task(4)
print("task(4)")
show_char_by_char('rachid')
print("\n")


#============= task(5)========================================
def longest_word_of_sentance(sentance):
    longest_word = ""
    reference_word = "" # the word we will use for checking
    
# I added space " " in the end of sentance to make sure the last word is checked
    for charachter in sentance + " " :
        if charachter != " ":
            reference_word += charachter
        else:
            if len(reference_word) > len(longest_word):
                longest_word = reference_word
            reference_word = ""   
    return print(f"The longest word in ur sentance is: {longest_word}")

# test task (5)
print("task(5)")
longest_word_of_sentance("Agadir is the best city in Morocco")
print("\n")


#============= task(6)========================================
def occurence_of_char(string):
    liste = [] 
    seen_chars = [] #this list will store the characters we have already checked
    
    for char in string:
        a = 0
        j = 0
        if char in seen_chars or char == " ":
            continue
        seen_chars.append(char) 

        while j < len(string):

            if char == string[j]:
                a = a + 1
            j += 1

        unit = f'{char}={a}'
        liste.append(unit)
    return liste

# test task (6)
print("task(6)")
print(occurence_of_char('definition is absolute'))
