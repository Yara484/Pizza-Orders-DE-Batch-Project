CREATE TABLE pizza_types_dim (
    pizza_type_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    ingredients VARCHAR(800)
);

CREATE TABLE pizzas_dim (
    pizza_id VARCHAR(100) PRIMARY KEY,
    pizza_type_id VARCHAR(50) REFERENCES pizza_types_dim(pizza_type_id),
    size VARCHAR(10),
    price DECIMAL(10, 2)
);

CREATE TABLE orders_fact (
    order_details_id INT,
    order_id INT,
    pizza_id VARCHAR(100),
    time TIME,
    date DATE,
    quantity INT,
    cost DECIMAL(10,2),
    PRIMARY KEY (order_id, order_details_id)
);

COPY "batch-project".public.pizzas_dim (pizza_id, pizza_type_id, size, price) FROM 's3://pizza-transform-result/pizzas.csv' IAM_ROLE 'arn:aws:iam::949982718908:role/RedshiftCopyFromS3Role' FORMAT AS CSV DELIMITER ',' QUOTE '"' IGNOREHEADER 1 REGION AS 'eu-west-1'
COPY "batch-project".public.pizza_types_dim (pizza_type_id, name, category, ingredients) FROM 's3://pizza-transform-result/pizza_types.csv' IAM_ROLE 'arn:aws:iam::949982718908:role/RedshiftCopyFromS3Role' FORMAT AS CSV DELIMITER ',' QUOTE '"' IGNOREHEADER 1 REGION AS 'eu-west-1'
COPY "batch-project".public.orders_fact (order_details_id, order_id, pizza_id, quantity, date, time, cost) FROM 's3://pizza-transform-result/orders_fact.csv' IAM_ROLE 'arn:aws:iam::949982718908:role/RedshiftCopyFromS3Role' FORMAT AS CSV DELIMITER ',' QUOTE '"' IGNOREHEADER 1 REGION AS 'eu-west-1'
