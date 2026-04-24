#_____________initialization_________
print('Hello there!')

#_____________inputs_______________
n1= float(input('choose a number n1 : '))
n2= float(input('choose a number n2 : '))

#_____________operation_____________
multiplication = n1 * n2

#_____________conditions_____________
if multiplication < 0:
    print(f"the multiplication of your numbers n1 = {n1} & n2 = {n2} \nis {multiplication}, results in a Negative number")
elif multiplication > 0:
    print(f"the multiplication of your numbers n1 = {n1} & n2 = {n2} \nis {multiplication}, results in a Positive number")
else:
    print(f"the multiplication of your numbers n1 = {n1} & n2 = {n2} is Zero")