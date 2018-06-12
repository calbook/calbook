COMMIT;
ROLLBACK;
-- ADMIN --
CREATE TABLE ADMIN(
    EMAIL   VARCHAR2(50),
    PWD VARCHAR2(50) NOT NULL,
    
    CONSTRAINT PK_ADMIN_EMAIL PRIMARY KEY(EMAIL)
);


-- NOTICE --
CREATE TABLE NOTICE(
    SEQ NUMBER(10),
    TITLE   VARCHAR2(50) NOT NULL,
    CONTENT VARCHAR2(300) NOT NULL,
    WRITER  VARCHAR2(50) NOT NULL,
    HIT NUMBER(10) DEFAULT 0 NOT NULL,
    REGDATE DATE DEFAULT SYSDATE NOT NULL,
    
    CONSTRAINT PK_NOTICE_SEQ PRIMARY KEY(SEQ),
    CONSTRAINT FK_NOTICE_WRITER FOREIGN KEY(WRITER) REFERENCES ADMIN(EMAIL)
);


------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------


-- MEMBERS --
CREATE TABLE MEMBERS(
    EMAIL   VARCHAR2(50),
    PWD VARCHAR2(50) NOT NULL,
    NICK    VARCHAR2(50) UNIQUE NOT NULL,
    PHONE   VARCHAR2(50) UNIQUE,
    PROFILE VARCHAR2(100) DEFAULT NULL,
    OPEN    NUMBER(3) DEFAULT 0,
    REGDATE DATE DEFAULT SYSDATE,
    
    CONSTRAINT PK_MEMBERS_EMAIL PRIMARY KEY(EMAIL)
);

SELECT * FROM MEMBERS WHERE EMAIL='jackie-kim@gmail.com';
SELECT * FROM MEMBERS;
DELETE MEMBERS WHERE EMAIL='pyr7221@naver.com';
UPDATE MEMBERS SET NICK='', PHONE='', PWD='', PROFILE='', OPEN= WHERE EMAIL='';



-- FRIENDS --
CREATE TABLE FRIENDS(
    M_EMAIL VARCHAR2(50) NOT NULL,
    F_EMAIL VARCHAR2(50) NOT NULL,
    RELATION    NUMBER(3) DEFAULT 0,
    
    CONSTRAINT PK_FRIENDS_EMAIL PRIMARY KEY(M_EMAIL, F_EMAIL),
    CONSTRAINT FK_FRIENDS_M_EMAIL FOREIGN KEY(M_EMAIL) REFERENCES MEMBERS(EMAIL),
    CONSTRAINT FK_FRIENDS_F_EMAIL FOREIGN KEY(F_EMAIL) REFERENCES MEMBERS(EMAIL)
);



-- GROUP --
CREATE TABLE GROUPS(
    NUM   NUMBER(38) NOT NULL,
    OWNER VARCHAR2(50) NOT NULL,
    CONTENT VARCHAR2(200) DEFAULT NULL,
    NAME    VARCHAR2(100) NOT NULL,
    STATUS  DATE DEFAULT NULL,
    
    CONSTRAINT PK_GROUP_G_NUM PRIMARY KEY(NUM),
    CONSTRAINT FK_GROUP_OWNER FOREIGN KEY(OWNER) REFERENCES MEMBERS(EMAIL)
);




-- SCHEDULES --
CREATE TABLE SCHEDULES(
    SEQ NUMBER(38),
    M_EMAIL VARCHAR2(50) NOT NULL,
    TITLE   VARCHAR2(50) NOT NULL,
    CONTENT VARCHAR2(300) DEFAULT NULL,
    IMPORTANT   NUMBER(3) DEFAULT 2 NOT NULL,
    START_DATE  DATE NOT NULL,
    FINISH_DATE DATE NOT NULL,
    LOCATION    VARCHAR2(100) DEFAULT NULL,
    G_NUM   NUMBER(38) DEFAULT NULL,
    
    CONSTRAINT PK_SCHEDULES_SEQ PRIMARY KEY(SEQ),
    CONSTRAINT FK_SCHEDULES_M_EMAIL FOREIGN KEY(M_EMAIL) REFERENCES MEMBERS(EMAIL),
    CONSTRAINT FK_SCHEDULES_G_NUM FOREIGN KEY(G_NUM) REFERENCES GROUPS(NUM)
);



