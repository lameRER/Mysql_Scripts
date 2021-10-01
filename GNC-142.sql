insert into PriceListItem(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, priceList_id, deleted,/*{{{*/
                          service_id, serviceCodeOW, serviceNameOW, begDate, endDate, price, isAccumulativePrice,
                          limitPerDay, limitPerMonth, limitPerPriceList, LCE, LCE_test)
select *
from (select now() createDatetime,
             NULL  createPerson_id,
             now() modifyDatetime,
             NULL  modifyPerson_id,
             120   priceList_id,
             deleted,
             service_id,
             serviceCodeOW,
             serviceNameOW,
             begDate,
             endDate,
             0.00  price,
             isAccumulativePrice,
             limitPerDay,
             limitPerMonth,
             limitPerPriceList,
             LCE,
             LCE_test
      from (
               select pli.*
               from ActionType at,
                    ActionType_Service ats,
                    rbService s,
                    PriceListItem pli
               where at.group_id in
                     (select id
                      from ActionType
                      where name in ('ИММУНОЛОГИЧЕСКИЕ лабораторные исследования (Гальцева И.В.)', 'ЦИТОГЕНЕТИКА, FISH',
                                     'МОЛЕКУЛЯРНО-ГЕНЕТИЧЕСКИЕ ИССЛЕДОВАНИЯ (Судариков А.Б.)')
                        and hidden = 0)
                 and at.id = ats.master_id
                 and s.id = ats.service_id
                 and pli.service_id = s.id
                 and pli.priceList_id = 124
                 and pli.endDate >= curdate()
                 and at.deleted = 0
                 and pli.deleted = 0
               union
               select pli.*
               from ActionType at,
                    ActionType_Service ats,
                    rbService s,
                    PriceListItem pli
               where at.group_id in
                     (select id
                      from ActionType
                      where group_id =
                            (select id
                             from ActionType
                             where name = 'КЛИНИКО-ДИАГНОСТИЧЕСКАЯ ЛАБОРАТОРИЯ')
                     )
                 and at.id = ats.master_id
                 and s.id = ats.service_id
                 and pli.service_id = s.id
                 and pli.priceList_id = 124
                 and pli.endDate >= curdate()
                 and at.deleted = 0
                 and pli.deleted = 0
    ) as tmp
      group by tmp.service_id) as tmp2
where exists(select *
                 from PriceListItem
                 where priceList_id = tmp2.priceList_id
                   and price = tmp2.price
                   and tmp2.service_id = service_id
                   and tmp2.deleted = deleted);/*}}}*/

select */*{{{*/
from PriceListItem
where serviceCodeOW = 'A12.30.012.014';/*}}}*/


select et.*
from EventType et, rbFinance f where et.deleted = 0 and f.id = et.finance_id and f.id = 20;


select *
from Contract where id in
(
select contract_id
from Contract_PriceList where priceList_id = 120) and finance_id = 20;


select *
from contra;

select *
from EventType where finance_id = 20;

select *
from EventType_Action where eventType_id = 148 and actionType_id in (select id from ActionType where group_id in
                     (select id
                      from ActionType
                      where name in ('ИММУНОЛОГИЧЕСКИЕ лабораторные исследования (Гальцева И.В.)', 'ЦИТОГЕНЕТИКА, FISH',
                                     'МОЛЕКУЛЯРНО-ГЕНЕТИЧЕСКИЕ ИССЛЕДОВАНИЯ (Судариков А.Б.)')));

select *
from Contract_PriceList where contract_id = 220086;

set @num = 115;
insert into EventType_Action(eventType_id, idx, actionType_id, speciality_id, tissueType_id, sex, age, age_bu, age_bc, age_eu, age_ec, selectionGroup, actuality, expose, payable, academicDegree_id, deleted, plannedEndDateTemplate_id)
select *
from (select
             eventType_id,
             @num:=@num+1 as idx,
             actionType_id,
             speciality_id,
             tissueType_id,
             sex,
             age,
             age_bu,
             age_bc,
             age_eu,
             age_ec,
             selectionGroup,
             actuality,
             expose,
             payable,
             academicDegree_id,
             deleted,
             plannedEndDateTemplate_id
      from (
               select ea.id,
                      eventType_id,
                      max(ea.idx) as idx,
                      at.id          actionType_id,
                      speciality_id,
                      tissueType_id,
                      ea.sex,
                      ea.age,
                      ea.age_bu,
                      ea.age_bc,
                      ea.age_eu,
                      ea.age_ec,
                      selectionGroup,
                      actuality,
                      expose,
                      payable,
                      academicDegree_id,
                      0              deleted,
                      plannedEndDateTemplate_id
               from ActionType at,
                    ActionType_Service ats,
                    rbService s,
                    PriceListItem pli,
                    EventType_Action ea
               where at.group_id in
                     (select id
                      from ActionType
                      where name in ('ИММУНОЛОГИЧЕСКИЕ лабораторные исследования (Гальцева И.В.)', 'ЦИТОГЕНЕТИКА, FISH',
                                     'МОЛЕКУЛЯРНО-ГЕНЕТИЧЕСКИЕ ИССЛЕДОВАНИЯ (Судариков А.Б.)')
                        and hidden = 0)
                 and at.id = ats.master_id
                 and s.id = ats.service_id
                 and pli.service_id = s.id
                 and pli.priceList_id = 120
                 and pli.endDate >= curdate()
                 and at.deleted = 0
                 and pli.deleted = 0
                 and ea.id = (select max(id) from EventType_Action where EventType_Action.eventType_id = 148)
               union
               select ea.id,
                      eventType_id,
                      ea.idx,
                      at.id actionType_id,
                      speciality_id,
                      tissueType_id,
                      ea.sex,
                      ea.age,
                      ea.age_bu,
                      ea.age_bc,
                      ea.age_eu,
                      ea.age_ec,
                      selectionGroup,
                      actuality,
                      expose,
                      payable,
                      academicDegree_id,
                      0     deleted,
                      plannedEndDateTemplate_id
               from ActionType at,
                    ActionType_Service ats,
                    rbService s,
                    PriceListItem pli,
                    EventType_Action ea
               where at.group_id in
                     (select id
                      from ActionType
                      where group_id =
                            (select id
                             from ActionType
                             where name = 'КЛИНИКО-ДИАГНОСТИЧЕСКАЯ ЛАБОРАТОРИЯ')
                     )
                 and at.id = ats.master_id
                 and s.id = ats.service_id
                 and pli.service_id = s.id
                 and pli.priceList_id = 120
                 and pli.endDate >= curdate()
                 and at.deleted = 0
                 and pli.deleted = 0
                 and ea.id = (select max(id) from EventType_Action where EventType_Action.eventType_id = 148)
               group by at.id
           ) as tmp) as tmp2
where not exists(select *
                 from EventType_Action
                 where tmp2.eventType_id = eventType_id
                   and actionType_id = tmp2.actionType_id
                   and tmp2.deleted = deleted)
# where not exists(select * from EventType_Action where eventType_id = )
# where exists(select *
#              from PriceListItem
#              where priceList_id = tmp2.priceList_id
#                and price = tmp2.price
#                and tmp2.service_id = service_id
#                and tmp2.deleted = deleted);/*}}}*/
