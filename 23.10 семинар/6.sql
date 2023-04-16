/*CREATE TABLE task2     
	(
      name  text,
      score int
    );
INSERT INTO task2 VALUES
('иванов', 5),
('иванов', 5),
('иванов', 5),
('иванов', 2),
('иванов', 5),
('иванов', 2),
('иванов', 5),
('иванов', 5),
('петров', 5),
('петров', 5),
('петров', 2); */

WITH tb AS (SELECT name, COUNT(score) c1 FROM task2 WHERE score = 5 GROUP BY name),
tb2 AS(SELECT name, COUNT(score) c2 FROM task2 WHERE score = 2 GROUP BY NAME)
SELECT * FROM tb INNER JOIN tb2 USING(name)
WHERE c1 = 6 AND c2 = 2
