#__________Function_________________
def calculation(a, b):
    return a + b, a - b, a * b, a / b

#__________Initialisation_________________
print("Welcome to the calculator program!")

#__________Loop___________________________
while True:
    try:
        print(f"for addition -->(+) \nFor substraction -->(-) \nFor Multiplication -->(*) \nFor divition -->(/) \nTo Quit -->(stop)")
        operation_type = input('choose which operation u want to perform : ')

        stop_word = 'stop'
        if operation_type.lower() == stop_word:
            break
        
        valid_instructions = ['/', '+', '*', '-', 'stop']
        if operation_type not in valid_instructions:
            raise ValueError
        
    except ValueError:
        print("the instruction u've entred is not vammlid! \nPlease try again...")
        continue
    try:
        a = int(input("Enter first number a: "))
        b = int(input("Enter second number b: "))
    except ValueError:
        print("Please enter a valid number! \nPlease try again...")
        continue

    
    if operation_type == '+':
        print(f"The sum of {a} and {b} is: {calculation(a, b)[0]}")
        print('to stop the program enter "stop"')
    elif operation_type == '-':
        print(f"The difference of {a} and {b} is: {calculation(a, b)[1]}")
        print('to stop the program enter "stop"')
    elif operation_type == '*':
        print(f"The product of {a} and {b} is: {calculation(a, b)[2]}")
        print('to stop the program enter "stop"')
    elif operation_type == '/':
        print(f"The division of {a} by {b} is: {calculation(a, b)[3]}")
        print('to stop the program enter "stop"')


