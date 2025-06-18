1. student 테이블을 참고해서 진행하세요.
학생들의 이름과 주민번호, 생일 그리고  jumin, birthday 참고해서 태어난 날짜별로 분기를 표시하는 쿼리를 작성하세요.
태어난 월에 따라서 각 분기로 표시
1~3 1분기
4~6 2분기
7~9 3분기
10~12 4분기

select name, jumin, birthday,
        CASE
            when SUBSTR(birthday, 4, 2) in (01,02,03)  then '1분기'
            when SUBSTR(birthday, 4, 2) in (04,05,06)  then '2분기'
            when SUBSTR(birthday, 4, 2) in (07,08,09)  then '3분기'
            when SUBSTR(birthday, 4, 2) in (10,11,12)  then '4분기'
        END 분기
from student;

--==============

select name, jumin, birthday,
        TO_CHAR(birthday, 'MM'),
        --DECODE(TO_CHAR(birthday, 'MM'), '01', '1분기', ...)
        CASE
            when TO_CHAR(birthday, 'MM') in ('01','02','03') then '1분기'
            when TO_CHAR(birthday, 'MM') in (4,5,6) then '2분기'
            when TO_NUMBER(TO_CHAR(birthday, 'MM')) between 7 and 9 then '3분기'
        else '4분기'
        END 분기
from student;

2.
emp 테이블을 조회하여 empno , ename , sal , LEVEL(급여등급)을 출력하세요.
단 급여등급은 sal 을 기준으로
1 - 1000 이면 Level 1,
1001 - 2000 이면 Level 2,
2001 - 3000 이면 Level 3,
3001 - 4000 이면 Level 4 ,
4001 보다 많으면 Level 5 로 출력하세요.

select empno, ename, sal,
        CASE
            when sal between 1001 and  2000 then 'Level 2'
            when sal between 2001 and  3000 then 'Level 3'
            when sal between 3001 and  4000 then 'Level 4'
            when sal between 4001 and  5000 then 'Level 5'
            else 'Level 1'
        END 분기
from emp;
