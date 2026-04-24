#______________initialization_____________
print("""Hello there dear student, 
Welcome to check-in survey""")

#______________inputs_________________
Name = str(input("Please enter your name: "))
Age = int(input("Please entre your Age :"))


#______________conditions_____________
if Age < 18 :
    print(f"We're sorry {Name.upper()}, you are underage for entry.")

elif Age >= 18 and Age <= 25 :
    print(f'Welcome dear {Name.upper()}, the entry is free')

elif Age > 25 :
    #______________more conditions to check_____________
    Companion_check = (input('Do you have a Companion? ')).lower() 
    Membership_check = (input('Are you a member of the club ? ')).lower() 
    valid_answers = ['oui', 'yes']
    if Companion_check in valid_answers or Membership_check in valid_answers :
         print(f'Welcome Sir {Name.upper()} to our Club, You are authorized to enter')
    else:
         print(f'we are sorry sir {Name.upper()}, based on your conditions you are not authorized to enter')

else :
    print(f'we are sorry sir {Name.upper()}, based on your conditions you are not authorized to enter')
    