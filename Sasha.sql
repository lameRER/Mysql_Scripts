select *
from rbPrintTemplate where name regexp 'Ведомость';


select * from rbSpecialVariablesPreferences where name = 'SpecialVar_VedomostNachisleniy'




SELECT
  t.Payer,
  t.PaymentType,
  SUM(CASE WHEN t.FinanceTransactionOperationTypeId = 1 THEN InvoiceItemSum END) Income,
  SUM(CASE WHEN t.FinanceTransactionOperationTypeId = 2 THEN -1 END * InvoiceItemSum) Refund,
  SUM(CASE WHEN t.PaymentTypeID = 1 AND
      t.FinanceTransactionOperationTypeId = 1 THEN t.InvoiceItemSum END) NalIncome,
  SUM(CASE WHEN t.PaymentTypeID = 1 AND
      t.FinanceTransactionOperationTypeId = 2 THEN -1 END * InvoiceItemSum) NalsRefund,
  SUM(CASE WHEN t.PaymentTypeID = 2 AND
      t.FinanceTransactionOperationTypeId = 1 THEN t.InvoiceItemSum END) bezNalIncome,
  SUM(CASE WHEN t.PaymentTypeID = 2 AND
      t.FinanceTransactionOperationTypeId = 2 THEN -1 END * InvoiceItemSum) bezNalsRefund,
  SUM(CASE WHEN t.PaymentTypeID = 3 AND
      t.FinanceTransactionOperationTypeId = 1 THEN t.InvoiceItemSum END) bezNalRSIncome,
  SUM(CASE WHEN t.PaymentTypeID = 3 AND
      t.FinanceTransactionOperationTypeId = 2 THEN -1 END * InvoiceItemSum) bezNalRSsRefund,
  SUM(CASE WHEN t.PaymentTypeID in (1,2) AND
      t.FinanceTransactionOperationTypeId = 1 THEN t.InvoiceItemSum END) KassaIn,
  SUM(CASE WHEN t.PaymentTypeID in (1,2) AND
      t.FinanceTransactionOperationTypeId = 2 THEN -1 END * InvoiceItemSum) KassaOut
FROM (SELECT
    ii.id AS InvoiceItemId,
    CASE WHEN ft.financeOperationType_id = 1 THEN ii.sum WHEN ft.financeOperationType_id = 2 THEN -ii.sum END AS InvoiceItemSum,
    ft.id AS FinanceTransactionId,
    ft.trxDatetime AS FinanceTransactionDateTime,
    ft.financeOperationType_id AS FinanceTransactionOperationTypeId,
    pt.name AS PaymentType,
    CASE WHEN cc.client_id IS NOT NULL THEN CONCAT_WS(' ', c_p.lastName, c_p.firstName, c_p.patrName) ELSE o_p.fullName END AS Payer,
    CASE WHEN s.actionProperty_id IS NOT NULL AND
        ps_pli.isAccumulativePrice = 1 THEN ap.action_id WHEN s.action_id IS NOT NULL AND
        ISNULL(ps.id) AND
        pli.isAccumulativePrice = 1 THEN NULL ELSE s.action_id END AS ActionId,
    pt.id AS PaymentTypeID
  FROM gnc.FinanceTransaction ft
    LEFT JOIN gnc.rbPayType pt
      ON pt.id = ft.payType_id
    JOIN gnc.Invoice i
      ON i.id = ft.invoice_id
      AND i.deleted = 0
    JOIN gnc.InvoiceItem ii
      ON (ii.invoice_id = i.id)
      OR (ii.refund_id = i.id
      AND ii.deleted = 0)
    JOIN gnc.Service s
      ON s.id = ii.concreteService_id
    JOIN gnc.PriceListItem pli
      ON s.priceListItem_id = pli.id
    LEFT JOIN gnc.Service ps
      ON s.parent_id = ps.id
    LEFT JOIN gnc.PriceListItem ps_pli
      ON ps.priceListItem_id = ps_pli.id
    LEFT JOIN gnc.ActionProperty ap
      ON s.actionProperty_id = ap.id
    LEFT JOIN gnc.Contract co
      ON co.id = i.contract_id
    LEFT JOIN gnc.Contract_Contragent cc
      ON cc.id = co.payer_id
    LEFT JOIN gnc.Client c_p
      ON c_p.id = cc.client_id
    LEFT JOIN gnc.Organisation o_p
      ON o_p.id = cc.organisation_id
  WHERE (ft.financeOperationType_id = 1
  OR ft.financeOperationType_id = 2) and s.deleted = 0
  AND ft.trxDatetime BETWEEN :Date1 AND :Date1 + INTERVAL 1 DAY - INTERVAL 1 SECOND) t
  INNER JOIN Action a
    ON a.id = t.ActionId and a.deleted = 0
  INNER JOIN Event e
    ON e.id = a.event_id
WHERE e.client_id != 18
GROUP BY t.FinanceTransactionId,
         t.InvoiceItemId;

select *
from FinanceTransaction;





select * from Service where event_id = 20433935


