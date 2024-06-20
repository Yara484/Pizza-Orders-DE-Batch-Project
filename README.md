# Pizza Orders (DE Batch Project) 
Developed a data model to process raw pizza order details. Built the data warehouse architecture and managed ETL workflows using AWS Glue for data transformation. Stored data in S3 and leveraged Redshift for efficient data warehousing and analytics.

| File Name       | Description              |
|-----------------|--------------------------|
| README.md        | Contains the project overview. |
| Architecture.png | Diagram of general architecture of the project and tools used |
| SQL_Queries.sql  | SQL queries used to build the tables in DWH and copy data from S# buckets to Redshift|
| data_dictionary.csv | Tables & Field definitions |
| pizza_data_snowflake_schema.png | DWH Schema with fact and dimension tables |
| pizzas_etl_test.ipynb | Jupyter notebook for data exploration and testing transformation script |
|                      |                                |

Ftuture Plans & Additions :
* Use Redshift tables to create a dashboard on Quicksight or Grafana
* Use Orchestration to automate the ETL process
* Update Readme file with extra documentation