--  ACCOUTN BOOK
--  KIND(����,����)
-- ���� �з� : ����, �μ���, �뵷, ��, �����ҵ�, ��Ÿ
-- ���� �з� : �ĺ�, ����/����, ��ȭ��Ȱ, ��Ʈ/������, �м�, ��Ȱ��ǰ, ��Ÿ
CREATE TABLE ACCOUNTBOOK(
    NUM NUMBER(38),
    M_EMAIL VARCHAR2(50) NOT NULL,
    ADATE    DATE NOT NULL,
    KIND    VARCHAR2(20) DEFAULT '����' NOT NULL,
    SUB_KIND    VARCHAR2(50) DEFAULT '��Ÿ' NOT NULL,
    AMOUNT NUMBER(20) NOT NULL,
    CONTENT VARCHAR2(100) DEFAULT NULL,
    
    CONSTRAINT PK_ACCOUNTBOOK_NUM PRIMARY KEY(NUM),
    CONSTRAINT FK_ACCOUNTBOOK_M_EMAIL FOREIGN KEY(M_EMAIL) REFERENCES MEMBERS(EMAIL)    
);

ALTER TABLE ACCOUNTBOOK RENAME COLUMN BUDGET TO AMOUNT;

SELECT * FROM ACCOUNTBOOK;

SELECT SUM(AMOUNT) SUM, KIND FROM ACCOUNTBOOK WHERE TO_CHAR(ADATE, 'YYYY/MM/DD')='2018/05/25' GROUP BY KIND, M_EMAIL HAVING M_EMAIL='pyr7221@naver.com' ORDER BY KIND;
SELECT SUM(AMOUNT) SUM, KIND FROM ACCOUNTBOOK WHERE TO_CHAR(ADATE, 'YYYY/MM')='2018/05' GROUP BY KIND, M_EMAIL HAVING M_EMAIL='pyr7221@naver.com' ORDER BY KIND;
SELECT * FROM ACCOUNTBOOK WHERE TO_CHAR(ADATE, 'YYYY/MM/DD')='2018/05/25' AND M_EMAIL='pyr7221@naver.com' ORDER BY ADATE;
SELECT * FROM ACCOUNTBOOK WHERE TO_CHAR(ADATE, 'YYYY/MM')='2018/05' AND M_EMAIL='pyr7221@naver.com' ORDER BY ADATE;
SELECT SAB.* FROM (SELECT SUM(AMOUNT) SUM, KIND FROM ACCOUNTBOOK GROUP BY KIND, M_EMAIL HAVING M_EMAIL='pyr7221@naver.com' AND KIND IN(0,1) ORDER BY KIND) SAB;
SELECT * FROM ACCOUNTBOOK where M_EMAIL='pyr7221@naver.com' ORDER BY KIND;
SELECT SUM(AMOUNT) SUM, SUB_KIND KIND FROM ACCOUNTBOOK WHERE M_EMAIL='pyr7221@naver.com' AND KIND='����' AND TO_CHAR(ADATE, 'YYYY/MM')='2018/05' GROUP BY SUB_KIND;
SELECT SUM(AMOUNT) SUM, KIND FROM ACCOUNTBOOK WHERE ADATE BETWEEN '2018/05/28' AND '2018/05/30' GROUP BY KIND, M_EMAIL HAVING M_EMAIL='pyr7221@naver.com' ORDER BY KIND;
SELECT * FROM ACCOUNTBOOK WHERE ADATE BETWEEN '2018/05/28' AND '2018/05/30' AND M_EMAIL='pyr7221@naver.com' ORDER BY ADATE;

