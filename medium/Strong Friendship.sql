-- Table: Friendship
+-------------+------+
| Column Name | Type |
+-------------+------+
| user1_id    | int  |
| user2_id    | int  |
+-------------+------+
--(user1_id, user2_id) is the primary key for this table.
--Each row of this table indicates that the users user1_id and user2_id are friends.
--Note that user1_id < user2_id.

--A friendship between a pair of friends x and y is strong if x and y have at least three common friends.
--Write an SQL query to find all the strong friendships.
--Note that the result table should not contain duplicates with user1_id < user2_id.
--Return the result table in any order.
--The query result format is in the following example:

--Friendship table:
+----------+----------+
| user1_id | user2_id |
+----------+----------+
| 1        | 2        |
| 1        | 3        |
| 2        | 3        |
| 1        | 4        |
| 2        | 4        |
| 1        | 5        |
| 2        | 5        |
| 1        | 7        |
| 3        | 7        |
| 1        | 6        |
| 3        | 6        |
| 2        | 6        |
+----------+----------+

--Result table:
+----------+----------+---------------+
| user1_id | user2_id | common_friend |
+----------+----------+---------------+
| 1        | 2        | 4             |
| 1        | 3        | 3             |
+----------+----------+---------------+
--Users 1 and 2 have 4 common friends (3, 4, 5, and 6).
--Users 1 and 3 have 3 common friends (2, 6, and 7).
--We did not include the friendship of users 2 and 3 because they only have two common friends (1 and 6).

-- Solution 
with friendtable as(
    select user1_id as userid, user2_id as friend
    from friendship
    union
    select user2_id as userid, user1_id as friend
    from friendship
)

select f1.userid as user1_id, f2.userid as user2_id, count(f1.friend) as common_friend
from friendtable as f1
join friendtable as f2
on f1.friend=f2.friend
where f1.userid<f2.userid 
    and (f1.userid, f2.userid) in(
        select user1_id, user2_id
        from friendship
)
group by f1.userid, f2.userid
having count(f2.friend)>=3
