#_____________initialization_________
print('Hello there!')
string = str(input('enter a string to reverse it : '))

string_counter = len(string)

# initialization
string_reversed = ""
i = 0

# looop
while i != string_counter :
    a = - 1 - i
    string_reversed = string_reversed + string[a]
    i = i + 1

print(f"your string reversed is {string_reversed}")