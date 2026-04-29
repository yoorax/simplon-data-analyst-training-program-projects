import pandas as pd
from nptdms import TdmsFile

# Load your TDMS file
tdms_file = TdmsFile.read("C:\\Users\\rachid\\Downloads\\current,temp\\0Nm_Unbalance_0583mg.tdms")

# View all groups and channels in the file (to understand its structure)
for group in tdms_file.groups():
    print(f"Group: {group.name}")
    for channel in group.channels():
        print(f"  Channel: {channel.name}")

# Convert the 'Log' group (which contains all the data channels) to a DataFrame
log_group = tdms_file["Log"]
df = log_group.as_dataframe()

# Save the DataFrame to CSV
df.to_csv("output.csv", index=False)

print("Conversion complete!")