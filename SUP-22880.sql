select *
from actiontype where name regexp 'Первичный осмотр кардиолога';

select *
from rbprinttemplate where context = '1osm_infekc';


select *
from actionpropertytype where actionType_id = 96751;