# https://school.programmers.co.kr/learn/courses/30/lessons/276034
SELECT ID,	EMAIL,	FIRST_NAME,	LAST_NAME
FROM DEVELOPERS B
WHERE SKILL_CODE & (
    SELECT SUM(CODE)
    FROM SKILLCODES
    WHERE NAME IN ('Python', 'C#')
) > 0
ORDER BY ID