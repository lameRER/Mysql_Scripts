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
                 and pli.deleted = 0) as tmp
      group by tmp.service_id) as tmp2
where not exists(select *
                 from PriceListItem
                 where priceList_id = tmp2.priceList_id
                   and price = tmp2.price
                   and tmp2.service_id = service_id
                   and tmp2.deleted = deleted
                   and priceList_id = 124);/*}}}*/

select */*{{{*/
from PriceListItem
where serviceCodeOW = 'A12.30.012.014';/*}}}*/
