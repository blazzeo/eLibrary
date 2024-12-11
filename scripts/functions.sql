--	CHECK USER
create or replace function check_user(
	p_user_name varchar,
	p_user_password varchar
) returns varchar as $$
declare
	r_user_role varchar;
begin
	-- Check if the user exists with the provided username and password
        SELECT user_role
		into r_user_role
        FROM users
        WHERE user_name = p_user_name AND user_password = p_user_password;

    RETURN r_user_role;
end;
$$ LANGUAGE plpgsql;

--	CHECK AVAILABLE LOGIN
create or replace function check_available_login(
	p_user_name varchar
) returns BOOLEAN as $$
declare
	login_available boolean;
begin
	-- Check if the user exists with the provided username and password
    SELECT not EXISTS (
        SELECT 1
        FROM users
        WHERE user_name = p_user_name
    ) INTO login_available;

    RETURN login_available;
end;
$$ language plpgsql;

--	ADD USER - JSON
CREATE OR REPLACE FUNCTION add_users(
    p_user JSON
) RETURNS BOOLEAN AS $$
DECLARE
    v_user_name VARCHAR := p_user->>'user_name';
    v_user_password VARCHAR := p_user->>'user_password';
    v_user_id INT;
BEGIN
    -- Check if the username is available
    IF NOT check_available_login(v_user_name) THEN
        RETURN FALSE;  -- Username is not available
    END IF;

    -- Insert the new user into the users table
    INSERT INTO users (user_name, user_password) 
    VALUES (v_user_name, v_user_password)
    RETURNING user_id INTO v_user_id;

    -- If the insertion is successful, return true
    IF v_user_id IS NOT NULL THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;

EXCEPTION
    WHEN unique_violation THEN
        -- Handle the case where the username already exists
        RETURN FALSE;
    WHEN OTHERS THEN
        -- Handle any other exceptions
        RETURN FALSE;
END;
$$ LANGUAGE plpgsql;

--	BORROW BOOK
CREATE OR REPLACE FUNCTION borrow_book(p_user_name varchar, p_book_id INT)
RETURNS INT AS $$
DECLARE
    v_loan_date DATE := CURRENT_DATE;
    v_return_date DATE := v_loan_date + INTERVAL '1 month';
    r_borrow_id INT;
	p_user_id int;
BEGIN
	-- get user's id
	select user_id 
	into p_user_id 
	from users 
	where user_name = p_user_name;

    -- Check if the user exists
    IF NOT EXISTS (SELECT 1 FROM users WHERE user_id = p_user_id) THEN
        RAISE EXCEPTION 'User with ID % does not exist', p_user_id;
    END IF;

    -- Check if the book exists
    IF NOT EXISTS (SELECT 1 FROM books WHERE book_id = p_book_id) THEN
        RAISE EXCEPTION 'Book with ID % does not exist', p_book_id;
    END IF;

    -- Check if the book is already borrowed
    IF EXISTS (SELECT 1 FROM book_loans WHERE book_id = p_book_id AND return_date IS NULL) THEN
        RAISE EXCEPTION 'Book with ID % is already borrowed', p_book_id;
    END IF;

    -- Check if the user has already borrowed this book
    IF EXISTS (SELECT 1 FROM book_loans WHERE user_id = p_user_id AND book_id = p_book_id AND return_date IS NULL) THEN
        RAISE EXCEPTION 'User with ID % has already borrowed book with ID %', p_user_id, p_book_id;
    END IF;

    -- Insert the loan record
    INSERT INTO book_loans (user_id, book_id, loan_date, return_date)
    VALUES (p_user_id, p_book_id, v_loan_date, v_return_date)
    RETURNING loan_id INTO r_borrow_id;

    RETURN r_borrow_id;
END;
$$ LANGUAGE plpgsql;

--	RETURN BACK
CREATE OR REPLACE FUNCTION return_book(
    p_book_id INT
) RETURNS BOOLEAN AS $$
DECLARE
    deleted_row RECORD;  -- Variable to hold the deleted loan record
BEGIN
    -- Check if the user has borrowed this book
    IF NOT EXISTS (SELECT 1 FROM book_loans WHERE book_id = p_book_id) THEN
        RAISE EXCEPTION 'No active loan for book ID %', p_book_id;
    END IF;

    -- Attempt to delete the book loan and count the affected rows
    DELETE FROM book_loans
    WHERE book_id = p_book_id
    RETURNING * INTO deleted_row;

    -- Return TRUE if one or more rows were deleted, otherwise FALSE
    RETURN FOUND;

EXCEPTION
    WHEN OTHERS THEN
        -- Optionally handle exceptions and return FALSE on error
		RAISE NOTICE 'An error occurred: %', SQLERRM;
        RETURN FALSE;
END;
$$ LANGUAGE plpgsql;

--	ADD BOOK - json
create or replace function add_books(book JSON)
returns boolean as $$ 
declare
	title VARCHAR(255) := book->>'title';
  	total_pages INT := COALESCE(NULLIF(book->>'total_pages', ''), NULL)::INT;
  	rating DECIMAL(4, 2) := COALESCE(NULLIF(book->>'rating', ''), NULL)::DECIMAL(4, 2);
  	isbn VARCHAR(13) := book->>'isbn';
  	published_date DATE := NULLIF(book->>'published_date', '')::DATE;
begin
	INSERT INTO books (title, total_pages, rating, isbn, published_date)
  	VALUES (title, total_pages, rating, isbn, published_date);
  
  	RETURN TRUE;  -- Возвращаем TRUE, если вставка прошла успешно
EXCEPTION
  	WHEN OTHERS THEN
    RETURN FALSE;  -- Возвращаем FALSE в случае ошибки
end;
$$ language plpgsql;

--	DELETE BOOK
create or replace function delete_book(p_book_id INT)
returns boolean as $$
declare
	deleted_row RECORD; 
begin
	delete from books 
	where book_id = book_id
	returning * into deleted_row;  
  
  	RETURN deleted_row is not null;
EXCEPTION
  	WHEN OTHERS THEN
    RETURN FALSE;  -- Возвращаем FALSE в случае ошибки
end;
$$ language plpgsql;

--  GET BOOKS + USER's BOOKSHELF
CREATE OR REPLACE FUNCTION get_books(p_user_name varchar)
RETURNS TABLE(
    book_id INT,
    title VARCHAR,
    total_pages INT,
    rating DECIMAL(4, 2),
    isbn VARCHAR,
    published_date DATE,
    loan_status INT  -- 0: not borrowed, 1: borrowed by user, 2: borrowed by another user
) AS $$
DECLARE
    p_user_id INT;
BEGIN
    SELECT user_id INTO p_user_id FROM users WHERE user_name = p_user_name;

    RETURN query
    SELECT 
        b.book_id,
        b.title,
        b.total_pages,
        b.rating,
        b.isbn,
        b.published_date,
        CASE
            WHEN NOT EXISTS (
                SELECT 1 
                FROM book_loans bl 
                WHERE bl.book_id = b.book_id
            ) THEN 0  -- Book is not borrowed by anyone
            WHEN EXISTS (
                SELECT 1 
                FROM book_loans bl 
                WHERE bl.book_id = b.book_id AND bl.user_id = p_user_id
            ) THEN 1  -- Book is borrowed by the specified user
            ELSE 2  -- Book is borrowed by another user
        END AS loan_status
    FROM 
        books b;
END;
$$ LANGUAGE plpgsql;