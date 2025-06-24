
사전준비.
CREATE TABLE temp_dept2
AS
SELECT * FROM dept2;

1. temp_dept2 테이블에 아래와 같은 내용으로 새로운 부서정보를 입력하세요.
* 부서번호 : 9010
* 부서명 : temp_10
* 상위부서 : 1006
* 지역 : temp area

SELECT * FROM temp_dept2;

INSERT INTO temp_dept2 VALUES (9010, 'temp_10', 1006, 'temp area');

SELECT * FROM temp_dept2;


2. temp_dept2 테이블에 아래와 같은 내용으로 특정컬럼에만 정보를 입력하세요
* 부서번호 : 9020
* 부서명 : temp_20
* 상위부서 : Business Department ( 1006 번 부서 )

INSERT INTO temp_dept2 (dcode, dname, pdept)
VALUES (9020, 'temp_20', 1006);

SELECT * FROM temp_dept2;


3. professor 테이블에서 profno 가 3000 번 이하의 교수들의 profno , name , pay 를 가져와서 새로운 new_professor 테이블을 생성하면서 데이터 한번에 넘겨지며 저장하는 쿼리를 쓰세요.

CREATE TABLE new_professor
AS
SELECT profno, name, pay, bonus
FROM professor
WHERE profno <= 3000;

SELECT * FROM new_professor;

4. new_professor 테이블에서 'Sharon Stone' 교수의 BONUS 를 100 만원으로 인상하세요.

DROP TABLE new_professor;

UPDATE new_professor
SET bonus = 100
WHERE name = 'Winona Ryder';

select * from new_professor;