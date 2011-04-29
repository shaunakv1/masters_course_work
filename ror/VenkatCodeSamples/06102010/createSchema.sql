drop table if exists graduates;
create table graduates (
  id INTEGER primary key,
  first_name varchar(100) not null,
  middle_name varchar(100) not null,
  last_name varchar(100) not null,
  year_of_graduation INTEGER not null
);

INSERT INTO graduates VALUES(null, 'Venkat', '', 'Subramaniam', 1995);
INSERT INTO graduates VALUES(null, 'John', '', 'Smith', 1990);
INSERT INTO graduates VALUES(null, 'Sara', '', 'Johnson', 1989);
INSERT INTO graduates VALUES(null, 'Bruce', '', 'Johnson', 1991);
