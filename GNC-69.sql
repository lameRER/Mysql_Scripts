select *
from rbService where name = 'Осмотр (консультация) врачом-анестезиологом-реаниматологом первичный';


select ActionType.*
from ActionType where id in(select master_id
from ActionType_Service where service_id = 14016)



select *
from EventType


select *
from Contract_Tariff where service_id = 14016;


select *
from EventType where deleted = 0 order by name;



select *
from Person;



select *
from ActionType where group_id = 9153;

select *
from ActionType where group_id = 9148;



select *
from ActionType where group_id = 9156;


select ActionType.name, at2.code,at2.name, at2.group_id
from ActionType
join ActionType at2 on at2.group_id = ActionType.id
where ActionType.group_id in(select id
from ActionType where group_id = (select id
from ActionType where id = 9147))




select
       now() createDatetime,
       null createPerson_id,
       now() modifyDatetime,
       null modifyPerson_id,
       A.deleted,
       A.hidden,
       A.class,
       at2.id group_id,
       pgt.code code,
       TRIM(pgt.name) name,
       TRIM(pgt.name) title,
       '' flatCode,
       A.sex,
       A.age,
       A.age_bu,
       A.age_bc,
       A.age_eu,
       A.age_ec,
       A.office,
       A.showInForm,
       A.genTimetable,
       A.service_id,
       A.quotaType_id,
       A.context,
       A.amount,
       A.amountEvaluation,
       A.defaultStatus,
       A.defaultDirectionDate,
       A.defaultPlannedEndDate,
       A.defaultEndDate,
       A.defaultExecPerson_id,
       A.defaultPersonInEvent,
       A.defaultPersonInEditor,
       A.maxOccursInEvent,
       A.showTime,
       A.isMES,
       A.nomenclativeService_id,
       A.isPreferable,
       A.prescribedType_id,
       A.shedule_id,
       A.isRequiredCoordination,
       A.isRequiredTissue,
       A.testTubeType_id,
       A.jobType_id,
       A.mnem,
       A.layout,
       A.hasPrescriptions,
       A.autoclose_on_event_close,
       A.noteMandatory,
       A.canHaveAttaches,
       A.loadPrintTemplate_id,
       A.dynamicNumberType_id,
       A.counter_id,
       A.ttjExternalCounter_id,
       A.ttjExternalCounter_id_cached
from price_gnc_temp pgt
left join rbService r on pgt.code = r.code and right(pgt.code, length(pgt.code)-1) = right(r.code, length(r.code)-1)
left join ActionType_Service ATS on r.id = ATS.service_id
left join ActionType A on ATS.master_id = A.id or A.id = 7953
join ActionType at2 on trim(at2.name) = trim(pgt.two) -- and at2.group_id = 9148
where r.code is null and pgt.one = '1. АМБУЛАТОРНО-ПОЛИКЛИНИЧЕСКАЯ ПОМОЩЬ ' and pgt.three is null and pgt.code is not null



select *
from ActionType where group_id in (select id
from ActionType where group_id = 9148)


select
       now() createDatetime,
       NULL createPerson_id,
       NOW() modifyDatetime,
       NULL modifyPerson_id,
       deleted,
       hidden,
       class,
       9147 group_id,
       code,
      'СТАЦИОНАРНАЯ ПОМОЩЬ, ОПЕРАТИВНЫЕ ВМЕШАТЕЛЬСТВА' name,
      'СТАЦИОНАРНАЯ ПОМОЩЬ, ОПЕРАТИВНЫЕ ВМЕШАТЕЛЬСТВА' title,
       flatCode,
       sex,
       age,
       age_bu,
       age_bc,
       age_eu,
       age_ec,
       office,
       showInForm,
       genTimetable,
       service_id,
       quotaType_id,
       context,
       amount,
       amountEvaluation,
       defaultStatus,
       defaultDirectionDate,
       defaultPlannedEndDate,
       defaultEndDate,
       defaultExecPerson_id,
       defaultPersonInEvent,
       defaultPersonInEditor,
       maxOccursInEvent,
       showTime,
       isMES,
       nomenclativeService_id,
       isPreferable,
       prescribedType_id,
       shedule_id,
       isRequiredCoordination,
       isRequiredTissue,
       testTubeType_id,
       jobType_id,
       mnem,
       layout,
       hasPrescriptions,
       autoclose_on_event_close,
       noteMandatory,
       canHaveAttaches,
       loadPrintTemplate_id,
       dynamicNumberType_id,
       counter_id,
       ttjExternalCounter_id,
       ttjExternalCounter_id_cached
from ActionType where id = 9147;



select *
from price_gnc_temp ;

select *
from rbService where code regexp '001.013';


select *
from ActionType where class =3 and deleted = 0 ;

select *
from ActionType at2
join ActionType_Service ats on ats.master_id = at2.id
join rbService r on r.id = ats.service_id



select *
from ActionType where group_id is null and deleted = 0 order by code;
