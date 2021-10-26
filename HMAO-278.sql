select name,
       code,
       id_orgStructure,
       printTemplate,
       type,
       isVisible,
       actionType_id,
       editableTime,
       canCopyOrgStr,
       idx_template
from rbEpicrisisTemplates ret, temp_ret tr
where id = 135;

create temporary table temp_ret
(
    select 'Выписной эпикриз' as name union
    select 'Этапный эпикриз' as name union
    select 'Дневник + предоперыционный эпикриз' as name union
    select 'Эпикриз плановых пациентов' as name union
    select '' as name
)