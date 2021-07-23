SELECT jt.datetime, c.lastName, a.* FROM Action a
INNER JOIN ActionProperty ap ON a.id = ap.action_id
INNER JOIN ActionProperty_Job_Ticket apjt ON ap.id = apjt.id
INNER JOIN Job_Ticket jt ON apjt.value = jt.id
INNER JOIN Event e ON a.event_id = e.id
INNER JOIN Client c ON e.client_id = c.id
WHERE a.actionType_id = 43232 AND jt.datetime >= '2021-07-23 11:30:00' AND a.status = 1



select distinct e.*
from Client c
join Event e on e.client_id = c.id and e.id = 13599772
where c.id = 768493;


select *
from ActionProperty ap
join Action a on a.id = ap.action_id and a.actionType_id = 43419
join ActionType at on at.id = a.actionType_id
left join ActionPropertyType apt on apt.actionType_id = at.id and apt.id = ap.type_id
join Event e on e.id = a.event_id
join Client c on c.id = e.client_id and c.id =768493

select *
from ActionPropertyType where id  =13625;

select *
from Action, Event where Action.event_id = Event.id and Event.client_id = 768493;


set @acOld = 43232;
set @acNew = 43419;


select APJT.* from
# update
              ActionProperty ap
join ActionProperty_Job_Ticket APJT on ap.id = APJT.id
join Action a on a.id = ap.action_id and a.deleted = 0
# set a.actionType_id = 43232
where a.id in(25801669,25782615,25821919,25781969,25769048,25797247,25771264,25747615,25798034,25780988,25797391,25774141,25755063,25732418,25760730,25797791,25789272,25799325,25812577,25797420,25769129,25754818,25768414,25732441,25781955,25768273,25736034,25563330,25799215,25816073,25730025,25727570,25798895,25776955,25605677,25672159,25715984,25723835,25736377,25742749,25743783,25745406,25746081,25745682,25747373,25800338,25755524,25741862,25749514,25750002,25747297,25750812,25735290,25747487,25745545,25751518,25747337,25751617,25747531,25751717,25751759,25751801,25751582,25752353,25747640,25752412,25752436,25752497,25762014,25762509,25779030,25789028,25790114,25792587,25793401,25793574,25794393,25757950,25757999,25795303,25795150,25804666,25805156,25805516,25805866,25792169,25757924,25816835,25758304,25789410,25753712,25753704,25789643,25747684,25754482,25742220,25812886,25807124,25812096,25753646,25787167,25805540,25758234,25773210,25753660,25812284,25781837,25810875,25430654,25737829,25753741,25753748,25747718,25753734,25753696,25755531,25755983,25755975,25756009,25756125,25758179,25758251,25758737,25758077,25759864,25760765,25760857,25755943,25761658,25756112,25763405,25759317,25763549,25763665,25763699,25763939,25759774,25765825,25766729,25770301,25761050,25770334,25758088,25770409,25763378,25763741,25767430,25765170,25765576,25760168,25777446,25783992,25789434,25805772,25809783,25800736,25802305,25801353,25800928,25803099,25801993,25801720,25802469,25805849,25816335,25795793,25708187,25764750,25775030,25775559,25777555,25780953,25781847,25784195,25784338,25787769,25789181,25786798,25786769,25789228,25791158,25793786,25789118,25793890,25794008,25795540,25804647,25811156,25816612,25818287,25820421,25816992,25797024,25797140,25799631,25814136,25797238,25785899,25789332,25787120,25748223,25812623,25782303,25783222,25783622,25784112,25793078,25793730,25795204,25797239,25804640,25809868,25811944,25812174,25821310,25812790,25814087,25818092,25821678,25821749,25815830,25816578,25816105,25819252,25819267,25819285,25805177,25763678,25820197,25820311,25804310,25803705,25738171,25770862,25783119,25795394,25795454,25795529,25808176,25810557,25810714,25811673,25814343,25815493,25817802,25822128,25818147,25819072,25819323,25819049,25819359,25793913,25819372,25819986,25690113,25737288,25715439,25737327,25763349,25782969,25819474,25822207,25810585,25811612,25818457,25797124,25819792,25822595,25781443,25819799,25794980,25813742)


select *
from Job_Ticket where id =543424;

select *
from Job where id = 7342;

select *
from rbJobType where id = 34;

select *
from ActionProperty where action_id= 25782615 and type_id = 13625;


select *
from ActionPropertyType where id = 19625;


select *
from ActionPropertyType where actionType_id = 43232;


select *
from ActionProperty_Job_Ticket where id =27789680;


select *
from Action a
join Action_backUp_2021_07_23 ab on ab.id = a.id
where ab.actionType_id = @acOld and a.actionType_id = @acNew





select *
from Job_Ticket;

select a.*, jt.datetime, at1.id, @acOld, ap.* from ActionProperty ap
left JOIN ActionProperty_Job_Ticket apjt using(id)
left JOIN Job_Ticket jt ON apjt.value = jt.id and jt.datetime >= '2021-07-23 13:00:00'
join Action a on a.id = ap.action_id and a.deleted =0-- and a.status = 1
join ActionType at1 on at1.id = a.actionType_id and at1.deleted = 0 and at1.id = @acOld
join ActionPropertyType apt on apt.actionType_id = at1.id and apt.id = ap.type_id and apt.deleted = 0
left join ActionType at2 on at2.id = @acNew
left join ActionPropertyType apt1 on apt1.actionType_id = at2.id and apt1.deleted = 0 and apt1.name = apt.name and apt1.typeName = apt.typeName and apt1.idx = apt.idx;





