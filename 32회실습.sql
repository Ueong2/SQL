/*
DROP TABLE SQLD_32_18;
CREATE TABLE SQLD_32_18
(   
    "�����Ƿ�" VARCHAR(30),
    "�����Ƿ�" VARCHAR(30),
    "�Ƿ���ȣ" NUMBER(10)
);
ALTER TABLE SQLD_32_18 MODIFY ("�����Ƿ�" VARCHAR(100));
ALTER TABLE SQLD_32_18 MODIFY ("�����Ƿ�" VARCHAR(100));
ALTER TABLE SQLD_32_18 ADD COLUMN "�Ƿ���ȣ" NUMBER(100);

INSERT INTO SQLD_32_18 ("�����Ƿ�", "�����Ƿ�","�Ƿ���ȣ") VALUES ('�ƿ����', '�縻', 1);
INSERT INTO SQLD_32_18 ("�����Ƿ�", "�����Ƿ�","�Ƿ���ȣ") VALUES ('�����', '�ƿ����', 2);
INSERT INTO SQLD_32_18 ("�����Ƿ�", "�����Ƿ�","�Ƿ���ȣ") VALUES ('�ܿ����', '�����', 3);
INSERT INTO SQLD_32_18 ("�����Ƿ�", "�����Ƿ�","�Ƿ���ȣ") VALUES ('����', '�ܿ����', 4);
INSERT INTO SQLD_32_18 ("�����Ƿ�", "�����Ƿ�","�Ƿ���ȣ") VALUES (NULL, '����', 5);
INSERT INTO SQLD_32_18 ("�����Ƿ�", "�����Ƿ�","�Ƿ���ȣ") VALUES ('������', '�չ���', 6);
INSERT INTO SQLD_32_18 ("�����Ƿ�", "�����Ƿ�","�Ƿ���ȣ") VALUES ('�縻', '������', 7);

SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables; ������� ���̺� �����ϴ� ����
ALTER TABLE "SQLD_32_18" RENAME TO "SQLD_32_19"; ���̺�� ����

*/
SELECT  *
FROM SQLD_32_18
START WITH "�����Ƿ�" IS NULL
CONNECT BY PRIOR "�����Ƿ�" = "�����Ƿ�"
;
--ALTER table ���̺�� modify (Į���� default not null) �׳� DEFAULT NOT NULL �ϸ� �ȵǴµ�? DEFAULT 0 �ؾ� ��
--ALTER TABLE S32_20 MODIFY ("�μ�ID" DEFAULT 0 NOT NULL);

SELECT  *
FROM    S32_20
;
SELECT  �����μ��ڵ�
FROM    SQLD_32_20
WHERE   �μ��ڵ� = 200
START WITH �����μ��ڵ� = 0
CONNECT BY PRIOR �μ��ڵ� = �����μ��ڵ�
;


SELECT  COUNT(NVL(NUM,0))
        ,SUM(NVL(NUM,0)) / 4
        ,AVG(NVL(NUM,0))
        ,MIN(NVL(NUM,5))
FROM SQLD_32_26;


SELECT  ��
        ,COUNT(DISTINCT �̸�) AS "�����"
FROM    SQLD_32_27
GROUP BY ��
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


SELECT   CASE WHEN GROUPING(�����ȣ) = 1 THEN '������ü'   ELSE �����ȣ	 END AS �����ȣ
        ,CASE WHEN GROUPING(����óID) = 1 THEN '����ó��ü' ELSE ����óID  END AS ����óID
        ,CASE WHEN GROUPING(��������) = 1 THEN '����������ü' ELSE ��������  END AS ��������
        ,SUM(���ּ���) AS ���ּ����հ�
FROM SQLD_32_40
GROUP BY GROUPING SETS(�����ȣ, (����óID, ��������))
ORDER BY �����ȣ, ����óID, ��������
;

SELECT  �����ȣ
        ,����óID
        ,��������
        ,SUM(���ּ���)
        ,GROUPING(�����ȣ)
        ,GROUPING(����óID)
        ,GROUPING(��������)
FROM SQLD_32_40
GROUP BY GROUPING SETS(�����ȣ, ����óID,��������)
ORDER BY �����ȣ, ����óID, ��������
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

