import sys
import pandas as pd
from datetime import datetime
import boto3
from io import StringIO

df_orders = pd.read_csv("s3://pizza-data-project/orders.csv", encoding = "ascii")
df_pizza_types = pd.read_csv("s3://pizza-data-project/pizza_types.csv", encoding = "Windows-1252")
df_order_details = pd.read_csv("s3://pizza-data-project/order_details.csv", encoding = "ascii")
df_pizzas = pd.read_csv("s3://pizza-data-project/pizzas.csv", encoding = "ascii")

# Standardize date format
df_orders['date'] = pd.to_datetime(df_orders['date'], format='%d/%m/%Y')
df_orders['time'] = pd.to_datetime(df_orders['time'], format='%H:%M:%S').dt.time

df_fact = pd.merge(df_order_details, df_orders, on="order_id")
df_prices = df_pizzas[['pizza_id', 'price']]
df_fact = pd.merge(df_fact, df_prices, on="pizza_id")
df_fact['cost'] = df_fact['price'] * df_fact['quantity']
df_fact = df_fact.drop(columns=['price'])

bucket_name = 'pizza-transform-result'

def upload_df_to_s3(dataframe, file_name):
    csv_buffer = StringIO()
    dataframe.to_csv(csv_buffer, index=False)
    s3_client = boto3.client('s3')
    s3_client.put_object(Body=csv_buffer.getvalue(), Bucket=bucket_name, Key=file_name)
    print(f"{file_name} uploaded to S3 successfully.")
    
upload_df_to_s3(df_fact, 'orders_fact.csv')
upload_df_to_s3(df_pizza_types, 'pizza_types.csv')
upload_df_to_s3(df_pizzas, 'pizzas.csv')





