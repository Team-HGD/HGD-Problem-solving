#https://school.programmers.co.kr/learn/courses/30/lessons/59411
-- 코드를 입력하세요
SELECT B.ANIMAL_ID, B.NAME
FROM ANIMAL_INS AS B
INNER JOIN ANIMAL_OUTS AS R 
ON B.ANIMAL_ID = R.ANIMAL_ID
ORDER BY R.DATETIME - B.DATETIME DESC
LIMIT 2