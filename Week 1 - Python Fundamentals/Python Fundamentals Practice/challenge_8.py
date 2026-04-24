#__________initialization____________
print('hello there!')

#__________inputs_________________
A_x = float(input("entre the point A's x coordinate :"))
A_y = float(input("entre the point A's y coordinate :"))
B_x = float(input("entre the point B's x coordinate :"))
B_y = float(input("entre the point A's y coordinate :"))

#__________operation_________________
import math
inner_distance = math.sqrt((B_y - A_y)**2 + (B_x - A_x)**2)

#__________output_________________
print(f"the inner distance between the two points A & B is {inner_distance} UI")
