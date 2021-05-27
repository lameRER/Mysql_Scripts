SELECT a0.master_id as OrgStructure,
                    a1.id as actionType_id,
                    a1.name,
                    a2.master_id,
                    a3.date,
                    a3.id as job,
                    a3.orgStructure_id AS orgStructureId,
			        (SELECT count(*) FROM Job_Ticket as a4 WHERE a4.master_id=a3.id AND a4.resTimestamp is NULL AND a4.status=0) as jobTickets,
					(SELECT min(datetime) FROM Job_Ticket as a4 WHERE a4.master_id=a3.id AND a4.resTimestamp is NULL AND a4.status=0 AND datetime>'2021-05-29 00:00:00') as jobTicket,
			 		a5.id as jobTicket_id
                FROM OrgStructure_ActionType as a0
                    INNER JOIN ActionType as a1 ON (a1.id=a0.actionType_id)
                    INNER JOIN rbJobType_ActionType as a2 ON (a1.id=a2.actionType_id)
                    INNER JOIN Job as a3 ON (a3.JobType_id=a2.master_id)
                    INNER JOIN Job_Ticket as a5 ON (a5.master_id=a3.id)
                WHERE a0.master_id IN (139)                    
                    AND a5.resTimestamp is NULL AND a5.status = 0 AND a5.datetime > '2021-05-29 00:00:00'
                    AND a3.date >= '2021-05-27' ORDER BY a5.datetime  
