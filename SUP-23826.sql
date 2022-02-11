select *
from s11.ActionType where id =63703;


select *
from ActionPropertyType where actionType_id = 63703 and deleted = 0 order by idx;


update ActionPropertyType
set deleted = 1
where actionType_id = 63703 and typeName != 'JobTicket';

drop temporary table if exists apt;
create temporary table if not exists apt(
select 'Состояние' as name, 'string' as type union
select 'Оценка нутритивного статуса' as name, 'Раздел' as type union
select 'Масса тела' as name, 'string' as type union
select 'Рост' as name, 'string' as type union
select 'ИМТ' as name, 'string' as type union
select 'Соматотип' as name, 'string' as type union
select 'Наличие белково-энергетической недостаточности' as name, 'string' as type union
select 'Показатели белкового статуса' as name, 'Раздел' as type union
select 'общий белок' as name, 'string' as type union
select 'альбумин' as name, 'string' as type union
select 'Наличие избыточного алиментарного статуса' as name, 'string' as type union
select 'Глотание' as name, 'string' as type union
select 'Нарушение алиментарного статуса согласно фенотипическим критериям' as name, 'string' as type union
select 'Наличие нарушений метаболизма' as name, 'string' as type union
select 'Тяжесть заболевания' as name, 'string' as type union
select 'Результат скрининга' as name, 'string' as type union
select 'Персонализация лечебного питания' as name, 'string' as type union
select 'Энтеральное питание per os' as name, 'string' as type union
select 'Сиппинги' as name, 'string' as type union
select 'Энтеральное зондовое питание' as name, 'string' as type
);

select *
from apt;