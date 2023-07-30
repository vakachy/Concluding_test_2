
#DROP DATABASE IF EXISTS man_s_friends;
CREATE DATABASE IF NOT EXISTS man_s_friends;
USE man_s_friends;


CREATE TABLE IF NOT EXISTS family
(id INT PRIMARY KEY,
family_name VARCHAR(45) UNIQUE
);

INSERT family (id, family_name)
 VALUES
	(1, "кот"),
    (2, "собака"),
    (3, "хомяк"),
    (4, "лошадь"),
    (5, "верблюд"),
    (6, "осел");


CREATE TABLE IF NOT EXISTS `type`
(
id INT PRIMARY KEY,
type_name ENUM('домашнее животное', 'не домашнее животное')
);

INSERT `type` (id, type_name)
 VALUES
	(1, "домашнее животное"),
    (2, "не домашнее животное");


CREATE TABLE IF NOT EXISTS kind
(
id INT PRIMARY KEY,
kind_name ENUM("вьючное животное", "не вьючное животное")
);

INSERT kind (id, kind_name)
 VALUES
	(1, "вьючное животное"),
    (2, "не вьючное животное");
    


CREATE TABLE IF NOT EXISTS cat
(
id INT PRIMARY KEY AUTO_INCREMENT,
family_id INT,
type_id INT,
kind_id INT,
`name` VARCHAR(45),
command VARCHAR(45),
birth_date DATE,
FOREIGN KEY (family_id)  REFERENCES family (id),
FOREIGN KEY (type_id)  REFERENCES `type`(id),
FOREIGN KEY (kind_id)  REFERENCES kind (id)
);

INSERT cat (family_id, type_id, kind_id, `name`, command, birth_date)
 VALUES
	(1, 1, 2, "Барсик", "брысь", "2021-09-06"),
    (1, 1, 2, "Муся", "брысь", "2017-04-14"),
    (1, 1, 2, "Багира", "брысь", "2018-10-21");



CREATE TABLE IF NOT EXISTS dog
(
id INT PRIMARY KEY AUTO_INCREMENT,
family_id INT,
type_id INT,
kind_id INT,
FOREIGN KEY (family_id)  REFERENCES family (id),
FOREIGN KEY (type_id)  REFERENCES `type`(id),
FOREIGN KEY (kind_id)  REFERENCES kind (id),
`name` VARCHAR(45),
command VARCHAR(45),
birth_date DATE
);

INSERT dog (family_id, type_id, kind_id, `name`, command, birth_date)
 VALUES
	(2, 1, 2, "Полкан", "фас, ко мне, лежать, голос", "2018-06-17"),
    (2, 1, 2, "Бобик", "фас, ко мне, лежать, голос", "2022-05-05"),
    (2, 1, 2, "Айза", "фас, ко мне, лежать, голос", "2020-07-30");



CREATE TABLE IF NOT EXISTS hamster
(
id INT PRIMARY KEY AUTO_INCREMENT,
family_id INT,
type_id INT,
kind_id INT,
FOREIGN KEY (family_id)  REFERENCES family (id),
FOREIGN KEY (type_id)  REFERENCES `type`(id),
FOREIGN KEY (kind_id)  REFERENCES kind (id),
`name` VARCHAR(45),
command VARCHAR(45),
birth_date DATE
);

INSERT hamster (family_id, type_id, kind_id, `name`, command, birth_date)
 VALUES
	(3, 1, 2, "Хома", "фу", "2023-05-13"),
    (3, 1, 2, "Сильвер", "фу", "2022-08-09"),
    (3, 1, 2, "Шумахер", "фу", "2021-07-23");



CREATE TABLE IF NOT EXISTS horse
(
id INT PRIMARY KEY AUTO_INCREMENT,
family_id INT,
type_id INT,
kind_id INT,
FOREIGN KEY (family_id)  REFERENCES family (id),
FOREIGN KEY (type_id)  REFERENCES `type`(id),
FOREIGN KEY (kind_id)  REFERENCES kind (id),
`name` VARCHAR(45),
command VARCHAR(45),
birth_date DATE
);

INSERT horse (family_id, type_id, kind_id, `name`, command, birth_date)
 VALUES
	(4, 1, 1, "Буран", "неа, еще, стоп, но", "2019-04-02"),
    (4, 1, 1, "Мерлин", "неа, еще, стоп, но", "2015-05-17"),
    (4, 1, 1, "Сахара", "неа, еще, стоп, но", "2020-08-20");



CREATE TABLE IF NOT EXISTS camel
(
id INT PRIMARY KEY AUTO_INCREMENT,
family_id INT,
type_id INT,
kind_id INT,
FOREIGN KEY (family_id)  REFERENCES family (id),
FOREIGN KEY (type_id)  REFERENCES `type`(id),
FOREIGN KEY (kind_id)  REFERENCES kind (id),
`name` VARCHAR(45),
command VARCHAR(45),
birth_date DATE
);

