
select table_name, constraint_name, status, owner
from all_constraints
where r_owner = :r_owner
and constraint_type = 'R'
and r_constraint_name in
 (
   select constraint_name from all_constraints
   where constraint_type in ('P', 'U')
   and table_name = :r_table_name
   and owner = :r_owner
 )
order by table_name, constraint_name;



select owner,constraint_name,constraint_type,table_name,r_owner,r_constraint_name
  from all_constraints
 where constraint_type='R'
   and r_constraint_name in (select constraint_name
                               from all_constraints
                              where constraint_type in ('P','U')
                                and table_name='D_PERSMEDCARD');


use s11;
SET foreign_key_checks = 0;
TRUNCATE Account;
TRUNCATE Account_Item;
TRUNCATE Action;
TRUNCATE ActionTemplate;
TRUNCATE Client;
TRUNCATE ClientAddress;
TRUNCATE ClientAllergy;
TRUNCATE ClientAnthropometric;
TRUNCATE ClientAttach;
TRUNCATE ClientCompulsoryTreatment;
TRUNCATE ClientContact;
TRUNCATE ClientDisability;
TRUNCATE ClientDispanserization;
TRUNCATE ClientDocument;
TRUNCATE ClientPolicy;
TRUNCATE ClientRelation;
TRUNCATE ClientRemark;
TRUNCATE ClientSocStatus;
TRUNCATE ClientWork;
TRUNCATE Diagnosis;
TRUNCATE Diagnostic;
TRUNCATE EQueueTicket;
TRUNCATE Event;
TRUNCATE Job_Ticket;
TRUNCATE OrgStructure;
TRUNCATE PersonAttach;
TRUNCATE Visit;
SET foreign_key_checks = 1;


select *
from s11.expdata1 group by PD_TYPE;



insert into s11.Client(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, attendingPerson_id, deleted, lastName, firstName, patrName, birthDate, birthTime, sex, SNILS, bloodType_id, bloodDate, bloodNotes, growth,
                       weight, embryonalPeriodWeek, birthPlace, chronicalMKB, diagNames, chartBeginDate, rbInfoSource_id, notes, IIN, isConfirmSendingData, isUnconscious, hasImplants, hasProsthesis, dataTransferConfirmationDate,
                       SNILSMissing_id)
select *
from (select now()                                                  createDatetime,
             null                                                   createPerson_id,
             now()                                                  modifyDatetime,
             null                                                   modifyPerson_id,
             attendingPerson_id,
             0                                                      deleted,
             tpl.SURNAME                                            lastName,
             tpl.FIRSTNAME                                          firstName,
             tpl.LASTNAME                                           patrName,
          date(STR_TO_DATE(tpl.BIRTHDATE, '%d.%m.%Y  %H:%i:%s')) birthDate,
     birthTime,
     tpl.SEX                                                sex,
     if(tpl.SNILS = 'null', '', tpl.SNILS)                SNILS,
     NULL                                                   bloodType_id,
     NULL                                                   bloodDate,
     bloodNotes,
     growth,
     weight,
     embryonalPeriodWeek,
     c.birthPlace,
    ''                                                   chronicalMKB,
    diagNames,
    chartBeginDate,
    rbInfoSource_id,
    notes,
    IIN,
    isConfirmSendingData,
    isUnconscious,
    hasImplants,
    hasProsthesis,
    dataTransferConfirmationDate,
    SNILSMissing_id
from s11.Client c,
    s11.expdata1 tpl
where tpl.BIRTHDATE != 'null' and c.id = (select id from Client order by id desc limit 1) group by tpl.ID) as tmp
where not exists(select * from Client where tmp.lastName = lastName and tmp.firstName = firstName and tmp.patrName = patrName and tmp.SNILS = SNILS and tmp.birthDate = birthDate);