select * from
# update
              ActionProperty ap
join Action a on a.id = ap.action_id and a.deleted = 0
join ActionType at1 on at1.id = a.actionType_id and at1.deleted = 0 and at1.id = @acNew
join ActionPropertyType apt on apt.actionType_id = at1.id and apt.id = ap.type_id and apt.deleted = 0
left join ActionType at2 on at2.id = @acNew
left join ActionPropertyType apt1 on apt1.actionType_id = at2.id and apt1.deleted = 0 and apt1.name = apt.name and apt1.typeName = apt.typeName and apt1.idx = apt.idx
# set ap.type_id = apt1.id
where ap.action_id in
(select ap.action_id from ActionProperty ap
JOIN ActionProperty_Job_Ticket apjt using(id)
JOIN Job_Ticket jt ON apjt.value = jt.id and jt.datetime >= '2021-07-23 13:00:00'
join Action a on a.id = ap.action_id and a.deleted =0 and a.status = 1
join ActionType at1 on at1.id = a.actionType_id and at1.deleted = 0 and at1.id = @acNew)



select * from
              ActionProperty ap
join Action a on a.id = ap.action_id and a.deleted = 0
join ActionType at1 on at1.id = a.actionType_id and at1.deleted = 0 and at1.id = @acOld
join ActionPropertyType apt on apt.actionType_id = at1.id and apt.id = ap.type_id and apt.deleted = 0
left join ActionType at2 on at2.id = @acNew
left join ActionPropertyType apt1 on apt1.actionType_id = at2.id and apt1.deleted = 0 and apt1.name = apt.name and apt1.typeName = apt.typeName and apt1.idx = apt.idx
where ap.action_id in
(select ap.action_id from ActionProperty ap
JOIN ActionProperty_Job_Ticket apjt using(id)
JOIN Job_Ticket jt ON apjt.value = jt.id and jt.datetime >= '2021-07-23 13:30:00'
join Action a on a.id = ap.action_id and a.deleted =0 and a.status = 1
join ActionType at1 on at1.id = a.actionType_id and at1.deleted = 0 and at1.id = @acOld)



select * from
              ActionProperty ap
join Action a on a.id = ap.action_id and a.deleted = 0
join ActionType at1 on at1.id = a.actionType_id and at1.deleted = 0 and at1.id = @acNew
join ActionPropertyType apt on apt.actionType_id = at1.id and apt.id = ap.type_id and apt.deleted = 0
left join ActionType at2 on at2.id = @acNew
left join ActionPropertyType apt1 on apt1.actionType_id = at2.id and apt1.deleted = 0 and apt1.name = apt.name and apt1.typeName = apt.typeName and apt1.idx = apt.idx
where ap.action_id in
(select ap.action_id from ActionProperty ap
JOIN ActionProperty_Job_Ticket apjt using(id)
JOIN Job_Ticket jt ON apjt.value = jt.id and jt.datetime >= '2021-07-23 13:00:00'
join Action a on a.id = ap.action_id and a.deleted =0 and a.status = 1
join ActionType at1 on at1.id = a.actionType_id and at1.deleted = 0 and at1.id = @acNew)


select *
from ActionPropertyType where id =14569;


select *
from ActionProperty where id = 27850042;


select *
from Action where id = 25822786;


select *
from ActionPropertyType where id = 14569;



PREPARE stmt_name FROM @sel;
EXECUTE stmt_name;



select *
from ActionProperty ap
left JOIN ActionProperty_Job_Ticket apjt using(id)
 left JOIN Job_Ticket jt ON apjt.value = jt.id and jt.datetime >= '2021-07-23 11:30:00'
join Action a on a.id = ap.action_id and a.deleted =0 and a.status = 1
join ActionType at1 on at1.id = a.actionType_id and at1.deleted = 0 and at1.id = @acOld
join ActionPropertyType apt on apt.actionType_id = at1.id and apt.id = ap.type_id and apt.deleted = 0
left join ActionType at2 on at2.id = @acNew
left join ActionPropertyType apt1 on apt1.actionType_id = at2.id and apt1.deleted = 0 and apt1.name = apt.name and apt1.typeName = apt.typeName and apt1.idx = apt.idx



select *
from ActionPropertyType where id in(14568,13624,14569,13625,14570,13626,14571,13627,14573,13629,14574,13630,14575,13631,14577,13633,14578,13634,14579,13635,14580,13636,14581,13637,14585,13641,14586,13642,14587,13643,14588,13644,14589,13645,14590,13646,14591,13647,14592,13648);




select *
from information_schema.PROCESSLIST where COMMAND not in('Sleep') and HOST regexp '10.145.134.254';


select *
from ActionPropertyType where id in();

select * from ActionPropertyType where actionType_id = (select id from ActionType where id = @acOld) and deleted = 0;

select * from ActionPropertyType where actionType_id = (select id from ActionType where id = @acNew) and deleted = 0;


select *
from ActionType where id = 43232;

select *
from ActionType where id =43419


select *
from ActionType where name regexp 'Определение РНК';

select *
from ActionType order by id desc;