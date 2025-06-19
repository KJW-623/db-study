/********************************************************/
join

select * from emp;

select * from dept;

--JOIN 기준 deptno가 같은!!

--select empno, ename, dname, loc, e.deptno
select e.empno, e.ename, d.dname, d.loc, d.deptno
from emp e, dept d
where e.deptno = d.deptno;

select e.empno, e.ename, d.dname, d.loc, d.deptno
from emp e INNER JOIN dept d
ON e.deptno = d.deptno;


select * 
from emp e, dept d; --join 조건 누락 -> 카티션 곱
--where e.deptno = d.deptno;

select * from student;
select * from professor;
--student <- join(profno) -> professor

select 
    s.name, p.name, s.studno, p.profno, p. email
from student s, professor p
where s.profno = p.profno;


select 
    s.name, p.name, s.studno, p.profno, p. email
from student s INNER JOIN professor p
ON s.profno = p.profno;


INNER JOIN, OUTER JOIN

select COUNT(*) from student;
select * from sutdent;

select *
from student s, professor p
--where s.profno = p.profno(+);
--where p.profno = s.profno(+);
where p.profno(+) = s.profno;

select *
from student s LEFT OUTER JOIN professor p
--from professor p LEFT OUTER JOIN student s
--from professor p LEFT OUTER JOIN student s
--from professor p RIGHT OUTER JOIN student s
ON s.profno = p.profno;


--professor 테이블 기준

select COUNT(*) from professor; --16명

select
    s.name, p.name, s.studno, p.profno, p.email
from professor p, student s
where p.profno = s.profno;

select
    s.name, p.name, s.studno, p.profno, p.email
from professor p, student s
where p.profno = s.profno (+);




--2) 학생테이블(student)과 교수 테이블(professor)을 join하여 학생의 이름과 지도교수번호, 지도교수 이름을 출력하세요.
select s.name STU_NAME, p.profno, p.name PROF_NAME
from student s, professor p
where s.profno = p.profno;


--3) 학생테이블(student)과 학과 테이블(department), 교수 테이블(professor)을 join하여 
--   학생의 이름과 학생의 학과 이름, 학생의 지도교수 이름을 출력하세요.
select s.name STU_NAME, d.dname DEPT_NAME, p.name PROF_NAME
from student s, professor p, department d
where s.profno = p.profno
      AND s.deptno1 = d.deptno;
      
      
--4) student 테이블을 조회하여 1전공(deptno1)이 101번인 학생들의 이름과 각 학생들의 지도교수 번호와 지도교수 이름을 출력하세요.

select s.name, p.profno, p.name
from student s, professor p
where s.deptno1 = 101
AND s.profno = p.profno;


--1) 학생명, 학생학과번호, 학생의 학과명, 교수명, 교수학과번호
select s.name STU_NAME, s.deptno1 STU_DEPTNO, d.dname DEPT_NAME, p.name PROF_NAME, p.deptno PROF_DEPTNO
from student s, professor p, department d
where s.profno = p.profno
      AND s.deptno1 = d.deptno;

--2) 학생명, 학생학과번호, 교수의 학과명, 교수명, 교수학과번호
select s.name STU_NAME, s.deptno1 STU_DEPTNO, d.dname DEPT_NAME, p.name PROF_NAME, p.deptno PROF_DEPTNO
from student s, professor p, department d
where s.profno = p.profno
      AND p.deptno = d.deptno;
      --AND p.deptno <> s.deptno;
      
--3) 학생명, 학생학과번호, 학생의 학과명, 교수명, 교수학과번호, 교수의 학과명
select s.name STU_NAME, s.deptno1 STU_DEPTNO, d.dname STUDEPT_NAME,
       p.name PROF_NAME, p.deptno PROF_DEPTNO, d.dname PROFDEPT_NAME
from student s, professor p, department d, department de
where s.profno = p.profno
      AND p.deptno = d.deptno
      AND s.deptno1 = de.deptno;
      --AND p.deptno <> s.deptno;
      
      
      
/********************************************************/
비등가 join

select * from customer;
select * from gift;

select * 
from customer c, gift g
where c.point BETWEEN g.g_start AND g.g_end;

select * from hakjum;

self join
select * from emp;


select * 
from emp e1, emp e2
where e1.mgr = e2.empno;

select * from emp2;

select A.empno 내사번, A.name 내이름, A.pempno 상사사번, B.name 상사이름
from emp2 A, emp2 B
where A.pempni = B.empno;

