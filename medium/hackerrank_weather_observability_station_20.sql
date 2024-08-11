WITH RankedValues AS(
    SELECT 
        lat_n,
        ROW_NUMBER() OVER (ORDER BY lat_n) AS rn,
        COUNT(*) OVER () AS total_count
    FROM 
        station
),
MedianVals AS (
    SELECT 
        lat_n
    FROM
        RankedValues
    WHERE
        rn = FLOOR((total_count + 1) / 2)
        OR rn = CEIL((total_count + 1) / 2)
)

SELECT 
    ROUND(AVG(lat_n), 4) AS median
FROM 
    MedianVals;