# insert into ActionType(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, class, group_id, code, name, title, flatCode, sex, age, age_bu, age_bc, age_eu, age_ec, office, showInForm, genTimetable, service_id, quotaType_id, context, defaultPlannedEndDate, defaultExecPerson_id, isMES, nomenclativeService_id, prescribedType_id, shedule_id, testTubeType_id, jobType_id, layout, loadPrintTemplate_id, dynamicNumberType_id, counter_id, ttjExternalCounter_id, ttjExternalCounter_id_cached)
select *
from
(select at2.*
# master_id, idx, service_id, ats1.begDate, ats1.endDate
from `price_temp_2021-07-19` pt
# left join rbService rS on `price_temp_2021-07-19`.code = rS.code and rS.id != 14224
join ActionType at2 on at2.code = pt.code and at2.class =1 and at2.deleted = 0 and at2.id not in(4787,4765)) as tmp
where not exists(select * from ActionType where tmp.code = code and tmp.deleted = tmp.deleted and tmp.class = class)


select *
from
(select at.*
from ActionType at
join `price_temp_2021-07-19` pt on pt.code = at.code
where at.class = 1 and at.deleted = 0 and at.id not in (4787)) as tmp
where not exists(select * from ActionType where tmp.code = code and tmp.class = class and tmp.deleted = deleted);




# select *
# from
# (
    select *
from `price_temp_2021-07-19` pt
left join rbService r on r.code = pt.code and r.id != 14224
left join ActionType A on pt.code = A.code and A.class = 1 and A.deleted = 0 and A.id not in(4787,4765)
#     ) as tmp


select *
from
(select at2.*
# master_id, idx, service_id, ats1.begDate, ats1.endDate
from `price_temp_2021-07-19` pt
join ActionType at2 on at2.code = pt.code and at2.class =1 and at2.deleted = 0 and at2.id not in(4787,4765)) as tmp
where not exists(select * from ActionType where tmp.code = code)



select *
from `price_temp_2021-07-19` pt
left join ActionType A on pt.code = A.code and A.class = 1 and A.deleted = 0 and A.id not in(4787,4765)
join A
where A.id is null


select *
from ActionType where code = 'A12.05.006';


select *
from ActionType where code = 'A12.05.008.001';

# left join ActionType_Service ats1 on ats1.id = (select id from ActionType_Service order by id desc limit 1)

insert into ActionType(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, hidden, class, group_id, code, name, title, flatCode, sex, age, age_bu, age_bc, age_eu, age_ec, office, showInForm, genTimetable, service_id, quotaType_id, context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultPersonInEvent, defaultPersonInEditor, maxOccursInEvent, showTime, isMES, nomenclativeService_id, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isRequiredTissue, testTubeType_id, jobType_id, mnem, layout, hasPrescriptions, autoclose_on_event_close, noteMandatory, canHaveAttaches, loadPrintTemplate_id, dynamicNumberType_id, counter_id, ttjExternalCounter_id, ttjExternalCounter_id_cached)
(select
       now() createDatetime,
       null createPerson_id,
       now() modifyDatetime,
       null modifyPerson_id,
       0 deleted,
       at.hidden,
       1 class,
       7244 group_id,
       pt.code code,
       pt.name name,
       pt.name title,
       at.flatCode,
       at.sex,
       at.age,
       at.age_bu,
       at.age_bc,
       at.age_eu,
       at.age_ec,
       at.office,
       at.showInForm,
       at.genTimetable,
       at.service_id,
       at.quotaType_id,
       at.context,
       at.amount,
       at.amountEvaluation,
       at.defaultStatus,
       at.defaultDirectionDate,
       at.defaultPlannedEndDate,
       at.defaultEndDate,
       at.defaultExecPerson_id,
       at.defaultPersonInEvent,
       at.defaultPersonInEditor,
       at.maxOccursInEvent,
       at.showTime,
       at.isMES,
       at.nomenclativeService_id,
       at.isPreferable,
       at.prescribedType_id,
       at.shedule_id,
       at.isRequiredCoordination,
       at.isRequiredTissue,
       at.testTubeType_id,
       at.jobType_id,
       at.mnem,
       at.layout,
       at.hasPrescriptions,
       at.autoclose_on_event_close,
       at.noteMandatory,
       at.canHaveAttaches,
       at.loadPrintTemplate_id,
       at.dynamicNumberType_id,
       at.counter_id,
       at.ttjExternalCounter_id,
       at.ttjExternalCounter_id_cached
from `price_temp_2021-07-19` pt
left join ActionType A on pt.code = A.code and A.class= 1 and A.deleted = 0
join ActionType at on at.id = (select id from ActionType order by id desc limit 1)
where A.id is null)



select *
from PriceListItem order by id desc ;

select *
from `price_temp_2021-07-19` pr
join PriceListItem


