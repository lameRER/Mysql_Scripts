select * from rbPrintTemplate rpt where rpt.name REGEXP '^����';


select * from ActionType at2 where context = '145-124-10';


select * from DestinationTree_ActionType dtat where actionType_id = 24912;

select * from DestinationTree dt where dt.id = 9748;



select * from rbPrintTemplate rpt where name REGEXP '�������� ';



select * from rbPrintTemplate rpt where rpt.`default` REGEXP '�����' order by id desc;




select * from DestinationTree dt where dt.name REGEXP '������' and dt.deleted = 0;

select * from DestinationTree_ActionType dtat where EXISTS (select * from DestinationTree dt where dt.name REGEXP '������' /*and dt.deleted = 0*/ and dt.id = dtat.master_id)

select * from ActionType at2 where at2.deleted = 0 and at2.serviceType = 4 and class = 2;



select * from rbEpicrisisProperty rep where rep.name REGEXP '������';



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
</head>
{setPageSize('A4')} {setOrientation('Portrait')} {setMargins(5)}

<body>
<table width="100%" border="1" cellpadding="0" cellspacing="0">
<tr>
    <th>� ���������</th>
    <th>���� �����������</th>
    <th>��. ������������</th>
    <th>������������ <br> �����.����.</th>
    <th>���� ���������</th>
    <th>���� ��������</th>
    <th>� ��������</th>
    <th>� ���������</th>
    <th>�����</th>
    <th>��. �����</th>
    <th>�����</th>
    <th>�������</th>
    <th>���-�� ������</th>
</tr>

{for: idx, pos in enumerate(positions)}
<tr>
    <th>{shippingDocs[idx].externalNumber}</th>
    <th>{shippingDocs[idx].shippingDocDate.toString('dd.MM.yyyy')}</th>
    <th>{shippingDocs[idx].supplier.shortName}</th>
    <th>{pos.catalog_item.name}</th>
    <th>{pos.arrivalDate.toString('dd.MM.yyyy')}</th>
    <th>{pos.expiryDate.toString('dd.MM.yyyy')}</th>
    
    <th>{pos.serial}</th>
    <th>{pos.blood_supply_number}</th>
    <th>{pos.donor}</th>
    
    <th>{pos.bloodType.name}</th>
    <th>{pos.bloodrh.name}</th>
    <th>{pos.bloodFenotip.name}</th>
    <th>{pos.amount_litres}</th>
    
</tr>
{end:}
</table>
</body>

</html>
