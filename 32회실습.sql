/*
DROP TABLE SQLD_32_18;
CREATE TABLE SQLD_32_18
(   
    "남성의류" VARCHAR(30),
    "여성의류" VARCHAR(30),
    "의류번호" NUMBER(10)
);
ALTER TABLE SQLD_32_18 MODIFY ("남성의류" VARCHAR(100));
ALTER TABLE SQLD_32_18 MODIFY ("여성의류" VARCHAR(100));
ALTER TABLE SQLD_32_18 ADD COLUMN "의류번호" NUMBER(100);

INSERT INTO SQLD_32_18 ("남성의류", "여성의류","의류번호") VALUES ('아웃숄더', '양말', 1);
INSERT INTO SQLD_32_18 ("남성의류", "여성의류","의류번호") VALUES ('가디건', '아웃숄더', 2);
INSERT INTO SQLD_32_18 ("남성의류", "여성의류","의류번호") VALUES ('겨울외투', '가디건', 3);
INSERT INTO SQLD_32_18 ("남성의류", "여성의류","의류번호") VALUES ('자켓', '겨울외투', 4);
INSERT INTO SQLD_32_18 ("남성의류", "여성의류","의류번호") VALUES (NULL, '자켓', 5);
INSERT INTO SQLD_32_18 ("남성의류", "여성의류","의류번호") VALUES ('숏바지', '롱바지', 6);
INSERT INTO SQLD_32_18 ("남성의류", "여성의류","의류번호") VALUES ('양말', '숏바지', 7);

SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables; 쓸모없는 테이블 정리하는 쿼리
ALTER TABLE "SQLD_32_18" RENAME TO "SQLD_32_19"; 테이블명 변경

*/
SELECT  *
FROM SQLD_32_18
START WITH "남성의류" IS NULL
CONNECT BY PRIOR "여성의류" = "남성의류"
;
--ALTER table 테이블명 modify (칼럼명 default not null) 그냥 DEFAULT NOT NULL 하면 안되는데? DEFAULT 0 해야 됨
--ALTER TABLE S32_20 MODIFY ("부서ID" DEFAULT 0 NOT NULL);

SELECT  *
FROM    S32_20
;
SELECT  상위부서코드
FROM    SQLD_32_20
WHERE   부서코드 = 200
START WITH 상위부서코드 = 0
CONNECT BY PRIOR 부서코드 = 상위부서코드
;


SELECT  COUNT(NVL(NUM,0))
        ,SUM(NVL(NUM,0)) / 4
        ,AVG(NVL(NUM,0))
        ,MIN(NVL(NUM,5))
FROM SQLD_32_26;


SELECT  반
        ,COUNT(DISTINCT 이름) AS "결과값"
FROM    SQLD_32_27
GROUP BY 반
;



SELECT  *
FROM    (
            SELECT  JOB_ID
                    ,MAX(SALARY)
            FROM    SQLD_32_31
            GROUP BY JOB_ID
            UNION ALL
            SELECT  JOB_ID
                    ,MIN(SALARY)
            FROM    SQLD_32_31
            GROUP BY JOB_ID
        );

select case col1 when null then -1 else 0 end as c1 from SQLD_32_32;
select case when col1 is null then -1 else 0 end as c2 from SQLD_32_32; 
select decode(col1, null, -1, col1) as c3 from SQLD_32_32;
select nvl(col1, -1) as c4 from SQLD_32_32;

SELECT  *
FROM    SQLD_32_35
ORDER BY COL1 DESC, COL2 DESC, COL3 DESC
;


SELECT   CASE WHEN GROUPING(자재번호) = 1 THEN '자재전체'   ELSE 자재번호	 END AS 자재번호
        ,CASE WHEN GROUPING(발주처ID) = 1 THEN '발주처전체' ELSE 발주처ID  END AS 발주처ID
        ,CASE WHEN GROUPING(발주일자) = 1 THEN '발주일자전체' ELSE 발주일자  END AS 발주일자
        ,SUM(발주수량) AS 발주수량합계
FROM SQLD_32_40
GROUP BY GROUPING SETS(자재번호, (발주처ID, 발주일자))
ORDER BY 자재번호, 발주처ID, 발주일자
;

SELECT  자재번호
        ,발주처ID
        ,발주일자
        ,SUM(발주수량)
        ,GROUPING(자재번호)
        ,GROUPING(발주처ID)
        ,GROUPING(발주일자)
FROM SQLD_32_40
GROUP BY GROUPING SETS(자재번호, 발주처ID,발주일자)
ORDER BY 자재번호, 발주처ID, 발주일자
;
--ALTER TABLE S32_41 RENAME TO S32_41_1;
SELECT  SUM(A.COL1)
FROM    S32_41_1 A, S32_41_2 B
WHERE   A.COL2 <> B.COL2
;


SELECT  GRADE
        ,JOB_ID
        ,SUM(GRADE)
FROM    SQLD_32_46
;
--ALTER TABLE SQLD_32_46 DROP COLUMN GRADE;
--ALTER TABLE SQLD_32_46 RENAME TO SQLD_32_46_1;

SELECT  B.GRADE
        ,A.JOB_ID
        ,SUM(B.GRADE)
FROM    SQLD_32_46_1 A, SQLD_32_46_2 B
GROUP BY GROUPING SETS(B.GRADE ,(B.GRADE, A.JOB_ID))
;