insert into PriceListItem(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, priceList_id, deleted, service_id, serviceCodeOW, serviceNameOW, begDate, endDate, price, isAccumulativePrice, limitPerDay, limitPerMonth, limitPerPriceList, LCE, LCE_test)
select *
from
(select
        now() createDatetime,
        null createPerson_id,
        now() modifyDatetime,
        null modifyPerson_id,
        124 priceList_id,
        0 deleted,
        rS.id service_id,
        pt.code serviceCodeOW,
        pt.name serviceNameOW,
        rS.begDate begDate,
        rS.endDate endDate,
        pt.price price,
        pli1.isAccumulativePrice,
        pli1.limitPerDay,
        pli1.limitPerMonth,
        pli1.limitPerPriceList,
        pli1.LCE,
        pli1.LCE_test
 from `price_temp_2021-07-19` pt
               join rbService rS on pt.code = rS.code and rS.id != 14224
               join ActionType A on pt.code = A.code and A.class = 1 and A.deleted = 0 and A.id not in (4787, 4765)
               join ActionType_Service s on s.master_id = A.id and s.service_id = rS.id
               left join PriceListItem pli on pli.serviceCodeOW = pt.code and pli.deleted = 0 and pli.service_id = rS.id and
                                         pli.endDate = '2022-01-09' and pli.begDate = '2021-07-01' and pli.priceList_id = 124
    join PriceListItem pli1 on pli1.id = (select id from PriceListItem where deleted = 0 and endDate = '2022-01-09' and begDate = '2021-07-01' and priceList_id = 124 order by id desc limit 1)
    ) as tmp
where  not exists(select * from PriceListItem where tmp.serviceCodeOW = serviceCodeOW and tmp.serviceNameOW = serviceNameOW and tmp.priceList_id = priceList_id and tmp.endDate = endDate and tmp.begDate = begDate and tmp.service_id = tmp.service_id)

select *
from `price_temp_2021-07-19` pt
join PriceListItem pli on pli.serviceCodeOW = pt.code and pli.endDate = '2022-01-09' and pli.begDate = '2021-07-01'




select *
 from `price_temp_2021-07-19` pt
               join rbService rS on pt.code = rS.code and rS.id != 14224
               join ActionType A on pt.code = A.code and A.class = 1 and A.deleted = 0 and A.id not in (4787, 4765)
               join ActionType_Service s on s.master_id = A.id and s.service_id = rS.id
join PriceListItem pli on pli.serviceCodeOW = pt.code and pli.deleted = 0 and pli.service_id = rS.id and pli.endDate = '2022-01-09' and pli.begDate = '2021-07-01' and pli.priceList_id = 124



select *
from EventType et
left join EventType_Action ETA on et.id = ETA.eventType_id
where et.deleted =0 and et.id != 109;



select
A.*
#        et.id eventType_id,
#        eta1.idx,
#        A.id actionType_id,
#        eta1.speciality_id,
#        eta1.tissueType_id,
#        eta1.sex,
#        eta1.age,
#        eta1.age_bu,
#        eta1.age_bc,
#        eta1.age_eu,
#        eta1.age_ec,
#        eta1.selectionGroup,
#        eta1.actuality,
#        eta1.expose,
#        eta1.payable,
#        eta1.academicDegree_id,
#        eta1.deleted,
#        eta1.plannedEndDateTemplate_id
from EventType_Action eta
left join EventType et on et.id = eta.eventType_id and et.deleted =0 and et.id != 109
join EventType_Action eta1 on eta1.id = (select id from EventType_Action order by id desc limit 1)
join `price_temp_2021-07-19` pt on 1
join rbService rS on pt.code = rS.code and rS.id != 14224
join ActionType A on pt.code = A.code and A.class = 1 and A.deleted = 0 and A.id not in (4787, 4765)
join ActionType_Service s on s.master_id = A.id and s.service_id = rS.id
join PriceListItem pli on pli.serviceCodeOW = pt.code and pli.deleted = 0 and pli.service_id = rS.id and pli.endDate = '2022-01-09' and pli.begDate = '2021-07-01' and pli.priceList_id = 124
group by A.id



select *
from PriceListItem where serviceCodeOW = 'A12.05.007.006';


select *
from rbService where id =14224;



select *
from ActionType_Service where service_id = 14224;

select *
from `price_temp_2021-07-19` pt
join PriceListItem pli on pli.serviceCodeOW = pt.code and pli.endDate = '2022-01-09' and pli.begDate = '2021-07-01' and priceList_id = 124






select *
from PriceListItem where id = 7101463;


select *
from ActionType where group_id = 7244

select *
from ActionPropertyType where actionType_id in(
select id
from ActionType where code= 'A12.05.005' and class = 1 and deleted = 0);


select id
from ActionType where code regexp 'A12.05.005' and class = 1 and deleted = 0

select *
from EventType where deleted = 0;

11559
11982
11983
11984
11986
11987
11988
11989
11990
11991
11992
11995
11996
11997

select *
from EventType_Action where  actionType_id in(11995,4881);


select distinct
       et.id eventType_id,
       idx,
       tmp.id actionType_id,
       speciality_id,
       tissueType_id,
       ETA.sex,
       ETA.age,
       ETA.age_bu,
       ETA.age_bc,
       ETA.age_eu,
       ETA.age_ec,
       selectionGroup,
       actuality,
       expose,
       payable,
       academicDegree_id,
       ETA.deleted,
       plannedEndDateTemplate_id
from EventType et
join (select 11559,11982,11983,11984,11986,11987,1198811989,11990,11991,11992,11995,11996,11997 as id) as tmp on 1
where et.id != 109 and et.deleted = 0
;

select *
from rbTest where id = 4011;



select *
from PriceList;

select *
from rbFinance where id =4;

select *
from ActionType_Service where master_id in (4881,4910,11995);


select *
from rbService where id in(12597,12607,14229);



select *
from PriceListItem where service_id in (12597,12607,14229) and priceList_id = 124;



select *
from ActionType_Service where service_id = 14229;



select *
from ActionType where id = 11995;


select *
from ActionType;


