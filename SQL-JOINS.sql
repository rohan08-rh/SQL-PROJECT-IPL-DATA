-- Q1) Which orders belong to each category?

SELECT t1.category,t2.order_id 
FROM data2.category t1
JOIN data2.order_details t2
ON t1.category_id=t2.category_id;


-- Q2) Which orders belong to the Chairs category?

SELECT t1.category_id,t1.order_id,t2.vertical FROM data2.order_details t1
INNER JOIN data2.category t2
ON t1.category_id=t2.category_id
WHERE t2.vertical='Chairs';


-- Q3) Which users placed orders that generated a positive profit?

SELECT t2.user_id,t1.order_id,t1.profit FROM data2.order_details t1
JOIN data2.orders t2
ON t1.order_id=t2.order_id
JOIN data2.users t3
ON t2.user_id=t3.user_id
WHERE t1.profit>0;


-- Q4) Which users have placed the highest number of orders?

SELECT name,COUNT(*) FROM data2.users t1
JOIN data2.orders t2
ON t1.user_id=t2.user_id
GROUP BY t1.name
ORDER BY COUNT(*) DESC;


-- Q5) Which product categories have generated more than 5000 in total profit?

SELECT t1.vertical,SUM(profit) FROM data2.category t1
JOIN data2.order_details t2
ON t1.category_id=t2.category_id
GROUP BY vertical HAVING SUM(profit) > 5000;
