insert into STREET(NAME, SOCR, CODE, `INDEX`, GNINMB, UNO, OCATD, infis)
select *
from(
select
       'Матисова' NAME,
       'нк' SOCR,
       '78000000000288200' CODE,
       '198206' `INDEX`,
       '7807' GNINMB,
       UNO,
       '40279562000' OCATD,
       infis
from STREET where NAME regexp 'матисов') as tmp
where not exists(select * from STREET where CODE = tmp.CODE);

select *
from STREET where CODE = '78000000000288200';

insert into DOMA(NAME, KORP, SOCR, CODE, `INDEX`, GNINMB, UNO, OCATD, flatHouseList)
select
       '4литерА,4литерЗ' NAME,
       KORP,
       SOCR,
       '78000000000288200' CODE,
       '198206' `INDEX`,
       '7807' GNINMB,
       UNO,
       '40279562000' OCATD,
       '4литерА,4литерЗ' flatHouseList
from DOMA limit 1;

select *
from STREET where CODE = '0200000500000070001';

select *
from KLADR where CODE = '0200000500000070001';

select *
from DOMA where CODE = '78000000000288200';