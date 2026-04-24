
import pandas as pd
import random

orders = [random.randint(1, 150) for _ in range (15) ]
clients_list = ["mohamed", "ali", "salah", "hassan", "sara", "fatima", "hossam", "rachid", "sofia", "aya"]
clients = [random.choice(clients_list) for _ in range (15)]

# Create and print the orders DataFrame
df_1 = pd.DataFrame({"orders" : orders})
print(f"{df_1}\n")

# Create and print the clients DataFrame
df_2 = pd.DataFrame({"clients" : clients})
print(f"{df_2}\n")

# Merge both DataFrames together using their index
df_global = pd.DataFrame.merge(df_1, df_2, left_index=True, right_index=True)

# Print the final merged DataFrame
print(f"{df_global}")   