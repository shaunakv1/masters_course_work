drop table if exists degrees;
create table degrees (
  id INTEGER primary key,
  title varchar(100) not null,
  abbr varchar(10) not null,
  years INTEGER not null
);

INSERT INTO degrees VALUES(null, 'Bachelor of Science', 'BS', 4);
INSERT INTO degrees VALUES(null, 'Master of Science', 'MS', 2);
INSERT INTO degrees VALUES(null, 'Doctor of Philosophy', 'Ph.D', 4);

drop table if exists professors;
create table professors (
  id INTEGER primary key,
  first_name varchar(100) not null,
  last_name varchar(100) not null
);

INSERT INTO professors VALUES(null, 'Bruce', 'Williams');
INSERT INTO professors VALUES(null, 'Kim', 'Johnson');

drop table if exists honors;
create table honors (
  id INTEGER primary key,
  title varchar(100) not null
);

INSERT INTO honors VALUES(null, '4pointer');
INSERT INTO honors VALUES(null, 'Speedy');

drop table if exists graduates;
create table graduates (
  id INTEGER primary key,
  first_name varchar(100) not null,
  middle_name varchar(100) not null,
  last_name varchar(100) not null,
  year_of_graduation INTEGER not null,
  degree_id INTEGER not null,
  faculty_id INTEGER
);

INSERT INTO graduates VALUES(null, 'Venkat', '', 'Subramaniam', 1995, 3, null);
INSERT INTO graduates VALUES(null, 'John', '', 'Smith', 1990, 2, null);
INSERT INTO graduates VALUES(null, 'Sara', '', 'Johnson', 1989, 1, null);
INSERT INTO graduates VALUES(null, 'Bruce', '', 'Johnson', 1991, 1, null);

drop table if exists graduates_honors;
create table graduates_honors (
  graduate_id INTEGER,
  honor_id INTEGER
);

INSERT INTO graduates_honors VALUES(1, 1);
INSERT INTO graduates_honors VALUES(1, 2);
INSERT INTO graduates_honors VALUES(2, 1);