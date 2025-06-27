--테이블 생성시, product_quiz 테이블명으로 생성

CREATE TABLE product_quiz
(
product_id INTEGER NOT NULL,
product_code VARCHAR(8) NOT NULL,
price INTEGER NOT NULL
);

INSERT INTO product_quiz VALUES (1, 'A1000011', 10000);
INSERT INTO product_quiz VALUES (2, 'A1000045', 9000);
INSERT INTO product_quiz VALUES (3, 'C3000002', 22000);
INSERT INTO product_quiz VALUES (4, 'C3000006', 15000);
INSERT INTO product_quiz VALUES (5, 'C3000010', 30000);
INSERT INTO product_quiz VALUES (6, 'K1000023', 17000);

select * from product_quiz;

select
    case
        when price >= 0 and price < 10000 then 0  
        when price >= 10000 and price < 20000 then 10000
        when price >= 20000 and price < 30000 then 20000 
        when price >= 30000 and price < 40000 then 30000           
    end PRICE_GROUP,                               
    count(product_id) PRODUCTS                     
from product_quiz                                            
group by
    case
        when price >= 0 and price < 10000 then 0
        when price >= 10000 and price < 20000 then 10000
        when price >= 20000 and price < 30000 then 20000
        when price >= 30000 and price < 40000 then 30000
    END                                               
order by PRICE_GROUP ASC;        


---------------------------------------------------------------------------


--1) 가격대 별로 나눠서 각자 갯수 계산 >> 합치면
select 0 PRICE_GROUP, count (*) PRODUCTS
--select * 
from product_quiz
where price between 0 and 9999
UNION ALL
select 10000, count (*)
from product_quiz
where price between 10000 and 19999
UNION ALL
select 20000, count (*)
from product_quiz
where price between 20000 and 29999
UNION ALL
select 30000, count (*)
from product_quiz
where price between 30000 and 39999;



--2) 가격단위로 그룹으로 묶어서 잘 처리를~
select * from product_quiz;

select
    CASE
        WHEN price BETWEEN 0 AND 9999 THEN 0
        WHEN price BETWEEN 10000 AND 19999 THEN 10000
        WHEN price BETWEEN 20000 AND 29999 THEN 20000
        WHEN price BETWEEN 30000 AND 39999 THEN 30000
    END PRICE_GROUP,
    count (*) PRODUCTS
from product_quiz
group by
    CASE
        WHEN price BETWEEN 0 AND 9999 THEN 0
        WHEN price BETWEEN 10000 AND 19999 THEN 10000
        WHEN price BETWEEN 20000 AND 29999 THEN 20000
        WHEN price BETWEEN 30000 AND 39999 THEN 30000
    END
order by PRICE_GROUP;

select price PRICE_GROUP, count(*) PRODUCTS
FROM (
    select
        CASE
            WHEN price BETWEEN 0 AND 9999 THEN 0
            WHEN price BETWEEN 10000 AND 19999 THEN 10000
            WHEN price BETWEEN 20000 AND 29999 THEN 20000
            WHEN price BETWEEN 30000 AND 39999 THEN 30000
        END PRICE
    from product_quiz
)
group by price
order by PRICE_GROUP; 


select price, price/10000, TRUNC(price/10000), TRUNC(price/10000)*10000
from product_quiz;

-- +서브쿼리

select price PRICE_GROUP, count(*) PRODUCTS 
from (select product_id, 
             product_code, 
             price, 
             TRUNC(price/10000) price_code, 
             TRUNC(price/10000)*10000 price_group
      from product_quiz)
group by price_group
order by PRICE_GROUP;



select price_code*10000 PRICE_GROUP, count(*) PRODUCTS 
from (select product_id, 
             product_code, 
             price, 
             TRUNC(price/10000) price_code, 
             TRUNC(price/10000)*10000 price_group
      from product_quiz)
group by price_code
order by price_code;



select
    TRUNC(price/10000)*10000 PRICE_GROUP,
    count (*) PRODUCTS
from product_quiz
group by TRUNC(price/10000)
order by PRICE_GROUP;

select TRUNC(1.1), FLOOR(1.1),
        TRUNC(-1.5), FLOOR(-1.5)
from dual;