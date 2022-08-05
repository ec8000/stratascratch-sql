-- Find the 3 most profitable companies in the entire world.
-- Output the result along with the corresponding company name.
-- Sort the result based on profits in descending order.

-- forbes_global_2010_2014
-- company:       varchar
-- sector:        varchar
-- industry:      varchar
-- continent:     varchar
-- country:       varchar
-- marketvalue:   float
-- sales:         float
-- profits:       float
-- assets:        float
-- rank:          int
-- forbeswebpage: varchar

WITH ranked_companies AS 
(
    SELECT 
        company, 
        profits, 
        dense_rank() over(ORDER BY profits DESC) AS rank
    FROM forbes_global_2010_2014
)
SELECT 
    company, 
    profits
FROM ranked_companies
WHERE rank <= 3;
