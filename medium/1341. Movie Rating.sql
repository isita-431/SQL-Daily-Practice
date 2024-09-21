WITH s1 AS (
    SELECT u.name
    FROM MovieRating mr
    JOIN Users u ON mr.user_id = u.user_id
    GROUP BY u.name, u.user_id
    ORDER BY COUNT(*) DESC, u.name
    LIMIT 1
),
s2 AS (
    SELECT m.title
    FROM MovieRating mr
    JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE mr.created_at < '2020-03-01' AND mr.created_at > '2020-01-31'
    GROUP BY m.title, m.movie_id
    ORDER BY AVG(mr.rating) DESC, m.title
    LIMIT 1
),
s3 as (
SELECT name AS results FROM s1
union all
SELECT title AS results FROM s2)

select results from s3
