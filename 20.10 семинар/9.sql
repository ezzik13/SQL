SELECT * FROM `люди` a
LEFT JOIN `адреса` b
 ON a.`﻿id`=  b.`﻿Чей адрес`
 UNION 
 SELECT * FROM `люди` a
RIGHT  JOIN `адреса` b
 ON a.`﻿id`=  b.`﻿Чей адрес`