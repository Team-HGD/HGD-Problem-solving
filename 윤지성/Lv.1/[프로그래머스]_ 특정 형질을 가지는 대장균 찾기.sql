# https://school.programmers.co.kr/learn/courses/30/lessons/301646

-- 코드를 작성해주세요
SELECT COUNT(*) AS COUNT
FROM ECOLI_DATA
WHERE (GENOTYPE & 1 = 1 OR GENOTYPE & 4 = 4)
AND GENOTYPE & 2 = 0