INSERT INTO ACCOUNTBOOK VALUES(NVL((SELECT MAX(NUM) FROM ACCOUNTBOOK)+1,1), 'pyr7221@naver.com', SYSDATE, '����', '�뵷', 200000, '�뵷');
INSERT INTO ACCOUNTBOOK VALUES(NVL((SELECT MAX(NUM) FROM ACCOUNTBOOK)+1,1), 'pyr7221@naver.com', SYSDATE, '����', '�ĺ�', 3900, '����(�̽����̰�)');
INSERT INTO ACCOUNTBOOK VALUES(NVL((SELECT MAX(NUM) FROM ACCOUNTBOOK)+1,1), 'pyr7221@naver.com', SYSDATE, '����', '�ĺ�', 1000, '����(���ܰ���)');
INSERT INTO ACCOUNTBOOK VALUES(NVL((SELECT MAX(NUM) FROM ACCOUNTBOOK)+1,1), 'pyr7221@naver.com', SYSDATE, '����', '�ĺ�', 1900, '����(������)');
INSERT INTO ACCOUNTBOOK VALUES(NVL((SELECT MAX(NUM) FROM ACCOUNTBOOK)+1,1), 'pyr7221@naver.com', SYSDATE, '����', '����/����', 3500, '�����(�պ�)');
INSERT INTO ACCOUNTBOOK VALUES(NVL((SELECT MAX(NUM) FROM ACCOUNTBOOK)+1,1), 'pyr7221@naver.com', '2018/06/01', '����', '��Ÿ', 1500, '������(����)');

DELETE ACCOUNTBOOK WHERE NUM=12;

UPDATE ACCOUNTBOOK SET CONTENT='����(������ġ-ġ��������ż�Ʈ)',AMOUNT=6000 WHERE NUM=2;

DROP TABLE ACCOUNTBOOK;

-- COMMUNITY --
CREATE TABLE COMMUNITY(
    SEQ NUMBER(38),
    TITLE   VARCHAR2(50) NOT NULL,
    CONTENT VARCHAR2(300) DEFAULT NULL,
    CDATE DATE DEFAULT SYSDATE NOT NULL,
    WRITER VARCHAR2(50) NOT NULL,
    HIT NUMBER(10) DEFAULT 0 NOT NULL,
    URL VARCHAR(200) DEFAULT NULL,
    
    CONSTRAINT PK_COMMUNITY_SEQ PRIMARY KEY(SEQ),
    CONSTRAINT FK_COMMUNITY_WRITER FOREIGN KEY(WRITER) REFERENCES MEMBERS(EMAIL)
);
ALTER TABLE COMMUNITY ADD URL VARCHAR2(200) DEFAULT NULL;
ALTER TABLE COMMUNITY MODIFY CONTENT VARCHAR2(1000) DEFAULT NULL;
SELECT * FROM COMMUNITY;
SELECT RN, N.* FROM (SELECT ROWNUM AS RN, M.* FROM (SELECT * FROM COMMUNITY WHERE WRITER='pyr7221@naver.com' AND (TITLE LIKE '%3%' OR CONTENT LIKE '%3%') ORDER BY SEQ DESC) M) N WHERE RN BETWEEN 1 AND 10;
SELECT COUNT(SEQ) FROM COMMUNITY WHERE WRITER='pyr7221@naver.com' AND (TITLE LIKE '%%' OR CONTENT LIKE '%%');
SELECT SEQ, TITLE, CONTENT, TO_CHAR(CDATE, 'YYYY/MM/DD') CDATE, WRITER, HIT, URL FROM COMMUNITY WHERE SEQ=1;
UPDATE COMMUNITY SET HIT=HIT+1 WHERE SEQ=1;

DELETE COMMUNITY WHERE SEQ=21;

