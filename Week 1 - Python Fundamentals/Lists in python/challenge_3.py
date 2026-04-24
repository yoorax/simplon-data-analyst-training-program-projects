#_______List__________________________
stock = ["Stylo", 25, "Classeur", 100, "Crayon", 12, "Surligneur", 40, "Feutre", 5]


#_______print the list________________
print(stock)


#_______string and numbers list________

i = 0
string_list = []
numbers_list = []
while i < len(stock):
    if type(stock[i]) == str:
        string_list.append(stock[i])
        i+=1
    else:
        numbers_list.append(stock[i])
        i += 1
print(f"list of Numbers from the stock list is : {numbers_list}")
print(f"list of Strings from the stock list is : {string_list}")



#___________numbers list sorting________

i = 0
temp = 0
while i < len(numbers_list) - 1:
    if numbers_list[i] < numbers_list[i+1]:
       
        temp = numbers_list[i]
        numbers_list[i] = numbers_list[i+1]
        numbers_list[i+1] = temp
        i = 0
    else:
        i += 1

print(f"New list of numbers sorted is: {numbers_list}")

#___________string list sorting________
i = 0
while i < len(string_list) - 1:
    if string_list[i] > string_list[i+1]:
        temp = string_list[i]
        string_list[i] = string_list[i+1]
        string_list[i+1] = temp
        i = 0
    else:
        i += 1

print(f"New list of strings sorted alphabetically is: {string_list}")