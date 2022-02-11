select *
from rbuserright
where code in (
    select code
    from rbuserright
    group by code
    having count(code) > 1
) order by code;

select *
from rbuserprofile_right where userRight_id in(409,408) group by userRight_id;


delete from rbuserright where id in(424, 421, 422, 430, 409);
