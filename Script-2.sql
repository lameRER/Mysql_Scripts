select rpmi.createDatetime, rpmi.createPerson_id, rpmi.modifyDatetime, rpmi.modifyPerson_id, rpmi.cureType_id, rpmi.cureMethod_id, rpmi.master_id+2 `master_id` from rbPatientModel rpm
join rbPatientModel_Item rpmi on rpmi.master_id = rpm.id 
where rpm.isObsolete = 0;



ALTER TABLE pes.rbPatientModel 
AUTO_INCREMENT=3391;


INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3391, '2020-02-18 16:27:01', 3992, '2020-03-02 12:47:45', 3992, '97_1', 'Локализованные формы злокачественных новообразований прямой кишки', 'C20', NULL, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3392, '2020-12-30 11:20:46', NULL, '2021-01-11 12:20:27', 3992, '379', 'злокачественные новообразования лимфоидной ткани', 'C81, C82, C83, C84, C85', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3393, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '306', 'злокачественные новообразования мочевого пузыря I - IV стадия (T1-T2bNxMo)', 'C67', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3394, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '307', 'злокачественные новообразования мочевого пузыря I - IV стадия (T1-T2bNxMo) при массивном кровотечении', 'C67', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3395, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '356', 'злокачественные новообразования надпочечника I - III стадия (T1a-T3aNxMo)', 'C74', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3396, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '253', 'злокачественные новообразования общего желчного протока', 'C22, C78.7, C24.0', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3397, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '273', 'злокачественные новообразования общего желчного протока в пределах слизистого слоя T1', 'C22, C78.7, C24.0', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3398, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '303', 'злокачественные новообразования полового члена', 'C60', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3399, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '351', 'злокачественные новообразования полового члена (I - IV стадия)', 'C60', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3400, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '209', 'злокачественные новообразования полости носа, глотки, гортани у функционально неоперабельных больных', 'C09, C10, C11, C12, C13, C14, C15, C30, C32', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3401, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '354', 'злокачественные новообразования почки (I - II стадия)', 'C64', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3402, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '304', 'злокачественные новообразования почки (I - III стадия), нефробластома', 'C64', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3403, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '353', 'злокачественные новообразования почки (III - IV стадия)', 'C64', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3404, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '346', 'злокачественные новообразования яичников (I - IV стадия). Рецидивы злокачественных новообразований яичников', 'C56', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3405, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '292', 'злокачественные новообразования яичников I стадии', 'C56', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3406, '2020-12-30 11:20:46', NULL, '2021-01-12 11:39:37', 3992, '377', 'злокачественные новообразования яичников. Локальный рецидив, поражение лимфатических узлов после неоднократных курсов полихимиотерапии и невозможности выполнить хирургическое вмешательство', 'C56', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3407, '2020-12-30 11:20:46', NULL, '2021-01-12 14:17:29', 3992, '376', 'интраэпителиальные, микроинвазивные и инвазивные злокачественные новообразования вульвы, влагалища, шейки и тела матки (T0-4N0-1M0-1), в том числе с метастазированием в параортальные или паховые лимфоузлы', 'C51, C52, C53, C54, C55', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3408, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '295', 'локализованные злокачественные новообразования предстательной железы (I - II стадия (T1-2cN0M0), местный рецидив после хирургического или лучевого лечения', 'C61', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3409, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '352', 'локализованные злокачественные новообразования предстательной железы (I - II стадия), T1-2cN0M0', 'C61', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3410, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '297', 'локализованные и местнораспространенные злокачественные новообразования предстательной железы (II - III стадия)', 'C61', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3411, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '275', 'локализованные и местнораспространенные формы злокачественных новообразований желчного пузыря', 'C23', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3412, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '333', 'локализованные опухоли среднеампулярного и нижнеампулярного отдела прямой кишки', 'C20', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3413, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '294', 'местнораспространенные злокачественные новообразования предстательной железы III стадии (T3a-T4NxMo)', 'C61', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3414, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '357', 'местнораспространенные опухоли органов средостения', 'C38, C39', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3415, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '313', 'метастатические опухоли костей. Первичные опухоли костей IV стадии. Первичные опухоли мягких тканей IV стадии. Метастатические опухоли мягких тканей', 'C79.5, C40.0, C40.1, C40.2, C40.3, C40.8, C40.9, C41.2, C41.3, C41.4, C41.8, C41.9, C49, C50, C79.8', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3416, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '309', 'метастатическое поражение плевры', 'C78.1, C38.4, C38.8, C45.0, C78.2', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3417, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '242', 'нерезектабельные злокачественные новообразования печени и внутрипеченочных желчных протоков', 'C22, C78.7, C24.0', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3418, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '334', 'опухоли легкого (I - III стадия)', 'C34', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3419, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '290', 'опухоли мягких тканей грудной стенки', 'C49.3', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3420, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '337', 'опухоль вилочковой железы III стадии. Опухоль переднего, заднего средостения местнораспространенной формы, метастатическое поражение средостения', 'C37, C08.1, C38.2, C38.3, C78.1', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3421, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '232', 'пациенты со злокачественными новообразованиями пищевода и желудка, подвергшиеся хирургическому лечению с различными пострезекционными состояниями (синдром приводящей петли, синдром отводящей петли, демпинг-синдром, рубцовые деформации анастомозов)', 'C15, C16, C18, C17, C19, C21, C20', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3422, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '338', 'первичные злокачественные новообразования костей и суставных хрящей туловища и конечностей Ia-b, IIa-b, IVa-b стадии. Метастатические новообразования костей, суставных хрящей туловища и конечностей', 'C40.0, C40.1, C40.2, C40.3, C40.8, C40.9, C41.2, C41.3, C41.4, C41.8, C41.9, C79.5, C43.5', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3423, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '342', 'первичные злокачественные новообразования мягких тканей туловища и конечностей, злокачественные новообразования периферической нервной системы туловища, нижних и верхних конечностей Ia-b, II a-b, III, IV a-b стадии', 'C49.1, C49.2, C49.3, C49.5, C49.6, C47.1, C47.2, C47.3, C47.5, C43.5', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3424, '2020-12-30 11:20:46', NULL, '2021-01-12 14:17:40', 3992, '378', 'Первичные и вторичные злокачественные новообразования оболочек головного мозга, спинного мозга, головного мозга', 'C70, C71, C72, C75.1, C75.3, C79.3, C79.4', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3425, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '311', 'первичные и метастатические злокачественные новообразования кожи', 'C79.2, C43, C44, C50', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3426, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '233', 'первичные и метастатические злокачественные новообразования печени', 'C22, C78.7, C24.0', 88, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3427, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '324', 'состояние после обструктивных резекций по поводу опухолей толстой кишки. Опухоли ободочной, сигмовидной, прямой кишки и ректосигмоидного соединения с перитонеальной диссеминацией, включая псевдомиксому брюшины', 'C18, C19, C20, C08, C48.1', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3428, '2020-12-30 11:20:46', NULL, '2020-12-30 11:20:46', NULL, '221', 'стенозирующие злокачественные новообразования пищевода, желудка, двенадцатиперстной кишки, ободочной кишки, ректосигмоидного соединения, прямой кишки, заднего прохода и анального канала', 'C15, C16, C18, C17, C19, C21, C20', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3455, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '710', 'злокачественные новообразования головы и шеи I - III стадии', 'C00, C01, C02, C04 - C06, C09.0, C09.1, C09.8, C09.9, C10.0, C10.1, C10.2, C10.3, C10.4, C11.0, C11.1, C11.2, C11.3, C11.8, C11.9, C12, C13.0, C13.1, C13.2, C13.8, C13.9, C14.0, C14.2, C15.0, C30.0, C31.0, C31.1, C31.2, C31.3, C31.8, C31.9, C32, C43, C44, C69, C73', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3456, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '748', 'злокачественные новообразования желчных протоков', 'C22, C78.7, C24.0', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3457, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '768', 'злокачественные новообразования мочевого пузыря (I стадия (T1NxMo)', 'C67', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3458, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '764', 'злокачественные новообразования мочеточника, почечной лоханки (I - II стадия (T1a-T2NxMo)', 'C66, C65', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3459, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '746', 'злокачественные новообразования общего желчного протока', 'C22, C78.7, C24.0', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3460, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '747', 'злокачественные новообразования общего желчного протока в пределах слизистого слоя T1', 'C22, C78.7, C24.0', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3461, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '721', 'злокачественные новообразования пищевода, желудка, двенадцатиперстной кишки, ободочной кишки, ректосигмоидного соединения, прямой кишки, заднего прохода и анального канала в пределах слизистого слоя T1', 'C15, C16, C17, C18, C19, C20, C21', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3462, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '762', 'злокачественные новообразования почки (I - III стадия), нефробластома', 'C64', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3463, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '756', 'злокачественные новообразования шейки матки (I - III стадия). Местнораспространенные формы рака шейки матки, осложненные кровотечением', 'C53', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3464, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '758', 'злокачественные новообразования эндометрия iNsitu - III стадия', 'C54', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3465, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '760', 'злокачественные новообразования яичников I стадии', 'C56', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3466, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '763', 'локализованные злокачественные новообразования почки (I - IV стадия), нефробластома, в том числе двусторонняя (T1a-T2NxMo-M1)', 'C64', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3467, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '761', 'локализованные злокачественные новообразования предстательной железы I стадии (T1a-T2cNxMo)', 'C61', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3468, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '765', 'локализованные злокачественные новообразования, саркома мочевого пузыря (I - II стадия (T1-T2bNxMo)', 'C67', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3469, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '724', 'локализованные и местнораспространенные формы злокачественных новообразований пищевода', 'C15', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3470, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '730', 'локализованные формы злокачественных новообразований левой половины ободочной кишки', 'C18.5, C18.6', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3471, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '728', 'локализованные формы злокачественных новообразований правой половины ободочной кишки. Карциноидные опухоли червеобразного отростка', 'C18.1, C18.2, C18.3, C18.4', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3472, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '732', 'локализованные формы злокачественных новообразований сигмовидной кишки и ректосигмоидного отдела', 'C18.7, C19', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3473, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '725', 'начальные и локализованные формы злокачественных новообразований желудка', 'C16', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3474, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '755', 'неорганные злокачественные новообразования забрюшинного пространства (первичные и рецидивные)', 'C48.0', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3475, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '742', 'нерезектабельные злокачественные новообразования печени и внутрипеченочных желчных протоков', 'C22, C78.7, C24.0', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3476, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '769', 'опухоль плевры. Распространенное поражение плевры. Мезотелиома плевры', 'C38.4, C38.8, C45.0', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3477, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '741', 'первичные и метастатические злокачественные новообразования печени', 'C22, C78.7, C24.0', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3478, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '735', 'ранние формы злокачественных новообразований прямой кишки; локализованные формы злокачественных новообразований прямой кишки', 'C20, C21', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3479, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '750', 'стенозирующие злокачественные новообразования трахеи. Стенозирующий центральный рак легкого (T2-4NxMx)', 'C33, C34', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3480, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '828', 'злокачественные новообразования влагалища (II - III стадия)', 'C52', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3481, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '836', 'злокачественные новообразования единственной почки с инвазией в лоханку почки', 'C64', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3482, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '841', 'злокачественные новообразования надпочечника (I - III стадия (T1a-T3aNxMo)', 'C74', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3483, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '831', 'злокачественные новообразования полового члена (I - IV стадия)', 'C60', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3484, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '839', 'злокачественные новообразования почки (I - III стадия (T1a-T3aNxMo)', 'C64', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3485, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '837', 'злокачественные новообразования почки (III - IV стадия)', 'C64', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3488, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '832', 'злокачественные новообразования предстательной железы II стадии (T1c-2bN0M0), уровень ПСА менее 10 нг/мл, сумма баллов по Глисону менее 7', 'C61', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3489, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '830', 'злокачественные новообразования яичников (I - IV стадия). Рецидивы злокачественных новообразований яичников', 'C56', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3491, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '771', 'локализованные опухоли средне- и нижнеампулярного отдела прямой кишки', 'C20', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3492, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '814', 'местнораспространенные формы первичных и метастатических злокачественных опухолей длинных трубчатых костей', 'C40.0, C40.1, C40.2, C40.3, C40.8, C40.9, C41.2, C41.3, C41.4, C41.8, C41.9, C79.5, C43.5', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3493, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '818', 'местнораспространенные формы первичных и метастатических меланом кожи конечностей', 'C43, C43.5, C43.6, C43.7, C43.8, C43.9, C44, C44.5, C44.6, C44.7, C44.8, C44.9', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3494, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '824', 'местнораспространенные формы первичных и метастатических сарком мягких тканей конечностей', 'C49.1, C49.2, C49.3, C49.5, C49.6, C47.1, C47.2, C47.3, C47.5, C43.5', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3495, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '790', 'опухоли грудной стенки (мягких тканей, ребер, грудины, ключицы)', 'C39.8, C41.3, C49.3', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3496, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '784', 'опухоли легкого (I - III стадия)', 'C34', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3497, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '789', 'опухоль вилочковой железы III стадии, опухоль переднего, заднего средостения, местнораспространенные формы, метастатическое поражение средостения', 'C37, C08.1, C38.2, C38.3, C78.1', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3498, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '781', 'опухоль трахеи', 'C33', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3499, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '793', 'первичные злокачественные новообразования костей и суставных хрящей туловища и конечностей Ia-b, Iia-b, Iva-b стадии. Метастатические новообразования костей, суставных хрящей туловища и конечностей', 'C40.0, C40.1, C40.2, C40.3, C40.8, C40.9, C41.2, C41.3, C41.4, C41.8, C41.9, C79.5, C43.5', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3500, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '822', 'первичные злокачественные новообразования мягких тканей туловища и конечностей, злокачественные новообразования периферической нервной системы туловища, нижних и верхних конечностей I a-b, II a-b, III, IV a-b стадии', 'C49.1, C49.2, C49.3, C49.5, C49.6, C47.1, C47.2, C47.3, C47.5, C43.5', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3501, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '772', 'резектабельные опухоли поджелудочной железы', 'C25', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3502, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '843', 'злокачественные новообразования головы и шеи (III - IV стадия), рецидив', 'C00, C01, C02, C03, C04, C05, C06, C07, C08, C09, C10, C11, C12, C13, C14, C15.0, C30, C31, C32, C33, C43, C44, C49.0, C69, C73', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3503, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '985', 'злокачественные новообразования почки IV стадии (T3b-3c4, N0-1M1)', 'C64', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3504, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '1066', 'злокачественные новообразования торако-абдоминальной локализации у детей (опухоли средостения, опухоли надпочечника, опухоли печени, яичка, яичников, неорганные забрюшинные опухоли, опухоли почки, мочевыводящей системы и другие). Программное лечение', 'C22, C34, C38, C48.0, C52, C53.9, C56, C61, C62, C64, C67.8, C74', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3505, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '966', 'злокачественные новообразования яичка (I - III стадия (T1-4N1-3M0-1)', 'C62', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3506, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '909', 'злокачественные новообразования яичников (I - IV стадия)', 'C56', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3507, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '844', 'местнораспространенные злокачественные новообразования желудка (T2N2M0, T3N1M0, T4N0M0, T3N2M0, T4N1-3M0-1) после операций в объеме R0', 'C16', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3508, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '850', 'местнораспространенные злокачественные новообразования легкого (T3N1M0, T1-3N2M0, T4N0-2M0, T1-4N3M0)', 'C34', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3509, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '846', 'местнораспространенные колоректальные злокачественные новообразования (T1-2N1M0, T3-4N1M0, T1-4N2M0)', 'C18, C19, C20', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3510, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '1005', 'местнораспространенные уротелиальные злокачественные новообразования (T1-4N1-3M0)', 'C65, C66, C67', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3511, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '986', 'местнораспространенные уротелиальные злокачественные новообразования (T3-4N0M0) при планировании органосохраняющей операции', 'C65, C66, C67', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3512, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '889', 'местнораспространенные формы опухолей брюшной стенки', 'C48', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3513, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '947', 'местнораспространенные, метастатические и рецидивные злокачественные новообразования яичка', 'C62', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3514, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '848', 'метастатические колоректальные злокачественные новообразования, предполагающие использование на одном из этапов лечения хирургического метода', 'C18, C19, C20', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3515, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '1024', 'опухоли головы и шеи у детей (остеосаркома, опухоли семейства саркомы Юинга, саркомы мягких тканей, хондросаркома, злокачественная фиброзная гистиоцитома, ретинобластома)', 'C00, C01, C02, C03, C04, C05, C09, C10, C11, C30, C31, C41.0, C41.1, C49.0, C69.2, C69.4, C69.6', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3516, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '1087', 'опухоли опорно-двигательного аппарата у детей (остеосаркома, опухоли семейства саркомы Юинга, злокачественная фиброзная гистиоцитома, саркомы мягких тканей)', 'C40, C41, C49', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3517, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '1045', 'опухоли центральной нервной системы у детей', 'C71', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3518, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '869', 'первичные злокачественные новообразования костей и суставных хрящей туловища и конечностей IIb - IVa,b стадии. Первичные злокачественные новообразования мягких тканей туловища и конечностей Iia-b, III, IV стадии', 'C40, C41.2, C41.3, C41.4, C41.8, C41.9', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3519, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '908', 'первичные злокачественные новообразования молочной железы (T1N2-3M0; T2-3N1-3M0)', 'C50', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3520, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '928', 'рецидивы злокачественных новообразований яичников', 'C56', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3521, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '1108', 'первичные хронические лейкозы и лимфомы (кроме высокозлокачественных лимфом, хронического миелолейкоза в фазе бластного криза и фазе акселерации)', 'C81 - C90, C91.1 - C91.9, C92.1, C93.1, D45, C95.1', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3522, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '1111', 'злокачественные новообразования головы и шеи, трахеи, бронхов, легкого, плевры, средостения, щитовидной железы, молочной железы, пищевода, желудка, тонкой кишки, ободочной кишки, желчного пузыря, поджелудочной железы, толстой и прямой кишки, анального канала, печени, мочевого пузыря, надпочечников, почки, полового члена, предстательной железы, костей и суставных хрящей, кожи, мягких тканей (T1-4Nлюбая M0), локализованные и местнораспространенные формы', 'C00 - C14, C15 - C17, C18 - C22, C23 - C25, C30, C31, C32, C33, C34, C37, C39, C40, C41, C44, C48, C49, C50, C51, C55, C60, C61, C64, C67, C68, C73, C74, C77,0, C77.1, C77.2, C77.5', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3523, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '1114', 'злокачественные новообразования почки (T1-3N0M0), локализованные и местнораспространенные формы', 'C64', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3524, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '1115', 'злокачественные новообразования щитовидной железы', 'C73', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3525, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '1112', 'интраэпителиальные, микроинвазивные и инвазивные злокачественные новообразования вульвы, влагалища, шейки и тела матки (T0-4N0-1M0-1), в том числе с метастазированием в параортальные или паховые лимфоузлы', 'C51, C52, C53, C54, C55', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3526, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '1119', 'злокачественные новообразования головы и шеи, трахеи, бронхов, легкого, пищевода, желудка, тонкой кишки, желчного пузыря, желчных путей, поджелудочной железы, толстой и прямой кишки, анального канала, печени, плевры, средостения, кожи, мезотелиальной и мягких тканей, молочной железы, мочевого пузыря, надпочечников, щитовидной железы, женских и мужских половых органов, костей и суставных хрящей, кожи, мягких тканей, глаза, головного мозга и других отделов центральной нервной системы, щитовидной железы и других эндокринных желез, первичных множественных локализаций. Злокачественные новообразования из первично-невыявленного очага', 'C00 - C75, C78 - C80, C97', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3527, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '1122', 'Гистиоцитоз X (мультифокальный, унифокальный). Гистиоцитоз Лангерганса (мультифокальный, унифокальный). Злокачественный гистиоцитоз.', 'C81 - C90, C91.0, C91.5 - C91.9, C92, C93, C94.0, C94.2 - 94.7, C95, C96.9, C00 - C14, C15 - C21, C22, C23 - C26, C30 - C32, C34, C37, C38, C39, C40, C41, C45, C46, C47, C48, C49, C51 - C58, C60, C61, C62, C63, C64, C65, C66, C67, C68, C69, C71, C72, C73, C74, C75, C76, C77, C78, C79; C96.5; C96.6; C96.8; D46; D47.4', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3528, '2020-12-30 11:21:18', NULL, '2021-01-11 13:57:39', 3992, '1120', 'острые лейкозы, высокозлокачественные лимфомы, рецидивы и резистентные формы других лимфопролиферативных заболеваний, хронический миелолейкоз в фазах акселерации и бластного криза. Солидные опухоли у детей высокого риска (опухоли центральной нервной системы, ретинобластома, нейробластома и другие опухоли периферической нервной системы, опухоли почки, опухоли печени, опухоли костей, саркомы мягких тканей, герминогенные опухоли). Рак носоглотки. Меланома. Другие злокачественные эпителиальные опухоли. Опухоли головы и шеи у детей (остеосаркома, опухоли семейства саркомы Юинга, хондросаркома, ЗФГ, саркомы мягких тканей, ретинобластома, опухоли параменингеальной области). Высокий риск. Миелодиспластические синдромы.', 'C81, C81.0, C81.1, C81.2, C81.3, C81.7, C81.9, C82, C82.0, C82.1, C82.2, C82.7, C82.9, C83, C83.0, C83.1, C82.2, C83.3, C83.4, C83.5, C83.6, C83.7, C83.8, C83.9, C84, C84.0, C84.1, C84.2, C84.3, C84.4, C84.5, C85, C84.0, C84.1, C84.7, C84.9, C85, C85.0, C85.1, C85.2, C85.3, C85.7, C85.9, C88, C88.0, C88.1, C88.2, C88.3, C88.7, C83.9, C90, C91.0, C91.5, C91.7, C91.9, C92, C93, C94.0, C94.2 - 94.7, C95, C96.9, C00, C00.0, C00.1, C00.2, C00.3, C00.4, C00.5, C00.6, C00.8, C00.9, C01, C02, C02.0, C02.1, C02.2, C02.3, C02.4, C02.8, C02.9, C03, C03.0, C03.1, C03.9, C04, C04.0, C04.1, C04.8, C04.9, C05, C05.0, C05.1, C05.2, C05.8, C05.9, C06, C06.0, C06.1, C06.2, C06.8, C06.9, C07. C08, C08.0, C08.1, C08.8, C08.9, C09, C09.0, C09.1, C09.8, C09.9, C10, C10.0, C10.1, C10.2, C10.3, C10.4, C10.8, C10.9, C11, C11.0, C11.1, C11.2, C11.3, C11.8, C11.9, C12, C13, C13.0, C13.1, C13.2, C13.8, C13.9, C14, C14.0, C14.1, C14.2, C14.8, C15 - C21, C22, C23 - C26, C30 - C32, C34, C37, C38, C39, C40, C41, C45, C46, C47, C48, C49, C51 - C58, C60, C61, C62, C63, C64, C65, C66, C67, C68, C69, C71, C72, C73, C74, C75, C76, C77, C78, C79; C96.5; C96.6; C96.8; D46; D47.4', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3529, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '1121', 'Первичный миелофиброз, вторичный миелофиброз при миелопролиферативном заболевании (трансформация истинной полицитемии и эссенциальной тромбоцитемии в миелофиброз).', 'C81 - C90, C91.0, C91.5 - C91.9, C92, C93, C94.0, C94.2 - 94.7, C95, C96.9, C00 - C14, C15 - C21, C22, C23 - C26, C30 - C32, C34, C37, C38, C39, C40, C41, C45, C46, C47, C48, C49, C51 - C58, C60, C61, C62, C63, C64, C65, C66, C67, C68, C69, C71, C72, C73, C74, C75, C76, C77, C78, C79; C96.5; C96.6; C96.8; D46; D47.4', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3530, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '1127', 'опухоли опорно-двигательного аппарата у детей. Остеосаркома, опухоли семейства саркомы Юинга, хондросаркома, злокачественная фиброзная гистиоцитома, саркомы мягких тканей', 'C40.0, C40.2, C41.2, C41.4', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3531, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '1154', 'опухоли черепно-челюстной локализации', 'C12, C13, C14, C32.1 - C32.3, C32.8, C32.9, C33, C41.1, C41.2, C43.1, C43.2, C43.3, C43.4, C44.1 - C44.4, C49.1 - C49.3, C69', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3532, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '1155', 'первичные опухоли длинных костей Iа-б, IIа-б, IVа, IVб стадии у взрослых. Метастатические опухоли длинных костей у взрослых. Гигантоклеточная опухоль длинных костей у взрослых', 'C40.0, C40.1, C40.2, C40.3, C40.8, C40.9, C41.2, C41.3, C41.4, C41.8, C41.9, C79.5', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3535, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '1182', 'болезнь Ходжкина. Неходжкинские лимфомы. Множественная миелома и злокачественные плазмоклеточные новообразования. Лимфоидный лейкоз (лимфолейкоз). Миелоидный лейкоз (миелолейкоз). Моноцитарный лейкоз, острая эритремия и эритролейкоз. Апластические анемии. Миелодиспластические синдромы. Примитивная нейроэктодермальная опухоль (PNET). Нейробластома. Первичный миелофиброз, вторичный миелофиброз при миелопролиферативном заболевании (трансформация истинной полицитемии и эссенциальной тромбоцитемии в миелофиброз). Злокачественные новообразования других типов соединительной и мягких тканей (рабдомиосаркома). Злокачественные новообразования костей и суставных хрящей (саркома Юинга, фибросаркома, хондросаркома). Болезни накопления. Остеопетроз. Врожденные синдромы костно-мозговой недостаточности. Тяжелый комбинированный иммунодефицит. Синдром Вискотта - Олдрича. Синдром Чедиака - Хигаши. Хроническая грануломатозная болезнь. Гипер-IgM синдром. Гемоглобинопатии. Серповидноклеточная анемия. Талассемия. Гистиоцитозы.', 'C38.2, C40, C41, C47.0, C47.3, C47.4, C47.5, C47.6, C47.8, C47.9, C48.0, C49, C71, C74.0, C74.1, C74.9, C76.0, C76.1, C76.2, C76.7, C76.8, C81, C82, C83, C84, C85, C90, C91, C92, C93, C94.0, D46, D47,4, D56, D57, D58, D61, D69, D70, D71, D76, D80.5, D81, D82.0, E70.3, E76, E77, Q45, Q78.2, L90.8', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3536, '2020-12-30 11:21:18', NULL, '2020-12-30 11:21:18', NULL, '1184', 'болезнь Ходжкина. Неходжкинские лимфомы. Множественная миелома и злокачественные плазмоклеточные новообразования. Лимфоидный лейкоз (лимфолейкоз). Миелоидный лейкоз (миелолейкоз). Моноцитарный лейкоз, острая эритремия и эритролейкоз. Апластические анемии. Миелодиспластические синдромы. Примитивная нейроэктодермальная опухоль (PNET). Нейробластома. Первичный миелофиброз, вторичный миелофиброз при миелопролиферативном заболевании (трансформация истинной полицитемии и эссенциальной тромбоцитемии в миелофиброз). Злокачественные новообразования других типов соединительной и мягких тканей (рабдомиосаркома). Злокачественные новообразования костей и суставных хрящей (саркома Юинга, фибросаркома, хондросаркома). Болезни накопления. Остеопетроз. Врожденные синдромы костно-мозговой недостаточности. Тяжелый комбинированный иммунодефицит. Синдром Вискотта - Олдрича. Синдром Чедиака - Хигаши. Хроническая грануломатозная болезнь. Гипер-IgM синдром. Гемоглобинопатии. Серповидноклеточная анемия. Талассемия. Гистиоцитозы. Нефробластома. Герминогенные опухоли.', 'C38.1, C38.2, C40, C41, C47.0, C47.3, C47.4, C47.5, C47.6, C47.8, C47.9, C48.0, C49, C49.5, C52, C56, C62, C64, C65, C66, C68, C71, C74.0, C74.1, C74.9, C76.0, C76.1, C76.2, C76.7, C76.8, C81, C82, C83, C84.0, C84, C85, C90, C91, C92, C93, C94.0, D46, D56, D57, D58, D61, D69, D70, D71, D47,4, D76, D80.5, D81, D82.0, E70.3, E76, E77, Q45, Q78.2, L90.8', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3582, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1711', 'вирусассоциированные злокачественные новообразования шейки матки in situ', 'C53', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3583, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1717', 'злокачественные новообразования вульвы (0 - I стадия), злокачественные новообразования влагалища', 'C51, C52', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3584, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1641', 'злокачественные новообразования головы и шеи (I - III стадия)', 'C00, C01, C02, C04 - C06, C09.0, C09.1, C09.8, C09.9, C10.0, C10.1, C10.2, C10.3, C10.4, C11.0, C11.1, C11.2, C11.3, C11.8, C11.9, C12, C13.0, C13.1, C13.2, C13.8, C13.9, C14.0, C14.2, C15.0, C30.0, C31.0, C31.1, C31.2, C31.3, C31.8, C31.9, C32, C43, C44, C69, C73, C15, C16, C17, C18, C19, C20, C21', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3586, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1704', 'злокачественные новообразования молочной железы IIa, IIb, IIIa стадии', 'C50.2, C50.9, C50.3', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3587, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1705', 'злокачественные новообразования шейки матки (I - III стадия). Местнораспространенные формы злокачественных новообразований шейки матки, осложненные кровотечением', 'C53', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3588, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1712', 'злокачественные новообразования эндометрия in situ - III стадии', 'C54', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3589, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1718', 'злокачественные новообразования яичка (TxN1-2MoS1-3)', 'C62', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3590, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1719', 'метастатическое поражение легкого', 'C78', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3591, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1685', 'немелкоклеточный ранний центральный рак легкого (Tis-T1NoMo)', 'C34, C33', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3592, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1654', 'нерезектабельные опухоли внепеченочных желчных протоков', 'C24', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3593, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1669', 'нерезектабельные опухоли поджелудочной железы. Злокачественные новообразования поджелудочной железы с обтурацией вирсунгова протока', 'C25', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3595, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1721', 'опухоль плевры. Распространенное поражение плевры. Мезотелиома плевры. Метастатическое поражение плевры', 'C78.1, C38.4, C38.8, C45.0, C78.2', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3596, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1700', 'ранние формы злокачественных опухолей легкого (I - II стадия)', 'C34, C33', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3597, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1690', 'ранний рак трахеи', 'C34, C33', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3598, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1695', 'стенозирующий рак трахеи. Стенозирующий центральный рак легкого (T3-4NxMx)', 'C34, C33', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3599, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1796', 'злокачественные новообразования кожи', 'C43, C44', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3600, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1805', 'злокачественные новообразования молочной железы (0 - IV стадия)', 'C50', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3601, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1816', 'злокачественные новообразования мочевого пузыря (I - IV стадия)', 'C67', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3602, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1820', 'злокачественные новообразования надпочечника (III - IV стадия)', 'C74', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3603, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1810', 'злокачественные новообразования тела матки (местнораспространенные формы). Злокачественные новообразования эндометрия (I - III стадия) с осложненным соматическим статусом (тяжелая степень ожирения, тяжелая степень сахарного диабета и т.д.)', 'C54', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3604, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1809', 'злокачественные новообразования шейки матки', 'C53', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3605, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1815', 'злокачественные новообразования яичка', 'C62', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3606, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1771', 'местнораспространенные и диссеминированные формы злокачественных новообразований двенадцатиперстной и тонкой кишки', 'C17', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3607, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1803', 'местнораспространенные и диссеминированные формы первичных и рецидивных неорганных опухолей забрюшинного пространства', 'C48', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3608, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1772', 'местнораспространенные и метастатические формы первичных и рецидивных злокачественных новообразований ободочной, сигмовидной, прямой кишки и ректосигмоидного соединения (II - IV стадия)', 'C18, C19, C20, C08, C48.1', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3609, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1783', 'местнораспространенные первичные и метастатические опухоли печени', 'C22, C23, C24', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3610, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1804', 'местнораспространенные формы первичных и метастатических опухолей брюшной стенки', 'C48', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3611, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1821', 'метастатическое поражение легкого', 'C78', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3612, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1750', 'начальные, локализованные и местнораспространенные формы злокачественных новообразований пищевода', 'C15', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3613, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1727', 'опухоли головы и шеи, первичные и рецидивные, метастатические опухоли центральной нервной системы', 'C00.0, C00.1, C00.2, C00.3, C00.4, C00.5, C00.6, C00.8, C00.9, C01, C02, C03.1, C03.9, C04.0, C04.1, C04.8, C04.9, C05, C06.0, C06.1, C06.2, C06.9, C07, C08.0, C08.1, C08.8, C08.9, C09.0, C09.8, C09.9, C10.0, C10.1, C10.2, C10.4, C10.8, C10.9, C11.0, C11.1, C11.2, C11.3, C11.8, C11.9, C13.0, C13.1, C13.2, C13.8, C13.9, C14.0, C12, C14.8, C15.0, C30.0, C30.1, C31.0, C31.1, C31.2, C31.3, C31.8, C31.9, C32.0, C32.1, C32.2, C32.3, C32.8, C32.9, C33, C43, C44, C49.0, C69, C73', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3614, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1795', 'опухоль плевры. Распространенное поражение плевры. Мезотелиома плевры. Метастатическое поражение плевры', 'C38.4, C38.8, C45, C78.2', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3615, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1753', 'пациенты со злокачественными новообразованиями желудка, подвергшиеся хирургическому лечению с различными пострезекционными состояниями (синдром приводящей петли, синдром отводящей петли, демпинг-синдром, рубцовые деформации анастомозов), злокачественные новообразования желудка (I - IV стадия)', 'C16', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3616, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1813', 'рецидивы злокачественного новообразования тела матки, шейки матки и яичников', 'C53, C54, C56, C57.8', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3617, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1824', 'первичный рак молочной железы T1N2-3M0, T2-3N1-3M0', 'C50', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3618, '2021-01-12 12:08:29', NULL, '2021-01-19 13:30:27', 3992, '1845', 'острые лейкозы, высокозлокачественные лимфомы, рецидивы и резистентные формы других лимфопролиферативных заболеваний, хронический миелолейкоз в фазах акселерации и бластного криза. Солидные опухоли у детей высокого риска: опухоли центральной нервной системы, ретинобластома, нейробластома и другие опухоли периферической нервной системы, опухоли почки, опухоли печени, опухоли костей, саркомы мягких тканей, герминогенные опухоли. Рак носоглотки. Меланома. Другие злокачественные эпителиальные опухоли. Опухоли головы и шеи у детей (остеосаркома, опухоли семейства саркомы Юинга, хондросаркома, злокачественная фиброзная гистиоцитома, саркомы мягких тканей, ретинобластома, опухоли параменингеальной области). Высокий риск', 'C81 - C90, C91.0, C91.5 - C91.9, C92, C93, C94.0, C94.2 - C94.7, C95, C96.9, C00 - C14, C15 - C21, C22, C23 - C26, C30 - C32, C34, C37, C38, C39, C40, C41, C45, C46, C47, C48, C49, C51 - C58, C60, C61, C62, C63, C64, C65, C66, C67, C68, C69, C71, C72, C73, C74, C75, C76, C77, C78, C79', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3619, '2021-01-12 12:08:29', NULL, '2021-01-12 12:45:50', 3992, '1847', 'злокачественные новообразования головы и шеи, трахеи, бронхов, легкого, плевры, средостения, щитовидной железы, молочной железы, пищевода, желудка, тонкой кишки, ободочной кишки, желчного пузыря, поджелудочной железы, толстой и прямой кишки, анального канала, печени, мочевого пузыря, надпочечников, почки, полового члена, предстательной железы, костей и суставных хрящей, кожи, мягких тканей (T1-4N любая M0), локализованные и местнораспространенные формы. Вторичное поражение лимфоузлов', 'C00 - C14, C15 - C17, C18 - C22, C23 - C25, C30, C31, C32, C33, C34, C37, C39, C40, C41, C44, C48, C49, C50, C51, C55, C60, C61, C64, C67, C68, C73, C74, C77', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3620, '2021-01-12 12:08:29', NULL, '2021-01-12 13:19:19', 3992, '1848', 'злокачественные новообразования маточных труб. Локальный рецидив после неоднократных курсов полихимиотерапии и невозможности выполнить хирургическое вмешательство', 'C57, C57.0, C57.1, C57.2, C57.3, C57.4, C57.7, C57.8, C57', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3621, '2021-01-12 12:08:29', NULL, '2021-01-12 14:16:34', 3992, '1849', 'злокачественные новообразования головы и шеи, трахеи, бронхов, легкого, плевры, средостения, щитовидной железы, молочной железы, пищевода, желудка, тонкой кишки, ободочной кишки, желчного пузыря, поджелудочной железы, толстой и прямой кишки, анального канала, печени, мочевого пузыря, надпочечников, почки, полового члена, предстательной железы, костей и суставных хрящей, кожи, мягких тканей (T1-4N любая M0), локализованные и местнораспространенные формы. Вторичное поражение лимфоузлов', 'C00 - C14, C15 - C17, C18 - C22, C23 - C25, C30, C31, C32, C33, C34, C37, C39, C40, C41, C44, C48, C49, C50, C51, C55, C60, C61, C64, C67, C68, C73, C74, C77', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3622, '2021-01-12 12:08:29', NULL, '2021-01-12 13:13:06', 3992, '1854', 'злокачественные новообразования лимфоидной ткани', 'C81, C82, C83, C84, C85', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3623, '2021-01-12 12:08:29', NULL, '2021-01-12 14:19:07', 3992, '1852', 'злокачественные новообразования маточных труб. Локальный рецидив после неоднократных курсов полихимиотерапии и невозможности выполнить хирургическое вмешательство', 'C57, C57.0, C57.1, C57.2, C57.3, C57.4, C57.7, C57.8, C57', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3624, '2021-01-12 12:08:29', NULL, '2021-01-12 14:21:29', 3992, '1851', 'злокачественные новообразования яичников. Локальный рецидив, поражение лимфатических узлов после неоднократных курсов полихимиотерапии и невозможности выполнить хирургическое вмешательство', 'C56', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3625, '2021-01-12 12:08:29', NULL, '2021-01-12 14:20:10', 3992, '1850', 'интраэпителиальные, микроинвазивные и инвазивные злокачественные новообразования вульвы, влагалища, шейки и тела матки (T0-4N0-1M0-1), в том числе с метастазированием в параортальные или паховые лимфоузлы', 'C51, C52, C53, C54, C55', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3626, '2021-01-12 12:08:29', NULL, '2021-01-12 14:20:42', 3992, '1853', 'Первичные и вторичные злокачественные новообразования оболочек головного мозга, спинного мозга, головного мозга', 'C70, C71, C72, C75.1, C75.3, C79.3, C79.4', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3627, '2021-01-12 12:08:29', NULL, '2021-01-12 14:23:20', 3992, '1855', 'злокачественные новообразования головы и шеи, трахеи, бронхов, легкого, плевры, средостения, щитовидной железы, молочной железы, пищевода, желудка, тонкой кишки, ободочной кишки, желчного пузыря, поджелудочной железы, толстой и прямой кишки, анального канала, печени, мочевого пузыря, надпочечников, почки, полового члена, предстательной железы, костей и суставных хрящей, кожи, мягких тканей (T1-4N любая M0), локализованные и местнораспространенные формы. Вторичное поражение лимфоузлов', 'C00, C00.0, C00.1, C00.2, C00.3, C00.4, C00.5, C00.6, C00.8, C00.9, C01, C02, C02.0, C02.1, C02.2, C02.3, C02.4, C02.8, C02.9, C03, C03.0, C03.1, C03.9, C04, C04.0, C04.1, C04.8, C04.9, C05, C05.0, C05.1, C05.2, C05.8, C05.9, C06, C06.0, C06.1, C06.2, C06.8, C06.9, C07. C08, C08.0, C08.1, C08.8, C08.9, C09, C09.0, C09.1, C09.8, C09.9, C10, C10.0, C10.1, C10.2, C10.3, C10.4, C10.8, C10.9, C11, C11.0, C11.1, C11.2, C11.3, C11.8, C11.9, C12, C13, C13.0, C13.1, C13.2, C13.8, C13.9, C14, C14.0, C14.1, C14.2, C14.8, C15 - C17, C18 - C22, C23 - C25, C30, C31, C32, C33, C34, C37, C39, C40, C41, C44, C48, C49, C50, C51, C55, C60, C61, C64, C67, C68, C73, C74, C77', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3628, '2021-01-12 12:08:29', NULL, '2021-01-12 13:25:48', 3992, '1872', 'злокачественные новообразования лимфоидной ткани', 'C81, C82, C83, C84, C85', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3629, '2021-01-12 12:08:29', NULL, '2021-01-12 14:19:19', 3992, '1864', 'злокачественные новообразования маточных труб. Локальный рецидив после неоднократных курсов полихимиотерапии и невозможности выполнить хирургическое вмешательство', 'C57, C57.0, C57.1, C57.2, C57.3, C57.4, C57.7, C57.8, C57', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3630, '2021-01-12 12:08:29', NULL, '2021-01-12 12:08:29', NULL, '1860', 'злокачественные новообразования яичников. Локальный рецидив, поражение лимфатических узлов после неоднократных курсов полихимиотерапии и невозможности выполнить хирургическое вмешательство', 'C56', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3631, '2021-01-12 12:08:29', NULL, '2021-01-12 13:24:24', 3992, '1856', 'интраэпителиальные, микроинвазивные и инвазивные злокачественные новообразования вульвы, влагалища, шейки и тела матки (T0-4N0-1M0-1), в том числе с метастазированием в параортальные или паховые лимфоузлы', 'C51, C52, C53, C54, C55', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3632, '2021-01-12 12:08:29', NULL, '2021-01-12 14:21:15', 3992, '1868', 'Первичные и вторичные злокачественные новообразования оболочек головного мозга, спинного мозга, головного мозга', 'C70, C71, C72, C75.1, C75.3, C79.3, C79.4', 90, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3645, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2031', 'злокачественные новообразования молочной железы Iia, Iib, IIIa стадии', 'C50.2, C50.3, C50.9', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3646, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2034', 'злокачественные новообразования надпочечника', 'C74', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3647, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2018', 'локализованные и местнораспространенные формы злокачественных новообразований двенадцатиперстной и тонкой кишки', 'C17', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3648, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2032', 'местнораспространенные формы злокачественных новообразований тела матки, осложненных кровотечением', 'C54, C55', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3649, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2020', 'немелкоклеточный ранний центральный рак легкого (Tis-T1NoMo)', 'C33, C34', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3650, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2029', 'опухоль вилочковой железы (I - II стадия). Опухоль переднего, заднего средостения (начальные формы). Метастатическое поражение средостения', 'C37, C38.1, C38.2, C38.3', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3651, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2028', 'ранние формы злокачественных опухолей легкого (I - II стадия)', 'C34', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3652, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2025', 'ранний рак трахеи', 'C33, C34', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3653, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2129', 'злокачественные новообразования вульвы (I - III стадия)', 'C51', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3654, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2115', 'злокачественные новообразования кожи', 'C43, C43.5, C43.6, C43.7, C43.8, C43.9, C44, C44.5, C44.6, C44.7, C44.8, C44.9', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3655, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2120', 'злокачественные новообразования молочной железы (0 - IV стадия)', 'C50, C50.1, C50.2, C50.3, C50.4, C50.5, C50.6, C50.8, C50.9', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3656, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2144', 'злокачественные новообразования мочевого пузыря (I - IV стадия)', 'C67', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3657, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2146', 'злокачественные новообразования надпочечника (III - IV стадия)', 'C74', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3658, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2139', 'злокачественные новообразования тела матки (местнораспространенные формы). Злокачественные новообразования эндометрия IA III стадии с осложненным соматическим статусом (тяжелая степень ожирения, тяжелая степень сахарного диабета и т.д.)', 'C54', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3659, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2133', 'злокачественные новообразования шейки матки', 'C53', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3660, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2094', 'местнораспространенные и диссеминированные формы злокачественных новообразований двенадцатиперстной и тонкой кишки', 'C17', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3661, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2117', 'местнораспространенные и диссеминированные формы первичных и рецидивных неорганных опухолей забрюшинного пространства', 'C48', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3662, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2096', 'местнораспространенные и метастатические формы первичных и рецидивных злокачественных новообразований ободочной, сигмовидной, прямой кишки и ректосигмоидного соединения (II - IV стадия)', 'C18, C19, C20', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3663, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2107', 'местнораспространенные первичные и метастатические опухоли печени', 'C22, C23, C24, C78.7', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3664, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2119', 'местнораспространенные формы первичных и метастатических опухолей брюшной стенки', 'C48', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3665, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2089', 'начальные, локализованные и местнораспространенные формы злокачественных новообразований пищевода', 'C15', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3666, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2035', 'опухоли головы и шеи, первичные и рецидивные, метастатические опухоли центральной нервной системы', 'C00.0, C00.1, C00.2, C00.3, C00.4, C00.5, C00.6, C00.8, C00.9, C01, C02, C03.1, C03.9, C04.0, C04.1, C04.8, C04.9, C05, C06.0, C06.1, C06.2, C06.8, C06.9, C07, C08.0, C08.1, C08.8, C08.9, C09.0, C09.1, C09.8, C09.9, C10.0, C10.1, C10.2, C10.3, C10.4, C10.8, C10.9, C11.0, C11.1, C11.2, C11.3, C11.8, C11.9, C12, C13.0, C13.1, C13.2, C13.8, C13.9, C14.0, C14.2, C14.8, C15.0, C30.0, C30.1, C31.0, C31.1, C31.2, C31.3, C31.8, C31.9, C32.0, C32.1, C32.2, C32.3, C32.8, C32.9, C33, C43.0 - C43.9, C44.0 - C44.9, C49.0, C69, C73', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3667, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2112', 'опухоль плевры. Распространенное поражение плевры. Мезотелиома плевры. Метастатическое поражение плевры', 'C38.4, C38.8, C45, C78.2', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3668, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2143', 'рецидивы злокачественных новообразований тела матки, шейки матки и яичников', 'C53, C54, C56, C57.8', 87, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3669, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2223', 'злокачественные новообразования эндометрия (II - III стадия)', 'C54', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3670, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2147', 'местнораспространенные и метастатические формы первичных и рецидивных неорганных опухолей забрюшинного пространства', 'C48', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3671, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2204', 'местнораспространенные формы злокачественных новообразований шейки матки', 'C53', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3672, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2185', 'метастатические и рецидивные злокачественные новообразования молочной железы, предполагающие использование на одном из этапов лечения хирургического метода', 'C50', 89, 0);
INSERT INTO rbPatientModel
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, cureType_id, isObsolete)
VALUES(3673, '2021-01-12 12:09:06', NULL, '2021-01-12 12:09:06', NULL, '2166', 'первичные злокачественные новообразования молочной железы (T1-3N0-1M0)', 'C50', 89, 0);





INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-02-18 16:27:01', 3992, '2020-03-02 12:47:45', 3992, 87, 3149, 3391);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-02-18 16:27:01', 3992, '2020-03-02 12:47:45', 3992, 87, 3150, 3391);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-02-18 16:27:01', 3992, '2020-03-02 12:47:45', 3992, 87, 3151, 3391);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-02-18 16:27:01', 3992, '2020-03-02 12:47:45', 3992, 87, 3152, 3391);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2969, 3415);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3081, 3404);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3086, 3399);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2889, 3410);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2889, 3415);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 88, 2889, 3426);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2970, 3415);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2966, 3416);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2965, 3416);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 88, 2886, 3426);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2900, 3396);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2900, 3411);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3080, 3404);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3061, 3422);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3070, 3423);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2958, 3393);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2950, 3408);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3053, 3418);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3079, 3404);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2021-01-12 11:39:37', 3992, 90, 3107, 3406);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2021-01-12 14:17:29', 3992, 90, 3106, 3407);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2021-01-12 14:17:40', 3992, 90, 3109, 3424);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2021-01-11 12:20:27', 3992, 90, 3110, 3392);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3090, 3401);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3087, 3409);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2946, 3405);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2947, 3405);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 88, 2884, 3426);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2949, 3413);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2904, 3411);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3022, 3427);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3023, 3427);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2955, 3398);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2967, 3415);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2967, 3425);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3040, 3412);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3089, 3403);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2968, 3415);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2872, 3400);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3021, 3427);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3020, 3427);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 89, 3101, 3414);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2935, 3419);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2956, 3402);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2951, 3408);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3055, 3418);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3054, 3418);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3060, 3422);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3091, 3401);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3026, 3427);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3027, 3427);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3059, 3422);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3025, 3427);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3024, 3427);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3019, 3427);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2859, 3415);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2934, 3419);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2952, 3394);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2952, 3410);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2957, 3402);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 88, 2887, 3426);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 88, 2885, 3426);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2891, 3396);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2891, 3411);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2891, 3417);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3056, 3420);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3096, 3395);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3058, 3422);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2892, 3417);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3082, 3404);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 3083, 3404);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 88, 2888, 3426);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2890, 3396);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2890, 3411);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2890, 3417);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2877, 3428);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2896, 3396);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2868, 3400);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2868, 3428);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2883, 3421);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2875, 3400);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2875, 3428);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2871, 3400);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2873, 3400);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2874, 3400);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2881, 3428);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2870, 3400);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2897, 3396);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2897, 3397);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2893, 3396);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2894, 3396);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2878, 3428);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2895, 3396);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2882, 3428);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2869, 3400);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:20:53', NULL, '2020-12-30 11:20:53', NULL, 87, 2869, 3428);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3302, 3499);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3137, 3469);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 2966, 3476);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 2965, 3476);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3175, 3463);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3176, 3463);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3153, 3477);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3177, 3464);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3171, 3474);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3357, 3502);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3363, 3518);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 2900, 3475);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 90, 3392, 3525);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 90, 3404, 3527);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 90, 3400, 3527);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2021-01-11 13:57:39', 3992, 90, 3400, 3528);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 90, 3400, 3529);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3279, 3496);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3070, 3492);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3070, 3493);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3070, 3494);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 90, 3402, 3527);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 90, 3391, 3522);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 90, 3394, 3523);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3227, 3500);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3281, 3496);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3280, 3496);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3157, 3456);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3158, 3456);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 90, 3388, 3521);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 90, 3401, 3527);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 90, 3403, 3527);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 90, 3390, 3521);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 90, 3389, 3521);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3383, 3504);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3383, 3515);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3383, 3517);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3381, 3516);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3435, 3473);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3183, 3466);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3184, 3458);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3138, 3473);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3181, 3467);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3185, 3468);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3182, 3462);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3187, 3468);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3186, 3468);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3180, 3465);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3143, 3470);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3144, 3470);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3141, 3471);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3142, 3471);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3149, 3478);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3150, 3478);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3151, 3478);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3145, 3472);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3146, 3472);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3354, 3482);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3283, 3496);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3127, 3455);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3126, 3455);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3152, 3478);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3147, 3472);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3433, 3535);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3267, 3501);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3268, 3501);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3278, 3498);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3376, 3503);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3101, 3504);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3101, 3505);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3101, 3506);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3101, 3508);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3101, 3510);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3101, 3511);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3101, 3512);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3101, 3513);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3101, 3515);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3101, 3516);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3101, 3517);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3101, 3518);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3101, 3520);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3360, 3514);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 89, 3368, 3519);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3348, 3485);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3349, 3485);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3346, 3488);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 90, 3395, 3524);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 90, 3397, 3524);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 90, 3398, 3524);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 90, 3396, 3524);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3277, 3498);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3276, 3498);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3275, 3501);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3271, 3501);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3272, 3501);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3273, 3501);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3274, 3501);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3282, 3496);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3407, 3530);
INSERT INTO rbPatientModel_Item
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
VALUES('2020-12-30 11:21:24', NULL, '2020-12-30 11:21:24', NULL, 87, 3407, 3532);





select * from rbPatientModel where isObsolete = 0;
select * from rbPatientModel_Item rpmi ;
select * from rbCureMethod where isObsolete = 0;
select * from rbCureType where isObsolete = 0;

select * from rbPatientModel_Item rpmi ;