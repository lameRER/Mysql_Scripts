select *
from rbService where name = 'Осмотр (консультация) врачом-анестезиологом-реаниматологом первичный';


select ActionType.*
from ActionType where id in(select master_id
from ActionType_Service where service_id = 14016);



select *
from EventType;


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
from ActionType where id = 11935;


select ActionType.name, at2.code,at2.name, at2.group_id
from ActionType
join ActionType at2 on at2.group_id = ActionType.id
where ActionType.group_id in(select id
from ActionType where group_id = (select id
from ActionType where id = 9147));


SELECT * FROM PriceListItem pli WHERE pli.priceList_id=124;


select *
from rbService where id = 13851;
select *
from ActionType_Service where service_id = 13851;
select *
from ActionType where id = 8433;





select *
from PriceListItem;

select
       id,
       priceList_id,
       deleted,
       service_id,
       pgt.code as newCode,
       serviceCodeOW,
       pgt.name as newName,
       serviceNameOW,
       begDate,
       endDate,
       concat(pgt.price,'.00') newPrice,
       pli.price,
       isAccumulativePrice,
       limitPerDay,
       limitPerMonth,
       limitPerPriceList,
       LCE,
       LCE_test
#        pgt.code as newCode, pli.serviceCodeOW, pgt.name as newName, pli.serviceNameOW, concat(pgt.price,'.00') newPrice, pli.price, pli.deleted
from price_gnc_temp pgt
left join PriceListItem pli on pli.serviceCodeOW = pgt.code and pli.priceList_id = 124 and (pgt.name != pli.serviceNameOW or concat(pgt.price,'.00') != pli.price)
group by pgt.code;





select *
from PriceList where id = 124;





select
#        pgt.two,
       now()          as createDatetime,
       null           as createPerson_id,
       now()          as modifyDatetime,
       null           as modifyPerson_id,
       A.deleted,
       A.hidden,
       A.class,
       at2.id         as group_id,
       pgt.code       as code,
       TRIM(pgt.name) as name,
       TRIM(pgt.code) as title,
       ''             as flatCode,
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
where r.code is null and pgt.one = '2. СТАЦИОНАРНАЯ ПОМОЩЬ, ОПЕРАТИВНЫЕ ВМЕШАТЕЛЬСТВА ' and pgt.three is null group by pgt.name;


select
       now()          as createDatetime,
       null           as createPerson_id,
       now()          as modifyDatetime,
       null           as modifyPerson_id,
       A.deleted,
       A.hidden,
       A.class,
       at2.id         as group_id,
       pgt.code       as code,
       TRIM(pgt.name) as name,
       TRIM(pgt.name) as title,
       ''             as flatCode,
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
where r.code is null and pgt.one = '1. АМБУЛАТОРНО-ПОЛИКЛИНИЧЕСКАЯ ПОМОЩЬ ' and pgt.three is null and pgt.code is not null;

select *
from price_gnc_temp where one = '2. СТАЦИОНАРНАЯ ПОМОЩЬ, ОПЕРАТИВНЫЕ ВМЕШАТЕЛЬСТВА ';

select *
from ActionType where group_id in (select id
from ActionType where group_id = 9148);


select
       now()                                           as createDatetime,
       NULL                                            as createPerson_id,
       NOW()                                           as modifyDatetime,
       NULL                                            as modifyPerson_id,
       deleted,
       hidden,
       class,
       9147                                            as group_id,
       code,
      'СТАЦИОНАРНАЯ ПОМОЩЬ, ОПЕРАТИВНЫЕ ВМЕШАТЕЛЬСТВА' as name,
      'СТАЦИОНАРНАЯ ПОМОЩЬ, ОПЕРАТИВНЫЕ ВМЕШАТЕЛЬСТВА' as title,
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
join rbService r on r.id = ats.service_id;



select *
from ActionType where group_id is null and deleted = 0 order by code;


select * from PriceListItem where  serviceCodeOW = 'A26.06.006' and priceList_id = 124;

