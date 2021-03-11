--SELECT CODE, CONCAT(NAME, \' \', SOCR) AS NAMEEX FROM %s WHERE CODE LIKE \'%s%%\' AND RIGHT(CODE,2)=\'00\' ORDER BY NAME, SOCR, CODE' % (tblSTREET, prefix)



select s.*, k2.CODE, CONCAT_WS(' ', k2.NAME, k2.SOCR), s.CODE, CONCAT_WS(' ', s.NAME, s.SOCR) from kladr.KLADR k 
join KLADR k2 on k2.CODE REGEXP CONCAT('^',k.GNINMB) and RIGHT(k2.CODE,2)= '00' and k2.NAME REGEXP 'Павловск'
join kladr.STREET s on s.CODE REGEXP CONCAT('^',k.GNINMB) and RIGHT(s.CODE,2)='00' and LEFT(s.CODE, 8) = LEFT(k2.CODE, 8)
-- join kladr.STREET s1 on s1.CODE REGEXP s.GNINMB and RIGHT(s1.CODE,2)='00'
where k.CODE = '7800000000000';


select * from kladr.STREET s where s.NAME = 'школьный' and s.CODE REGEXP '^78';



select * from STREET s ;


INSERT INTO STREET
(NAME, SOCR, CODE, `INDEX`, GNINMB, UNO, OCATD, infis)
VALUES('8-я линия (Звёздочка тер. СНТ)', 'ул', '78000007000032400', '196621', '7820', '', '40294502000', '*');



INSERT into KLADR.STREET(NAME, SOCR, CODE, `INDEX`, GNINMB, UNO, OCATD, infis)
select ''