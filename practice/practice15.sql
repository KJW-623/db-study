1.
student, score, hakjum 테이블을 활용하여 다음 정보를 출력하세요.
각 학생 별로 점수가 몇점이고 그 점수가 어떤 학점인지를 확인하고 싶습니다.

학번 이름 점수 학점 순으로 조회하세요.

select * from student;
select * from score;
select * from hakjum;

select s.studno 학번, s.name 이름, sc.total 점수, h.grade 학점
from student s, score sc, hakjum h
where s.studno = sc.studno
        and sc.total between h.min_point and h.max_point;
        
        
2.
student, score, hakjum 테이블을 활용하여 다음 정보를 출력하세요.
각 학생 별로 점수가 몇점이고 그 점수가 어떤 학점인지를 확인하고 싶습니다.

학번 이름 점수 학점 순으로 조회하세요.

위 내역에서 101, 102 학과에 속한 학생들의 정보만 보여주세요.

select * from student;
select * from score;
select * from hakjum;

select s.studno 학번, s.name 이름, sc.total 점수, h.grade 학점
from student s, score sc, hakjum h
where s.deptno1 in (101, 102)
        and s.studno = sc.studno
        and sc.total between h.min_point and h.max_point
order by sc.total desc;


3.
--학생 테이블(student)과 학과 테이블(department) , 교수 테이블(professor) 을 Join하여
--301학과 속한 교수를 제외한 교수를 지도교수로 두고 있는
--학생의 이름과 학생의 학년, 학생의 지도교수 이름, 지도교수의 학과 번호, 지도교수가 속한 학과이름을 출력하세요.

select * from student;
select * from department;
select * from professor;

select s.name, s.grade, p.name, p.deptno, d.dname
from student s, department d, professor p
where p.deptno != 301
        and s.profno = p.profno
        and p.deptno = d.deptno
order by s.grade desc;