select *
from rbService where code = 'A26.06.006';


select *
from rbTest_Service;



select *
from rbTest where id = 67;



select *
from Price_cal_temp where PriceNEW != PriceOLD or NameOLD != NameNEW;


select pli.serviceCodeOW,pli.serviceNameOW,pli.price,pli.begDate,if(pli.serviceNameOW != pct.NameNEW or pli.price != pct.PriceNEW, '2021-06-30', pli.endDate) as endDate,pct.*
from PriceListItem pli
left join Price_cal_temp pct on pct.CodeOLD = pli.serviceCodeOW and (PriceNEW != PriceOLD or NameOLD != NameNEW)
where pli.priceList_id = 124;



select pct.CodeNEW  as code,
       pct.NameNEW  as name,
       0            as eisLegacy,
       0            as nomenclatureLegacy,
       0            as license,
       ''           as infis,
       '2021-07-01' as begDate,
       '2030-12-31' as endDate,
       NULL         as medicalAidProfile_id,
       0            as adultUetDoctor,
       0            as adultUetAverageMedWorker,
       0            as childUetDoctor,
       0            as childUetAverageMedWorker,
       NULL         as rbMedicalKind_id,
       0            as UET,
       NULL         as departCode,
       0            as isComplex,
       0 as maxSubServices
from rbService pt
right join Price_cal_temp pct on pct.CodeNEW = pt.code and (pct.PriceNEW != pct.PriceOLD or pct.NameOLD != pct.NameNEW)
left join PriceListItem pli on pli.serviceCodeOW = pct.CodeNEW and pli.priceList_id = 124
where pct.deleted = 0 and pct.CodeNEW is not null order by code and PriceNEW is not null and pli.id is null;




select
       pt.createDatetime,
       pt.createPerson_id,
       pt.modifyDatetime,
       pt.modifyPerson_id,
       pt.deleted,
       hidden,
       class,
       group_id,
       code,
       name,
       title,
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
       pt.service_id,
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
from ActionType pt
join Price_cal_temp pct on pct.CodeNEW = pt.code and (pct.PriceNEW != pct.PriceOLD or pct.NameOLD != pct.NameNEW)
join PriceListItem pli on pli.serviceCodeOW = pct.CodeNEW and pli.priceList_id = 124
where pct.deleted = 0 and pct.CodeNEW is not null order by code and PriceNEW is not null;













select
       pct.*,
       pct.CodeNEW  as code,
       pct.NameNEW  as name,
       0            as eisLegacy,
       0            as nomenclatureLegacy,
       0            as license,
       ''           as infis,
       '2021-07-01' as begDate,
       '2030-12-31' as endDate,
       null         as medicalAidProfile_id,
       0            as adultUetDoctor,
       0            as adultUetAverageMedWorker,
       0            as childUetDoctor,
       0            as childUetAverageMedWorker,
       null         as rbMedicalKind_id,
       0            as UET,
       null         as departCode,
       0            as isComplex,
       0 as maxSubServices
from rbService a
left join PriceListItem pli on pli.service_id = a.id and pli.priceList_id = 124
right join Price_cal_temp pct on pct.CodeNEW = a.code
where pct.NameNEW is not null and pct.deleted = 0; -- and (/*pct.PriceNEW != pct.PriceOLD or*/ pct.NameOLD != pct.NameNEW)







update PriceListItem pli
join rbService r on pli.service_id = r.id
right join Price_cal_temp pct on pct.CodeOLD = pli.serviceCodeOW and (pct.NameOLD != pct.NameNEW or pct.PriceOLD != pct.PriceNEW)
set pli.endDate = '2021-06-30'
where pli.priceList_id = 124 and pct.deleted is not null and pli.endDate > '2021-06-30';


