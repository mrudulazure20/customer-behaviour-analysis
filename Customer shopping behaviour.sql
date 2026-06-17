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
Successfully run. Total query runtime: 2 secs 205 msec.
609 rows affected.


copy
customer_shopping (Age,gender,item_purchased,Category,Purchase_amount,location,size,color,season,review_rating,subscription_status,shipping_type,discount_applied,Promo_code_used,Previous_purchases,payment_method,frequency_of_purchases)
FROM 'C:\Customer Shopping Behavior Analysis.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM customer_shopping LIMIT 20;
1	55	"Male"	"Blouse"	"Clothing"	53.00	"Kentucky"	"L"	"Gray"	"Winter"	3.1	"Yes"	"Express"	"Yes"	"Yes"	14	"Venmo"	"Fortnightly"
2	19	"Male"	"Sweater"	"Clothing"	64.00	"Maine"	"L"	"Maroon"	"Winter"	3.1	"Yes"	"Express"	"Yes"	"Yes"	2	"Cash"	"Fortnightly"
3	50	"Male"	"Jeans"	"Clothing"	73.00	"Massachusetts"	"S"	"Maroon"	"Spring"	3.1	"Yes"	"Free Shipping"	"Yes"	"Yes"	23	"Credit Card"	"Weekly"
4	21	"Male"	"Sandals"	"Footwear"	90.00	"Rhode Island"	"M"	"Maroon"	"Spring"	3.5	"Yes"	"Next Day Air"	"Yes"	"Yes"	49	"PayPal"	"Weekly"
5	45	"Male"	"Blouse"	"Clothing"	49.00	"Oregon"	"M"	"Turquoise"	"Spring"	2.7	"Yes"	"Free Shipping"	"Yes"	"Yes"	31	"PayPal"	"Annually"
6	46	"Male"	"Sneakers"	"Footwear"	20.00	"Wyoming"	"M"	"White"	"Summer"	2.9	"Yes"	"Standard"	"Yes"	"Yes"	14	"Venmo"	"Weekly"
7	63	"Male"	"Shirt"	"Clothing"	85.00	"Montana"	"M"	"Gray"	"Fall"	3.2	"Yes"	"Free Shipping"	"Yes"	"Yes"	49	"Cash"	"Quarterly"
8	27	"Male"	"Shorts"	"Clothing"	34.00	"Louisiana"	"L"	"Charcoal"	"Winter"	3.2	"Yes"	"Free Shipping"	"Yes"	"Yes"	19	"Credit Card"	"Weekly"
9	26	"Male"	"Coat"	"Outerwear"	97.00	"West Virginia"	"L"	"Silver"	"Summer"	2.6	"Yes"	"Express"	"Yes"	"Yes"	8	"Venmo"	"Annually"
10	57	"Male"	"Handbag"	"Accessories"	31.00	"Missouri"	"M"	"Pink"	"Spring"	4.8	"Yes"	"2-Day Shipping"	"Yes"	"Yes"	4	"Cash"	"Quarterly"
11	53	"Male"	"Shoes"	"Footwear"	34.00	"Arkansas"	"L"	"Purple"	"Fall"	4.1	"Yes"	"Store Pickup"	"Yes"	"Yes"	26	"Bank Transfer"	"Bi-Weekly"
12	30	"Male"	"Shorts"	"Clothing"	68.00	"Hawaii"	"S"	"Olive"	"Winter"	4.9	"Yes"	"Store Pickup"	"Yes"	"Yes"	10	"Bank Transfer"	"Fortnightly"
13	61	"Male"	"Coat"	"Outerwear"	72.00	"Delaware"	"M"	"Gold"	"Winter"	4.5	"Yes"	"Express"	"Yes"	"Yes"	37	"Venmo"	"Fortnightly"
14	65	"Male"	"Dress"	"Clothing"	51.00	"New Hampshire"	"M"	"Violet"	"Spring"	4.7	"Yes"	"Express"	"Yes"	"Yes"	31	"PayPal"	"Weekly"
15	64	"Male"	"Coat"	"Outerwear"	53.00	"New York"	"L"	"Teal"	"Winter"	4.7	"Yes"	"Free Shipping"	"Yes"	"Yes"	34	"Debit Card"	"Weekly"
16	64	"Male"	"Skirt"	"Clothing"	81.00	"Rhode Island"	"M"	"Teal"	"Winter"	2.8	"Yes"	"Store Pickup"	"Yes"	"Yes"	8	"PayPal"	"Monthly"
17	25	"Male"	"Sunglasses"	"Accessories"	36.00	"Alabama"	"S"	"Gray"	"Spring"	4.1	"Yes"	"Next Day Air"	"Yes"	"Yes"	44	"Debit Card"	"Bi-Weekly"
18	53	"Male"	"Dress"	"Clothing"	38.00	"Mississippi"	"XL"	"Lavender"	"Winter"	4.7	"Yes"	"2-Day Shipping"	"Yes"	"Yes"	36	"Venmo"	"Quarterly"
19	52	"Male"	"Sweater"	"Clothing"	48.00	"Montana"	"S"	"Black"	"Summer"	4.6	"Yes"	"Free Shipping"	"Yes"	"Yes"	17	"Cash"	"Weekly"
20	66	"Male"	"Pants"	"Clothing"	90.00	"Rhode Island"	"M"	"Green"	"Summer"	3.3	"Yes"	"Standard"	"Yes"	"Yes"	46	"Debit Card"	"Bi-Weekly"



