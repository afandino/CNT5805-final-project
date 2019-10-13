/*create database and select user*/
create database gephidb;
use gephidb;
select database ();
create user 'gephiusr'@'%' identified by 'gephipwd';
grant select on gephidb.* to 'gephiusr'@'%' identified by 'gephipwd';
show grants for 'gephiusr';
show CREATE USER 'gephiusr'@'localhost';
SELECT User FROM mysql.user;
/*create gephi tables*/
create table nodes (id varchar(11),label varchar(128),size int(11));
ALTER TABLE nodes ADD constraint primary key (id);
create table edges (source varchar(11), target varchar(11), label varchar(128), weight int(11));
ALTER TABLE `gephidb`.`edges` 
ADD CONSTRAINT `fk_edges_source`
  FOREIGN KEY (`source`)
  REFERENCES `gephidb`.`nodes` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
ALTER TABLE `gephidb`.`edges` 
ADD CONSTRAINT `fk_edges_target`
  FOREIGN KEY (`target`)
  REFERENCES `gephidb`.`nodes` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
/*set up the stage table to load raw data*/
CREATE TABLE `arcos_all_washpost` (
  `REPORTER_DEA_NO` varchar(11),
  `REPORTER_BUS_ACT` text,
  `REPORTER_NAME` text,
  `REPORTER_ADDL_CO_INFO` text,
  `REPORTER_ADDRESS1` text,
  `REPORTER_ADDRESS2` text,
  `REPORTER_CITY` text,
  `REPORTER_STATE` varchar(2),
  `REPORTER_ZIP` int(11) DEFAULT NULL,
  `REPORTER_COUNTY` text,
  `BUYER_DEA_NO` varchar(11),
  `BUYER_BUS_ACT` text,
  `BUYER_NAME` text,
  `BUYER_ADDL_CO_INFO` text,
  `BUYER_ADDRESS1` text,
  `BUYER_ADDRESS2` text,
  `BUYER_CITY` text,
  `BUYER_STATE` varchar(2),
  `BUYER_ZIP` int(11) DEFAULT NULL,
  `BUYER_COUNTY` text,
  `TRANSACTION_CODE` text,
  `DRUG_CODE` int(11) DEFAULT NULL,
  `NDC_NO` int(11) DEFAULT NULL,
  `DRUG_NAME` text,
  `QUANTITY` int(11) DEFAULT NULL,
  `UNIT` text,
  `ACTION_INDICATOR` text,
  `ORDER_FORM_NO` int(11) DEFAULT NULL,
  `CORRECTION_NO` text,
  `STRENGTH` text,
  `TRANSACTION_DATE` int(11) DEFAULT NULL,
  `CALC_BASE_WT_IN_GM` double DEFAULT NULL,
  `DOSAGE_UNIT` text,
  `TRANSACTION_ID` int(11) DEFAULT NULL,
  `Product_Name` text,
  `Ingredient_Name` text,
  `Measure` text,
  `MME_Conversion_Factor` int(11) DEFAULT NULL,
  `Combined_Labeler_Name` text,
  `Revised_Company_Name` text,
  `Reporter_family` text,
  `dos_str` text
);
ALTER TABLE `gephidb`.`arcos_all_washpost` 
ADD INDEX `reporter_dea_no_idx` (`REPORTER_DEA_NO` ASC);
;
show tables;
