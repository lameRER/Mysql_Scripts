select *
from rbService where name = 'Осмотр (консультация) врачом-анестезиологом-реаниматологом первичный';


select *
from ActionType where id in(select master_id
from ActionType_Service where service_id = 14016)



select *
from EventType


select *
from Contract_Tariff where service_id = 14016;


select *
from EventType where deleted = 0 order by name;





select
#        pgt.code, r.code
NOW() createDatetime,
NULL createPerson_id,
NOW() modifyDatetime,
NULL modifyPerson_id,
deleted,
hidden,
0 class,
0 group_id,
'' code,
trim(pgt.two) name,
trim(pgt.two) title,
'' flatCode,
0 sex
from price_gnc_temp pgt
left join rbService r on pgt.code = r.code and right(pgt.code, length(pgt.code)-1) = right(r.code, length(r.code)-1)
left join ActionType_Service ATS on r.id = ATS.service_id
left join ActionType A on ATS.master_id = A.id
where r.code is null and pgt.one = '1. АМБУЛАТОРНО-ПОЛИКЛИНИЧЕСКАЯ ПОМОЩЬ ' group by pgt.two



select *
from ActionType where group_id = 9147;

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
