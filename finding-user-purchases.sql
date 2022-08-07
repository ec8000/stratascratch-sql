/*
Write a query that'll identify returning active users. 
A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. 
Output a list of user_ids of these returning active users.

amazon_transactions
id:         int
user_id:    int
item:       varchar
created_at: datetime
revenue:    int
*/

WITH orders AS 
(
    SELECT 
        user_id, 
        created_at, 
        LEAD (created_at, 1) OVER (PARTITION BY user_id ORDER BY created_at) AS next_purchase
    FROM amazon_transactions
)
SELECT DISTINCT user_id
FROM orders
WHERE (next_purchase - created_at) <= 7
ORDER BY user_id;


