SELECT distinct r.category_id,r1.name, r.name,ar.refuseType_id, a.*
FROM action a
INNER JOIN account_item ai ON a.event_id = ai.event_id
INNER JOIN actiontype at1 ON a.actionType_id = at1.id
INNER JOIN rbservice r ON at1.nomenclativeService_id=r.id
INNER JOIN rbservicecategory r1 ON r.category_id=r1.id
INNER JOIN account_refuses ar ON ai.id = ar.account_item_id
WHERE ai.master_id IN (86491,86401, 86400, 86478, 86491, 86492, 86300, 86301, 86546, 86446, 86377,86267, 86269, 86277)
AND a.deleted=0
AND ai.deleted=0
AND at1.deleted=0
AND a.payStatus=2
AND ar.refuseType_id=1243
AND r.category_id=2;



SELECT
       count(a.event_id),
       a.id, a.event_id, s.category_id, sc.name, s.name, ar.refuseType_id, a.*
from account_item ai
join Action a on a.id = ai.action_id and a.event_id = ai.event_id and a.deleted = 0 and a.payStatus = 2
#                      and a.event_id in (3753130,3758282,3758317,3761676,3765005,3769520,3769610,3772792,3781126,3782069,3783789,3784265,3790106,3790847,3790854,3791105,3791107,3793745,3796828,3796845,3796885)
#      and a.id = (select min(a2.endDate) from action a2 where a2.id = a.id group by a2.event_id)
join ActionType at1 on at1.id = a.actionType_id and at1.deleted = 0
join rbservice s on s.id = at1.nomenclativeService_id and s.category_id = 2
join rbservicecategory sc on s.category_id = sc.id and sc.deleted = 0
join account_refuses ar on ar.account_item_id = ai.id and ar.refuseType_id = 1243
where ai.master_id IN (86491,86401, 86400, 86478, 86491, 86492, 86300, 86301, 86546, 86446, 86377,86267, 86269, 86277)
group by a.event_id having count(a.event_id) > 1
;


select min(endDate)
from action where event_id in (3753130,3758282,3758317,3761676,3765005,3769520,3769610,3772792,3781126,3782069,3783789,3784265,3790106,3790847,3790854,3791105,3791107,3793745,3796828,3796845,3796885)
and id in (7180039, 7268136, 7189108, 7221093, 7180052, 7257575, 7193881, 7256539, 7207358, 7222759, 7185654, 7239406, 7204358, 7246954, 7216243, 7254496, 7236168, 7237224, 7228204, 7228232, 7256196, 7262528, 7256205, 7280572, 7256274, 7262126, 7236215, 7237180, 7271459, 7256302, 7273769, 7251320, 7271509, 7256310, 7271448, 7256334, 7262159, 7251208, 7271580, 7256393, 7271557, 7256402, 7273782)
                  group by event_id;


select a.id, a.event_id, s.category_id, sc.name, s.name, ar.refuseType_id, a.*
from account_item ai
join Action a on a.id = ai.action_id and a.event_id = ai.event_id and a.deleted = 0 and a.payStatus = 2 and a.event_id = 3753130
join ActionType at1 on at1.id = a.actionType_id and at1.deleted = 0
join rbservice s on s.id = at1.nomenclativeService_id and s.category_id = 2
join rbservicecategory sc on s.category_id = sc.id and sc.deleted = 0
join account_refuses ar on ar.account_item_id = ai.id and ar.refuseType_id = 1243
where ai.master_id IN (86491,86401, 86400, 86478, 86491, 86492, 86300, 86301, 86546, 86446, 86377,86267, 86269, 86277)