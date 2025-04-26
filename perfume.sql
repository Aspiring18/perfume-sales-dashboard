select * from ebay_womens_perfume

select brand, title, price, (price*sold) as total_sales from ebay_womens_perfume where brand = 'Gucci'
order by total_sales desc
--highest total sales 

select brand, title, sum(sold) as sales 
from ebay_womens_perfume
group by brand
order by sales desc 

--What are the top 10 best-selling perfumes by quantity sold?
select top 10 type, sold, brand from ebay_womens_perfume
order by sold desc

-- Which perfume brand has the highest total sales?
select brand, sum(sold) as total_sales 
from ebay_womens_perfume
group by brand
order by total_sales desc 

--What is the average price of perfumes for each brand?
select AVG(price) as avergae,type, brand
from ebay_womens_perfume
group by type, brand
order by avergae desc

--What are the price ranges for perfumes in each brand? (Min, Max, Average)
select min(price) as minimum, max(price) as maximum, AVG(price) as average,type, brand
from ebay_womens_perfume
group by type, brand

--Which perfumes are currently marked as "Not Available"?
select brand, type, availableText
from ebay_womens_perfume
where availableText LIKE 'Out of Stock %'

--Which perfumes are labeled as "Available" and have the highest sales?
select type, sum(sold) as sales 
from ebay_womens_perfume
group by type
order by sales desc

--How does the sales of Eau de Parfum compare to Eau de Toilette perfumes?
select type, brand, sum(sold) as total_sales
from ebay_womens_perfume
where type IN ('Eau de Parfum' , 'Eau De Toilette')
group by type, brand
order by total_sales desc

-- Is there any correlation between the price of a perfume and its total sales?
SELECT brand, AVG(price) AS avg_price, SUM(sold) AS total_sold  
FROM ebay_womens_perfume  
GROUP BY brand  
ORDER BY total_sold DESC;


--What is the most expensive perfume sold and its brand?
select brand, title, price_in_inr
from ebay_womens_perfume
order by price_in_inr desc

ALTER TABLE ebay_womens_perfume  
ADD price_in_inr DECIMAL(10,2);

update ebay_womens_perfume
set price_in_inr = price * 83

select brand, title, min(price_in_inr) as minimun 
from ebay_womens_perfume
group by brand, title

select brand, title,price_in_inr
from ebay_womens_perfume
where brand = 'Zara'

-- Sales trends by region (which locations buy the most perfumes?)
select itemLocation, brand, sum(sold) as total_sales
from ebay_womens_perfume
group by itemLocation, brand
order by  total_sales desc, itemLocation ASC

--most recent perfume added : 
SELECT brand, title, lastUpdated  
FROM ebay_womens_perfume  
ORDER BY lastUpdated DESC  

--do expensive perfumes sell more :

--Which perfumes have the highest sales revenue?
select brand, title, (price*sold) as total_revenue
from ebay_womens_perfume
order by total_revenue desc 

--Which perfume brands have low sales and need promotions?
select brand, title, (sold- available) as remaining,  sold, available
from ebay_womens_perfume
where sold <=10 
order by remaining desc