SELECT column_name
FROM information_schema.columns
WHERE table_name = 'customer_shopping';
"customer_id"
"age"
"gender"
"item_purchased"
"category"
"purchase_amount"
"location"
"size"
"color"
"season"
"review_rating"
"subscription_status"
"shipping_type"
"discount_applied"
"promo_code_used"
"previous_purchases"
"payment_method"
"frequency_of_purchases"

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';
"customer"
"customer_shopping"
"purchases"
"age_group"

SELECT gender, SUM(purchase_amount) AS revenue
FROM customer_shopping
GROUP BY gender;
"Male"	36390.00

SELECT table_schema, table_name
FROM information_schema.tables;
"public"	"customer"
"pg_catalog"	"pg_statistic"
"pg_catalog"	"pg_type"
"public"	"customer_shopping"
"public"	"purchases"
"pg_catalog"	"pg_foreign_table"
"pg_catalog"	"pg_authid"
"pg_catalog"	"pg_shadow"
"public"	"age_group"
"pg_catalog"	"pg_roles"
"pg_catalog"	"pg_statistic_ext_data"
"pg_catalog"	"pg_ident_file_mappings"
"pg_catalog"	"pg_settings"
"pg_catalog"	"pg_file_settings"
"pg_catalog"	"pg_hba_file_rules"
"pg_catalog"	"pg_backend_memory_contexts"
"pg_catalog"	"pg_config"
"pg_catalog"	"pg_shmem_allocations"
"pg_catalog"	"pg_shmem_allocations_numa"
"information_schema"	"schemata"
"information_schema"	"domain_constraints"
"information_schema"	"routine_column_usage"
"information_schema"	"domain_udt_usage"
"information_schema"	"domains"
"information_schema"	"routine_table_usage"
"information_schema"	"enabled_roles"
"information_schema"	"routine_privileges"
"information_schema"	"key_column_usage"
"information_schema"	"parameters"
"information_schema"	"referential_constraints"
"information_schema"	"role_routine_grants"
"information_schema"	"role_column_grants"




SELECT * 
FROM information_schema.tables
WHERE table_name = 'purchases';
"customer behaviour"	"public"	"purchases"	"BASE TABLE"			"YES"	"NO"	

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
    2	64.00
3	73.00
4	90.00
7	85.00
9	97.00
12	68.00
13	72.00
16	81.00
20	90.00
22	62.00
24	88.00
29	94.00
32	79.00
33	67.00
35	91.00
37	69.00
40	60.00
41	76.00
43	100.00
44	69.00
55	94.00
57	73.00
58	64.00

595	83.00
596	77.00
598	69.00
599	66.00
601	63.00
605	92.00
607	90.00

select item_purchased, ROUND(AVG(review_rating::numeric),2) as "Average Product Rating"
from customer_shopping
group by item_purchased
order by avg(review_rating) desc
limit 5;
"Boots"	4.06
"Sandals"	3.95
"Hat"	3.95
"Skirt"	3.92
"T-shirt"	3.88
    
select shipping_type,
ROUND(AVG(purchase_amount),2)
from customer_shopping
where shipping_type in ('Standard','Express')
group by shipping_type 
    "Standard"	61.54
"Express"	58.76

select subscription_status,
COUNT(customer_id) as total_customers,
ROUND(AVG(purchase_amount),2) as avg_spend,
ROUND(SUM(purchase_amount),2) as total_revenue
from customer_shopping
group by subscription_status
order by total_revenue, avg_spend desc;
"Yes"	609	59.75	36390.00

select item_purchased,
ROUND(100.00 * SUM(CASE WHEN discount_applied ='yes'THEN 1 ELSE 0 END)/COUNT(*),2 ) AS DISCOUNT_RATE
FROM customer_shopping
group by item_purchased
order by discount_rate desc
limit 5;
"Shirt"	0.00
"Hat"	0.00
"Jacket"	0.00
"Sneakers"	0.00
"Gloves"	0.00

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
"Loyal"	502
"New"	8
"Returning"	99
    
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
1	"Accessories"	"Jewelry"	30
2	"Accessories"	"Backpack"	26
3	"Accessories"	"Scarf"	26
1	"Clothing"	"Sweater"	34
2	"Clothing"	"Pants"	30
3	"Clothing"	"Skirt"	29
1	"Footwear"	"Shoes"	29
2	"Footwear"	"Sneakers"	27
3	"Footwear"	"Sandals"	22
1	"Outerwear"	"Coat"	36
2	"Outerwear"	"Jacket"	25

select subscription_status,
count(customer_id) as repeat_buyers
from customer_shopping
where previous_purchases > 5
group by subscription_status
    "Yes"	554

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
"31-50"	14204.00
"50+"	13208.00
"18-30"	8978.00



