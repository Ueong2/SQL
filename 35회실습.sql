SELECT  *
FROM    S35_14
WHERE   1=1
AND     CODE IN ('A', 'B')
AND     COL1 BETWEEN 200 AND 400
;

SELECT  *
FROM    S35_18
WHERE   NAME LIKE '%@_%' ESCAPE '@'
;

SELECT  NULLIF(COL2, COL3)
FROM    S35_20
;
SELECT  NULLIF(500, 300)
FROM    DUAL
;

SELECT  *
FROM    S35_34
WHERE   SALARY <=   (
                        SELECT MAX(SALARY)
                        FROM    S35_34
                        GROUP BY DEPT
                    )
;

SELECT  *
FROM    S35_34
WHERE   SALARY IN   (
                        SELECT  SALARY
                        FROM    S35_34
                        WHERE   DEPT = 'MARKETING'
                    )
;

SELECT  *
FROM    S35_34
;

SELECT  *
FROM    S35_34
WHERE   SALARY >=   ANY(50,60,70)
;
SELECT  *
FROM    S35_34
WHERE   SALARY <=   ALL(40,50,60,70)
;
SELECT  *
FROM    S35_34
WHERE   SALARY IN (SELECT SALARY FROM S35_34 WHERE DEPT = 'MARKETING')
;

SELECT  *
FROM    S35_34
WHERE   DEPT = 'MARKETING' OR DEPT = 'SALES' AND SALARY >= 50
;
SELECT  SUM(CASE WHEN SALARY <50 THEN 1 END)
FROM    S35_34
WHERE   DEPT = 'MARKETING' OR DEPT = 'SALES' AND SALARY >= 50
;

SELECT  *
FROM    S35_34
WHERE   (DEPT = 'MARKETING' OR DEPT = 'SALES') AND SALARY >= 50
;
SELECT  COUNT(COL1)
        ,COUNT(COL2)
FROM    (
            SELECT DISTINCT COL1, COL2
            FROM    S35_39
        )
;

SELECT  COL1
        ,COUNT(*)
FROM    S35_40
GROUP BY ROLLUP (COL1), COL1
;

SELECT  COL1
        ,COL2
        ,LEVEL
FROM    S35_50
WHERE COL1 <> 4
START WITH COL1 = 1
CONNECT BY PRIOR COL1 = COL2
ORDER BY LEVEL, COL1
;

SELECT  *
FROM    S35_50
;
SELECT  LPAD(' ', COL1) || COL1
        ,LPAD(' ', COL1,'0') || COL1
FROM    S35_50
;
SELECT  LPAD('123', 5)
FROM    DUAL
;
                