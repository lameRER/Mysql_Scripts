
-- UPDATE
 SELECT at.name, apt.* FROM 
ActionPropertyType apt
 JOIN ActionType at ON apt.actionType_id = at.id AND at.deleted = 0 AND at.class = 1
-- SET apt.visibleInDR = 0, apt.visibleInJobTicket = 1
WHERE apt.visibleInJobTicket = 0 AND apt.visibleInDR = 1 AND apt.deleted = 0;

-- UPDATE
 SELECT at.name, apt.* FROM 
ActionPropertyType apt
 JOIN ActionType at ON apt.actionType_id = at.id AND at.deleted = 0 AND  at.class = 1
-- SET apt.visibleInDR = 1, apt.visibleInJobTicket = 0
WHERE apt.visibleInJobTicket = 1 AND apt.visibleInDR = 0 AND apt.deleted = 0;

/*
 UPDATE
-- SELECT apt.* FROM 
 s11.ActionPropertyType apt
JOIN s12.ActionType at ON apt.actionType_id = at.id AND at.deleted = 0
JOIN s11.Update_apt_14_08_20 up ON up.id = apt.id
 SET apt.visibleInJobTicket = up.visibleInJobTicket, apt.visibleInDR = up.visibleInDR
WHERE apt.deleted = 0
/*