# insert into ClientDocument(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, client_id, documentType_id, serial, number, date, origin, endDate)
# create temporary table temp_lu
(select *
from
(select now()                                                                                    createDatetime,
       null                                                                                     createPerson_id,
       now()                                                                                    modifyDatetime,
       null                                                                                     modifyPerson_id,
       0                                                                                        deleted,
       c.id                                                                                     client_id,
       case
           when ex.PD_TYPE = 49694 then 3
           when ex.PD_TYPE = 49695 then 4
           when ex.PD_TYPE = 49696 then 5
           when ex.PD_TYPE = 49698 then 7
           when ex.PD_TYPE = 49700 then 2
           when ex.PD_TYPE = 75599624 then 14
           when ex.PD_TYPE = 75599625 then 11
           when ex.PD_TYPE = 75599627 then 13
           when ex.PD_TYPE = 75599628 then 1
           when ex.PD_TYPE = 75599629 then 2
           when ex.PD_TYPE = 75599630 then 6
           when ex.PD_TYPE = 75599632 then null
           when ex.PD_TYPE = 78243493 then null
           when ex.PD_TYPE = 78243495 then null
           when ex.PD_TYPE = 78243496 then 3
           when ex.PD_TYPE = 78243497 then 3
           when ex.PD_TYPE = 78243500 then null end                                                               documentType_id,
       replace(ex.PD_SER, '.', ' ')                                                                                                  serial,
       ex.PD_NUMB                                                                                                 number,
       STR_TO_DATE(ex.PD_WHEN, '%d.%m.%Y  %H:%i:%s')                         date,
       if(ex.PD_WHO = 'null' or ex.PD_WHO = '.', '', ex.PD_WHO)                                                                    origin,
       IF(ex.PERIOD_END = 'null', NULL, STR_TO_DATE(ex.PERIOD_END, '%d.%m.%Y  %H:%i:%s')) endDate
from Client c,
     ClientDocument cd,
     expdata1 ex
where c.lastName = ex.SURNAME
  and c.patrName = ex.LASTNAME
  and c.firstName = ex.FIRSTNAME
  and c.birthDate = if(ex.BIRTHDATE ='null', NULL, date(STR_TO_DATE(ex.BIRTHDATE, '%d.%m.%Y  %H:%i:%s')))
  and ex.ID in (select ID from expdata1 group by ID) and ex.PD_WHEN != 'null'
  and cd.id = (select id from ClientDocument order by id desc limit 1)) as tmp
where not exists(select * from ClientDocument where tmp.serial = serial and tmp.number = number and tmp.deleted = deleted and tmp.client_id = client_id and tmp.date = date) and tmp.documentType_id is not null);


select ex.PD_WHEN, date(STR_TO_DATE(PD_WHEN, '%d.%m.%Y %H:%i:%s'))
from expdata1 ex  group by ex.PD_WHEN;


select *
from ClientDocument;

insert into ClientDocument(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, client_id, documentType_id, serial, number, date, origin, endDate)
select *
from
    (select *
     from temp_clientDocument tc) as tmp
where not exists(select * from ClientDocument where tmp.serial = serial and tmp.number = number and tmp.endDate = endDate)
;
select *
from ClientDocument order by id desc ;


select *
from Client where id = 87831;


select * from Client where SNILS = 00813050395

select *
from temp_clientDocument where client_id = 65195;

alter table ClientDocument modify origin varchar(250) default '' not null comment 'Организация, выдавшая документ';

insert into ClientPolicy(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id,
                         deleted, client_id, insurer_id, policyType_id, policyKind_id, serial,
                         number, begDate, endDate, dischargeDate, insuranceArea)
select *
from (select now()                                                        createDatetime,
             null                                                         createPerson_id,
             now()                                                        modifyDatetime,
             null                                                         modifyPerson_id,
             0                                                            deleted,
             c.id                                                         client_id,
             null                                                         insurer_id,
             case when ex.P_TYPE = 0 then 1 when ex.P_TYPE = 1 then 3 end policyType_id,
             case
                 when ex.P_KIND = 1 then 2
                 when ex.P_KIND = 2 then 3
                 when ex.P_KIND = 3 then 1 end                            policyKind_id,
             if(ex.P_SER = 'null', '', ex.P_SER)                          serial,
             ex.P_NUM                                                     number,
             ex.P_BEGIN                                                   begDate,
             if(ex.P_END = 'null', null, ex.P_END)                        endDate,
             null                                                         dischargeDate,
             null                                                         insuranceArea
      from Client c,
           ClientPolicy cd,
           expdata1 ex
      where c.lastName = ex.SURNAME
        and c.patrName = ex.LASTNAME
        and c.firstName = ex.FIRSTNAME
        and c.birthDate = if(ex.BIRTHDATE = 'null', NULL, date(STR_TO_DATE(ex.BIRTHDATE, '%d.%m.%Y  %H:%i:%s')))
        and ex.ID in (select ID from expdata1 group by ID)
        and ex.PD_WHEN != 'null'
        and cd.id = (select id from ClientPolicy order by id desc limit 1)) as tmp
where not exists(select * from ClientPolicy where tmp.serial = serial and tmp.number = number and tmp.deleted = deleted and tmp.client_id = client_id and tmp.begDate = tmp.begDate and tmp.endDate = tmp.endDate);

select *
from ClientPolicy;


select *
from rbPolicyType;
select *
from rbPolicyKind;

insert into ClientPolicy(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id,
                         deleted, client_id, insurer_id, policyType_id, policyKind_id, serial,
                         number, begDate, endDate, dischargeDate, insuranceArea)
select createDatetime,
       createPerson_id,
       modifyDatetime,
       modifyPerson_id,
       deleted,
       client_id,
       insurer_id,
       policyType_id,
       policyKind_id,
       serial,
       number,
    date(STR_TO_DATE(begDate, '%d.%m.%Y  %H:%i:%s')),
    date(STR_TO_DATE(endDate, '%d.%m.%Y  %H:%i:%s')),
    dischargeDate,
    '' insuranceArea
from temp_clientPolice_lu;
