-- Find the review_text that received the highest number of 'cool' votes.
-- Output the business name along with the review text with the highest number of 'cool' votes.

-- yelp_reviews
-- business_name: varchar
-- review_id:     varchar
-- user_id:       varchar
-- stars:         varchar
-- review_date:   datetime
-- review_text:   varchar
-- funny:         int
-- useful:        int
-- cool:          int

WITH ranked_reviews AS 
(
    SELECT 
        business_name, 
        review_text, 
        DENSE_RANK() OVER (ORDER BY cool DESC) AS rank
    FROM yelp_reviews
)
SELECT business_name, review_text
FROM ranked_reviews
WHERE rank = 1;
