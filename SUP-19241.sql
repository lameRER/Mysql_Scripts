# noinspection SqlAggregatesForFile

select up.name, os.name, p.login, p.password
from Person p, OrgStructure os, rbUserProfile up
where p.userProfile_id = up.id and os.id = p.orgStructure_id and doctorRoomAccessDenied = 0 group by os.id, up.id order by  up.name, os.name;