insert into PriceListItem(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, priceList_id, deleted, service_id, serviceCodeOW, serviceNameOW, begDate, endDate, price, isAccumulativePrice, limitPerDay, limitPerMonth, limitPerPriceList, LCE, LCE_test)
select *
from (select now() createDatetime,
       null createPerson_id,
       now() modifyDatetime,
       null modifyPerson_id,
       124 priceList_id,
       0 deleted,
       pli.service_id,
       pct.CodeNEW serviceCodeOW,
       pct.NameNEW serviceNameOW,
       '2021-07-01' begDate,
       '2030-12-31' endDate,
       pct.PriceNEW price,
       0 isAccumulativePrice,
       null limitPerDay,
       null limitPerMonth,
       null limitPerPriceList,
       null LCE,
       null LCE_test
from PriceListItem pli
join rbService r on pli.service_id = r.id
right join Price_cal_temp pct on pct.CodeOLD = pli.serviceCodeOW and (pct.NameOLD != pct.NameNEW or pct.PriceOLD != pct.PriceNEW)
where pli.priceList_id = 124 and pct.deleted is not null and pli.endDate and pct.deleted = 0) as tmp
where not exists (select * from PriceListItem where serviceCodeOW = tmp.serviceCodeOW and endDate = tmp.endDate);

insert into rbService(code, name, eisLegacy, license, infis, begDate, endDate, medicalAidProfile_id, rbMedicalKind_id, departCode)
select *
from
(select pct.CodeNEW code,
       pct.NameNEW name,
       0 eisLegacy,
       0 license,
       '' infis,
       '2021-07-01' begDate,
       '2030-12-31' endDate,
       null medicalAidProfile_id,
       null rbMedicalKind_id,
       null departCode
from rbService r
right join Price_cal_temp pct on pct.CodeNEW = r.code
where (pct.NameOLD != pct.NameNEW or pct.PriceOLD != pct.PriceNEW) and CodeOLD is null) as tmp
where not exists(select * from rbService where code = tmp.code and name = tmp.name and begDate = tmp.begDate and endDate = tmp.endDate);





select A.*
from PriceListItem
join rbService rS on PriceListItem.service_id = rS.id
join ActionType_Service ATS on rS.id = ATS.service_id
join ActionType A on ATS.master_id = A.id
where priceList_id = 124;


insert into ActionType(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, class, group_id, code, name, title, flatCode, sex, age, age_bu, age_bc, age_eu, age_ec, office, showInForm, genTimetable, service_id, quotaType_id, context, defaultPlannedEndDate, defaultExecPerson_id, isMES, nomenclativeService_id, prescribedType_id, shedule_id, testTubeType_id, jobType_id, layout, loadPrintTemplate_id, dynamicNumberType_id, counter_id, ttjExternalCounter_id, ttjExternalCounter_id_cached)
select *
from
(select now() createDatetime,
       null createPerson_id,
       now()modifyDatetime,
       null modifyPerson_id,
       0 class,
       NULL group_id,
       pct.codeNEW code,
       pct.NameNEW name,
       pct.NameNEW title,
       '' flatCode,
       0 sex,
       '' age,
       null age_bu,
       null age_bc,
       null age_eu,
       null age_ec,
       '' office,
       0 showInForm,
       0 genTimetable,
       null service_id,
       null quotaType_id,
       '' context,
       0 defaultPlannedEndDate,
       null defaultExecPerson_id,
       null isMES,
       null nomenclativeService_id,
       null prescribedType_id,
       null shedule_id,
       null testTubeType_id,
       null jobType_id,
       null layout,
       null loadPrintTemplate_id,
       null dynamicNumberType_id,
       null counter_id,
       null ttjExternalCounter_id,
       null ttjExternalCounter_id_cached
from ActionType r
right join Price_cal_temp pct on pct.CodeNEW = r.code
where (pct.NameOLD != pct.NameNEW or pct.PriceOLD != pct.PriceNEW) and CodeOLD is null) as tmp
where  exists(select * from ActionType where name = tmp.name and code = tmp.code);

