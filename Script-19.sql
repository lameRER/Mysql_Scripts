select * from ActionType at2 where name REGEXP '^Оперблок';


select * from s12.rbPrintTemplate rpt where context = 'oper_epicriz';

select * from s12.ActionType at2 where context = 'oper_epicriz';


select * from rbPrintTemplate rpt order by id desc;


select a.* from Event e 
join Action a on a.event_id = e.id and a.deleted = 0
where e.externalId = '38848'
order by a.createDatetime desc



UPDATE ActionPropertyType 
set valueDomain = '"Полостная", "Лапароскопическая", "БИОС", "Металостеосинтез", "Эндопротезирование", "PFN"'
WHERE id in(
select apt.id from ActionPropertyType apt where apt.name REGEXP 'тип операции' and apt.deleted = 0 and typeName = 'String' and apt.valueDomain = '"1 - плановая", "2 - экстренная"'
)



select apt.*from ActionPropertyType apt where apt.name REGEXP 'тип операции' and apt.deleted = 0 and typeName = 'String'




INSERT INTO s12.rbPrintTemplate
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, context, fileName, `default`, dpdAgreement, `type`, hideParam, banUnkeptDate, counter_id, deleted, isPatientAgreed, groupName, documentType_id, isEditableInWeb, pageOrientation)
VALUES(3344, '2021-01-27 14:19:36', NULL, '2021-01-27 14:19:36', NULL, '9', 'Оперблок: Предоперационный эпикриз', 'oper_epicriz', '', '<html>

<head>
	{setPageSize(''A4'')}
	{setOrientation(''P'')}
	{: setLeftMargin(15)}
	{: setTopMargin(10)}
	{: setBottomMargin(10)}
	{: setRightMargin(10)}
</head>

<body>
	{if: action.person.shortName == ''''}
	<div class="check">
		<table width="100%" border="0">
			<tr>
				<td align="center">
					<h1><b>Документ не может быть распечатан.</b></h1>
				</td>
			</tr>
			<tr>
				<td align="center">
					<h1><b>Документ не подписан.</b></h1>
				</td>
			</tr>
			<tr>
				<td align="center">
					<table border="0">
						<tr>
							<td align="center" style="vertical-align: top;">
								<h1><b>Нажмите </b></h1>
							</td>
							<td align="center" style="vertical-align: top;">
								<img
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAhCAYAAABX5MJvAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAR9SURBVFhHvVjbTxxVGP+duezO7JWFvZBKSA2BAqUaTTWpxr4Y4z/gKzya+OQbj/wDBIhPJjyQGImpqYloeDTxHpNGo6kNLYY04kMtUKAt7G12d8bvOzuzTGF2wC3wI98O5+yZ8/3OdzsfCMdxwFhcXHRKpRKEEHJ8VmB9LLFYDOPj41KZJPHRx/NOJJGEomq8jOfPGAJ2ow5rfw8ffvC+EAsLC05FN6FFDXfB+aFerUDsP4aYnJx0jPwFqFrE/er80KhbqG79CzE/P+/Y8TQU/fxJ2DUL1vbGyUlwwPYV8nh19BLSyYQ7exSPnzzFrdt38GDzEYSqhgY6k6jtbEJxx8ei0NON118aRZ6e0UikrRRyWbw2NoquuEnmrslMOA4nIpFKxHH96ivoTqfdmXD0ksXeeesNGKpCROrubHuIqakpR8/kodApgqCRSa+OjWBscMCdoaimjauWxUnvzhDI7GwJTeM0b+LWb7/j1zsr0AyT0l91Zw9g0x7V7YcQ09PTjpLuaRsTcdPAe+++jYiuy/HTvT189/0P+PPuqhwLOi1z0TUVl4eHcf3Na0gmEtINRSp+n3x+E0I3oEejkqgfXmASQRWKorQX+t6gDbzxvdVV3F65h2g8jlQ2h3Q2j65cHvFMD/5+uIn76//IdQx+z67VYdsNCG+/IOHolT/8DBK53QE4+iOmiVgyDTOZgkmV1pNoPIGyVXNX0kltGw4RcGxH7nN07+bzxNnhgS2nUnlXyT18Cj/kqWTpdwmQS5pRE54hgST4Fe81XWvGgof+vj769K94Fr25ngMCJLobS2E0xNzcnCOS3YHZce3KKC70FpBJp9yZZmCWyhVpEbKlO3sAk+LAiEZQq9XQaDSwsbWF1bX7WN94BJV0+K3H2WHtUGC640Bc7O97hgAjlUyiN59DjopWrjtzREwjKpWzcCp3pVK4PDSI4t4TWbyCEEpCD8jtMHiKWfxE2C1VStd2hSuUxHHY2d3FX2tr2NnZbSn1S4sMZQjHSbvA6JiERf789LMbuPHFl7j51dcol8stxZ5yVuwRCgvmjklw2eZCFqP7xEx1oVK1pHK/Yo+ILUm0R8ckYlSwhoeGEIkYGLjYLzPCr/gwkTB0RMLbPB4z4TRqMHSt5QK/OzwC/AzD/ybhKeKnRSWa6wHHh3/ek5ZFTtMSfkWsfHDgRbw8OoIXCoXW/GEiLKfmDk+BJzyOUnW8MnKJrvmmO4IIsDxXYO6XyrLQ8OZ8chZPmSeHgzBInssS3/z8C7apIBWLRVdKslHxxiUiyX+17cvfS7JW+KVSqVDqVvHtjz/Jjot7iiCEXmA2nbRcpAuLLq06WSH8LmwPjW7iGPUeBvUcqq/98y4wMTs76ygpau+CekxyhTQpEWiatDMSikI9CF3ph2/eVo85MzPjqN3U6LrNyHmCLV3degBFdscNR7JVBPd75ySkD9T2sXXE8vKy88fKXUSTGXkXsAvOHOQSTtvq3i76qWmS/xpYWlpy1tfXUaVIbq452jGdFvxtXzabxcTEhPgPn//iC+G7+moAAAAASUVORK5CYII=">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	{else:}
	<div class="DOC">
		<div class="Title">
			<table width="100%" border="0">
				<tr>
					<td width="150"></td>
					<td align="center">
						<h2>{action.title}</h2>
					</td>
					<td width="150"></td>
				</tr>
			</table>
		</div>
		<br>
		<div class="Client">
			<table width="100%" border="0">
				<tr>
					<td>
						<b>ФИО:</b> {client.fullName}, {client.birthDate}({client.age})
						<br><b>Номер и/б:</b> {event.externalId}
						<br><b>Дата выполнения:</b> {action.endDate}
					</td>
				</tr>
			</table>
		</div>
		<div class="ActionProperty">
			{for: prop in action}
				{if: prop.name == u''Клинический диагноз'' and prop.value}<br><b>{prop.name}:</b> {prop.value}{end:}
				{if: prop.name == u''Основное заболевание'' and prop.value}<br><b>{prop.name}:</b> {prop.value}{end:}
				{if: prop.name == u''Сопутствующее заболевание'' and prop.value}<br><b>{prop.name}:</b> {prop.value}{end:}
				{if: prop.name == u''Обоснование диагноза'' and prop.value}<br><b>{prop.name}:</b> {prop.value}{end:}
				{if: prop.name == u''Морфологическая верификация'' and prop.value}<br><b>{prop.name}:</b> {prop.value}{end:}
				{if: prop.name == u''Показания к операции'' and prop.value}<br><b>{prop.name}:</b> {prop.value}{end:}
				{if: prop.name == u''План операции'' and prop.value}<br><b>{prop.name}:</b> {prop.value}{end:}
				{if: prop.name == u''Периоперационная антибиотикопрофилактика'' and prop.value}<br><b>{prop.name}:</b> {prop.value}{end:}
				{if: prop.name == u''Заключение терапевта'' and prop.value}<br><b>{prop.name}:</b> {prop.value}{end:}
				{if: prop.name == u''Заключение анестезиолога'' and prop.value}<br><b>{prop.name}:</b> {prop.value}{end:}
				{if: prop.name == u''Гемотрансфузия'' and prop.value}<br><b>{prop.name}:</b> {prop.value}{end:}
				{if: prop.name == u''Положение  на  столе'' and prop.value}<br><b>{prop.name}:</b> {prop.value}{end:}
				{if: prop.name == u''Переливание крови ранее'' and prop.value}<br><b>{prop.name}:</b> {prop.value}{end:}
				{if: prop.name == u''Трансфузионный анамнез'' and prop.value}<br><b>{prop.name}:</b> {prop.value}{end:}
				{if: prop.name == u''Индивидуальный подбор крови'' and prop.value}<br><b>{prop.name}:</b> {prop.value}{end:}
				{if: prop.name == u''Планируемый объем кровопотери в ходе операции до'' and prop.value}<br><b>{prop.name}:</b> {prop.value}{end:}
				{if: prop.name == u''Для восполнения возможной кровопотери заказано'' and prop.value}<br><b>{prop.name}:</b> {prop.value}{end:}
				{if: prop.name == u''группа крови'' and prop.value}<br><b>{prop.name}:</b> {prop.value}{end:}
				{if: prop.name == u''резус-фактор'' and prop.value}<br><b>{prop.name}:</b> {prop.value}{end:}
			{end:}
		</div>
	</div>
	<br>
	<div class="signature">
		<table width="100%" border="0">
			<tr>
				<td><b>Врач {action.person.speciality}:</b> </td>
				<td align="right">{action.person.shortName}</td>
			</tr>
		</table>
	</div>
	{end:}
</body>

</html>
', 0, 0, 0, 2, NULL, 0, 0, '', NULL, 0, 'P');
