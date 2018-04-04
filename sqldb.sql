CREATE TABLE event 
( 
  event_id INT NOT NULL, 
  event_name varchar(50) NOT NULL, 
  PRIMARY KEY (event_id) 
); 
 
INSERT INTO event VALUES (1, 'Mens 500'); 
INSERT INTO event VALUES (2, 'Womens 1000'); 
INSERT INTO event VALUES (3, 'Womens 500'); 
 
CREATE TABLE rounds 
( 
  round_id INT NOT NULL, 
  round_name varchar(50) NOT NULL, 
  PRIMARY KEY (round_id) 
); 
 
INSERT INTO rounds VALUES (1, 'Round1'); 
INSERT INTO rounds VALUES (2, 'Quarter Finals'); 
INSERT INTO rounds VALUES (3, 'SemiFinals'); 
INSERT INTO rounds VALUES (4, 'Finals'); 
 
CREATE TABLE country 
( 
  country_id varchar(3) NOT NULL, 
  country_name varchar(50) NOT NULL, 
  PRIMARY KEY (country_id) 
); 

 
INSERT INTO country VALUES ('JPN','Japan'); 
INSERT INTO country VALUES ('KOR','Korea'); 
INSERT INTO country VALUES ('CZE','Czech Republic'); 
INSERT INTO country VALUES ('AUT','Austria'); 
INSERT INTO country VALUES ('USA','United States of America'); 
INSERT INTO country VALUES ('NED','Netherlands'); 
INSERT INTO country VALUES ('OAR','Olympic Athlete from Russia'); 
INSERT INTO country VALUES ('CHN','China'); 
INSERT INTO country VALUES ('CAN','Canada'); 
INSERT INTO country VALUES ('NOR','Norway'); 
INSERT INTO country VALUES ('FIN','Finland'); 
INSERT INTO country VALUES ('GER','Germany'); 
INSERT INTO country VALUES ('HUN', 'Hungary'); 
INSERT INTO country VALUES ('ITA', 'Italy'); 
INSERT INTO country VALUES ('GBR', 'Great Britain'); 
INSERT INTO country VALUES ('POL', 'Poland'); 
INSERT INTO country VALUES ('KAZ', 'Kazakhstan'); 
INSERT INTO country VALUES ('LAT', 'Latvia'); 
 
CREATE TABLE sport 
( 
  sport_id varchar(50) NOT NULL, 
  sport_name varchar(50) NOT NULL, 
  PRIMARY KEY (sport_id) 
); 
 
INSERT INTO sport VALUES ('STSS', 'Short Track Speed Skating'); 
INSERT INTO sport VALUES ('C', 'Curling'); 

 
CREATE TABLE athletes 
( 
  athlete_id INT NOT NULL, 
  athlete_name varchar(50) NOT NULL, 
  athlete_gender varchar(50) NOT NULL, 
  athlete_birthday DATE NOT NULL, 
  athlete_weight_kg INT NOT NULL, 
  athlete_height_cm INT NOT NULL, 
  country_id varchar(3) NOT NULL, 
  PRIMARY KEY (athlete_id), 
  FOREIGN KEY (country_id) REFERENCES country(country_id) 
); 
 