insert into rbService (code, name, eisLegacy, license, infis, begDate, endDate, medicalAidProfile_id, rbMedicalKind_id, departCode)
(select
       pt.code,
       pt.name,
       s.eisLegacy,
       s.license,
       '' infis,
       '2021-07-01' begDate,
       '2022-01-09' endDate,
       s.medicalAidProfile_id,
       s.rbMedicalKind_id,
       s.departCode
from `price_temp_2021-07-19` pt
left join rbService rS on pt.code = rS.code
left join rbService s on s.id = (select id from rbService where id = 504)
where rS.id is null)


select *
from `price_temp_2021-07-19` pt
join ActionType A on pt.code = A.code and A.class = 1 and A.deleted = 0

select *
from `price_temp_2021-07-19`;

select *
from rbSpeciality;

insert into PriceListItem (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, priceList_id, deleted, service_id, serviceCodeOW, serviceNameOW, begDate, endDate, price, isAccumulativePrice, limitPerDay, limitPerMonth, limitPerPriceList, LCE, LCE_test)
select
       now() createDatetime,
       null createPerson_id,
       now() modifyDatetime,
       null modifyPerson_id,
       pli1.priceList_id,
       pli1.deleted,
       rS.id service_id,
       pt.code serviceCodeOW,
       pt.name serviceNameOW,
       '2021-07-01' begDate,
       '2022-01-09' endDate,
       pt.price price,
       pli1.isAccumulativePrice,
       pli1.limitPerDay,
       pli1.limitPerMonth,
       pli1.limitPerPriceList,
       pli1.LCE,
       pli1.LCE_test
from `price_temp_2021-07-19` pt
join rbService rS on pt.code = rS.code
left join PriceListItem pli on rS.id = pli.service_id and pli.begDate = '2021-07-01' and rS.endDate = '2022-01-09'
left join PriceListItem pli1 on pli1.id = (select id from PriceListItem order by id desc limit 1)
where pli.id is  null
;

select *
from InvoiceItem


select *
from Action where event_id=20433935  and actionType_id in(4687,5096);

4687
5096



select *
from Service where action_id in(23144059,23144060
);

select *
from Service where action_id = 23125027;


select *
from ActionType where id in(8586,4687,5096
                           );



SELECT
  TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME, REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME
FROM
  INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
  REFERENCED_TABLE_SCHEMA = 'gnc' AND
  REFERENCED_TABLE_NAME = 'InvoiceItem' and
REFERENCED_COLUMN_NAME = 'id';


select *
from Service;

select *
from Invoice;


select id,
       code,
       name,
       eisLegacy,
       nomenclatureLegacy,
       license,
       infis,
       begDate,
       endDate,
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
from rbService s;


select *
from rbPrintTemplate where name = 'Дневниковый осмотр';


select *
from rbPrintTemplate where templateText regexp 'Настоящее состояние';

select *
from ActionType where context in(select context from rbPrintTemplate where id in (16802,16821,34399))
;


select *
from ActionType at, rbPrintTemplate t where at.id = 4218 and at.context = t.context;


select *
from rbPrintTemplate where id =177;


select *
from rbSpeciality where id in(24,114);


select rp.*, s.*
from Person p, rbSpeciality s, rbPost rp where p.lastName = 'Пурло' and s.id = p.speciality_id and rp.id = p.post_id;

select *
from rbSpeciality where name regexp 'нефролог';\


select *
from rbAcademicTitle;

select *
from rbAcademicDegree;


select at.name, a.* from Action a, ActionType at where a.event_id = 20427788 and at.id = a.actionType_id

select *
from Client where id = 72609;

select *
from Action where  event_id = 20427788 and deleted = 0 and actionType_id in(7750,8207,8222,8488,8490);



select ActionType.name, Action.*
from Action
join ActionType on Action.actionType_id = ActionType.id
where event_id = (select id from Event where Event.externalId = '2525' and client_id = 278645) order by id desc ;

select *
from Client where lastName=  'Санасапова';

select *
from ActionType where name regexp 'Протокол операции' group by group_id;

select e.*
from Event e
where e.client_id = 330684 and
      e.externalId = '2617';


select *
from Action
join ActionType on Action.actionType_id = ActionType.id and ActionType.flatCode = 'moving'
where event_id = 20431652;
\

select *
from Action where actionType_id =7932 order by  id desc ;

select *
from ActionType where name = 'Выписка';


select *
from ActionPropertyType where actionType_id = 4676 and deleted = 0 order by idx;

select *
from ActionType where name = '';


select * from ActionType where id in(65100,77754,84478,8449784533,84587)

select distinct *
from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on ret.id = retres.id_rbEpicrisisTemplates
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id
left join rbEpicrisisSections_rbEpicrisisProperty resrep on res.id = resrep.id_rbEpicrisisSections
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id
where ret.code = 'Код 1';


delete from rbEpicrisisSections_rbEpicrisisProperty
where id in (73,74,76,77, 78, 93,94);

select *
from rbEpicrisisTemplates;

select *
from OrgStructure where deleted = 0 and name regexp 'травма|анестези';

' 18, 33,'


