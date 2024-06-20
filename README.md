# Pizza Orders (DE Batch Project) 
Developed a data model to process raw pizza order details. Built the data warehouse architecture and managed ETL workflows using AWS Glue for data transformation. Stored data in S3 and leveraged Redshift for efficient data warehousing and analytics.

[Data Source - Kaggle](https://www.kaggle.com/datasets/neethimohan/maven-pizza-challenge-dataset)

![Architecture](https://github.com/Yara484/Pizza-Orders-DE-Batch-Project/assets/51079151/aa43b3cd-56ae-4379-b268-63d963519f1e)


| File Name       | Description              |
|-----------------|--------------------------|
| README.md        | Contains the project overview. |
| Architecture.png | Diagram of general architecture of the project and tools used |
| SQL_Queries.sql  | SQL queries used to build the tables in DWH and copy data from S# buckets to Redshift|
| data_dictionary.csv | Tables & Field definitions |
| pizza_data_snowflake_schema.png | DWH Schema with fact and dimension tables |
| pizzas_etl_test.ipynb | Jupyter notebook for data exploration and testing transformation script |
| etl_glue_job.py | Final python script used in aws glue for ETL |

**Future Plans & Additions :**
* Use Redshift tables to create a dashboard on Quicksight or Grafana
* Use Orchestration to automate the ETL process
* Update Readme file with extra documentation

**Sample screenshots of process on AWS :**

Glue ETL Job

![image](https://github.com/Yara484/Pizza-Orders-DE-Batch-Project/assets/51079151/783b96b8-a145-44c7-8b43-cb2b6fbc77e0)

Raw files in S3 Bucket

![image](https://github.com/Yara484/Pizza-Orders-DE-Batch-Project/assets/51079151/4ffff86e-fd6d-4432-93ee-89135f2cf529)


Transformed file uploaded to S3 Bucket

![image](https://github.com/Yara484/Pizza-Orders-DE-Batch-Project/assets/51079151/f44c4170-6924-4194-974d-d226edcd8b79)

Loading data from CSV files in S3 bucket to Redshift tables

![image](https://github.com/Yara484/Pizza-Orders-DE-Batch-Project/assets/51079151/396a9c1a-401f-410f-a3b2-887347c6b4a3)


Tables loaded into Redshift under 'batch-project' database

![image](https://github.com/Yara484/Pizza-Orders-DE-Batch-Project/assets/51079151/318ede98-46d5-4b79-8c7b-525114246aba)



