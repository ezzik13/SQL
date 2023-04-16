CREATE TABLE `Рассадка` (
  `﻿id_place` int DEFAULT NULL,
  `ряд от двери` int  DEFAULT NULL,
  `ряд от доски` int DEFAULT NULL,
  `вариант` int DEFAULT NULL
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Рассадка` VALUES (111,1,1,1), (112,1,1,2), (123,1,2,3), (124,1,2,4), (131,1,3,1), (132,1,3,2),(213,2,1,3), (214,2,1,4), (221,2,2,1), (222,2,2,2), (233,2,3,3), (234,2,3,4),
(311,3,1,1), (312,3,1,2), (323,3,2,3), (324,3,2,4), (331,3,3,1), (332,3,3,2);

CREATE TABLE `Список класса` (
  `﻿id_student` int DEFAULT NULL,
  `Фамилия` text  DEFAULT NULL,
  `Имя` text DEFAULT NULL,
  `Отчество` text DEFAULT NULL,
  `д/р` DATE DEFAULT NULL
)
ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;


CREATE TABLE `Расписание контрольных` (
  `﻿предмет` text DEFAULT NULL,
  `начало` TIMESTAMP   DEFAULT NULL,
  `окончание` TIMESTAMP DEFAULT NULL,
  `вариант рассадки` int DEFAULT NULL
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `Рассадка на контрольных` (
  `﻿id_place` int DEFAULT NULL,
  `вариант рассадки 1` int  DEFAULT NULL,
  `вариант рассадки 2` int DEFAULT NULL
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Рассадка на контрольных` VALUES (111,8,4), (112,9,12), (123,15,14), (124,3,7),(131,14,9),(132,11,3),(213,10,11), (214,7,8),(221,4,16),(222,16,6),
(233,17,13),(234,1,10),(311,12,1),(312,5,17),(323,6,18),(324,2,15),(331,18,5),(332,13,2)
;