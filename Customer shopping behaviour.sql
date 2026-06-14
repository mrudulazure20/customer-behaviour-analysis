CREATE TABLE customer_shopping(
    customer_id INT PRIMARY KEY,
    age INT,
    gender VARCHAR(20),
    item_purchased VARCHAR(100),
    category VARCHAR(50),
    purchase_amount NUMERIC(10,2),
    location VARCHAR(50),
    size VARCHAR(10),
    color VARCHAR(30),
    season VARCHAR(20),
    review_rating NUMERIC(3,1),
    subscription_status VARCHAR(10),
    shipping_type VARCHAR(30),
    discount_applied VARCHAR(10),
    promo_code_used VARCHAR(10),
    previous_purchases INT,
    payment_method VARCHAR(30),
    frequency_of_purchases VARCHAR(30)
);
SELECT * FROM customer_shopping;

copy
customer_shopping (Age,gender,item_purchased,Category,Purchase_amount,location,size,color,season,review_rating,subscription_status,shipping_type,discount_applied,Promo_code_used,Previous_purchases,payment_method,frequency_of_purchases)
FROM 'C:\Customer Shopping Behavior Analysis.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM customer_shopping LIMIT 20;

SELECT column_name
FROM information_schema.columns
WHERE table_name = 'customer_shopping';

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

SELECT gender, SUM(purchase_amount) AS revenue
FROM customer_shopping
GROUP BY gender;

SELECT table_schema, table_name
FROM information_schema.tables;

SELECT * 
FROM information_schema.tables
WHERE table_name = 'purchases';

SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_name = 'purchases';

CREATE TABLE purchases (
    id SERIAL PRIMARY KEY,
    item TEXT,
    amount NUMERIC
);

SELECT * FROM "purchases";


select customer_id, purchase_amount
from customer_shopping
where discount_applied='Yes' and purchase_amount >= (select AVG(purchase_amount) 
from customer_shopping)

select item_purchased, ROUND(AVG(review_rating::numeric),2) as "Average Product Rating"
from customer_shopping
group by item_purchased
order by avg(review_rating) desc
limit 5;

select shipping_type,
ROUND(AVG(purchase_amount),2)
from customer_shopping
where shipping_type in ('Standard','Express')
group by shipping_type 

select subscription_status,
COUNT(customer_id) as total_customers,
ROUND(AVG(purchase_amount),2) as avg_spend,
ROUND(SUM(purchase_amount),2) as total_revenue
from customer_shopping
group by subscription_status
order by total_revenue, avg_spend desc;

select item_purchased,
ROUND(100.00 * SUM(CASE WHEN discount_applied ='yes'THEN 1 ELSE 0 END)/COUNT(*),2 ) AS DISCOUNT_RATE
FROM customer_shopping
group by item_purchased
order by discount_rate desc
limit 5;

with customer_type as (
select customer_id, previous_purchases,
CASE
WHEN previous_purchases=1 THEN 'New'
WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
ELSE 'Loyal'
END AS customer_segment
from customer_shopping
)
select customer_segment,count(*) as "Number of Customers"
from customer_type
group by customer_segment

with item_counts as (
select category,
item_purchased, 
COUNT(customer_id) as total_orders,
ROW_NUMBER() over(partition by category order by count(customer_id) DESC) as item_rank
from customer_shopping
group by category, item_purchased
)
select item_rank, category,item_purchased, total_orders
from item_counts
where item_rank <=3;

select subscription_status,
count(customer_id) as repeat_buyers
from customer_shopping
where previous_purchases > 5
group by subscription_status

CREATE TABLE age_group (
    id SERIAL PRIMARY KEY,
    item TEXT,
    amount NUMERIC
);

SELECT * FROM "age_group";

SELECT
    CASE
        WHEN age < 18 THEN 'Under 18'
        WHEN age BETWEEN 18 AND 30 THEN '18-30'
        WHEN age BETWEEN 31 AND 50 THEN '31-50'
        ELSE '50+'
    END AS age_group,
    SUM(purchase_amount) AS total_revenue
FROM customer_shopping
GROUP BY age_group
ORDER BY total_revenue DESC;

