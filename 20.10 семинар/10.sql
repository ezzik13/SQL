SELECT `ФИО`, `Адрес`, `Комментарий`
FROM `люди` a
RIGHT  JOIN `адреса` b
 ON a.`﻿id`=  b.`﻿Чей адрес`