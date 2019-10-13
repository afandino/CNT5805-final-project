USE gephidb;
/*needed to delete header record*/
DELETE FROM gephidb.arcos_all_washpost WHERE REPORTER_DEA_NO='REPORTER_DEA_NO';
/*inserting reporting nodes*/
INSERT IGNORE INTO nodes (ID,LABEL) SELECT REPORTER_DEA_NO,REPORTER_NAME FROM arcos_all_washpost WHERE reporter_state='FL';
/*inserting buyer nodes*/
INSERT IGNORE INTO nodes (ID,LABEL) SELECT BUYER_DEA_NO, BUYER_NAME FROM gephidb.arcos_all_washpost WHERE reporter_state='FL';
/*inserting edges*/
INSERT INTO edges (SOURCE, TARGET) SELECT DISTINCT DREPORTER_DEA_NO, BUYER_DEA_NO FROM gephidb.arcos_all_washpost WHERE reporter_state='FL';
