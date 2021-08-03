select r.*
from ActionType at
join ActionType_Service ats on ats.master_id = at.id
join rbService r on r.id = ats.service_id
left join PriceListItem pli on pli.service_id = r.id and pli.deleted = 0 and pli.endDate >= curdate()
where at.name regexp 'Исследование фиксированных антитромбоцитарных антител методом проточной цитофлуориметрии';



select *
from
(SELECT @a := @a + 1 AS id, UNITED.* FROM (
    SELECT 
    pli.id as price_list_item_id, 
    pli.service_id as service_id, 
    pli.serviceCodeOW as service_code, 
    pli.serviceNameOW as service_name, 
    at.id as action_type_id, 
    at.code as at_code, 
    at.name as at_name, 
    pl.id as pricelist_id, 
    pli.price, 
    pli.isAccumulativePrice as is_accumulative_price, 
    s.isComplex as is_complex_service, 
    at.isRequiredTissue as is_at_lab, 
    GROUP_CONCAT(DISTINCT mr.id SEPARATOR ',') as material_resource_ids 
    FROM ActionType at 
    INNER JOIN ActionType_Service ats ON ats.master_id=at.id AND (CURDATE() BETWEEN ats.begDate AND COALESCE(ats.endDate, CURDATE())) 
    LEFT JOIN ActionType_MaterialResource atmr on atmr.actionType_id  = at.id 
    LEFT JOIN rbMaterialResource mr on mr.id = atmr.rbMaterialResource_id 
    INNER JOIN EventType_Action e ON e.actionType_id=at.id 
    INNER JOIN PriceListItem pli ON pli.service_id=ats.service_id 
    INNER JOIN PriceList pl ON pli.priceList_id=pl.id 
    INNER JOIN rbService s ON s.id=ats.service_id 
    WHERE 
    at.deleted=0 AND pli.deleted=0 AND pl.deleted=0 AND 
    (CURDATE() BETWEEN pli.begDate AND pli.endDate) 
    GROUP BY at.id, at.code, pl.id
    UNION
    SELECT 
    pli.id as price_list_item_id, 
    pli.service_id as service_id, 
    pli.serviceCodeOW as service_code, 
    pli.serviceNameOW as service_name, 
    NULL as action_type_id, 
    NULL as at_code, 
    NULL as at_name, 
    pl.id as pricelist_id, 
    pli.price, 
    pli.isAccumulativePrice as is_accumulative_price, 
    s.isComplex as is_complex_service, 
    NULL as is_at_lab, 
    NULL as material_resource_ids 
    FROM PriceListItem pli 
    INNER JOIN PriceList pl ON pli.priceList_id=pl.id 
    INNER JOIN rbService s ON pli.service_id=s.id 
    LEFT JOIN ( 
    SELECT at.id, ats.service_id 
    FROM ActionType at 
    INNER JOIN ActionType_Service ats ON ats.master_id=at.id AND (CURDATE() BETWEEN ats.begDate AND COALESCE(ats.endDate, CURDATE())) 
    INNER JOIN EventType_Action e ON e.actionType_id=at.id 
    WHERE at.deleted=0 
    GROUP BY at.id, ats.service_id 
    ) at_with_services ON pli.service_id=at_with_services.service_id 
    WHERE 
    pli.deleted=0 AND pl.deleted=0 AND (CURDATE() BETWEEN pli.begDate AND pli.endDate) AND 
    at_with_services.id IS NULL AND s.isComplex = 1
) AS UNITED) as tmp
where tmp.service_id in (13920)

select at.*
from ActionType at
left join ActionType_Service ats on ats.master_id = at.id
left join rbService r on r.id = ats.service_id
left join PriceListItem pli on pli.service_id = r.id and pli.deleted = 0 and pli.endDate >= curdate()
where pli.serviceNameOW regexp 'гликопротеин IgG';