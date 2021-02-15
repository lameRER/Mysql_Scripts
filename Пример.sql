





-- Пример добавления Event

INSERT INTO Event ( createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, externalId,eventType_id, org_id, client_id, contract_id, prevEventDate, setDate, setPerson_id, execDate, execPerson_id, isPrimary, order, result_id, nextEventDate, payStatus, typeAsset_id, note, curator_id, assistant_id, pregnancyWeek, MES_id, HTG_id, KSG_id, mesSpecification_id, relegateOrg_id, totalCost, patientModel_id, cureType_id, cureMethod_id, prevEvent_id, littleStranger_id, referral_id, armyReferral_id, goal_id, outgoingOrg_id, outgoingRefNumber, hmpKind_id, hmpMethod_id, eventCostPrinted, exposeConfirmed, ZNOFirst, ZNOMorph, hospParent, clientPolicy_id, cycleDay, locked, isClosed, dispByMobileTeam, duration, orgStructure_id, vista_system, isStage, isCrime, signedDocuments, signDateTime, journalNum, fixate, KSGCriterion, transfId) VALUES
( '2020-07-22 12:40:36', 970, '2020-07-29 15:16:18', 985, 0, '27907', 94, 5268, 730748, 3, NULL, '2020-07-22 12:39:47', 522, NULL, 522, 2, 2, 218, NULL, 0, NULL, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, 67, 454, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 7, 120, NULL, 0, 0, 0, NULL, NULL, 0, NULL, NULL);



-- Пример добавления Action(Поступление)

INSERT INTO Action (id, parent_id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, 
actionType_id, -- Тип события {ActionType}
specifiedName, 
event_id, -- Событие, к которому относится действие {Event}
idx, directionDate, status, setPerson_id, isUrgent, begDate, plannedEndDate, endDate, note, person_id, office, amount, uet, payStatus, account, MKB, morphologyMKB, finance_id, contract_id, prescription_id, takenTissueJournal_id, org_id, coordDate, coordAgent, coordInspector, coordText, assistant_id, preliminaryResult, duration, periodicity, aliquoticity, signature, assistant2_id, assistant3_id, MES_id, hmpKind_id, hmpMethod_id, counterValue, customSum, isVerified, importDate) VALUES
(2522827, 0, '2014-03-31 00:00:00', NULL, '2014-03-31 00:00:00', NULL, 0, 15084, '', 2522827, 0, '2014-01-10 00:00:00', 2, 509, 0, '2014-01-10 10:00:00', '0000-00-00 00:00:00', '2014-01-10 12:00:00', '', 509, '', 1, 0, 0, 0, '', '', 2, 1, NULL, NULL, NULL, NULL, '', '', '', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);



-- Пример создания свойст действия


INSERT INTO ActionProperty (id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, 
action_id, -- Действие к которому относится это свойство {Action}
type_id, -- Тип свойства {ActionPropertyType}
unit_id, norm, isAssigned, evaluation, isAutoFillCancelled) VALUES
(223062566, '2020-07-22 12:40:37', 970, '2020-07-22 12:40:37', 970, 0, 98217445, 38921, NULL, '', 0, NULL, 1),
(223062567, '2020-07-22 12:40:37', 970, '2020-07-22 12:40:37', 970, 0, 98217445, 35466, NULL, '', 0, NULL, 0),
(223062568, '2020-07-22 12:40:37', 970, '2020-07-22 12:40:37', 970, 0, 98217445, 37268, NULL, '', 0, NULL, 1),
(223062569, '2020-07-22 12:40:37', 970, '2020-07-22 12:40:37', 970, 0, 98217445, 35464, NULL, '', 0, NULL, 1),
(223062570, '2020-07-22 12:40:37', 970, '2020-07-22 12:40:37', 970, 0, 98217445, 35418, NULL, '', 0, NULL, 1),
(223062571, '2020-07-22 12:40:37', 970, '2020-07-22 12:40:37', 970, 0, 98217445, 35422, NULL, '', 0, NULL, 1),
(223062572, '2020-07-22 12:40:37', 970, '2020-07-22 12:40:37', 970, 0, 98217445, 35429, NULL, '', 0, NULL, 1),
(223062641, '2020-07-22 12:41:06', 970, '2020-07-22 12:41:06', 970, 0, 98217445, 35471, NULL, '', 0, NULL, 1),
(223063006, '2020-07-22 12:41:06', 970, '2020-07-22 12:41:06', 970, 0, 98217445, 39729, NULL, '', 0, NULL, 0),
(223237748, '2020-07-28 14:59:18', 936, '2020-07-28 14:59:18', 936, 0, 98217445, 35423, NULL, '', 0, NULL, 0),
(223237751, '2020-07-28 14:59:25', 936, '2020-07-28 14:59:25', 936, 0, 98217445, 35419, NULL, '', 0, NULL, 0),
(223237755, '2020-07-28 14:59:40', 936, '2020-07-28 14:59:40', 936, 0, 98217445, 35421, NULL, '', 0, NULL, 0),
(223237757, '2020-07-28 14:59:54', 936, '2020-07-28 14:59:54', 936, 0, 98217445, 38923, NULL, '', 0, NULL, 0),
(223237759, '2020-07-28 15:00:05', 936, '2020-07-28 15:00:05', 936, 0, 98217445, 35426, NULL, '', 0, NULL, 0),
(223313945, '2020-07-28 14:59:18', 936, '2020-07-28 14:59:18', 936, 0, 98217445, 38920, NULL, '', 0, NULL, 0),
(223313946, '2020-07-22 12:40:37', 970, '2020-07-22 12:40:37', 970, 0, 98217445, 38922, NULL, '', 0, NULL, 0);