INSERT INTO athletes VALUES (1,'Dajing Wu', 'M', '1994-07-24', 74, 182, 'CHN'); 
INSERT INTO athletes VALUES (2, 'Daeheon Hwang', 'M', '1999-07-05', 73, 179, 'KOR'); 
INSERT INTO athletes VALUES (3, 'Hyojun Lim', 'M', '1996-05-29', 64, 168, 'KOR'); 
INSERT INTO athletes VALUES (4, 'Samuel Girard', 'M', '1996-06-26', 72, 178, 'CAN'); 
INSERT INTO athletes VALUES (5, 'Shaolin Sandor Liu', 'M', '1995-11-20', 81, 183, 'HUN'); 
INSERT INTO athletes VALUES (6, 'Ren Ziwei', 'M', '1997-06-03', 73, 177, 'CHN'); 
INSERT INTO athletes VALUES (7, 'Daan Breeuwsma', 'M', '1987-12-29', 75, 181, 'NED'); 
INSERT INTO athletes VALUES (8, 'Ryosuke Sakazume', 'M', '1990-03-21', 72, 181, 'JPN'); 
INSERT INTO athletes VALUES (9, 'Abzal Azhgaliyev', 'M', '1992-06-30', 69, 178, 'KAZ'); 
INSERT INTO athletes VALUES (10,'Roberts Zvejnieks', 'M', '1996-06-26', 72, 178, 'LAT'); 
INSERT INTO athletes VALUES (11,'Jamie Macdonald', 'F', '1994-01-22', 55, 159, 'USA'); 
INSERT INTO athletes VALUES (12,'Yara Van Kerkhof', 'F', '1990-05-31', 52, 163, 'NED'); 
INSERT INTO athletes VALUES (13,'Kim Boutin', 'F', '1994-12-16', 58, 165, 'CAN'); 
INSERT INTO athletes VALUES (14,'Elise Christie', 'F', '1990-08-13', 57, 160, 'GBR'); 
INSERT INTO athletes VALUES (15,'Sofia Prosvirnova', 'F', '1997-12-20', 61, 168, 'OAR'); 
INSERT INTO athletes VALUES (16,'Choi Minjeong', 'F', '1998-09-09', 54, 164, 'KOR'); 
INSERT INTO athletes VALUES (17,'Qu Chunyu', 'F', '1996-07-20', 63, 170, 'CHN'); 
INSERT INTO athletes VALUES (18,'Arianna Fontana', 'F', '1990-04-14', 60, 163, 'ITA'); 
INSERT INTO athletes VALUES (19,'Fan Kexin', 'F', '1993-09-19', 58, 171, 'CHN'); 
INSERT INTO athletes VALUES (20,'Martina Valcepina', 'F', '1992-07-04', 60, 168, 'ITA'); 
INSERT INTO athletes VALUES (21,'Suzanne Schulting', 'F', '1997-09-25', 65, 170, 'NED'); 
INSERT INTO athletes VALUES (22,'Kim Alang', 'F', '1995-08-22', 60, 172, 'KOR'); 
INSERT INTO athletes VALUES (23,'Shim Sukhee', 'F', '1997-01-30', 61, 175, 'KOR'); 
INSERT INTO athletes VALUES (24,'Valerie Maltais', 'F', '1990-07-04', 62, 165, 'CAN'); 
INSERT INTO athletes VALUES (25,'Li Jinyu', 'F', '2001-01-30', 58, 161, 'CHN'); 
INSERT INTO athletes VALUES (26,'Ekaterina Efremenkova', 'F', '1997-12-31', 58, 168, 'OAR'); 
 
 
 
 
CREATE TABLE results 
( 
  heat INT NOT NULL, 
  times TIME(3) NOT NULL, 
  athlete_id INT NOT NULL, 
  event_id INT NOT NULL, 
  round_id INT NOT NULL, 
  PRIMARY KEY (athlete_id, event_id, round_id), 
  FOREIGN KEY (athlete_id) REFERENCES athletes(athlete_id), 
  FOREIGN KEY (event_id) REFERENCES event(event_id), 
  FOREIGN KEY (round_id) REFERENCES rounds(round_id) 
); 
 
 
INSERT INTO results VALUES(1, '00:00:39.584', 1, 1, 4); 
INSERT INTO results VALUES(1, '00:00:39.845', 2, 1, 4); 
INSERT INTO results VALUES(1, '00:00:39.919', 3, 1, 4); 
INSERT INTO results VALUES(1, '00:00:39.987', 4, 1, 4); 
INSERT INTO results VALUES(2, '00:00:40.651', 5, 1, 4); 
INSERT INTO results VALUES(2, '00:00:40.694', 6, 1, 4); 
INSERT INTO results VALUES(2, '00:00:40.835', 7, 1, 4); 
INSERT INTO results VALUES(2, '00:00:40.985', 8, 1, 4); 
INSERT INTO results VALUES(1, '00:00:40.087', 1, 1, 3); 
INSERT INTO results VALUES(2, '00:00:39.800', 1, 1, 2); 
INSERT INTO results VALUES(1, '00:00:40.264', 1, 1, 1); 
INSERT INTO results VALUES(2, '00:00:40.108', 2, 1, 3); 
INSERT INTO results VALUES(2, '00:00:40.861', 2, 1, 2); 
INSERT INTO results VALUES(7, '00:00:40.758', 2, 1, 1); 
INSERT INTO results VALUES(2, '00:00:40.132', 3, 1, 3); 
INSERT INTO results VALUES(4, '00:00:40.400', 3, 1, 2); 
INSERT INTO results VALUES(4, '00:00:40.418', 3, 1, 1); 
INSERT INTO results VALUES(1, '00:00:40.185', 4, 1, 3); 
INSERT INTO results VALUES(3, '00:00:40.477', 4, 1, 2); 
INSERT INTO results VALUES(2, '00:00:40.493', 4, 1, 1); 
INSERT INTO results VALUES(1, '00:00:40.399', 5, 1, 3); 
INSERT INTO results VALUES(1, '00:00:40.471', 5, 1, 2); 
INSERT INTO results VALUES(8, '00:00:40.650', 5, 1, 1); 
INSERT INTO results VALUES(2, '00:00:40.418', 6, 1, 3); 
INSERT INTO results VALUES(1, '00:00:40.032', 6, 1, 2); 
INSERT INTO results VALUES(5, '00:00:40.294', 6, 1, 1); 
INSERT INTO results VALUES(1, '00:00:40.775', 7, 1, 3); 
INSERT INTO results VALUES(4, '00:00:40.677', 7, 1, 2); 
INSERT INTO results VALUES(4, '00:00:40.806', 7, 1, 1); 
INSERT INTO results VALUES(2, '00:00:40.434', 8, 1, 3); 
INSERT INTO results VALUES(3, '00:00:40.563', 8, 1, 2); 
INSERT INTO results VALUES(6, '00:00:40.658', 8, 1, 1); 
INSERT INTO results VALUES(1, '00:00:40.835', 9, 1, 3); 
Insert INTO results Values(4, '00:00:41.616', 9, 1, 2); 
Insert INTO results VALUES(6, '00:00:43.388', 9, 1, 1); 
INSERT INTO results VALUES(2, '00:00:40.904', 10, 1, 2); 
INSERT INTO results VALUES(2, '00:00:40.562', 10, 1, 1); 
INSERT INTO results VALUES(1, '00:00:42.569', 18, 3, 4); 
INSERT INTO results VALUES(1, '00:00:42.635', 18, 3, 3); 
INSERT INTO results VALUES(1, '00:00:43.128', 18, 3, 2);  
INSERT INTO results VALUES(2, '00:00:43.214', 18, 3, 1); 
INSERT INTO results VALUES(1, '00:00:43.256', 12, 3, 4); 
INSERT INTO results VALUES(2, '00:00:43.182', 12, 3, 3); 
INSERT INTO results VALUES(1, '00:00:43.197', 12, 3, 2); 
INSERT INTO results VALUES(3, '00:00:43.430', 12, 3, 1); 
INSERT INTO results VALUES(1, '00:00:43.881', 13, 3, 4); 
INSERT INTO results VALUES(2, '00:00:43.234', 13, 3, 3); 
INSERT INTO results VALUES(2, '00:00:42.789', 13, 3, 2); 
INSERT INTO results VALUES(1, '00:00:43.634', 13, 3, 1); 
INSERT INTO results VALUES(1, '00:01:23.063', 14, 3, 4); 
INSERT INTO results VALUES(2, '00:00:43.184', 14, 3, 3); 
INSERT INTO results VALUES(2, '00:00:42.703', 14, 3, 2); 
INSERT INTO results VALUES(4, '00:00:42.872', 14, 3, 1); 
INSERT INTO results VALUES(1, '00:00:43.219', 15, 3, 3); 
INSERT INTO results VALUES(3, '00:00:43.366', 15, 3, 2); 
INSERT INTO results VALUES(3, '00:00:43.376', 15, 3, 1); 
INSERT INTO results VALUES(1, '00:00:42.422', 16, 3, 3); 
INSERT INTO results VALUES(4, '00:00:42.996', 16, 3, 2); 
INSERT INTO results VALUES(8, '00:00:42.870', 16, 3, 1); 
INSERT INTO results VALUES(4, '00:00:42.954', 17, 3, 2); 
INSERT INTO results VALUES(4, '00:00:42.971', 17, 3, 1); 
INSERT INTO results VALUES(5, '00:00:43.350', 19, 3, 1);  
INSERT INTO results VALUES(3, '00:00:43.385', 19, 3, 2); 
INSERT INTO results VALUES(6, '00:00:43.698', 20, 3, 1); 
INSERT INTO results VALUES(4, '00:00:43.023', 20, 3, 2); 
INSERT INTO results VALUES(5, '00:00:43.724', 22, 3, 1); 
INSERT INTO results VALUES(4, '00:00:43.048', 23, 3, 1); 
INSERT INTO results VALUES(6, '00:01:43.364', 12, 2, 1); 
INSERT INTO results VALUES(4, '00:01:29.670', 12, 2, 2); 
INSERT INTO results VALUES(8, '00:01:32.402', 13, 2, 1); 
INSERT INTO results VALUES(1, '00:01:30.013', 13, 2, 2); 
INSERT INTO results VALUES(1, '00:01:29.065', 13, 2, 3); 
INSERT INTO results VALUES(1, '00:01:29.956', 13, 2, 4); 
INSERT INTO results VALUES(2, '00:01:31.190', 16, 2, 1); 
INSERT INTO results VALUES(3, '00:01:30.940', 16, 2, 2); 
INSERT INTO results VALUES(2, '00:01:31.131', 16, 2, 3); 
INSERT INTO results VALUES(1, '00:01:42.434', 16, 2, 4); 
INSERT INTO results VALUES(2, '00:01:31.279', 17, 2, 1); 
INSERT INTO results VALUES(1, '00:01:31.284', 17, 2, 2); 
INSERT INTO results VALUES(4, '00:01:30.676', 18, 2, 1); 
INSERT INTO results VALUES(2, '00:01:30.074', 18, 2, 2); 
INSERT INTO results VALUES(1, '00:01:29.156', 18, 2, 3); 
INSERT INTO results VALUES(1, '00:01:30.656', 18, 2, 4); 
INSERT INTO results VALUES(3, '00:01:29.519', 21, 2, 1); 
INSERT INTO results VALUES(4, '00:01:29.377', 21, 2, 2); 
INSERT INTO results VALUES(2, '00:01:30.949', 21, 2, 3); 
INSERT INTO results VALUES(1, '00:01:29.778', 21, 2, 4);  
INSERT INTO results VALUES(7, '00:01:30.459', 22, 2, 1); 
INSERT INTO results VALUES(1, '00:01:30.137', 22, 2, 2); 
INSERT INTO results VALUES(1, '00:01:29.212', 22, 2, 3); 
INSERT INTO results VALUES(1, '00:01:34.940', 23, 2, 1); 
INSERT INTO results VALUES(4, '00:01:29.159', 23, 2, 2); 
INSERT INTO results VALUES(2, '00:01:30.974', 23, 2, 3); 
INSERT INTO results VALUES(4, '00:01:30.773', 24, 2, 1); 
INSERT INTO results VALUES(2, '00:01:30.131', 24, 2, 2); 
INSERT INTO results VALUES(6, '00:01:32.235', 25, 2, 1); 
INSERT INTO results VALUES(2, '00:01:30.175', 25, 2, 2); 
INSERT INTO results VALUES(3, '00:01:29.598', 26, 2, 1); 
INSERT INTO results VALUES(4, '00:01:29.466', 26, 2, 2); 
 
 
 
   
   
   
CREATE TABLE coach 
( 
  coach_id INT NOT NULL, 
  coach_name varchar(50) NOT NULL, 
  sport_id varchar(10) NOT NULL, 
  country_id varchar(3) NOT NULL, 
  PRIMARY KEY (coach_id), 
  FOREIGN KEY (sport_id) REFERENCES sport(sport_id), 
  FOREIGN KEY (country_id) REFERENCES country(country_id) 
); 
 

 
INSERT INTO coach VALUES(1, 'Jonathan Guilmette', 'STSS', 'JPN'); 
INSERT INTO coach VALUES(2, 'Anthony Barthell', 'STSS', 'USA'); 
INSERT INTO coach VALUES(3, 'Alex Izykowski', 'STSS', 'USA'); 
INSERT INTO coach VALUES(4, 'Yoon Jae-Myung', 'STSS', 'KOR'); 
INSERT INTO coach VALUES(5, 'Derrick Campbell', 'STSS', 'CAN'); 
INSERT INTO coach VALUES(6, 'Chun Jae-su', 'STSS', 'HUN'); 
INSERT INTO coach VALUES(7, 'Li Yan', 'STSS', 'CHN'); 
INSERT INTO coach VALUES(8, 'Jeroen Otter', 'STSS', 'NED'); 
INSERT INTO coach VALUES(9, 'Madygali Karsybekov', 'STSS', 'KAZ'); 
INSERT INTO coach VALUES(10, 'Evita Krievane', 'STSS', 'LAT'); 
INSERT INTO coach VALUES(11, 'Stuart Horsepool', 'STSS', 'LAT'); 
INSERT INTO coach VALUES(12, 'Nicky Gooch', 'STSS', 'GBR'); 
INSERT INTO coach VALUES(13, 'Stewart Laing', 'STSS', 'GBR'); 
INSERT INTO coach VALUES(14, 'Kenan Gouadec', 'STSS', 'ITA'); 
INSERT INTO coach VALUES(15, 'Andrey Maksimov', 'STSS', 'OAR'); 
INSERT INTO coach VALUES(16, 'Svetlana Tretyakova', 'STSS', 'OAR'); 
 
 
 
 
 
 
 
 
CREATE TABLE participate_in 
( 
  athlete_id INT NOT NULL, 
  sport_id varchar(10) NOT NULL, 
  PRIMARY KEY (athlete_id, sport_id), 
  FOREIGN KEY (athlete_id) REFERENCES athletes(athlete_id), 
  FOREIGN KEY (sport_id) REFERENCES sport(sport_id) 
); 
 
