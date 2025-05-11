--	CHECK USER
create or replace function authentificate(
	p_name varchar,
	p_password varchar
) returns varchar as $$
declare
	r_user_role varchar;
begin
	-- Check if the user exists with the provided username and password
        SELECT user_role
		into r_user_role
        FROM users
        WHERE user_name = p_name AND user_password = p_password;

    RETURN r_user_role;
end;
$$ LANGUAGE plpgsql;

--	CHECK AVAILABLE LOGIN
create or replace function check_available_login(
	p_name varchar
) returns BOOLEAN as $$
declare
	login_available boolean;
begin
	-- Check if the user exists with the provided username and password
    SELECT not EXISTS (
        SELECT 1
        FROM users
        WHERE user_name = p_name
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

--	ADD BOOK - json
create or replace function add_books(book JSON)
returns boolean as $$ 
declare
    title VARCHAR(255) := book->>'title';
    total_pages INT := COALESCE(NULLIF(book->>'total_pages', ''), NULL)::INT;
    rating DECIMAL(4, 2) := COALESCE(NULLIF(book->>'rating', ''), NULL)::DECIMAL(4, 2);
    isbn VARCHAR(13) := COALESCE(NULLIF(book->>'isbn', ''), NULL);
    published_date DATE := NULLIF(book->>'published_date', '')::DATE;
begin
    -- Вставка данных в таблицу books
    INSERT INTO books (title, total_pages, rating, isbn, published_date)
    VALUES (title, total_pages, rating, isbn, published_date);

    -- Если вставка прошла успешно, возвращаем TRUE
    RETURN TRUE;
EXCEPTION
    WHEN OTHERS THEN
        -- Логирование ошибки
        RAISE NOTICE 'Error: %', SQLERRM;
        -- Возвращаем FALSE в случае ошибки
        RETURN FALSE;
end;
$$ language plpgsql;

--	BORROW BOOK
CREATE OR REPLACE FUNCTION borrow_book(p_user_name varchar, p_book_id INT, p_return_date DATE)
RETURNS INT AS $$
DECLARE
    v_loan_date DATE := CURRENT_DATE;
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
    IF EXISTS (SELECT 1 FROM book_loans WHERE book_id = p_book_id) THEN
        RAISE EXCEPTION 'Book with ID % is already borrowed', p_book_id;
    END IF;

    -- Check if the user has already borrowed this book
    IF EXISTS (SELECT 1 FROM book_loans WHERE user_id = p_user_id AND book_id = p_book_id) THEN
        RAISE EXCEPTION 'User with ID % has already borrowed book with ID %', p_user_id, p_book_id;
    END IF;

    -- Insert the loan record
    INSERT INTO book_loans (user_id, book_id, loan_date)
    VALUES (p_user_id, p_book_id, v_loan_date)
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

--	DELETE BOOK
create or replace function delete_book(p_book_id INT)
returns boolean as $$
declare
	deleted_row RECORD; 
begin
	IF EXISTS (SELECT 1 FROM book_loans WHERE book_id = p_book_id) THEN
        delete from book_loans
		where p_book_id = book_id;
    END IF;

	delete from books 
	where p_book_id = book_id
	returning * into deleted_row;  
  
  	RETURN deleted_row is not null;
EXCEPTION
WHEN OTHERS THEN
        RAISE NOTICE 'Error deleting book with id %: %', p_book_id, SQLERRM;
        RETURN FALSE;
end;
$$ language plpgsql;

--  GET LOANS
CREATE OR REPLACE FUNCTION get_loans()
RETURNS jsonb
AS $$
DECLARE
    result jsonb;
BEGIN
    SELECT jsonb_agg(row_data)
    INTO result
    FROM (
        SELECT jsonb_build_object(
            'book', jsonb_build_object(
                'book_id', bl.book_id,
                'title', b.title,
                'published_date', b.published_date,
                'owner', jsonb_build_object(
                    'user_id', u.user_id,
                    'user_name', u.user_name,
                    'borrow_date', bl.borrow_date,
                    'return_date', bl.return_date
                )
            ),
            'extension_request', er.request_date,
            'wishlist', COALESCE(
                jsonb_agg(DISTINCT jsonb_build_object(
                    'user_id', w.user_id,
                    'user_name', wu.user_name,
                    'request_date', w.request_date
                )) FILTER (WHERE w.user_id IS NOT NULL),
                '[]'::jsonb
            )
        ) AS row_data
        FROM book_loans bl
        JOIN books b ON b.book_id = bl.book_id
        JOIN book_authors ba ON ba.book_id = bl.book_id
        LEFT JOIN users u ON u.user_id = bl.user_id
        LEFT JOIN extention_requests er ON er.user_id = bl.user_id AND er.book_id = bl.book_id
        LEFT JOIN wishlist w ON w.book_id = bl.book_id
        LEFT JOIN users wu ON wu.user_id = w.user_id
        GROUP BY
            bl.book_id, bl.user_id,
            b.title, b.published_date,
            u.user_id, u.user_name,
            bl.borrow_date, bl.return_date,
            er.request_date
    ) sub;

    RETURN result;
END;
$$ LANGUAGE plpgsql;


-- 	GET BOOKS for moder
CREATE OR REPLACE FUNCTION get_books_moder()
RETURNS TABLE(
    book_id INT,
    title VARCHAR,
    authors text[],
    genres varchar[],
    total_pages INT,
    rating DECIMAL(4, 2),
    isbn VARCHAR,
    published_date DATE,
    borrow_date DATE,
    return_date DATE,
    user_name VARCHAR,
    user_id INT
) AS $$
DECLARE
BEGIN
    RETURN QUERY
    SELECT
        b.book_id,
        b.title,
		ARRAY_AGG(DISTINCT a.first_name || ' ' || a.last_name) as authors,
		ARRAY_AGG(DISTINCT g.genre) as genres,
        b.total_pages,
        b.rating,
        b.isbn,
        b.published_date,
		bl.borrow_date,
		bl.return_date,
        u.user_name,
		u.user_id
    FROM 
        books b
	JOIN
		book_authors ba on b.book_id = ba.book_id
	JOIN
		authors a on a.author_id = ba.author_id
	JOIN
		book_genres bg on b.book_id = bg.book_id
	JOIN
		genres g on bg.genre_id = g.genre_id
	LEFT JOIN
		book_loans bl on bl.book_id = b.book_id
	LEFT JOIN
		users u on u.user_id = bl.user_id
	GROUP BY
        b.book_id, b.title, b.total_pages, b.rating, b.isbn, b.published_date, bl.return_date, bl.borrow_date, u.user_id, u.user_name;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_moder_books_json_table()
RETURNS TABLE(book_info jsonb)
LANGUAGE plpgsql
AS $$
BEGIN
  RETURN QUERY
  SELECT jsonb_build_object(
    'book', jsonb_build_object(
        'book_id', b.book_id,
        'title', b.title,
        'published_date', b.published_date,
		'isbn', b.isbn,
		'total_pages', b.total_pages,	
        'authors', (
          SELECT ARRAY_AGG(DISTINCT a.first_name || ' ' || a.last_name)
          FROM book_authors ba
          JOIN authors a ON a.author_id = ba.author_id
          WHERE ba.book_id = b.book_id
        ),
        'genres', (
          SELECT ARRAY_AGG(DISTINCT g.genre)
          FROM book_genres bg
          JOIN genres g ON g.genre_id = bg.genre_id
          WHERE bg.book_id = b.book_id
        ),
        'owner', (
          SELECT jsonb_build_object(
            'user_id', u.user_id,
            'user_name', u.user_name,
            'borrow_date', bl.borrow_date,
            'return_date', bl.return_date
          )
          FROM book_loans bl
          LEFT JOIN users u ON u.user_id = bl.user_id
          WHERE bl.book_id = b.book_id
          ORDER BY bl.borrow_date DESC
          LIMIT 1
        )
    ),
    'extension_request', (
      SELECT er.request_date
      FROM extention_requests er
      WHERE er.book_id = b.book_id
      ORDER BY er.request_date DESC
      LIMIT 1
    ),
    'wishlist', COALESCE((
      SELECT jsonb_agg(DISTINCT jsonb_build_object(
          'user_id', w.user_id,
          'user_name', wu.user_name,
          'request_date', w.request_date
      ))
      FROM wishlist w
      LEFT JOIN users wu ON wu.user_id = w.user_id
      WHERE w.book_id = b.book_id
    ), '[]'::jsonb)
  ) as boooook_info
  FROM books b;
END;
$$;


create or replace function get_moder_books_json()
returns json
as $$
begin
  return (
    SELECT jsonb_agg(book_info)
    FROM (
      SELECT jsonb_build_object(
        'book', jsonb_build_object(
            'book_id', bl.book_id,
            'title', b.title,
            'published_date', b.published_date,
			'authors', ARRAY_AGG(DISTINCT a.first_name || ' ' || a.last_name),
			'genres', ARRAY_AGG(DISTINCT g.genre),
            'owner', jsonb_build_object(
                'user_id', u.user_id,
                'user_name', u.user_name,
                'borrow_date', bl.borrow_date,
                'return_date', bl.return_date
            )
        ),
        'extension_request', er.request_date,
        'wishlist', COALESCE((
          SELECT jsonb_agg(DISTINCT jsonb_build_object(
              'user_id', w.user_id,
              'user_name', wu.user_name,
              'request_date', w.request_date
          ))
          FROM wishlist w
          LEFT JOIN users wu ON wu.user_id = w.user_id
          WHERE w.book_id = bl.book_id
        ), '[]'::jsonb)
      ) AS book_info
      FROM books b
      LEFT JOIN book_loans bl ON bl.book_id = b.book_id
      JOIN book_authors ba ON ba.book_id = bl.book_id
	  JOIN authors a on a.author_id = ba.author_id
	  JOIN book_genres bg on b.book_id = bg.book_id
	  JOIN genres g on bg.genre_id = g.genre_id
      LEFT JOIN users u ON u.user_id = bl.user_id
      LEFT JOIN extention_requests er ON er.user_id = bl.user_id AND er.book_id = bl.book_id
      GROUP BY
          bl.book_id, bl.user_id,
          b.title, b.published_date,
          u.user_id, u.user_name,
          bl.borrow_date, bl.return_date,
          er.request_date
    ) subquery
  )::json;
end;
$$ language plpgsql;

-- 	CONFIRM EXNTENSION
create or replace procedure confirm_extension(p_book_id INTEGER, p_user_id INTEGER, p_request_date date)
LANGUAGE plpgsql
AS $$
BEGIN
	update book_loans bl
	set bl.return_date = p_request_date
	where bl.book_id = p_book_id and
			bl.user_id = p_user_id;

	delete 
	from extention_requests er
	where er.book_id = p_book_id and
			er.user_id = p_user_id and
			er.request_date = p_request_date; 
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Произошла ошибка: %', SQLERRM;
END;
$$;

-- 	REJECT EXNTENSION
create or replace procedure reject_extension(p_book_id INTEGER, p_user_id number, p_request_date date)
LANGUAGE plpgsql
AS $$
BEGIN
	delete 
	from extention_requests er
	where er.book_id = p_book_id and
			er.user_id = p_user_id and
			er.request_date = p_request_date; 
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Произошла ошибка: %', SQLERRM;
END;
$$;


-- 	EXTENT LOAN
create or replace procedure extent_loan(p_user_name VARCHAR, p_book_id INTEGER)
LANGUAGE plpgsql
AS $$
DECLARE
    v_user_id INTEGER;
    v_new_date DATE;
	v_old_date DATE;
    req_exists BOOLEAN;
BEGIN
	-- Get user ID
    SELECT u.user_id
    INTO v_user_id
    FROM users u
    WHERE u.user_name = p_user_name;

	-- Check if there is already a request
    SELECT EXISTS (
        SELECT 1
        FROM extention_requests er
        WHERE er.book_id = p_book_id AND er.user_id = v_user_id
    )
    INTO req_exists;

	if req_exists then
			-- get old return_date
			select return_date
			from book_loans
			into v_old_date
			where book_id = p_book_id;

			-- get new return_date
			select er.request_date
			from extention_requests er
			into v_new_date
			where er.book_id = p_book_id and er.user_id = v_user_id;

			if v_new_date < v_old_date then
				RAISE EXCEPTION 'INVALID DATE: new date is smaller than older one';
			end if;
			 
			-- update loan row in book_loans
			update book_loans
			set return_date = v_new_date
			where book_id = p_book_id;

			-- delete request from queue
			delete from extention_requests
			where book_id = p_book_id and user_id = v_user_id;
	else
		RAISE EXCEPTION 'ERROR: NO REQUEST WAS MADE';
	end if;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE NOTICE 'Пользователь "%" не найден или отсутствуют записи.', p_user_name;

    WHEN OTHERS THEN
        RAISE NOTICE 'Произошла ошибка: %', SQLERRM;
END;
$$;

/*
create or replace procedure add_loan(
)
LANGUAGE plpgsql
AS $$
DECLARE
BEGIN

END;
$$;
*/

--	REQUEST LOAN EXTENTION
CREATE OR REPLACE PROCEDURE request_extent_loan(
    p_user_name VARCHAR,
    p_book_id INTEGER,
    p_request_date DATE
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_user_id INTEGER;
    req_exists BOOLEAN;
BEGIN
    -- Get user ID
    SELECT u.user_id
    INTO v_user_id
    FROM users u
    WHERE u.user_name = p_user_name;

    -- Check if there is already request
    SELECT EXISTS (
        SELECT 1
        FROM extention_requests er
        WHERE er.book_id = p_book_id AND er.user_id = v_user_id
    )
    INTO req_exists;

    IF req_exists THEN
        -- There IS request: update date
        UPDATE extention_requests
        SET request_date = p_request_date
        WHERE book_id = p_book_id AND user_id = v_user_id;
    ELSE
        -- No request: insert new one
        INSERT INTO extention_requests(user_id, book_id, request_date)
        VALUES (v_user_id, p_book_id, p_request_date);
    END IF;
END;
$$;



--  GET BOOKS + USER's BOOKSHELF
CREATE OR REPLACE FUNCTION get_books(p_user_name VARCHAR)
RETURNS TABLE(
    book_id INT,
    title VARCHAR,
    authors text[],
    genres varchar[],	
    total_pages INT,
    rating DECIMAL(4, 2),
    isbn VARCHAR,
    published_date DATE,
    borrow_date DATE,
    return_date DATE,
    loan_status INT 
    -- 0: mine 
    -- 1: do wishlish,
    -- 2: not wishlish
) AS $$
DECLARE
    p_user_id INT;
BEGIN
    -- Check if p_user_name is provided
    IF p_user_name IS NOT NULL THEN
        -- Get user_id for the provided user_name
        SELECT user_id INTO p_user_id FROM users WHERE user_name = p_user_name;
    END IF;

    RETURN QUERY
    SELECT
        b.book_id,
        b.title,
		ARRAY_AGG(DISTINCT a.first_name || ' ' || a.last_name) as authors,
		ARRAY_AGG(DISTINCT g.genre) as genres,
        b.total_pages,
        b.rating,
        b.isbn,
        b.published_date,
		bl.borrow_date,
		bl.return_date,
        CASE
            WHEN p_user_name IS NOT NULL AND EXISTS (
                SELECT 1
                FROM book_loans bl
                WHERE bl.book_id = b.book_id and bl.user_id = p_user_id
			) THEN 0  -- Book is mine
            WHEN p_user_name IS NOT NULL AND EXISTS (
                SELECT 1 
                FROM wishlist w 
                WHERE w.book_id = b.book_id AND w.user_id = p_user_id
            ) THEN 1  -- book is in my wishlish
            ELSE 2  -- book is not in my wishlist
        END AS loan_status
    FROM 
        books b
	JOIN
		book_authors ba on b.book_id = ba.book_id
	JOIN
		authors a on a.author_id = ba.author_id
	JOIN
		book_genres bg on b.book_id = bg.book_id
	JOIN
		genres g on bg.genre_id = g.genre_id
	LEFT JOIN
		book_loans bl on bl.book_id = b.book_id
	GROUP BY
        b.book_id, b.title, b.total_pages, b.rating, b.isbn, b.published_date, bl.return_date, bl.borrow_date;
END;
$$ LANGUAGE plpgsql;

--	GET USERS
create or replace function get_users()
returns table(
	user_id int,
	user_name varchar,
	user_password varchar,
	user_role user_role
) as $$
begin
	return query
	select u.user_id, u.user_name, u.user_password, u.user_role
	from users as u; 
end;
$$ LANGUAGE plpgsql;

--	DELETE USER
CREATE OR REPLACE FUNCTION delete_user(p_user_name VARCHAR)
RETURNS BOOLEAN AS $$
DECLARE
    user_exists BOOLEAN;
BEGIN
    -- Проверяем, существует ли пользователь
    SELECT EXISTS (SELECT 1 FROM users WHERE user_name = p_user_name) INTO user_exists;

    IF NOT user_exists THEN
        -- Если пользователь не найден, возвращаем false
        RETURN FALSE;
    END IF;

    -- Удаляем пользователя
    DELETE FROM users WHERE user_name = p_user_name;

    -- Проверяем, был ли удален пользователь
    IF NOT EXISTS (SELECT 1 FROM users WHERE user_name = p_user_name) THEN
        RETURN TRUE;  -- Удаление прошло успешно
    ELSE
        RETURN FALSE; -- Удаление не удалось
    END IF;
END;
$$ LANGUAGE plpgsql;

--	GET LOANS
create or replace function get_loans()
returns table(
	user_id int,
	user_name varchar,
	book_id int
) as $$ 
begin
	return query
	select bl.user_id, u.user_name, bl.book_id 
	from book_loans as bl 
	inner join users as u 
	on bl.user_id = u.user_id;
end;
$$ language plpgsql;

--	EDIT BOOK
CREATE OR REPLACE FUNCTION edit_book(p_book JSON)
RETURNS BOOLEAN AS $$
DECLARE
    p_book_id INT := (p_book->>'book_id')::INT;
    p_title VARCHAR(255) := p_book->>'title';
    p_total_pages INT := COALESCE(NULLIF(p_book->>'total_pages', ''), NULL)::INT;
    p_rating DECIMAL(4, 2) := COALESCE(NULLIF(p_book->>'rating', ''), NULL)::DECIMAL(4, 2);
    p_isbn VARCHAR(13) := COALESCE(NULLIF(p_book->>'isbn', ''), NULL);
    p_published_date DATE := NULLIF(p_book->>'published_date', '')::DATE;
    rows_updated INT;
BEGIN
    -- Check for the existence of the book
    IF NOT EXISTS (SELECT 1 FROM books WHERE book_id = p_book_id) THEN
        RETURN FALSE;  -- If the book does not exist, return FALSE
    END IF;

    -- Update the book
    UPDATE books
    SET title = p_title, 
        total_pages = p_total_pages, 
        rating = p_rating, 
        isbn = p_isbn, 
        published_date = p_published_date 
    WHERE book_id = p_book_id;

    -- Get the number of updated rows
    GET DIAGNOSTICS rows_updated = ROW_COUNT;

    -- Return TRUE if rows were updated, otherwise FALSE
    RETURN rows_updated > 0;
EXCEPTION
    WHEN OTHERS THEN
        -- Log the error
        RAISE NOTICE 'Error in edit_book: %', SQLERRM;
        RETURN FALSE;  -- Return FALSE in case of an error
END;
$$ LANGUAGE plpgsql;

-- toggle wishlist
CREATE OR REPLACE PROCEDURE toggle_wishlist (
    p_user_name VARCHAR,
    p_book_id INTEGER
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_user_id INTEGER;
    user_exists BOOLEAN;
    book_exists BOOLEAN;
    already_in_wishlist BOOLEAN;
BEGIN
    -- Проверка на NULL значения
    IF p_user_name IS NULL THEN
        RAISE EXCEPTION 'User name cannot be NULL';
    END IF;
    
    IF p_book_id IS NULL THEN
        RAISE EXCEPTION 'Book ID cannot be NULL';
    END IF;
    
    -- Проверка существования пользователя
    SELECT EXISTS(SELECT 1 FROM users WHERE user_name = p_user_name) INTO user_exists;
    IF NOT user_exists THEN
        RAISE EXCEPTION 'User with name % does not exist', p_user_name;
    END IF;

    SELECT u.user_id FROM users u WHERE u.user_name = p_user_name INTO v_user_id;

    -- Проверка существования книги
    SELECT EXISTS(SELECT 1 FROM books WHERE book_id = p_book_id) INTO book_exists;
    IF NOT book_exists THEN
        RAISE EXCEPTION 'Book with ID % does not exist', p_book_id;
    END IF;

    -- Проверка, нет ли уже этой книги в вишлисте пользователя
    SELECT EXISTS(
        SELECT 1 
        FROM wishlist w 
        WHERE w.user_id = v_user_id AND w.book_id = p_book_id
    ) INTO already_in_wishlist;

    IF already_in_wishlist THEN
		-- Удаление из списка
        DELETE 
		FROM wishlist 
		WHERE user_id = v_user_id AND book_id = p_book_id; 
    ELSE
        -- Добавление в вишлист
        INSERT
		INTO wishlist (user_id, book_id)
        VALUES (v_user_id, p_book_id);
        
        RAISE NOTICE 'Book % successfully added to wishlist for user %', p_book_id, p_user_name;
    END IF;
END;
$$;

-- GET WISHLIST user
--drop function get_user_wishlist(varchar);
CREATE OR REPLACE FUNCTION get_user_wishlist(p_user_name VARCHAR)
RETURNS TABLE(user_id INT, user_name varchar, book_id INT, book_title varchar, request_date DATE) AS $$
BEGIN
    RETURN QUERY
    SELECT w.user_id, u.user_name, w.book_id, b.title, w.request_date
    FROM wishlist w
    JOIN users u ON w.user_id = u.user_id
	JOIN books b ON w.book_id = b.book_id
    WHERE (p_user_name IS NULL OR u.user_name = p_user_name);
END;
$$ LANGUAGE plpgsql;

-- get wishlist all
--drop function get_wishlists();
CREATE OR REPLACE FUNCTION get_wishlists()
RETURNS TABLE(user_id INT, user_name varchar, book_id INT, book_title varchar, request_date DATE) AS $$
BEGIN
    RETURN QUERY
    SELECT w.user_id, u.user_name, w.book_id, b.title, w.request_date
    FROM wishlist w
    JOIN users u ON w.user_id = u.user_id
	JOIN books b ON w.book_id = b.book_id;
END;
$$ LANGUAGE plpgsql;