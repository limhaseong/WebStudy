SELECT USER
FROM DUAL;
--==> SCOTT

SELECT *
FROM TAB;

SELECT *
FROM TBL_MEMBER;
/*
5	박나영	010-5555-5555
6	정현욱	010-6666-6666
7	홍길동	010-7777-7777
1	문정환	010-1111-1111
2	정한울	010-2222-2222
3	최혜인	010-3333-3333
4	길현욱	010-4444-4444
*/

DESC TBL_MEMBER;
/*
이름   널?       유형           
---- -------- ------------ 
SID  NOT NULL NUMBER       
NAME          VARCHAR2(30) 
TEL           VARCHAR2(40)
*/

TRUNCATE TABLE TBL_MEMBER;
--==> Table TBL_MEMBER이(가) 잘렸습니다.

DROP SEQUENCE MEMBERSEQ;
--==> Sequence MEMBERSEQ이(가) 삭제되었습니다.

CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==> Sequence MEMBERSEQ이(가) 생성되었습니다.

INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '강혜성', '010-1111-1111');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '김동민', '010-2222-2222');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '이주형', '010-3333-3333');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '엄재용', '010-4444-4444');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '김지민', '010-5555-5555');
--==> 1 행 이(가) 삽입되었습니다.

SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--> 한 줄 구성
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;
/*
1	강혜성	010-1111-1111
2	김동민	010-2222-2222
3	이주형	010-3333-3333
4	엄재용	010-4444-4444
5	김지민	010-5555-5555
*/

COMMIT;
--==> 커밋 완료.

--○ 인원 수 확인 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBER;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER
;
--==> 5







