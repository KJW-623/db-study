1.
student, department 테이블 활용
학과 이름, 학과별 최대키, 학과별 최대키를 가진 학생들의 이름과 키를 출력 하세요.
select * from student;
select * from department;

select d.dname, s.height MAX_HEIGHT, s.name, s.height
from student s, department d
where (deptno1, height) IN (select deptno1, MAX(height)
                            from student
                            group by deptno1)
    and s.deptno1 = d.deptno;


2.
student 테이블에서 학생의 키가 동일 학년의 평균 키 보다 큰 학생들의 학년과 이름과 키,
해당 학년의 평균 키를 출력 하세요.
(학년 컬럼으로 오름차순 정렬해서 출력하세요)
select * from student;

