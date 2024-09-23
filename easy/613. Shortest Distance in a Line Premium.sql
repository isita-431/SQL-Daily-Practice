WITH diffs AS(
    SELECT x - LAG(x) OVER (ORDER BY x) AS diff
    FROM Point
)
SELECT MIN(diff) AS shortest
FROM diffs