-- Пример добавления значения свойст действия(с типом поля String)


INSERT INTO ActionProperty_String (
id, -- {ActionProperty}
INDEX, value) VALUES
(223062570,	0,	'Самостоятельно'),
(223062641,	0,	'112'),
(223237748,	0,	'2 часа'),
(223237751,	0,	'112'),
(223237755,	0,	'орви'),




-- Пример добавления значения свойст действия(с типом поля Integer)

INSERT INTO ActionProperty_Integer (
ID, '{ActionProperty}'
INDEX, value) VALUES
(188534591, 0, 2),
(198345565, 0, 60),
(198345575, 0, 60),
(198345585, 0, 60),
(198345595, 0, 60),
(198345605, 0, 60),
(198345615, 0, 60),
(198345625, 0, 60);




-- пример добавления диагнозов



INSERT INTO Diagnostic (id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, event_id, 
diagnosis_id, -- Диагноз {Diagnosis}
TNMS, diagnosisType_id -- Тип диагноза {rbDiagnosisType}
, character_id, stage_id, phase_id, dispanser_id, sanatorium, hospital, traumaType_id, speciality_id, person_id, healthGroup_id, result_id, setDate, endDate, notes, assistant_id, medicalGroup_id, status, org_id, ecog_id, carnotianIndex_id, epid_number, epid_date) VALUES
(2522827, '2014-03-31 00:00:00', NULL, '2014-03-31 00:00:00', NULL, 0, 2522827, 2522827, '', 1, 3, NULL, NULL, NULL, 0, 0, NULL, 61, 509, NULL, 35, '2014-01-10 00:00:00', '2014-01-10 00:00:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2522828, '2014-03-31 00:00:00', NULL, '2014-03-31 00:00:00', NULL, 0, 2522828, 2522828, '', 1, 3, NULL, NULL, NULL, 0, 0, NULL, 61, 509, NULL, 35, '2014-01-09 00:00:00', '2014-01-09 00:00:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2522839, '2014-03-31 00:00:00', NULL, '2014-03-31 00:00:00', NULL, 0, 2522839, 2522839, '', 1, 3, NULL, NULL, NULL, 0, 0, NULL, 2, 210, NULL, 35, '2014-01-20 00:00:00', '2014-01-20 00:00:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);




INSERT INTO Diagnosis (id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, 
client_id, -- Пациент {Client}
diagnosisType_id, -- Тип диагноза {rbDiagnosisType}
character_id, -- Характер заболевания {rbDiseaseCharacter}
MKB, -- Код по МКБ X (с пятым знаком)
MKBEx, -- Вторая секция кода по МКБ X (с пятым знаком)
morphologyMKB, TNMS, dispanser_id, traumaType_id, setDate, endDate, mod_id, person_id) VALUES
(8, '2013-12-04 16:05:00', 200, '2013-12-04 17:21:29', 200, 0, 240490, 2, 3, 'R46.1', '', '', '', NULL, NULL, NULL, '2013-12-04', NULL, 441),
(458686, '2013-12-02 00:00:00', NULL, '2013-12-02 00:00:00', NULL, 0, 262736, 1, NULL, 'N18.0', '', '', '', NULL, NULL, '2003-02-08', '2003-02-15', NULL, 284),
(458687, '2013-12-02 00:00:00', NULL, '2013-12-02 00:00:00', NULL, 0, 272603, 1, NULL, 'N18.0', '', '', '', NULL, NULL, '2003-02-24', '2003-02-28', NULL, 284);
