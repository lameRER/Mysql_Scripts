-- Ф.И.О. всех пациентов меняется в Пациентов Пациент Пациентович.
UPDATE `Client` 
SET 
    lastName = 'Пациентов',
    firstName = 'Пациент',
    patrName = 'Пациентович';
   
   select * from Client c ;
    
   
   UPDATE 
	ClientDocument
SET
	`serial` = right(CAST(rand() AS CHAR), 4),
	`number` = right(CAST(rand() AS CHAR), 6),
	`origin` = 'Виста';
	

-- Полисы всех пациентов меняется на полисы со случайным 12-тизначным номером.
UPDATE 
	ClientPolicy
SET
	`number` = right(CAST(rand() AS CHAR), 12);
	

-- Номера домов и корпусов всех пациентов меняются на 777 и 999 соотв.
UPDATE 
	AddressHouse
SET
	`number` = 777,
	`corpus` = 999;
	
-- Номера квартир всех пациентов меняются на 666.
UPDATE `Address` 
SET 
    flat = 666;
    
   
   -- Работа всех пациентов меняются на введенную вручную "неизвестно".
UPDATE ClientWork 
SET 
    freeInput = 'неизвестно',
    org_id = NULL,
    post = 'неизвестно';
    
   
   -- Ф.И.О всех врачей (персонала) меняются на #Врачевой Врач Врачевич, 
-- где на месте "#" будет стоять первая буква реальной фамилии врача.
UPDATE `Person` 
SET 
    lastName = CONCAT(LEFT(lastName, 1), 'Врачевой'),
    firstName = 'Врач',
    patrName = 'Врачевич';
    
   
   
   select * from Person p ;