insert into ActionType_Service(master_id, idx, service_id, begDate, endDate)
select *
from
(select at.id master_id, 0 idx, r.id service_id, '2021-07-01' begDate, '2030-12-31' endDate
from  rbService r
left join Price_cal_temp pct on pct.CodeNEW = r.code
join ActionType at on at.code = pct.CodeNEW
where (pct.NameOLD != pct.NameNEW or pct.PriceOLD != pct.PriceNEW) and CodeOLD is null) as tmp
where not exists(select * from ActionType_Service where service_id = tmp.service_id and master_id = tmp.master_id);

select *
from ActionType_Service order by id desc ;

select *
from ActionType where id = 11977;


select *
from rbService where id = 14210;
select *
from Price_cal_temp where CodeNEW = 'B01.005.001.013';

select *
from PriceListItem where serviceCodeOW = 'A18.05.009';

select *
from PriceListItem pli
join Price_cal_temp pct on pct.CodeOLD = pli.serviceCodeOW and (pct.NameOLD != pct.NameNEW or pct.PriceOLD != pct.PriceNEW) and pli.endDate > curdate() and priceList_id = 124;


select *
from ActionType_Service;



select *
from PriceListItem where priceList_id = 124;
select *
from PriceListItem where serviceCodeOW = 'B01.018.001';



select *
from Price_cal_temp where CodeOLD = 'A12.05.018.001';


select *
from rbService where id = 13980;



insert into Price_cal_temp(CodeOLD, NameOLD, PriceOLD, CodeNEW, NameNEW, PriceNEW, deleted)
select '1', '2', '3', '4','5','6','7';


select *
from rbService where code regexp '^A.';


select *
from PriceListItem where serviceCodeOW regexp 'А27.30.113';



select *
from PriceListItem where serviceCodeOW regexp 'А09.05.233';

select *
from ActionType where code in
(select CodeNEW
from Price_cal_temp where CodeNEW regexp '^А');


select *
from PriceListItem where serviceCodeOW = 'A09.23.005' and priceList_id = 124;


select *
from PriceListItem where serviceCodeOW regexp '^А' order by id desc ;


select * from rbService order by id desc;



select pt.*
from PriceListItem pli
right join price_temp_2021 pt on pt.`Номенклатура.Номенклатурный номер` = pli.serviceCodeOW
where pli.id is null;



select *
from price_temp_2021 where `Номенклатура.Номенклатурный номер` regexp '^B';


select *
from PriceListItem where priceList_id = 124;


# insert into ActionType(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, class, group_id, code, name, title, flatCode, sex, age, age_bu, age_bc, age_eu, age_ec, office, showInForm, genTimetable, service_id, quotaType_id, context, defaultPlannedEndDate, defaultExecPerson_id, isMES, nomenclativeService_id, prescribedType_id, shedule_id, testTubeType_id, jobType_id, layout, loadPrintTemplate_id, dynamicNumberType_id, counter_id, ttjExternalCounter_id, ttjExternalCounter_id_cached)
select *
from
(select now() createDatetime,
       null createPerson_id,
       now()modifyDatetime,
       null modifyPerson_id,
       0 class,
       NULL group_id,
       pct.`Номенклатура.Номенклатурный номер` code,
       pct.`Номенклатура.Наименование полное` name,
       pct.`Номенклатура.Наименование полное` title,
       '' flatCode,
       0 sex,
       '' age,
       null age_bu,
       null age_bc,
       null age_eu,
       null age_ec,
       '' office,
       0 showInForm,
       0 genTimetable,
       null service_id,
       null quotaType_id,
       '' context,
       0 defaultPlannedEndDate,
       null defaultExecPerson_id,
       null isMES,
       null nomenclativeService_id,
       null prescribedType_id,
       null shedule_id,
       null testTubeType_id,
       null jobType_id,
       null layout,
       null loadPrintTemplate_id,
       null dynamicNumberType_id,
       null counter_id,
       null ttjExternalCounter_id,
       null ttjExternalCounter_id_cached
from PriceListItem pl
right join price_temp_2021 pct on pct.`Номенклатура.Номенклатурный номер` = pl.serviceCodeOW
where pl.id is null) as tmp
where  exists(select * from ActionType where name = tmp.name and code = tmp.code);