insert into s11.rbEpicrisisTemplates (id, name, code, id_orgStructure, printTemplate, type, isVisible, actionType_id, editableTime, canCopyOrgStr)
values  (5, 'Тест_Выписной эпикриз', 'Код 1', ' 18, 33,', '<div style="font-size:14pt; text-align:center;">
<b>САНКТ-ПЕТЕРБУРГСКОЕ ГОСУДАРСТВЕННОЕ БЮДЖЕТНОЕ <br>
УЧРЕЖДЕНИЕ ЗДРАВООХРАНЕНИЯ «ГОРОДСКАЯ БОЛЬНИЦА №15»</b></div>', null, 1, null, 0, ' 12, 13, 14, 15, 16, 17, 18, 19,  20, 28,');

insert into s11.rbEpicrisisSections (id, name, description)
values  (11, 'Шапка эпикриза', 'Шапка эпикриза'),
        (1, 'Паспортная часть', 'Выписной'),
        (4, 'Диагноз при выписке', null),
        (19, 'Состояние при поступлении', 'Неврологический'),
        (12, 'Лабораторные исследования', 'Результаты исследований'),
        (13, 'Инструментальные методы', 'Результаты исследований'),
        (14, 'Консультации специалистов', 'Результаты исследований'),
        (15, 'Лечение', ''),
        (17, 'Прочее', 'Результаты исследований'),
        (21, 'Лист нетрудоспособности', 'Результаты исследований');

insert into s11.rbEpicrisisProperty (id, name, description, type, defaultValue, valueDomain, printAsTable, isCopy)
values  (49, 'ИБ', '', 7, 'SELECT Event.externalId
FROM Event INNER JOIN Client ON Event.client_id = Client.id
WHERE Event.id = %s', null, 0, 1),
        (70, 'Отделение', 'Шапка эпикриза', 7, 'select os.name from Event e
join Person p on p.id = e.execPerson_id and p.deleted = 0
join OrgStructure os on os.id = p.orgStructure_id and os.deleted = 0
where e.deleted = 0 and e.id = %s', null, 0, 1),
        (2, 'ФИО пациента', '', 7, '#SELECT CONCAT_WS('' '',  Client.lastName,Client.firstName, Client.patrName, DATE_FORMAT(Client.birthDate,''%d.%m.%Y''), '' '', age(Client.birthDate,CURDATE()), ''лет'',''ИБ №'',Event.externalId) '' ''
#FROM Event INNER JOIN Client ON Event.client_id = Client.id
#WHERE Event.id = %s;

SELECT CONCAT_WS('' '',  Client.lastName,Client.firstName, Client.patrName, ''Дата рождения'', DATE_FORMAT(Client.birthDate,''%d.%m.%Y''), '' '', age(Client.birthDate,CURDATE()), ''лет'',''ИБ №'',Event.externalId) '' ''
FROM Event INNER JOIN Client ON Event.client_id = Client.id
WHERE Event.id = %s', null, 0, 1),
        (3, 'Находился(ась) на стационарном лечении', 'Кол-во дней прибывания', 7, 'select CONCAT_WS('' '', ''с'', Date(e.setDate), ''по'', if(e.execDate is null, CURDATE(), Date(e.execDate))) from Event e
where e.id = %s', null, 0, 0),
        (5, 'Адрес регистрации', '', 7, 'SELECT
  CONCAT(k.NAME,'', Район '', rd.name, '', улица '',s.NAME,'', д.'', ah.number,IF(ah.corpus LIKE '''','''',CONCAT('', корпус '',ah.corpus)),IF(a.flat LIKE '''','''',CONCAT('', кв '',a.flat)))
  FROM ClientAddress ca
  INNER JOIN Address a ON ca.address_id=a.id
  INNER JOIN AddressHouse ah ON a.house_id=ah.id
  INNER JOIN kladr.STREET s ON s.CODE=ah.KLADRStreetCode
  INNER JOIN kladr.KLADR k ON k.CODE=ah.KLADRCode
  INNER JOIN Event e ON ca.client_id=e.client_id
  left join rbDistrict rd on rd.id = ca.district_id
WHERE
  (
  ca.id = getClientRegAddressId(ca.client_id)
  )
  AND
  e.id= %s
  ORDER BY ca.type ASC
  LIMIT 1', null, 0, 1),
        (53, 'Полис', '', 7, '   SELECT concat (cp.serial,'' '',cp.number)
  FROM Event e
  INNER JOIN Client c ON e.client_id = c.id
    INNER JOIN ClientPolicy cp ON c.id = cp.client_id

  WHERE e.id=%s

  LIMIT 1

 ', null, 0, 1),
        (54, 'Снилс', '', 7, '   SELECT c.SNILS
  FROM Event e
  INNER JOIN Client c ON e.client_id = c.id


  WHERE e.id=%s

  LIMIT 1

 ', null, 0, 1),
        (71, 'Адрес проживания', '', 7, 'SELECT
  CONCAT(k.NAME,'', Район '', rd.name, '', улица '',s.NAME,'', д.'', ah.number,IF(ah.corpus LIKE '''','''',CONCAT('', корпус '',ah.corpus)),IF(a.flat LIKE '''','''',CONCAT('', кв '',a.flat)))
  FROM ClientAddress ca
  INNER JOIN Address a ON ca.address_id=a.id
  INNER JOIN AddressHouse ah ON a.house_id=ah.id
  INNER JOIN kladr.STREET s ON s.CODE=ah.KLADRStreetCode
  INNER JOIN kladr.KLADR k ON k.CODE=ah.KLADRCode
  INNER JOIN Event e ON ca.client_id=e.client_id
  left join rbDistrict rd on rd.id = ca.district_id
WHERE
  (
  ca.id = getClientLocAddressId(ca.client_id)
  )
  AND
  e.id= %s
  ORDER BY ca.type ASC
  LIMIT 1', null, 0, 1),
        (72, 'Паспорт', 'Паспортная часть', 7, 'select CONCAT_WS('' '', CONCAT_WS('' '', ''Серия:'', cd.serial), CONCAT_WS('' '', ''№:'', cd.`number`)) from Client c
 join ClientDocument cd on cd.id = (select max(cd2.id) from ClientDocument cd2 where cd2.client_id = c.id and cd2.deleted = 0)
 join Event e on e.client_id = c.id and e.id = %s', null, 0, 1),
        (10, 'Заключительный диагноз', 'совм.осм. с зав. посл', 7, 'select CONCAT_WS('' '', d.MKB,m2.DiagName) from Event e
 join Diagnostic d2 on d2.event_id = e.id and d2.deleted = 0
 join Diagnosis d on d.id = d2.diagnosis_id and d.deleted = 0 and d.client_id = e.client_id
 join rbDiagnosisType rdt on rdt.id = d2.diagnosisType_id and rdt.code = ''1''
 join MKB m2 on m2.DiagID = d.MKB
 where e.deleted = 0 and e.id = %s ORDER by d2.createDatetime desc limit 1', null, 1, 1),
        (11, 'Сопутствующие заболевания', '', 7, 'select CONCAT_WS('' '', d.MKB,m2.DiagName) from Event e
 join Diagnostic d2 on d2.event_id = e.id and d2.deleted = 0
 join Diagnosis d on d.id = d2.diagnosis_id and d.deleted = 0 and d.client_id = e.client_id
 join rbDiagnosisType rdt on rdt.id = d2.diagnosisType_id and rdt.code = ''9''
 join MKB m2 on m2.DiagID = d.MKB
 where e.deleted = 0 and e.id = %s ORDER by d2.createDatetime desc limit 1', null, 0, 1),
        (12, 'Осложнения основного заболевания', '', 7, 'select CONCAT_WS('' '', d.MKB,m2.DiagName) from Event e
 join Diagnostic d2 on d2.event_id = e.id and d2.deleted = 0
 join Diagnosis d on d.id = d2.diagnosis_id and d.deleted = 0 and d.client_id = e.client_id
 join rbDiagnosisType rdt on rdt.id = d2.diagnosisType_id and rdt.code = ''3''
 join MKB m2 on m2.DiagID = d.MKB
 where e.deleted = 0 and e.id = %s ORDER by d2.createDatetime desc limit 1', null, 0, 1),
        (122, 'Клинический диагноз', '', 7, null, null, 0, 1),
        (111, 'Жалобы при поступлении', 'Неврологический', 7, 'select aps.value from ActionProperty ap
left join ActionProperty_String aps using(id)
join Action a on ap.action_id = a.id and a.deleted = 0 and a.status = 2 and a.event_id = %s
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.code = ''''
join ActionPropertyType apt on apt.actionType_id = at2.id and ap.type_id = apt.id and apt.name REGEXP ''^Жалобы'' and apt.deleted = 0
where ap.deleted = 0 ORDER by a.createDatetime desc limit 1', null, 0, 1),
        (112, 'Анамнез заболевания', 'Неврологический', 7, 'select aps.value from ActionProperty ap
left join ActionProperty_String aps using(id)
join Action a on ap.action_id = a.id and a.deleted = 0 and a.status = 2 and a.event_id = %s
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.code = ''''
join ActionPropertyType apt on apt.actionType_id = at2.id and ap.type_id = apt.id and apt.name = ''Анамнез заболевания'' and apt.deleted = 0
where ap.deleted = 0 ORDER by a.createDatetime desc limit 1', null, 0, 1),
        (113, 'Объективный статус при поступлении', 'Неврологический', 8, 'select apt.name `Название поля`, aps.value `Значение поля` from ActionProperty ap
left join ActionProperty_String aps using(id)
join Action a on ap.action_id = a.id and a.deleted = 0 and a.status = 2 and a.event_id = %s
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.code = ''''
join ActionPropertyType apt on apt.actionType_id = at2.id and ap.type_id = apt.id and apt.name REGEXP ''Сознание|Температура|Кожные покровы|Видимые слизистые|Периферические лимфоузлы|Пульс|Сатурация|Артериальное давление|Тоны сердце|Шумы сердца|Част. дых|Дыхание|Хрипы|Язык|Живот|При пальпации|напряжен в|Симптомы раздражения брюшины|Печень|Поколачивание в поясничной области|Костно-мышечная система, суставы|Физиологические оправления'' and apt.deleted = 0
where ap.deleted = 0 ORDER by a.createDatetime desc, apt.idx ', null, 0, 1),
        (74, 'Биохимические исследования', 'Результаты исследований', 8, 'call procEpicrisisAnalyzes(%s, "''Биохимические исследования''")', null, 1, 1),
        (75, 'Анализы стационара', 'Результаты исследований', 8, 'call procEpicrisisAnalyzes(%s, "''Анализы стационара''")', null, 1, 1),
        (79, 'Covid-19', 'Результаты исследований', 8, 'call procEpicrisisAnalyzes(%s, "''Covid-19''")', null, 1, 1),
        (78, 'Иммунологические исследования', 'Результаты исследований', 8, 'call procEpicrisisAnalyzes(%s, "''Иммунологические исследования''")', null, 1, 1),
        (77, 'Коагулологические исследования', 'Результаты исследований', 8, 'call procEpicrisisAnalyzes(%s, "''Коагулологические исследования''")', null, 1, 1),
        (83, 'Диагностические назначения', 'Результаты исследований', 8, 'call procEpicrisisDiagnostic(%s, "''Заключение''")', null, 1, 1),
        (123, 'инструментальные исследования', 'Результаты исследований', 7, 'SELECT "" ', null, 0, 1),
        (98, '', 'Консультации специалистов', 8, 'call procEpicrisisConsult(%s,"''Рекомендовано.?''")', null, 1, 1),
        (124, 'заключения специалистов', 'Консультации специалистов(ручной ввод)', 7, 'SELECT "" ', null, 0, 1),
        (99, 'Диета', 'Лечение', 8, 'select
rd.name `Название диеты`,
min(date(ef.date)) `Дата начала`,
max(date(ef.date)) `Дата окончания`
from Event e
join Event_Feed ef ON ef.event_id = e.id
join rbDiet rd on rd.id = ef.diet_id
where e.id = %s
GROUP by ef.diet_id
order by ef.createDatetime', null, 0, 1),
        (100, 'Лекарственная терапия', 'Лечение', 8, 'select DATE_FORMAT(min(dds.takeDatetime), "%d.%m.%y %H:%i") `Начало`,DATE_FORMAT(max(dds.takeDatetime), "%d.%m.%y\\n%H:%i") `Окончание`, sum(dds.takeDose) `Доза`, rsn.mnn `МНН`
from DrugDestinationSchedule dds
join Action a on a.id = dds.action_id and a.deleted = 0 and a.event_id = %s
join rbStockNomenclature rsn on rsn.id = dds.nomenclature_id and rsn.deleted = 0
join ActionProperty ap on ap.action_id = a.id and ap.type_id in (SELECT apt.id from ActionPropertyType apt where apt.deleted = 0 and apt.name REGEXP ''Статус'' and apt.actionType_id in (select at2.id from ActionType at2 where at2.flatCode REGEXP ''drug_theraphy|drug_theraphy_complex'' and at2.deleted = 0))
join ActionProperty ap2 on ap2.action_id = a.id and ap2.type_id in (SELECT apt.id from ActionPropertyType apt where apt.deleted = 0 and apt.name REGEXP ''код'' and apt.actionType_id in (select at2.id from ActionType at2 where at2.flatCode REGEXP ''drug_theraphy|drug_theraphy_complex'' and at2.deleted = 0))
join ActionProperty_Integer api on ap.id = api.id  and (api.value = 2 or api.value = 1)
join ActionProperty_Integer api2 on ap2.id = api2.id and api2.value = dds.nomenclature_id
WHERE dds.deleted = 0
GROUP by a.id order by dds.id desc', null, 0, 1),
        (101, 'Процедуры и манипуляции', 'Лечение', 7, null, null, 0, 1),
        (103, 'Динамика состояния', 'Лечение', 8, 'select aps.value from ActionProperty ap
left join ActionProperty_String aps using(id)
join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = %s
join ActionType at2 on at2.id = a.actionType_id and at2.code = ''145-6480'' and flatCode = ''diary''
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted = 0 and apt.name REGEXP ''Состояние''
where ap.deleted = 0
order by a.createDatetime desc limit 1', null, 0, 1),
        (120, 'Лекарственная терапия', 'Лечение', 7, null, null, 0, 1),
        (121, 'Операции', 'ОперБлок', 8, 'select
Date(a1.plannedEndDate) `Дата операции`,
a1.specifiedName `Название операции`
from Event e
join Action a on a.event_id = e.id and a.deleted = 0
join Action a1 on a.parent_id = a1.id
where e.deleted = 0 and e.id = %s;', null, 0, 1),
        (104, 'Рекомендации', 'Лечение', 7, null, null, 0, 1),
        (106, 'Лечащий врач', 'Лечение', 7, 'select CONCAT_WS('' '', p.lastName, p.firstName, p.patrName) from Event e
join Person p on p.id = e.execPerson_id and p.deleted = 0
where e.deleted = 0 and e.id = %s', null, 0, 1),
        (107, 'Зав. отделением', 'Лечение', 7, 'select
CONCAT_WS('' '', p1.lastName, p1.firstName, p1.patrName)
from Event e
join Person p on p.id = e.execPerson_id and p.deleted = 0
join OrgStructure os on os.id = p.orgStructure_id
join Person p1 on p1.id = os.chief_id and p1.deleted = 0
where e.deleted = 0 and e.id = %s', null, 0, 1),
        (105, 'Лист нетрудоспособности', 'Лечение', 8, '(SELECT CONCAT_WS('' '', ti.serial,ti.number) `Больничный лист №` ,ti.begDate `Дата начала`,ti.endDate `Дата окончания` FROM Event e
JOIN TempInvalid ti ON e.client_id = ti.client_id AND ti.deleted = 0
WHERE e.deleted = 0 AND (ti.begDate >= date(e.createDatetime)) AND e.id = %s ORDER BY e.createDatetime DESC LIMIT 1)
UNION
(SELECT tie.number, tie.begDate,tie.endDate FROM Event e
JOIN TempInvalidELN tie ON e.client_id = tie.client_id AND tie.deleted = 0
WHERE e.id = %s AND e.deleted =0 AND (tie.begDate >= date(e.createDatetime)) ORDER BY e.createDatetime DESC LIMIT 1)', null, 0, 1);


insert into s11.rbEpicrisisTemplates_rbEpicrisisSections (id, id_rbEpicrisisTemplates, id_rbEpicrisisSections, idx, isEditable, htmlTemplate, isRequired)
values  (30, 5, 11, 0, 1, '<div style=''font-size: 14pt; text-align:center; margin-bottom: 0.25em; margin-top: 0.25em;''>
    {value}
</div>', 0),
        (31, 5, 1, 2, 1, '<div style=''font-size: 14pt; text-align:center; margin-bottom: 0.25em; margin-top: 0.25em; border-bottom:1px solid black; border-top:1px solid black;''>
    <b>{name} </b>
</div>
{value}', 0),
        (32, 5, 4, 4, 1, '<div style=''font-size: 14pt; text-align:center; margin-bottom: 0.25em; margin-top: 0.25em; border-bottom:1px solid black; border-top:1px solid black;''>
    <b>{name} </b>
</div>
{value}', 0),
        (33, 5, 19, 5, 1, '<div style=''font-size: 14pt; text-align:center; margin-bottom: 0.25em; margin-top: 0.25em; border-bottom:1px solid black; border-top:1px solid black;''>
    <b>{name} </b>
</div>
{value}', 0),
        (34, 5, 12, 6, 1, '<div style=''font-size: 14pt; text-align:center; margin-bottom: 0.25em; margin-top: 0.25em; border-bottom:1px solid black; border-top:1px solid black;''>
    <b>{name} </b>
</div>
{value}', 0),
        (35, 5, 13, 7, 1, '<div style=''font-size: 14pt; text-align:center; margin-bottom: 0.25em; margin-top: 0.25em; border-bottom:1px solid black; border-top:1px solid black;''>
    <b>{name} </b>
</div>
{value}', 0),
        (36, 5, 14, 8, 1, '<div style=''font-size: 14pt; text-align:center; margin-bottom: 0.25em; margin-top: 0.25em; border-bottom:1px solid black; border-top:1px solid black;''>
    <b>{name} </b>
</div>
{value}', 0),
        (37, 5, 15, 9, 1, '<div style=''font-size: 14pt; text-align:center; margin-bottom: 0.25em; margin-top: 0.25em; border-bottom:1px solid black; border-top:1px solid black;''>
 <b>{name} </b>
</div>
{value}', 0),
        (38, 5, 17, 11, 1, '{value}', 0),
        (77, 5, 21, 10, 1, '<div style=''font-size: 14pt; text-align:center; margin-bottom: 0.25em; margin-top: 0.25em; border-bottom:1px solid black; border-top:1px solid black;''>
 <b>{name} </b>
</div>
{value}', 0);

insert into s11.rbEpicrisisSections_rbEpicrisisProperty (id, id_rbEpicrisisSections, id_rbEpicrisisProperty, idx, htmlTemplate, orgStruct, isRequired, isEditable, isOld)
values  (48, 11, 49, 1, '<p style=''font-size: 11pt; text-align:center; margin-bottom: 0.1em; margin-top: 0.1em;''>Медицинская карта № </b>{value}</p>
<p style=''font-size: 14pt; text-align:center; margin-bottom: 0.5em; margin-top: 0.5em; border-bottom:1px;''> <b>Выписной эпикриз</b> <br> </p>', 'NULL', 0, 1, 0),
        (69, 11, 70, 0, '<p style=''font-size: 11pt; text-align:center; margin-bottom: 0.5em; margin-top: 0.5em;''> {value}</p>', 'NULL', 0, 1, 0),
        (1, 1, 2, 1, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (3, 1, 3, 8, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (52, 1, 5, 4, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (53, 1, 53, 6, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (54, 1, 54, 7, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (70, 1, 71, 5, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (71, 1, 72, 2, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (10, 4, 10, 1, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (11, 4, 11, 2, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (12, 4, 12, 3, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (114, 4, 122, 4, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (103, 19, 111, 1, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (104, 19, 112, 2, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (105, 19, 113, 3, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (73, 12, 74, 1, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 0, 0),
        (74, 12, 75, 2, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 0, 0),
        (76, 12, 79, 3, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 0, 0),
        (77, 12, 78, 4, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 0, 0),
        (78, 12, 77, 5, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 0, 0),
        (93, 13, 83, 0, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (115, 13, 123, 1, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (94, 14, 98, 0, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (116, 14, 124, 1, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (95, 15, 99, 0, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (96, 15, 100, 2, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 0, 0),
        (97, 15, 101, 3, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (98, 15, 103, 5, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (112, 15, 120, 1, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (113, 15, 121, 4, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (99, 17, 104, 0, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (101, 17, 106, 0, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (102, 17, 107, 0, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (100, 21, 105, 0, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0);

select *
from rbEpicrisisTemplates;