INSERT camel (family_id, type_id, kind_id, `name`, command, birth_date)
 VALUES
	(5, 1, 1, "Джаред", "гит, каш, стоп, но", "2015-03-10"),
    (5, 1, 1, "Вася", "гит, каш, стоп, но", "2017-04-01"),
    (5, 1, 1, "Жуля", "гит, каш, стоп, но", "2021-03-24");


CREATE TABLE IF NOT EXISTS donkey
(
id INT PRIMARY KEY AUTO_INCREMENT,
family_id INT,
type_id INT,
kind_id INT,
FOREIGN KEY (family_id)  REFERENCES family (id),
FOREIGN KEY (type_id)  REFERENCES `type`(id),
FOREIGN KEY (kind_id)  REFERENCES kind (id),
`name` VARCHAR(45),
command VARCHAR(45),
birth_date DATE
);

INSERT donkey (family_id, type_id, kind_id, `name`, command, birth_date)
 VALUES
	(6, 1, 1, "Пуля", "но, стоп", "2016-04-04"),
    (6, 1, 1, "Джексон", "но, стоп", "2018-05-19"),
    (6, 1, 1, "Фасоль", "но, стоп", "2022-06-06");


-- создать представление для упрощения последующих операций
-- представление объединяет все  базовые таблицы с животными

DROP VIEW IF EXISTS animal_aux;
CREATE VIEW animal_aux
AS
SELECT  * FROM cat
UNION ALL
SELECT * FROM dog
UNION ALL
SELECT * FROM hamster
UNION ALL
SELECT * FROM horse
UNION ALL
SELECT * FROM camel
UNION ALL
SELECT * FROM donkey;


-- создать представление для упрощения последующих операций
-- представление создано на основе представления animal_aux
DROP VIEW IF EXISTS animal;
CREATE VIEW animal
AS
SELECT
	f.family_name,
    a.`name`,
    a.command,
    a.birth_date,
	t.type_name,
	k.kind_name
FROM animal_aux AS a
JOIN `type` AS t ON t.id = a.type_id
JOIN kind AS k ON k.id = a.kind_id
JOIN family AS f ON f.id = a.family_id;

#SELECT * FROM animal;

/*
clause_10. Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой питомник на зимовку, объединить таблицы лошади, и ослы в одну таблицу.
*/
#DROP TABLE IF EXISTS clause_10;
CREATE TABLE IF NOT EXISTS clause_10
WITH no_camel AS (
SELECT
	a.*
FROM animal AS a
WHERE a.family_name !='верблюд'
)
SELECT
	nd.*
FROM no_camel nd
WHERE nd.family_name IN ('лошадь', 'осел')
ORDER BY nd.family_name;

SELECT * FROM clause_10;

/*
clause_11. Создать новую таблицу “молодые животные” в которую попадут все животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью
до месяца подсчитать возраст животных в новой таблице
*/

-- 365 == 1 год, 1095 == 3 года
-- 365.2468 -- среднестатистическое количество дней в году
-- 30.44 -- среднестатистическое количество дней в месяце
-- использовать представление animal

CREATE TABLE IF NOT EXISTS young_animal
SELECT
	`name`,
    birth_date,    
	concat(
    truncate(datediff(curdate(), birth_date)/365.2468,0),
    "; ",
    truncate(datediff(curdate(), birth_date)%365.2468/30.44, 0)
    )
    AS `age (лет; месяцев)`
FROM animal
WHERE datediff(curdate(), birth_date) BETWEEN 365 AND 1095; 

SELECT * FROM young_animal;

/*
clause_12. Объединить все таблицы в одну, при этом сохраняя поля, указывающие на прошлую принадлежность к старым таблицам.
*/
#DROP TABLE IF EXISTS special_table;
CREATE TABLE IF NOT EXISTS special_table
SELECT
	cat.`name` 'cat_table: name'
    , cat.command 'cat_table: command'
    , cat.birth_date 'cat_table: birth_date'
    , dog.`name` 'dog_table: name'
    , dog.command 'dog_table: command'
    , dog.birth_date 'dog_table: birth_date'
    , h.`name` 'hamster_table: name'
    , h.command 'hamster_table: command'
    , h.birth_date 'hamster_table: birth_date'
    , ho.`name` 'horse_table: name'
    , ho.command 'horse_table: command'
    , ho.birth_date 'horse_table: birth_date'
    , ca.`name` 'camel_table: name'
    , ca.command 'camel_table: command'
    , ca.birth_date 'camel_table: birth_date'
    , d.`name` 'donkey_table: name'
    , d.command 'donkey_table: command'
    , d.birth_date 'donkey_table: birth_date'
FROM
	cat
    , dog
    , hamster h
    , horse ho
    , camel ca
    , donkey d
;
SELECT * FROM special_table;