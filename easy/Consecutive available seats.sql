-- Question 37
-- Several friends at a cinema ticket office would like to reserve consecutive available seats.
-- Can you help to query all the consecutive available seats order by the seat_id using the following cinema table?
-- | seat_id | free |  prev     next
-- |---------|------|
-- | 1       | 1    |    1        0
-- | 2       | 0    |    1        1
-- | 3       | 1    |    1        1
-- | 4       | 1    |    1        1
-- | 5       | 1    |    1        1
 

-- Your query should return the following result for the sample case above.
 

-- | seat_id |
-- |---------|
-- | 3       |
-- | 4       |
-- | 5       |
-- Note:
-- The seat_id is an auto increment int, and free is bool ('1' means free, and '0' means occupied.).
-- Consecutive available seats are more than 2(inclusive) seats consecutively available.


-- Solution
select seat_id
from
(select seat_id,free
lag(free,1) over() as prev,
lead(free,1) over() as next
from cinema ) a
a.free =True and (prev= True or next = True)
order by seat_id
