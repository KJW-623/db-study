
/********************************************************/
단일행 함수

select * from dual;
dual: 더미 데이터가 들어있는 임시로 사용하는 테이블

select INITCAP('abc') from dual;

select ename, INITCAP(ename)
from emp;

select name, LOWER(name), UPPER(name)
from student;

select name, LENGTH(name)
from student;

select LENGTH('asdoijf'), LENGTHB('asdoijf'), 
       LENGTH('한글'), LENGTHB('한글') -- 한글 한글자 3byte
from dual;

--이름이 알파벳 5자 이상만 조회
select * 
from emp
where LENGTH(ename) >= 5;

select '아침' || '점심' || '저녁', CONCAT(CONCAT('아침', '점심'), '저녁')
from dual;


--SUBSTR(대상값/컬럼명, 시작지점(1~), 자릿수)
SELECT
    SUBSTR('abcdefg', 1, 3),
    SUBSTR('abcdefg', 3, 5),
    SUBSTR('abcdefg', -4, 2)
FROM dual;

--INSTR(대상값/컬럼명, 찾는값)
--INSTR(대상값/컬럼명, 찾는값, 시작위치)
--INSTR(대상값/컬럼명, 찾는값, 시작위치, 몇번째값)
select
    INSTR('2025-06-01 10:25:48', '-'),
    INSTR('2025-06-01 10:25:48', ':'),
    INSTR('2025-06-01 10:25:48', '-', 7),
    INSTR('2025-06-01 10:25:48', ':', 15),
    INSTR('2025-06-01 10:25:48', '-', 1, 2)
from dual;

select 
    tel,
    INSTR(tel, ')')
from student;   --010-1234-5678 055)381-2158

select 
    LPAD('문자', 10, '-'),
    RPAD('123', 6, '*'),
    LPAD(5, 2, 0),
    LPAD(15, 2, 0)
from dual;

--TRIM 공백제거
select
    '*' || LTRIM(' abcd ') || '*',
    RTRIM(' abcd '),
    TRIM(' abcd '),
    LTRIM('*abcd*', '*')
from dual;

select
    REPLACE('abcde', 'c', '/')
from dual;
    
select 
    birthday,
    REPLACE(birthday, '/', '$')
from student;



/********************************************************/
숫자

select
    ROUND (1.67), --반올림
    ROUND(1.67, 1),
    ROUND(1.64578, 3),
    ROUND(1.64578, 0),
    ROUND(357.123,-1),
    TRUNC(1.456), --버림
    TRUNC(1.456, 2),
    MOD(15, 4), -- 나머지
    CEIL(123.123), --인접 큰 정수
    FLOOR(123.123), --인접 작은 정수
    POWER(6, 3) --6*6*6 제곱
from dual;

select
    rownum, --행번호
    CEIL(rownum/3) 그룹번호, --1/3=0.33>>1 2/3=0.66>>1 3/3=1
                            --4/3 = 1.33>>2 5/3 = 1.66>>2 6/3=2 
    CEIL(rownum/4) 팀구분,
    empno,
    ename
from emp;
--where rownum <=5;



/********************************************************/
--날짜

select 
    null,
    SYSDATE, --현재 날짜
    SYSTIMESTAMP,    --현재 날짜 시간
    MONTHS_BETWEEN('2024-01-05', '2024-03-05'), --앞날짜-뒷날짜 >> 월로 환산
    MONTHS_BETWEEN('2024-11-05', '2025-06-21'),
    ADD_MONTHS(SYSDATE, 3),
    ADD_MONTHS(SYSDATE, -8),
    LAST_DAY(SYSDATE),
    NEXT_DAY(SYSDATE, '수'),
    NEXT_DAY(SYSDATE, '토')
from dual;

SELECT
    SYSDATE,
    ROUND(SYSDATE),
    TRUNC(SYSDATE),
    TRUNC(SYSDATE, 'DD'), -- 해당 날짜의 자정으로 시간을 자릅니다.
    TRUNC(SYSDATE, 'MM'), -- 해당 월의 첫째 날로 시간을 자릅니다.
    TRUNC(SYSDATE, 'YY'), -- 해당 연도의 첫째 날로 시간을 자릅니다.
    ADD_MONTHS(SYSDATE, 1), -- 현재 날짜로부터 1개월 뒤의 날짜
    SYSDATE + 3, -- 현재 날짜로부터 3일 뒤의 날짜
    SYSDATE + 7, -- 현재 날짜로부터 7일 뒤의 날짜

    -- 다음 달의 첫째 날
    TRUNC(ADD_MONTHS(SYSDATE, 1), 'MM'), -- 현재 날짜로부터 1개월 뒤 날짜의 첫째 날
    LAST_DAY(SYSDATE) + 1,               -- 현재 달의 마지막 날 + 1일 = 다음 달 첫째 날

    -- 전월의 마지막 날
    LAST_DAY(ADD_MONTHS(SYSDATE, -1)),   -- 현재 날짜로부터 1개월 전 날짜의 마지막 날
    TRUNC(SYSDATE, 'MM') - 1             -- 현재 달의 첫째 날 - 1일 = 지난 달의 마지막 날
FROM dual;




