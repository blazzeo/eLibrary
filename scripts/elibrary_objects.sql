-- Create admin, user roles
create role dbadmin with LOGIN password 'masteradmin' SUPERUSER;
create role dbuser with LOGIN password 'masteruser';

--	create tables

CREATE TABLE authors( 
  author_id   SERIAL NOT NULL,
  first_name  VARCHAR(100) NOT NULL, 
  middle_name VARCHAR(50) NULL, 
  last_name   VARCHAR(100) NULL,
  PRIMARY KEY(author_id)
);


CREATE TABLE books(
  book_id        SERIAL NOT NULL, 
  title          VARCHAR(255) NOT NULL, 
  total_pages    INT NULL, 
  rating         DECIMAL(4, 2) NULL, 
  isbn           VARCHAR(13) NULL, 
  published_date DATE, 
  PRIMARY KEY(book_id)
);


CREATE TABLE book_authors (
  book_id   INT NOT NULL, 
  author_id INT NOT NULL, 
  PRIMARY KEY(book_id, author_id), 
  CONSTRAINT fk_book 
    FOREIGN KEY(book_id) 
    REFERENCES books(book_id) ON DELETE CASCADE, 
  CONSTRAINT fk_author 
    FOREIGN KEY(author_id) 
    REFERENCES authors(author_id) ON DELETE CASCADE
);


CREATE TABLE genres (
  genre_id  SERIAL NOT NULL,
  genre     VARCHAR(255) NOT NULL, 
  parent_id INT NULL, 
  PRIMARY KEY(genre_id),
  CONSTRAINT fk_parent 
    FOREIGN KEY(parent_id) REFERENCES genres(genre_id)
);


CREATE TABLE book_genres(
  book_id  INT NOT NULL, 
  genre_id INT NOT NULL, 
  PRIMARY KEY(book_id, genre_id), 
  CONSTRAINT fk_book_genre
    FOREIGN KEY(book_id) 
    REFERENCES books(book_id) ON DELETE CASCADE, 
  CONSTRAINT fk_genre_book
    FOREIGN KEY(genre_id) 
    REFERENCES genres(genre_id) ON DELETE CASCADE
);


CREATE TABLE users(
  user_id SERIAL NOT NULL,
  user_name VARCHAR(50) NOT NULL UNIQUE,
  user_password VARCHAR(255) NOT NULL,
  PRIMARY KEY(user_id)
);


CREATE TABLE book_loans (
    loan_id SERIAL NOT NULL,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    loan_date DATE NOT NULL DEFAULT CURRENT_DATE,
    return_date DATE NULL,
    PRIMARY KEY (loan_id),
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id),
    CONSTRAINT fk_book
        FOREIGN KEY (book_id)
        REFERENCES books(book_id)
);

--	grant privilleges 
grant connect on database elibrary to dbuser;
grant connect on database elibrary to dbuser;

GRANT SELECT ON books TO dbuser;

--	drop all objects

drop table authors cascade;
drop table books cascade;
drop table book_authors cascade;
drop table genres cascade;
drop table book_genres cascade;
drop table users cascade;
drop table book_loans cascade;
drop role dbadmin;
drop role dbuser;
