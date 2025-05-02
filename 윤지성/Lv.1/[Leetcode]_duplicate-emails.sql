# https://leetcode.com/problems/duplicate-emails/description/
# Write your MySQL query statement below
SELECT DISTINCT(EMAIL)
FROM PERSON
WHERE EMAIL IN (
    SELECT EMAIL
    FROM PERSON 
    GROUP BY EMAIL
    HAVING COUNT(*) > 1
)