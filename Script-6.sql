select * from s12.spt;

SELECT * from SPRAV_DRUGS_SCHEMES order by ID_DRUGS desc

SELECT tsds.ID_DRUGS, tsds.DRUGS_CODE, tsds.DATE_BEGIN, tsds.DATE_END, sds.ID_DRUGS, sds.DRUGS_CODE, sds.DATE_BEGIN, sds.DATE_END from temp_SPRAV_DRUGS_SCHEMES tsds
left join SPRAV_DRUGS_SCHEMES sds on sds.ID_DRUGS = tsds.ID_DRUGS 
where sds.ID_DRUGS is not null

select * from SPRAV_DRUGS_SCHEMES sds ;

select * from SPRAV_DRUGS_SC_LEKPR sdsl ;

select * from SPRAV_LEK_PR slp ;

select * from temp_SPRAV_LEK_PR slp ;

select * from temp_SPRAV_DRUGS_SC_LEKPR ;

INSERT INTO SPRAV_DRUGS_SCHEMES(ID_DRUGS, DRUGS_CODE, MNN, DRUGS_NAME, DATE_BEGIN, DATE_END, FULL_NAME, id, code, name, EGISZ_code)
select tsds.ID_DRUGS, tsds.DRUGS_CODE, tsds.MNN, tsds.DRUGS_NAME, tsds.DATE_BEGIN, tsds.DATE_END, tsds.FULL_NAME, tsds.ID_DRUGS id, tsds.DRUGS_CODE code, tsds.FULL_NAME name, null EGISZ_code from SPRAV_DRUGS_SCHEMES sds
right join temp_SPRAV_DRUGS_SCHEMES tsds on sds.ID_DRUGS = tsds.ID_DRUGS  
where sds.ID_DRUGS is /*not*/ null

UPDATE SPRAV_DRUGS_SCHEMES sds
right join temp_SPRAV_DRUGS_SCHEMES tsds on sds.ID_DRUGS = tsds.ID_DRUGS 
set sds.DATE_BEGIN = tsds.DATE_BEGIN, sds.DATE_END = tsds.DATE_END 
where sds.ID_DRUGS is not null

INSERT into SPRAV_DRUGS_SC_LEKPR(ID_DRUGS, DRUGS_CODE, MNN_DR, DRUGS_NAME, FULL_NAME, ID_LEK_PR, MNN_LEK, DATE_BEGIN, DATE_END)
select tsdslp.* from SPRAV_DRUGS_SC_LEKPR sdsl
right join temp_SPRAV_DRUGS_SC_LEKPR tsdslp on sdsl.ID_DRUGS = tsdslp.ID_DRUGS 
where sdsl.ID_LEK_PR is NULL 

UPDATE SPRAV_DRUGS_SC_LEKPR sdsl
right join temp_SPRAV_DRUGS_SC_LEKPR tsdslp on sdsl.ID_DRUGS = tsdslp.ID_DRUGS 
SET  sdsl.DATE_BEGIN = tsdslp.DATE_BEGIN, sdsl.DATE_END = tsdslp.DATE_END 
where sdsl.ID_LEK_PR is not NULL 


INSERT INTO SPRAV_LEK_PR(ID_LEK_PR, NUM_REG, DATE_REG, DATE_BEGIN, DATE_END, MNN)
select tslp.ID_LEK_PR, tslp.FED_ID, tslp.DATE_BEGIN DATE_REG, tslp.DATE_BEGIN, tslp.DATE_END, tslp.MNN from SPRAV_LEK_PR slp
right join temp_SPRAV_LEK_PR tslp on slp.ID_LEK_PR = tslp.ID_LEK_PR
where slp.ID_LEK_PR is null

UPDATE SPRAV_LEK_PR slp
right join temp_SPRAV_LEK_PR tslp on slp.ID_LEK_PR = tslp.ID_LEK_PR
set slp.DATE_BEGIN = tslp.DATE_BEGIN, slp.DATE_END = tslp.DATE_END
where slp.ID_LEK_PR is not null



select tsds.* from SPRAV_DRUGS_SCHEMES sds
right join temp_SPRAV_DRUGS_SCHEMES tsds on sds.ID_DRUGS = tsds.ID_DRUGS  
where sds.ID_DRUGS is /*not*/ null

CREATE TABLE s11.temp_SPRAV_DRUGS_SC_LEKPR
(select * from temp_SPRAV_DRUGS_SC_LEKPR tsdsl);
CREATE TABLE s11.temp_SPRAV_DRUGS_SCHEMES
(select * from temp_SPRAV_DRUGS_SCHEMES tsds );
CREATE TABLE s11.temp_SPRAV_LEK_PR
(select * from temp_SPRAV_LEK_PR tslp );




CREATE TABLE s11.backup_SPRAV_LEK_PR_25_02_21
(select * from s11.SPRAV_LEK_PR slp)

-- CREATE TABLE s12.backup_SPRAV_DRUGS_SC_LEKPR_25_02_21
-- (select * from s11.SPRAV_DRUGS_SC_LEKPR sdsl)

-- CREATE TABLE s11.backup_SPRAV_DRUGS_SCHEMES_25_02_21
-- (select * from s11.SPRAV_DRUGS_SCHEMES)


s12.SPRAV_DRUGS_SC_LEKPR


select * from rbStockNomenclature rsn ;

SELECT * from SPRAV_DRUGS_SC_LEKPR

select * from SPRAV_LEK_PR

select * from temp_SPRAV_DRUGS_SC_LEK_PR;


select * from SPRAV_DRUGS_SC_LEKPR sdsl
join SPRAV_LEK_PR slp on slp.ID_LEK_PR = sdsl.ID_LEK_PR 



select slp.MNN, tslp.MNN, tslp.* from temp_SPRAV_DRUGS_SC_LEK_PR tslp
left join SPRAV_LEK_PR slp on slp.ID_LEK_PR = tslp.ID_LEK_PR 
where slp.ID_LEK_PR is NULL 