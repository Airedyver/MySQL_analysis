ALTER TABLE `sakila`.`actor` 
ADD COLUMN `middle_name` VARCHAR(45) NULL AFTER `first_name`;

ALTER TABLE `sakila`.`actor` 
CHANGE COLUMN `middle_name` `middle_name` BLOB(45) NULL DEFAULT NULL ;

ALTER TABLE `sakila`.`actor` 
DROP COLUMN `middle_name`;