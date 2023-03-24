SELECT   ID
        ,PARENT_ID
        ,NAME
        ,PARENT_NAME
FROM    S39_21
WHERE   PARENT_ID NOT IN (3)
START WITH PARENT_ID = 0
CONNECT BY PRIOR ID = PARENT_ID
ORDER SIBLINGS BY PARENT_ID ASC, ID ASC
;
--23
SELECT  NEXT_DAY(ADD_MONTHS(SYSDATE,6), '월요일')
FROM    DUAL
;

SELECT  *
FROM    S39_21
;
--30
SELECT  ID, DEPTH, COUNT(PARENT_ID)
FROM    S39_21
WHERE   PARENT_ID >0
GROUP BY ID, DEPTH
;

CREATE VIEW V_S39_32
AS
SELECT  *
FROM    S39_32
WHERE   COL1 = 'A' OR COL1 IS NULL
;
SELECT  SUM(COL2) 합계
FROM    V_S39_32
WHERE   COL2>= 2000
;

--38
SELECT  TO_CHAR(SYSDATE+1, 'YYYYMMDD') FROM DUAL
;
--ALTER TABLE S390_40 RENAME TO S39_40;
SELECT  COUNT(*)
        ,SUM(C3)
FROM    S39_40
GROUP BY C2
HAVING COUNT(*) >= 2
;
SELECT  C2
        ,SUM(C3)
        ,COUNT(*)
FROM    S39_40
GROUP BY C2
;
SELECT  COUNT(*)
FROM    S39_40
GROUP BY C2
;

SELECT  *
FROM    S39_49, S39_49_2
;
COMMIT;