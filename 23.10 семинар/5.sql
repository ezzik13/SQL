/*CREATE TABLE `task1` (
	`ID` INT(10) NULL DEFAULT NULL,
	`ID_fol` INT(10) NULL DEFAULT NULL
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;
INSERT INTO task1 (ID, ID_fol) VALUES (1, 2);
INSERT INTO task1 (ID, ID_fol) VALUES (1, 3);
INSERT INTO task1 (ID, ID_fol) VALUES (2, 1);
INSERT INTO task1 (ID, ID_fol) VALUES (3, 2);
INSERT INTO task1 (ID, ID_fol) VALUES (3, 1);
*/


SELECT *, CONCAT(ID, '-', ID_fol) FROM task1
/* если запрос делается не из базы, где расположена таблица то база.таблица(12345.task1)*/
WHERE CONCAT(ID, '-', ID_fol) NOT IN (SELECT CONCAT(ID_fol,'-', ID) FROM task1)