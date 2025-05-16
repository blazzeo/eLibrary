-- Create admin, user roles
<<<<<<< HEAD
create role moder;
create role dbuser;
=======
CREATE ROLE moder LOGIN PASSWORD 'master_moder';
CREATE ROLE dbuser LOGIN PASSWORD 'master_user';
>>>>>>> dev

--	АВТОРЫ
CREATE TABLE authors(
  author_id   SERIAL NOT NULL,
  first_name  VARCHAR(100) NOT NULL, 
  middle_name VARCHAR(50) NULL,
  last_name   VARCHAR(100) NULL,
  PRIMARY KEY(author_id)
);

--	КНИГИ
CREATE TABLE books (
  book_id        SERIAL NOT NULL, 
  title          VARCHAR(255) NOT NULL, 
  total_pages    INT NULL,
  rating         DECIMAL(4, 2) NULL CHECK (rating >= 0 AND rating <= 5),
  isbn           VARCHAR(13) NULL, 
  published_date DATE DEFAULT CURRENT_DATE,
  PRIMARY KEY(book_id)
);

-- Авторы книг
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

-- Жанры
CREATE TABLE genres (
  genre_id  SERIAL NOT NULL,
  genre     VARCHAR(255) NOT NULL, 
  parent_id INT NULL, 
  PRIMARY KEY(genre_id),
  CONSTRAINT fk_parent 
    FOREIGN KEY(parent_id) REFERENCES genres(genre_id)
);

-- Жанры книг
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

-- ТИП для пользователей
CREATE TYPE user_role AS ENUM ('admin', 'moder', 'user');
create TABLE users(
  user_id SERIAL NOT NULL,
  user_name VARCHAR(50) NOT NULL UNIQUE,
<<<<<<< HEAD
  user_password VARCHAR(255) NOT NULL,
  user_role user_role not null default 'user',
=======
  user_password TEXT NOT NULL,
  user_role user_role not null default 'user',
  registration_date date not null default CURRENT_DATE,
>>>>>>> dev
  PRIMARY KEY(user_id)
);

--	Брони
CREATE TABLE book_loans (
    loan_id SERIAL NOT NULL,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    borrow_date DATE NOT NULL DEFAULT CURRENT_DATE,
    return_date DATE not null,
    PRIMARY KEY (loan_id),
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id),
    CONSTRAINT fk_book
        FOREIGN KEY (book_id)
        REFERENCES books(book_id)
);

<<<<<<< HEAD
=======
--	СПИСОК ЗАПРОСОВ НА БРОНЬ
create table wishlist (
	book_id int not null,
	user_id int not null,
	request_date date not null default CURRENT_DATE,
	CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id),
    CONSTRAINT fk_book
        FOREIGN KEY (book_id)
        REFERENCES books(book_id)
);

--	СПИСОК ЗАПРОСОВ НА ПРОДЛЕНИЕ
create table extention_requests(
	book_id int not null,
	user_id int not null,
	request_date date,
	CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id),
    CONSTRAINT fk_book
        FOREIGN KEY (book_id)
        REFERENCES books(book_id)
);

>>>>>>> dev
--	drop all objects
drop table authors cascade;
drop table books cascade;
drop table book_authors cascade;
drop table genres cascade;
drop table book_genres cascade;
drop table users cascade;
drop table book_loans;
drop role admin;
drop role moder;
drop role user;
