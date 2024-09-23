WITH cte AS (
    SELECT 
        student_id, 
        SUM(assignment1) + SUM(assignment2) + SUM(assignment3) AS score
    FROM Scores
    GROUP BY student_id
)

select max(score) - min(score) as difference_in_score from cte;