INSERT INTO COMMUNITY VALUES(NVL((SELECT MAX(SEQ) FROM COMMUNITY)+1,1), '���ǵ� ������ ������2', '�ٷ����� �� ��� ����ź���� ������ ���� �Ǿ���. �׷��� �����̿� ���ǵ����� ���� �����Ÿ� ����. �ѽð��� 3000���δ� �ѰŰ����� ������ �Ϸ��� ��� Ÿ�⿡�� �����ѰŰ���! �������� Ÿ�� ������ �� �ö� �� ������ ���� �������� �ֽ� �����ϰ� ������ �޷ȴ�. ������ ������ �帴�ϰ� ����� ������ Ÿ�⿡ �� ���� ��������. �п� �����ϰ� �ѹ� �� Ÿ�� ���߰ڴ�..!', '2018/05/21', 'pyr7221@naver.com', 0, NULL);
INSERT INTO COMMUNITY VALUES(NVL((SELECT MAX(SEQ) FROM COMMUNITY)+1,1), '���ǵ� ������ ������3', '�ٷ����� �� ��� ����ź���� ������ ���� �Ǿ���. �׷��� �����̿� ���ǵ����� ���� �����Ÿ� ����. �ѽð��� 3000���δ� �ѰŰ����� ������ �Ϸ��� ��� Ÿ�⿡�� �����ѰŰ���! �������� Ÿ�� ������ �� �ö� �� ������ ���� �������� �ֽ� �����ϰ� ������ �޷ȴ�. ������ ������ �帴�ϰ� ����� ������ Ÿ�⿡ �� ���� ��������. �п� �����ϰ� �ѹ� �� Ÿ�� ���߰ڴ�..!', '2018/05/21', 'pyr7221@naver.com', 0, NULL);
INSERT INTO COMMUNITY VALUES(NVL((SELECT MAX(SEQ) FROM COMMUNITY)+1,1), '���ǵ� ������ ������4', '�ٷ����� �� ��� ����ź���� ������ ���� �Ǿ���. �׷��� �����̿� ���ǵ����� ���� �����Ÿ� ����. �ѽð��� 3000���δ� �ѰŰ����� ������ �Ϸ��� ��� Ÿ�⿡�� �����ѰŰ���! �������� Ÿ�� ������ �� �ö� �� ������ ���� �������� �ֽ� �����ϰ� ������ �޷ȴ�. ������ ������ �帴�ϰ� ����� ������ Ÿ�⿡ �� ���� ��������. �п� �����ϰ� �ѹ� �� Ÿ�� ���߰ڴ�..!', '2018/05/21', 'pyr7221@naver.com', 0, NULL);
INSERT INTO COMMUNITY VALUES(NVL((SELECT MAX(SEQ) FROM COMMUNITY)+1,1), '���ǵ� ������ ������5', '�ٷ����� �� ��� ����ź���� ������ ���� �Ǿ���. �׷��� �����̿� ���ǵ����� ���� �����Ÿ� ����. �ѽð��� 3000���δ� �ѰŰ����� ������ �Ϸ��� ��� Ÿ�⿡�� �����ѰŰ���! �������� Ÿ�� ������ �� �ö� �� ������ ���� �������� �ֽ� �����ϰ� ������ �޷ȴ�. ������ ������ �帴�ϰ� ����� ������ Ÿ�⿡ �� ���� ��������. �п� �����ϰ� �ѹ� �� Ÿ�� ���߰ڴ�..!', '2018/05/21', 'pyr7221@naver.com', 0, NULL);
INSERT INTO COMMUNITY VALUES(NVL((SELECT MAX(SEQ) FROM COMMUNITY)+1,1), '���ǵ� ������ ������6', '�ٷ����� �� ��� ����ź���� ������ ���� �Ǿ���. �׷��� �����̿� ���ǵ����� ���� �����Ÿ� ����. �ѽð��� 3000���δ� �ѰŰ����� ������ �Ϸ��� ��� Ÿ�⿡�� �����ѰŰ���! �������� Ÿ�� ������ �� �ö� �� ������ ���� �������� �ֽ� �����ϰ� ������ �޷ȴ�. ������ ������ �帴�ϰ� ����� ������ Ÿ�⿡ �� ���� ��������. �п� �����ϰ� �ѹ� �� Ÿ�� ���߰ڴ�..!', '2018/05/21', 'pyr7221@naver.com', 0, NULL);
INSERT INTO COMMUNITY VALUES(NVL((SELECT MAX(SEQ) FROM COMMUNITY)+1,1), '���ǵ� ������ ������7', '�ٷ����� �� ��� ����ź���� ������ ���� �Ǿ���. �׷��� �����̿� ���ǵ����� ���� �����Ÿ� ����. �ѽð��� 3000���δ� �ѰŰ����� ������ �Ϸ��� ��� Ÿ�⿡�� �����ѰŰ���! �������� Ÿ�� ������ �� �ö� �� ������ ���� �������� �ֽ� �����ϰ� ������ �޷ȴ�. ������ ������ �帴�ϰ� ����� ������ Ÿ�⿡ �� ���� ��������. �п� �����ϰ� �ѹ� �� Ÿ�� ���߰ڴ�..!', '2018/05/21', 'pyr7221@naver.com', 0, NULL);
INSERT INTO COMMUNITY VALUES(NVL((SELECT MAX(SEQ) FROM COMMUNITY)+1,1), '���ǵ� ������ ������8', '�ٷ����� �� ��� ����ź���� ������ ���� �Ǿ���. �׷��� �����̿� ���ǵ����� ���� �����Ÿ� ����. �ѽð��� 3000���δ� �ѰŰ����� ������ �Ϸ��� ��� Ÿ�⿡�� �����ѰŰ���! �������� Ÿ�� ������ �� �ö� �� ������ ���� �������� �ֽ� �����ϰ� ������ �޷ȴ�. ������ ������ �帴�ϰ� ����� ������ Ÿ�⿡ �� ���� ��������. �п� �����ϰ� �ѹ� �� Ÿ�� ���߰ڴ�..!', '2018/05/21', 'pyr7221@naver.com', 0, NULL);
INSERT INTO COMMUNITY VALUES(NVL((SELECT MAX(SEQ) FROM COMMUNITY)+1,1), '���ǵ� ������ ������9', '�ٷ����� �� ��� ����ź���� ������ ���� �Ǿ���. �׷��� �����̿� ���ǵ����� ���� �����Ÿ� ����. �ѽð��� 3000���δ� �ѰŰ����� ������ �Ϸ��� ��� Ÿ�⿡�� �����ѰŰ���! �������� Ÿ�� ������ �� �ö� �� ������ ���� �������� �ֽ� �����ϰ� ������ �޷ȴ�. ������ ������ �帴�ϰ� ����� ������ Ÿ�⿡ �� ���� ��������. �п� �����ϰ� �ѹ� �� Ÿ�� ���߰ڴ�..!', '2018/05/21', 'pyr7221@naver.com', 0, NULL);
INSERT INTO COMMUNITY VALUES(NVL((SELECT MAX(SEQ) FROM COMMUNITY)+1,1), '���ǵ� ������ ������10', '�ٷ����� �� ��� ����ź���� ������ ���� �Ǿ���. �׷��� �����̿� ���ǵ����� ���� �����Ÿ� ����. �ѽð��� 3000���δ� �ѰŰ����� ������ �Ϸ��� ��� Ÿ�⿡�� �����ѰŰ���! �������� Ÿ�� ������ �� �ö� �� ������ ���� �������� �ֽ� �����ϰ� ������ �޷ȴ�. ������ ������ �帴�ϰ� ����� ������ Ÿ�⿡ �� ���� ��������. �п� �����ϰ� �ѹ� �� Ÿ�� ���߰ڴ�..!', '2018/05/21', 'pyr7221@naver.com', 0, NULL);
INSERT INTO COMMUNITY VALUES(NVL((SELECT MAX(SEQ) FROM COMMUNITY)+1,1), '���ǵ� ������ ������11', '�ٷ����� �� ��� ����ź���� ������ ���� �Ǿ���. �׷��� �����̿� ���ǵ����� ���� �����Ÿ� ����. �ѽð��� 3000���δ� �ѰŰ����� ������ �Ϸ��� ��� Ÿ�⿡�� �����ѰŰ���! �������� Ÿ�� ������ �� �ö� �� ������ ���� �������� �ֽ� �����ϰ� ������ �޷ȴ�. ������ ������ �帴�ϰ� ����� ������ Ÿ�⿡ �� ���� ��������. �п� �����ϰ� �ѹ� �� Ÿ�� ���߰ڴ�..!', '2018/05/21', 'pyr7221@naver.com', 0, NULL);
INSERT INTO COMMUNITY VALUES(NVL((SELECT MAX(SEQ) FROM COMMUNITY)+1,1), '���ǵ� ������ ������12', '�ٷ����� �� ��� ����ź���� ������ ���� �Ǿ���. �׷��� �����̿� ���ǵ����� ���� �����Ÿ� ����. �ѽð��� 3000���δ� �ѰŰ����� ������ �Ϸ��� ��� Ÿ�⿡�� �����ѰŰ���! �������� Ÿ�� ������ �� �ö� �� ������ ���� �������� �ֽ� �����ϰ� ������ �޷ȴ�. ������ ������ �帴�ϰ� ����� ������ Ÿ�⿡ �� ���� ��������. �п� �����ϰ� �ѹ� �� Ÿ�� ���߰ڴ�..!', '2018/05/21', 'pyr7221@naver.com', 0, NULL);
INSERT INTO COMMUNITY VALUES(NVL((SELECT MAX(SEQ) FROM COMMUNITY)+1,1), '���ǵ� ������ ������13', '�ٷ����� �� ��� ����ź���� ������ ���� �Ǿ���. �׷��� �����̿� ���ǵ����� ���� �����Ÿ� ����. �ѽð��� 3000���δ� �ѰŰ����� ������ �Ϸ��� ��� Ÿ�⿡�� �����ѰŰ���! �������� Ÿ�� ������ �� �ö� �� ������ ���� �������� �ֽ� �����ϰ� ������ �޷ȴ�. ������ ������ �帴�ϰ� ����� ������ Ÿ�⿡ �� ���� ��������. �п� �����ϰ� �ѹ� �� Ÿ�� ���߰ڴ�..!', '2018/05/21', 'pyr7221@naver.com', 0, NULL);
INSERT INTO COMMUNITY VALUES(NVL((SELECT MAX(SEQ) FROM COMMUNITY)+1,1), '���ǵ� ������ ������14', '�ٷ����� �� ��� ����ź���� ������ ���� �Ǿ���. �׷��� �����̿� ���ǵ����� ���� �����Ÿ� ����. �ѽð��� 3000���δ� �ѰŰ����� ������ �Ϸ��� ��� Ÿ�⿡�� �����ѰŰ���! �������� Ÿ�� ������ �� �ö� �� ������ ���� �������� �ֽ� �����ϰ� ������ �޷ȴ�. ������ ������ �帴�ϰ� ����� ������ Ÿ�⿡ �� ���� ��������. �п� �����ϰ� �ѹ� �� Ÿ�� ���߰ڴ�..!', '2018/05/21', 'pyr7221@naver.com', 0, NULL);
INSERT INTO COMMUNITY VALUES(NVL((SELECT MAX(SEQ) FROM COMMUNITY)+1,1), '���ǵ� ������ ������15', '�ٷ����� �� ��� ����ź���� ������ ���� �Ǿ���. �׷��� �����̿� ���ǵ����� ���� �����Ÿ� ����. �ѽð��� 3000���δ� �ѰŰ����� ������ �Ϸ��� ��� Ÿ�⿡�� �����ѰŰ���! �������� Ÿ�� ������ �� �ö� �� ������ ���� �������� �ֽ� �����ϰ� ������ �޷ȴ�. ������ ������ �帴�ϰ� ����� ������ Ÿ�⿡ �� ���� ��������. �п� �����ϰ� �ѹ� �� Ÿ�� ���߰ڴ�..!', '2018/05/21', 'pyr7221@naver.com', 0, NULL);
INSERT INTO COMMUNITY VALUES(NVL((SELECT MAX(SEQ) FROM COMMUNITY)+1,1), '���ǵ� ������ ������16', '�ٷ����� �� ��� ����ź���� ������ ���� �Ǿ���. �׷��� �����̿� ���ǵ����� ���� �����Ÿ� ����. �ѽð��� 3000���δ� �ѰŰ����� ������ �Ϸ��� ��� Ÿ�⿡�� �����ѰŰ���! �������� Ÿ�� ������ �� �ö� �� ������ ���� �������� �ֽ� �����ϰ� ������ �޷ȴ�. ������ ������ �帴�ϰ� ����� ������ Ÿ�⿡ �� ���� ��������. �п� �����ϰ� �ѹ� �� Ÿ�� ���߰ڴ�..!', '2018/05/21', 'pyr7221@naver.com', 0, NULL);
INSERT INTO COMMUNITY VALUES(NVL((SELECT MAX(SEQ) FROM COMMUNITY)+1,1), '���ǵ� ������ ������18', '�ٷ����� �� ��� ����ź���� ������ ���� �Ǿ���. �׷��� �����̿� ���ǵ����� ���� �����Ÿ� ����. �ѽð��� 3000���δ� �ѰŰ����� ������ �Ϸ��� ��� Ÿ�⿡�� �����ѰŰ���! �������� Ÿ�� ������ �� �ö� �� ������ ���� �������� �ֽ� �����ϰ� ������ �޷ȴ�. ������ ������ �帴�ϰ� ����� ������ Ÿ�⿡ �� ���� ��������. �п� �����ϰ� �ѹ� �� Ÿ�� ���߰ڴ�..!', TO_CHAR(SYSDATE, 'YYYY/MM/DD'), 'pyr7221@naver.com', 0, NULL);


