/*emp2 테이블을 기준으로 아래 정보를 출력
사원들 중에 70년대 생이면서 지역번호를 기준으로 서울(02), 경기도(031)에 거주하는
사원들의 정보를 아래와 같이 출력하시오.
사번, 이름, 생년월일, 취미, 급여(pay), 성과급(급여의 150%)
, 직원분류(단, 가족과 같은 직원이라서 family로 표기)
,전화번호, 급여수준
(단, 급여수준은 아래와 같이 분류)
3500만 1원 ~ 4500만 : '하'
4500만 1원 ~ 6천만 : '중"
6000만 1원 이상 : '상'
그 외... : '화이팅'*/

select * from emp2;

select empno 사번,
       name 이름,
       birthday 생년월일,
       hobby 취미,
       pay 급여,
       pay * 1.5 성과급,
       REPLACE(emp_type, 'employee', 'family') "직원 분류",
       tel,
       CASE
            when pay between 35000001 and  45000000 then '하'
            when pay between 45000001 and  60000000 then '중'
            when pay >= 60000001 then '상'
            else '화이팅'
       END 급여수준
from emp2
where SUBSTR(birthday, 1, 1) = 7 and SUBSTR(tel, 1, 3) in ('02)', '031');