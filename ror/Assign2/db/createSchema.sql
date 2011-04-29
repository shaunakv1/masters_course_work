drop table if exists publishers;
create table publishers (
  id INTEGER primary key,
  name varchar(100) not null
);

INSERT INTO publishers VALUES(null, 'Tata');
INSERT INTO publishers VALUES(null, 'Allied');
INSERT INTO publishers VALUES(null, 'MGG');


drop table if exists authors;
create table authors (
  id INTEGER primary key,
  first_name varchar(100) not null,
  last_name varchar(100) not null
);

INSERT INTO authors VALUES(null, 'Venkat', 'Subramaniam');
INSERT INTO authors VALUES(null, 'Shaunak', 'Vairagare');
INSERT INTO authors VALUES(null, 'Vasundhara', 'Singh');


drop table if exists books;
create table books (
  id INTEGER primary key,
  title varchar(100) not null,
  publisher_id INTEGER not null
);

INSERT INTO books VALUES(null, 'Book of Ruby',1);
INSERT INTO books VALUES(null, 'Book of Music',2);
INSERT INTO books VALUES(null, 'Book of Cooking',3);
INSERT INTO books VALUES(null, 'C/C++',3);


drop table if exists authors_books;
create table authors_books(
  author_id INTEGER,
  book_id INTEGER
);

INSERT INTO authors_books VALUES(1,1);
INSERT INTO authors_books VALUES(2,2);
INSERT INTO authors_books VALUES(3,3);
INSERT INTO authors_books VALUES(3,4);

