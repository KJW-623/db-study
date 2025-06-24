emp2 dept2 테이블을 참고하여,
'AL Pacino'와 "같은 지역"에서
근무하는 직원들의 평균 연봉보다
많이 받는 직원들의 사번, 이름, 부서번호, 부서이름, 근무지역, 급여 를 출력하세요.

select * from emp2;
select * from dept2;
                                        
select e.empno, e.name, e.deptno, d.dname, d.area, e.pay
from emp2 e, dept2 d
where e.deptno = d.dcode
    and e.pay > (select AVG(e_avg.pay)
                 from emp2 e_avg, dept2 d_avg
                 where e_avg.deptno = d_avg.dcode
                        and d_avg.area = (select d_al.area
                                          from emp2 e_al, dept2 d_al
                                          where e_al.deptno = d_al.dcode
                                          and e_al.name = 'AL Pacino'));

-------------

select empno, name, deptno, d.dname, d.area, pay
from emp2 e, dept2 d
where e.deptno = d.dcode
   and e.pay > (select AVG(pay)
                from emp2
                where deptno in (select dcode
                                    from dept2
                                    where area = (select area
                                                    from dept2
                                                    where dcode = ( select deptno
                                                                        from emp2
                                                                        where name = 'AL Pacino'))));
