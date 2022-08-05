-- Find the highest target achieved by the employee or employees who works under the manager id 13.
-- Output the first name of the employee and target achieved.
-- The solution should show the highest target achieved under manager_id=13 and which employee(s) achieved it.

-- salesforce_employees
-- id:              int
-- first_name:      varchar
-- last_name:       varchar
-- age:             int
-- sex:             varchar
-- employee_title:  varchar
-- department:      varchar
-- salary:          int
-- target:          int
-- bonus:           int
-- email:           varchar
-- city:            varchar
-- address:         varchar
-- manager_id:      int

WITH ranked_employees AS 
(
    SELECT 
        first_name, 
        target, 
        DENSE_RANK() OVER (ORDER BY target DESC) AS rank
    FROM salesforce_employees
    WHERE manager_id = 13
)
SELECT 
    first_name, 
    target
FROM ranked_employees
WHERE rank = 1;
