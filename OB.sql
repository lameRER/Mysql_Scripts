
USE s11

-- Отбирает Хирургов ОБ

SELECT os.code, p.* FROM Person p
JOIN vrbPersonWithSpeciality pws ON p.id = pws.id
JOIN Person_Activity pa ON p.id = pa.master_id
JOIN rbActivity a ON pa.activity_id = a.id
JOIN OrgStructure os ON os.id = p.orgStructure_id
WHERE a.name = 'Хирург ОБ'
ORDER BY os.code;


-- Вот так определяются операционные
SELECT * FROM OrgStructure os
WHERE os.name REGEXP 'Операционная.*' AND name NOT REGEXP 'малой';

-- Операционная сестра
SELECT * FROM Person as p
JOIN rbUserProfile up ON p.userProfile_id=up.id
WHERE up.code='sisterob';

-- Так определяются ассистенты
SELECT * FROM Person p
JOIN OrgStructure os ON p.orgStructure_id=os.id
WHERE os.hasHospitalBeds=1 AND p.speciality_id IS NOT NULL AND p.retired=0;

-- Анастезиолог
SELECT p.* FROM Person p
JOIN OrgStructure os ON p.orgStructure_id=os.id
JOIN rbSpeciality s ON p.speciality_id=s.id
WHERE os.name REGEXP 'анестез' and s.name NOT REGEXP '%сестр%' AND retired=0
ORDER BY p.lastname;

-- Анастезиологическая сестра
SELECT * FROM Person p
INNER JOIN rbUserProfile up ON p.userProfile_id=up.id
WHERE up.code='anestezsister_ob';





-- Профиля прав которые были добавлены и тестовые учетки к ним
-- пароль 12347
SELECT p.* FROM Person p
JOIN Person_UserProfile pup ON p.userProfile_id = pup.userProfile_id
JOIN rbUserProfile up ON pup.userProfile_id = up.id AND up.code IN ('sisterob', 'head_sister_ob', 'anestezsister_ob', 'head_anestez', 'nachmed');



SELECT * FROM ActionPropertyType apt  WHERE apt.name REGEXP 'Тип операции';


SELECT * FROM ActionType at WHERE at.name = 'Оперблок: Предоперационный эпикриз'