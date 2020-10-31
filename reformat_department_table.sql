-- Table: Department

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | revenue       | int     |
-- | month         | varchar |
-- +---------------+---------+
-- (id, month) is the primary key of this table.
-- The table has information about the revenue of each department per month.
-- The month has values in ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"].
 

-- Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month.

-- The query result format is in the following example:

-- Department table:
-- +------+---------+-------+
-- | id   | revenue | month |
-- +------+---------+-------+
-- | 1    | 8000    | Jan   |
-- | 2    | 9000    | Jan   |
-- | 3    | 10000   | Feb   |
-- | 1    | 7000    | Feb   |
-- | 1    | 6000    | Mar   |
-- +------+---------+-------+

-- Result table:
-- +------+-------------+-------------+-------------+-----+-------------+
-- | id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
-- +------+-------------+-------------+-------------+-----+-------------+
-- | 1    | 8000        | 7000        | 6000        | ... | null        |
-- | 2    | 9000        | null        | null        | ... | null        |
-- | 3    | null        | 10000       | null        | ... | null        |
-- +------+-------------+-------------+-------------+-----+-------------+

-- Note that the result table has 13 columns (1 for the department id + 12 for the months).

# Write your MySQL query statement below
SELECT d.id,
SUM(CASE WHEN d.month = 'Jan' THEN d.revenue END) AS Jan_Revenue,
SUM(CASE WHEN d.month = 'Feb' THEN d.revenue END) AS Feb_Revenue,
SUM(CASE WHEN d.month = 'Mar' THEN d.revenue END) AS Mar_Revenue,
SUM(CASE WHEN d.month = 'Apr' THEN d.revenue END) AS Apr_Revenue,
SUM(CASE WHEN d.month = 'May' THEN d.revenue END) AS May_Revenue,
SUM(CASE WHEN d.month = 'Jun' THEN d.revenue END) AS Jun_Revenue,
SUM(CASE WHEN d.month = 'Jul' THEN d.revenue END) AS Jul_Revenue,
SUM(CASE WHEN d.month = 'Aug' THEN d.revenue END) AS Aug_Revenue,
SUM(CASE WHEN d.month = 'Sep' THEN d.revenue END) AS Sep_Revenue,
SUM(CASE WHEN d.month = 'Oct' THEN d.revenue END) AS Oct_Revenue,
SUM(CASE WHEN d.month = 'Nov' THEN d.revenue END) AS Nov_Revenue,
SUM(CASE WHEN d.month = 'Dec' THEN d.revenue END) AS Dec_Revenue
FROM Department d
GROUP BY d.id;