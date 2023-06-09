--ALTER TABLE S37_13 RENAME COLUMN DETPNO TO DEPTNO;
SELECT  DEPTNO, JOB, SUM(SAL)
FROM    S37_13
GROUP BY GROUPING SETS (DEPTNO, JOB, (DEPTNO, JOB), () )
ORDER BY DEPTNO NULLS FIRST, JOB NULLS FIRST 
;
SELECT  DEPTNO, JOB, SUM(SAL)
FROM    S37_13
GROUP BY CUBE(DEPTNO, JOB)
;

SELECT  LPAD('**', (LEVEL-1) *2) || EMPNO AS EMP
        ,NAME
FROM    S37_16
--WHERE   EMPNO<>3
START WITH EMPNO = 3
CONNECT BY EMPNO = PRIOR MANAGER
;

SELECT  DECODE('A','A','C',NULL)
FROM    DUAL
;

SELECT  SUM(COL1+COL2+COL3+COL4)
FROM    S37_23;
SELECT  SUM(COL1)+SUM(COL2)+SUM(COL3)+SUM(COL4)
FROM    S37_23;


SELECT  SUM(DECODE(ORDERMONTH, 06 ,PRICE)) AS TOTAL
FROM    S37_25 WHERE ORDERYEAR BETWEEN 2020 AND 2021
;
SELECT  SUM(DECODE('06', 0, PRICE)) AS TOTAL
FROM    S37_25 WHERE ORDERYEAR BETWEEN 2020 AND 2021
;

SELECT  COUNT(*)
FROM    S37_29_1 A
WHERE   A.COL NOT IN (SELECT    COL FROM S37_29_2) -- 어지간하면 COUNT(*)은 0일듯 이런식은
;

SELECT  *
FROM    S37_43
;

SELECT  LEVEL
        ,LPAD(' ', 4*(LEVEL-1)) || EMPNO
        ,MGR
        ,CONNECT_BY_ISLEAF
FROM    S37_43
START WITH  MGR IS NULL
CONNECT BY PRIOR EMPNO = MGR
;

SELECT  B.GRADE, A.STUDENTNO, SUM(B.GRADE)
FROM    S37_44_1 A, S37_44_2 B
GROUP BY GROUPING SETS(B.GRADE, (B.GRADE, A.STUDENTNO))
--ORDER BY B.GRADE 이거 넣어주는게 더 확실하긴 하지...
;
CREATE TABLE S37_49 (
                        COL1 VARCHAR(10),
                        COL2 VARCHAR(10),
                        COL3 NUMBER(10)
                    );
INSERT INTO S37_49 VALUES('A','가',10);
INSERT INTO S37_49 VALUES('A','가',20);
INSERT INTO S37_49 VALUES('A','다',25);
INSERT INTO S37_49 VALUES('B','가',10);
INSERT INTO S37_49 VALUES('B','나',30);
INSERT INTO S37_49 VALUES('B','나',20);
INSERT INTO S37_49 VALUES('B','나',60);
INSERT INTO S37_49 VALUES('C','라',30);

SELECT  NTILE_2
        ,COUNT(*) AS ROWCNT
FROM    (
        SELECT  COL1
                ,COL2
                ,COL3
                ,NTILE(3) OVER(ORDER BY COL3) AS NTILE_2
        FROM    S37_49
        )
GROUP BY NTILE_2
;

SELECT  *
FROM    S37_50
;
SELECT  ENAME
        ,SAL
        ,COUNT(*) OVER(ORDER BY SAL RANGE BETWEEN 50 PRECEDING AND 100 FOLLOWING) SIM_CNT
FROM    S37_50
; --PRECEDING 을 CURRENT ROW로 고쳐도 됨
