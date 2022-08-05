-- Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01.
-- If customer had more than one order on a certain day, sum the order costs on daily basis.
-- Output customer's first name, total cost of their items, and the date.

-- customers
-- id:                int
-- first_name:        varchar
-- last_name:         varchar
-- city:              varchar
-- address:           varchar
-- phone_number:      varchar

-- orders
-- id:                int
-- cust_id:           int
-- order_date:        datetime
-- total_order_cost:  varchar
-- total_order_cost:  int

WITH daily_cost AS 
(
    SELECT 
        cust_id, order_date, 
        SUM (total_order_cost) AS total_cost
        FROM orders
        GROUP BY cust_id, order_date
) 
SELECT cust.first_name, dc.total_cost, dc.order_date
FROM customers AS cust
JOIN daily_cost AS dc ON cust.id = dc.cust_id
WHERE dc.order_date BETWEEN '2019-02-01' AND '2019-05-01'
ORDER BY dc.total_cost DESC
LIMIT 1;
