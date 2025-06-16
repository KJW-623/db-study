select * from student;
select name, ID, weight from student;
select name, ID AS "ID:", weight AS "WEIGHT is" from student;

--====================== 아래로 선생님 버전

select * from student;
select name || '''s ID : ' || ID || ', WEIGHT is ' || weight || 'Kg' AS "ID AND WEIGHT" 
from student;


/********************************************************/


select * from emp;
select ename, job from emp;
select ename(job) from emp;

--====================== 아래로 선생님 버전

select * from emp;
select ename, job from emp;

select ename || '(' || job || ') , ' || ename || '''' || job || '''' "NAME AND JOB" 
from emp;


/********************************************************/


select * from emp;
select ename, sal from emp;

--====================== 아래로 선생님 버전

select * from emp;
select ename, sal from emp;

select ename || '''s sal is $' || sal AS "Name and Sal" from emp;