INSERT INTO participate_in VALUES(1, 'STSS'); 
INSERT INTO participate_in VALUES(2, 'STSS'); 
INSERT INTO participate_in VALUES(3, 'STSS'); 
INSERT INTO participate_in VALUES(4, 'STSS'); 
INSERT INTO participate_in VALUES(5, 'STSS'); 
INSERT INTO participate_in VALUES(6, 'STSS'); 
INSERT INTO participate_in VALUES(7, 'STSS'); 
INSERT INTO participate_in VALUES(8, 'STSS'); 
INSERT INTO participate_in VALUES(9, 'STSS'); 
INSERT INTO participate_in VALUES(10, 'STSS'); 
INSERT INTO participate_in VALUES(11, 'STSS'); 
INSERT INTO participate_in VALUES(12, 'STSS'); 
INSERT INTO participate_in VALUES(13, 'STSS'); 
INSERT INTO participate_in VALUES(14, 'STSS'); 
INSERT INTO participate_in VALUES(15, 'STSS'); 
INSERT INTO participate_in VALUES(16, 'STSS'); 
INSERT INTO participate_in VALUES(17, 'STSS'); 
INSERT INTO participate_in VALUES(18, 'STSS'); 
INSERT INTO participate_in VALUES(19, 'STSS'); 
INSERT INTO participate_in VALUES(20, 'STSS'); 
INSERT INTO participate_in VALUES(21, 'STSS'); 
INSERT INTO participate_in VALUES(22, 'STSS'); 
INSERT INTO participate_in VALUES(23, 'STSS'); 
INSERT INTO participate_in VALUES(25, 'STSS'); 
INSERT INTO participate_in VALUES(26, 'STSS'); 