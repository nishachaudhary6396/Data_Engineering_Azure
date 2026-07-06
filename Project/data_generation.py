import pandas as pd
import random
from faker import Faker

fake=Faker()

num_records=1000

warehouses=["WH-A","WH-B","WH-C","WH-D","WH-E"]

products=["Laptop","Mobile","Tablet","Monitor","Keyboard","Mouse","Printer","Router"]

suppliers=["Supplier-V","Supplier-W","Supplier-X","Supplier-Y","Supplier-Z"]

data=[]

for _ in range(num_records):
    warehouse=random.choice(warehouses)
    product=random.choice(products)
    supplier=random.choice(suppliers)
    stock_level=random.randint(0,1000)
    reorder_level=random.randint(0,500)
    last_updated=fake.date_between(start_date='-2y',end_date='today')

    transport_cost=round(random.uniform(500,5000)+stock_level*0.5,2)

    data.append([warehouse,product,supplier,stock_level,reorder_level,last_updated,transport_cost])

    df=pd.DataFrame(data,columns=["warehouse","product","supplier","stock_level","reorder_level","last_updated","transport_cost"])


# Add Missing Values
    for col in ["supplier", "stock_level", "transport_cost"]:
        missing_idx = df.sample(frac=0.03, random_state=42).index
        df.loc[missing_idx, col] = None


# Add Duplicate Records
    duplicate_rows = df.sample(frac=0.05, random_state=42)

    df = pd.concat([df, duplicate_rows], ignore_index=True)

    df.to_csv("data.csv",index=False)