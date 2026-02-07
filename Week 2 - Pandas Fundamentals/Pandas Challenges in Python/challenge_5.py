
import random
import pandas as pd


# Define lists for cities and products
cities_list = ["casablanca", "rabat", "agadir", "marrakech", "tanger", "fes", "mohammedia", "oujda"]
products_list = ["keyboard", "mouse", "monitor", "printer", "scanner", "headphone", "webcam", "usb", "charger", "cable", "headset", "microphone"]

# Generate 20 random records for the dataset
cities = [random.choice(cities_list) for _ in range (20)]
products = [random.choice(products_list) for _ in range (20)]
sales = [random.randint(1, 200) for _ in range (20)]
sales_Number = range (1101, 1121)

# Create a DataFrame from the generated data
df = pd.DataFrame({"sales_Number" : sales_Number, "cities" : cities, "products" : products, "sales" : sales})

# Print the full data table
print(f"{df}\n")

print(f"\n")
# Create a pivot table to summarize sales by product and city
pivot_table = df.pivot_table(
    index = "products",
    columns = "cities",
    values = "sales",
    aggfunc = "sum",
    fill_value = 0)

# Print the summarized pivot table
print(f"pivot table :\n{pivot_table}")

