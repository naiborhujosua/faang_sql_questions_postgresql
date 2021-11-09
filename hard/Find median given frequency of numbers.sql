-- Question 107
-- The Numbers table keeps the value of number and its frequency.

-- +----------+-------------+
-- |  Number  |  Frequency  |cumsum | middle | range
-- +----------+-------------|
-- |  0       |  7          |  7        6       0,7
-- |  1       |  1          |  8        6       7,8
-- |  2       |  3          |  11       6       8,11
-- |  3       |  1          |  12       6       11,12
-- +----------+-------------+
-- In this table, the numbers are 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 3, so the median is (0 + 0) / 2 = 0.

-- +--------+
-- | median |
-- +--------|
-- | 0.0000 |
-- +--------+
-- Write a query to find the median of all numbers and name the result as median.

--Solution 
select avg(number) as median
from
(select number, sum(frequency) over(order by number) as cum_sum, 
((sum(frequency) over())/2 as middle
from Numbers) t1
where middle between (cum_sum-frequency) and cum_sum



