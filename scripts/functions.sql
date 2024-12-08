--	CHECK USER
create or replace function check_user(
	p_user_name varchar,
	p_user_password varchar
) returns BOOLEAN as $$
declare
	user_exists BOOLEAN;
begin
	-- Check if the user exists with the provided username and password
    SELECT EXISTS (
        SELECT 1
        FROM users
        WHERE user_name = p_user_name AND user_password = p_user_password
    ) INTO user_exists;

    RETURN user_exists;
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

--	CREATE USER - json
CREATE OR REPLACE FUNCTION add_users(
    p_user JSON
) RETURNS BOOLEAN AS $$
DECLARE
    v_user_name varchar := p_user->>'user_name';
	v_user_password varchar := p_user->>'user_password';
	v_user_id int;
BEGIN
    -- Insert the new user into the users table
    INSERT INTO users (user_name, user_password) 
    VALUES (p_user_name, p_user_password)
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
CREATE OR REPLACE FUNCTION borrow_book(p_user_id INT, p_book_id INT)
RETURNS int AS $$
DECLARE
    v_loan_date DATE := CURRENT_DATE;
    v_return_date DATE := v_loan_date + INTERVAL '1 month';
	r_borrow_id int;
BEGIN
    -- Проверяем, существует ли пользователь
    IF NOT EXISTS (SELECT 1 FROM users WHERE user_id = p_user_id) THEN
        RAISE EXCEPTION 'User with ID % does not exist', p_user_id;
    END IF;

    -- Проверяем, существует ли книга
    IF NOT EXISTS (SELECT 1 FROM books WHERE book_id = p_book_id) THEN
        RAISE EXCEPTION 'Book with ID % does not exist', p_book_id;
    END IF;

    -- Проверяем, была ли книга уже взята
    IF EXISTS (SELECT 1 FROM book_loans WHERE book_id = p_book_id AND return_date IS NULL) THEN
        RAISE EXCEPTION 'Book with ID % is already borrowed', p_book_id;
    END IF;

    -- Вставляем запись о займе
    INSERT INTO book_loans (user_id, book_id, loan_date, return_date)
    VALUES (p_user_id, p_book_id, v_loan_date, v_return_date)
	returning loan_id into r_borrow_id;

	return r_borrow_id;
END;
$$ LANGUAGE plpgsql;


--	RETURN BACK
CREATE OR REPLACE FUNCTION return_book(
    p_book_id INT
) RETURNS BOOLEAN AS $$
DECLARE
    deleted_row RECORD;  -- Variable to hold the number of deleted rows
BEGIN
    -- Attempt to delete the book loan and count the affected rows
    DELETE FROM book_loans
    WHERE book_id = p_book_id
    RETURNING * INTO deleted_row;

    -- Return TRUE if one or more rows were deleted, otherwise FALSE
    RETURN deleted_row is not null;

EXCEPTION
    WHEN OTHERS THEN
        -- Optionally handle exceptions and return FALSE on error
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

-- REGISTER NEW USER
CREATE OR REPLACE FUNCTION create_database_user(username TEXT, password TEXT)
RETURNS BOOLEAN AS $$
DECLARE
    user_exists INT;
BEGIN
    -- Проверяем, существует ли пользователь
    SELECT COUNT(*) INTO user_exists 
    FROM pg_roles 
    WHERE rolname = username;

    IF user_exists > 0 THEN
        RAISE NOTICE 'Пользователь "%" уже существует.', username;
        RETURN FALSE;  -- Пользователь уже существует
    END IF;

    -- Создаем нового пользователя
    EXECUTE format('CREATE USER %I WITH PASSWORD %L', username, password);
    RAISE NOTICE 'Пользователь "%" успешно создан.', username;

    RETURN TRUE;  -- Пользователь успешно создан
EXCEPTION
    WHEN OTHERS THEN
        RAISE ERROR 'Ошибка при создании пользователя: %', SQLERRM;
        RETURN FALSE;  -- Возвращаем FALSE в случае ошибки
END;
$$ LANGUAGE plpgsql;
