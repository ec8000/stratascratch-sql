/*
Calculate the total revenue from each customer in March 2019. Include only customers who were active in March 2019.
Output the revenue along with the customer id and sort the results based on the revenue in descending order.

orders
id:                int
cust_id:           int
order_date:        datetime
order_details:     varchar
total_order_cost:  int
*/

SELECT 
    cust_id, 
    SUM (total_order_cost) AS total_cost
FROM orders
WHERE order_date between '2019-03-01' AND '2019-03-31'
GROUP BY cust_id
ORDER BY total_cost DESC;
