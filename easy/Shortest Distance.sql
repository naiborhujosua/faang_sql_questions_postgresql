-- Question 25
-- Table point holds the x coordinate of some points on x-axis in a plane, which are all integers.
 

-- Write a query to find the shortest distance between two points in these points.
 

-- | x   | next    shortest
-- |-----|
-- | -1  | 0           1
-- | 0   | 2           2
-- | 2   | null        null
 

-- The shortest distance is '1' obviously, which is from point '-1' to '0'. So the output is as below:
 

-- | shortest|
-- |---------|
-- | 1       |
 
-- Solution
select min(abs(abs(a.x)-abs(a.next))) as shortest
from 
(
    select x,lead(order by x) as next
    from point 
) a