select *
from PriceListItem where service_id = 12970 and serviceCodeOW = 'A11.12.001';













# A06.09.005.003йцв
# https://skillbox.ru/media/code/ne_windows_edinoy_kak_pisat_krossplatformennye_prilozheniya_s_gui_na_c/




select * from price_gnc_21_08_05;

#TODO: Поменять киррилицу на латиницу в "price_gnc_21_08_05"
create temporary table temp_rbservice
(select
       pg.code      as code,
       pg.name      as name,
       eisLegacy,
       nomenclatureLegacy,
       license,
       infis,
       '2021-07-01' as begDate,
       '2030-12-31' as endDate,
       medicalAidProfile_id,
       adultUetDoctor,
       adultUetAverageMedWorker,
       childUetDoctor,
       childUetAverageMedWorker,
       rbMedicalKind_id,
       UET,
       departCode,
       isComplex,
       maxSubServices
from price_gnc_21_08_05 pg
left join PriceListItem pli on pg.code = pli.serviceCodeOW
join rbService s on s.id = (select id from rbService order by id desc limit 1)
where pli.id is null);




select *
from (
select
       now() createDatetime,
       null createPerson_id,
       now() modifyDatetime,
       null modifyPerson_id,
       124 priceList_id,
       0 deleted,
       pli.id,
       pli.service_id as pliid,
       s.id as sid,
       ifnull(pli.service_id,s.id) service_id,
       s.code, s.name,
       pg.code serviceCodeOW,
       pg.name serviceNameOW,
       '2021-07-01' begDate,
       '2030-12-31' endDate,
       pg.price price,
       pli_or.isAccumulativePrice,
       pli_or.limitPerDay,
       pli_or.limitPerMonth,
       pli_or.limitPerPriceList,
       pli_or.LCE,
       pli_or.LCE_test
from price_gnc_21_08_05 pg
left join PriceListItem pli on pli.serviceCodeOW = pg.code
left join rbService s1 on s1.id = pli.service_id and (s1.endDate >= curdate() or s1.endDate is null)
join PriceListItem pli_or on pli_or.id = (select id from PriceListItem order by id desc limit 1)
left join rbService s on s.code in (select code from temp_rbservice) and s.code = pg.code
# where pli.id is null
group by pg.code) as tmp
where not exists(select * from PriceListItem where serviceCodeOW = tmp.serviceCodeOW and serviceNameOW = tmp.serviceNameOW and tmp.price = price and priceList_id = 124 and (endDate >= curdate() or endDate is null) and tmp.service_id = service_id and tmp.deleted = deleted);


insert into rbService(code, name, eisLegacy, nomenclatureLegacy, license, infis, begDate, endDate, medicalAidProfile_id, adultUetDoctor, adultUetAverageMedWorker, childUetDoctor, childUetAverageMedWorker, rbMedicalKind_id, UET, departCode, isComplex, maxSubServices)
select *
from
(select * from temp_rbservice) as tmp
where not exists(select * from rbService where tmp.code = code and tmp.name = name and endDate = tmp.endDate and begDate = tmp.begDate);
# A12.30.012.001.012

select *
from rbService where id = 12610;

select *
from PriceListItem where id in (7091648,7098289);



select curdate()-1;
drop table temp_priceListItem_backup;
create table temp_priceListItem_backup
(select * from PriceListItem);

# update
select * from
PriceListItem
# set endDate = curdate()-1
where priceList_id = 124 and endDate >= curdate();























select *
from PriceListItem order by id desc ;

select *
from price_gnc_21_08_05 pg
left join PriceListItem pli on pli.serviceCodeOW = pg.code and (pli.endDate >= curdate() or pli.endDate is null) and pli.priceList_id = 124
where pg.code = 'A04.30.001.001';


select *
from price_gnc_21_08_05 where price is null;

select *
from PriceListItem where serviceCodeOW = 'B01.005.011';