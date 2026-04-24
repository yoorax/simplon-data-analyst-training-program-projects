# Import libraries
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

# Group the data by city and sum the sales for each city
total_by_city = df.groupby("cities")["sales"].sum()

# Print the total sales per city
print(f"Total sales by city:\n{total_by_city}\n")
