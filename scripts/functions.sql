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
    v_user_password TEXT := p_user->>'user_password';
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

-- 	CREATE MODER
CREATE OR REPLACE FUNCTION create_moder(
    p_login VARCHAR,
    p_password TEXT
)
RETURNS TABLE(success BOOLEAN, message TEXT)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Проверка: логин пуст
    IF trim(p_login) IS NULL OR trim(p_login) = '' THEN
        RETURN QUERY SELECT false, 'Логин не может быть пустым.';
        RETURN;
    END IF;

    -- Проверка: длина логина
    IF length(p_login) < 3 OR length(p_login) > 50 THEN
        RETURN QUERY SELECT false, 'Логин должен содержать от 3 до 50 символов.';
        RETURN;
    END IF;

    -- Проверка: допустимые символы в логине
    IF p_login !~ '^[a-zA-Z0-9_]+$' THEN
        RETURN QUERY SELECT false, 'Логин может содержать только латинские буквы, цифры и нижнее подчеркивание.';
        RETURN;
    END IF;

    -- Проверка: пароль пуст
    IF trim(p_password) IS NULL OR trim(p_password) = '' THEN
        RETURN QUERY SELECT false, 'Пароль не может быть пустым.';
        RETURN;
    END IF;

    -- Проверка: длина пароля
    IF length(p_password) < 6 THEN
        RETURN QUERY SELECT false, 'Пароль должен содержать не менее 6 символов.';
        RETURN;
    END IF;

    -- Проверка: существует ли уже пользователь с таким логином
    IF EXISTS (SELECT 1 FROM users WHERE user_name = p_login) THEN
        RETURN QUERY SELECT false, 'Пользователь с таким логином уже существует.';
        RETURN;
    END IF;

    -- Создание модератора
    INSERT INTO users(user_name, user_password, user_role)
    VALUES (p_login, p_password, 'moder');

    RETURN QUERY SELECT true, 'Модератор успешно создан.';
END;
$$;


--	ADD BOOK - json
CREATE OR REPLACE FUNCTION add_full_book(book JSON)
RETURNS BOOLEAN AS $$
DECLARE
    -- Основные поля книги
    v_title VARCHAR := book->>'title';
    v_total_pages INT := COALESCE(NULLIF(book->>'total_pages', ''), NULL)::INT;
    v_rating DECIMAL(4,2) := COALESCE(NULLIF(book->>'rating', ''), NULL)::DECIMAL(4,2);
    v_isbn VARCHAR := NULLIF(book->>'isbn', '');
    v_published_date DATE := NULLIF(book->>'published_date', '')::DATE;

    v_book_id INT;

    author JSON;
    genre_name TEXT;
    v_author_id INT;
    v_genre_id INT;
BEGIN
    -- Вставка книги
    INSERT INTO books (title, total_pages, rating, isbn, published_date)
    VALUES (v_title, v_total_pages, v_rating, v_isbn, v_published_date)
    RETURNING book_id INTO v_book_id;

    -- Обработка авторов
    FOR author IN SELECT * FROM json_array_elements(book->'authors')
    LOOP
        SELECT author_id INTO v_author_id
        FROM authors
        WHERE first_name = author->>'first_name'
          AND COALESCE(middle_name, '') = COALESCE(author->>'middle_name', '')
          AND COALESCE(last_name, '') = COALESCE(author->>'last_name', '')
        LIMIT 1;

        IF v_author_id IS NULL THEN
            INSERT INTO authors (first_name, middle_name, last_name)
            VALUES (
                author->>'first_name',
                NULLIF(author->>'middle_name', ''),
                NULLIF(author->>'last_name', '')
            )
            RETURNING author_id INTO v_author_id;
        END IF;

        -- Добавление связи книга-автор
        INSERT INTO book_authors (book_id, author_id)
        VALUES (v_book_id, v_author_id)
        ON CONFLICT DO NOTHING;
    END LOOP;

    -- Обработка жанров
    FOR genre_name IN SELECT json_array_elements_text(book->'genres')
    LOOP
        SELECT genre_id INTO v_genre_id
        FROM genres
        WHERE genre = genre_name
        LIMIT 1;

        IF v_genre_id IS NULL THEN
            INSERT INTO genres (genre)
            VALUES (genre_name)
            RETURNING genre_id INTO v_genre_id;
        END IF;

        -- Добавление связи книга-жанр
        INSERT INTO book_genres (book_id, genre_id)
        VALUES (v_book_id, v_genre_id)
        ON CONFLICT DO NOTHING;
    END LOOP;

    RETURN TRUE;
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Ошибка: %', SQLERRM;
        RETURN FALSE;
END;
$$ LANGUAGE plpgsql;


-- 	ADD_BOOK_FULL JSON
CREATE OR REPLACE PROCEDURE add_full_book(book JSON)
LANGUAGE plpgsql
AS $$
DECLARE
    -- Книга
    v_book_id INT;
    v_title TEXT := book->>'title';
    v_total_pages INT := COALESCE(NULLIF(book->>'total_pages', ''), NULL)::INT;
    v_rating DECIMAL(4,2) := COALESCE(NULLIF(book->>'rating', ''), NULL)::DECIMAL(4,2);
    v_isbn TEXT := NULLIF(book->>'isbn', '');
    v_published_date DATE := NULLIF(book->>'published_date', '')::DATE;

    -- Автор / Жанр
    author JSON;
    genre_name TEXT;
    v_author_id INT;
    v_genre_id INT;
BEGIN
    -- Добавление книги
    INSERT INTO books (title, total_pages, rating, isbn, published_date)
    VALUES (v_title, v_total_pages, v_rating, v_isbn, v_published_date)
    RETURNING book_id INTO v_book_id;

    -- Обработка авторов
    FOR author IN SELECT * FROM json_array_elements(book->'authors')
    LOOP
        SELECT author_id INTO v_author_id
        FROM authors
        WHERE first_name = author->>'first_name'
          AND COALESCE(middle_name, '') = COALESCE(author->>'middle_name', '')
          AND COALESCE(last_name, '') = COALESCE(author->>'last_name', '')
        LIMIT 1;

        -- Если нет такого автора — добавляем
        IF v_author_id IS NULL THEN
            INSERT INTO authors (first_name, middle_name, last_name)
            VALUES (
                author->>'first_name',
                NULLIF(author->>'middle_name', ''),
                NULLIF(author->>'last_name', '')
            )
            RETURNING author_id INTO v_author_id;
        END IF;

        -- Добавляем связь
        INSERT INTO book_authors (book_id, author_id)
        VALUES (v_book_id, v_author_id)
        ON CONFLICT DO NOTHING;
    END LOOP;

    -- Обработка жанров
    FOR genre_name IN SELECT json_array_elements_text(book->'genres')
    LOOP
        SELECT genre_id INTO v_genre_id
        FROM genres
        WHERE genre = genre_name
        LIMIT 1;

        IF v_genre_id IS NULL THEN
            INSERT INTO genres (genre)
            VALUES (genre_name)
            RETURNING genre_id INTO v_genre_id;
        END IF;

        -- Добавляем связь
        INSERT INTO book_genres (book_id, genre_id)
        VALUES (v_book_id, v_genre_id)
        ON CONFLICT DO NOTHING;
    END LOOP;

    RAISE NOTICE 'Книга успешно добавлена (id = %)', v_book_id;
END;
$$;



--	BORROW BOOK
CREATE OR REPLACE FUNCTION borrow_book(p_user_name varchar, p_book_id INT, p_return_date DATE)
RETURNS INT AS $$
DECLARE
    v_loan_date DATE := CURRENT_DATE;
    r_borrow_id INT;
	p_user_id int;
	book_title text;
BEGIN
	-- get user's id
	select user_id 
	into p_user_id 
	from users 
	where user_name = p_user_name;

    -- Check if the user exists
    IF NOT EXISTS (SELECT 1 FROM users WHERE user_id = p_user_id) THEN
        RAISE EXCEPTION 'User "%" does not exist', p_user_name;
    END IF;

    -- Check if the book exists
    IF NOT EXISTS (SELECT 1 FROM books WHERE book_id = p_book_id) THEN
        RAISE EXCEPTION 'Book does not exist';
    END IF;

	select title
	from books 
	into book_title 
	where book_id = p_book_id;

    -- Check if the book is already borrowed
    IF EXISTS (SELECT 1 FROM book_loans WHERE book_id = p_book_id) THEN
        RAISE EXCEPTION 'Book "%" is already borrowed', book_title;
    END IF;

    -- Check if the user has already borrowed this book
    IF EXISTS (SELECT 1 FROM book_loans WHERE user_id = p_user_id AND book_id = p_book_id) THEN
        RAISE EXCEPTION 'User "%" has already borrowed book "%"', p_user_name, book_title;
    END IF;

	IF EXISTS (SELECT 1 FROM wishlist WHERE book_id = p_book_id and user_id = p_user_id) THEN
		DELETE FROM wishlist WHERE book_id = p_book_id and user_id = p_user_id;
	END IF;

    -- Insert the loan record
    INSERT INTO book_loans (user_id, book_id, return_date)
    VALUES (p_user_id, p_book_id, p_return_date)
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

	--	Delete from extensions
	delete from extention_requests
	where book_id = p_book_id;

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
CREATE OR REPLACE FUNCTION get_moder_books()
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
      'total_pages', b.total_pages,
      'rating', b.rating,
      'isbn', b.isbn,
      'authors', COALESCE((
        SELECT jsonb_agg(DISTINCT a.first_name || ' ' || a.last_name)
        FROM book_authors ba
        JOIN authors a ON a.author_id = ba.author_id
        WHERE ba.book_id = b.book_id
      ), '[]'::jsonb),
      'genres', COALESCE((
        SELECT jsonb_agg(DISTINCT g.genre)
        FROM book_genres bg
        JOIN genres g ON g.genre_id = bg.genre_id
        WHERE bg.book_id = b.book_id
      ), '[]'::jsonb)
    ),
    
    'owner', (
      SELECT to_jsonb(jsonb_build_object(
        'user_id', u.user_id,
        'user_name', u.user_name,
        'borrow_date', bl.borrow_date,
        'return_date', bl.return_date
      ))
      FROM book_loans bl
      JOIN users u ON u.user_id = bl.user_id
      WHERE bl.book_id = b.book_id
      ORDER BY bl.borrow_date DESC
      LIMIT 1
    ),

    'extension_request', (
      SELECT er.request_date
      FROM extention_requests er
      WHERE er.book_id = b.book_id
      ORDER BY er.request_date DESC
      LIMIT 1
    ),

    'wishlist', COALESCE((
      SELECT jsonb_agg(jsonb_build_object(
        'user_id', wu.user_id,
        'user_name', wu.user_name,
        'request_date', w.request_date
      ))
      FROM wishlist w
      JOIN users wu ON wu.user_id = w.user_id
      WHERE w.book_id = b.book_id
    ), '[]'::jsonb)
  )
  FROM books b;
END;
$$;



-- 	CONFIRM EXNTENSION
drop procedure confirm_extension(integer, integer, date);
CREATE OR REPLACE FUNCTION confirm_extension(
    p_book_id INTEGER,
    p_user_id INTEGER,
    p_request_date DATE
) 
RETURNS TEXT
LANGUAGE plpgsql
AS $$
DECLARE
    updated BOOLEAN := FALSE;
    deleted BOOLEAN := FALSE;
BEGIN
    -- Обновление даты возврата
    UPDATE book_loans
    SET return_date = p_request_date
    WHERE book_id = p_book_id AND user_id = p_user_id;

    IF FOUND THEN
        updated := TRUE;
    ELSE
        RETURN format('⚠️ Не найдена запись в book_loans для book_id=%s, user_id=%s', p_book_id, p_user_id);
    END IF;

    -- Удаление запроса на продление
    DELETE FROM extention_requests
    WHERE book_id = p_book_id AND user_id = p_user_id AND request_date::date = p_request_date;

    IF FOUND THEN
        deleted := TRUE;
    END IF;

    IF updated THEN
        IF deleted THEN
            RETURN '✅ Дата возврата обновлена, запрос на продление удалён';
        ELSE
            RETURN '✅ Дата возврата обновлена, но запрос на продление не найден';
        END IF;
    END IF;

    RETURN '❌ Неожиданная ситуация — ни одно действие не выполнено';
    
EXCEPTION
    WHEN OTHERS THEN
        RETURN format('❌ Ошибка: %s', SQLERRM);
END;
$$;


-- 	REJECT EXNTENSION
drop procedure reject_extension(integer, integer,date);
CREATE OR REPLACE FUNCTION reject_extension(
    p_book_id INTEGER,
    p_user_id INTEGER,
    p_request_date DATE
)
RETURNS TEXT
LANGUAGE plpgsql
AS $$
DECLARE
    rows_deleted INTEGER;
BEGIN
    DELETE FROM extention_requests
    WHERE book_id = p_book_id
      AND user_id = p_user_id
      AND request_date = p_request_date;

    GET DIAGNOSTICS rows_deleted = ROW_COUNT;

    IF rows_deleted = 0 THEN
        RETURN '❌ Запись для удаления не найдена.';
    ELSE
        RETURN format('✅ Успешно удалено %s запись(ей).', rows_deleted);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        RETURN format('❗ Ошибка: %s', SQLERRM);
END;
$$;

crea

-- 	EXTENT LOAN
drop procedure extent_loan(varchar, integer);
CREATE OR REPLACE PROCEDURE extent_loan(
    p_user_name VARCHAR,
    p_book_id INTEGER,
    p_new_return_date DATE
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_user_id INTEGER;
    v_old_return_date DATE;
BEGIN
    -- Получаем user_id по имени пользователя
    SELECT u.user_id
    INTO v_user_id
    FROM users u
    WHERE u.user_name = p_user_name;

    -- Получаем текущую дату возврата
    SELECT bl.return_date
    INTO v_old_return_date
    FROM book_loans bl
    WHERE bl.book_id = p_book_id AND bl.user_id = v_user_id;

    -- Проверка корректности новой даты возврата
    IF p_new_return_date <= v_old_return_date THEN
        RAISE EXCEPTION 'Новая дата возврата должна быть позже текущей: % <= %', p_new_return_date, v_old_return_date;
    END IF;

    -- Обновление даты возврата
    UPDATE book_loans
    SET return_date = p_new_return_date
    WHERE book_id = p_book_id AND user_id = v_user_id;

    -- Удаление запроса на продление, если он есть
    DELETE FROM extention_requests
    WHERE book_id = p_book_id AND user_id = v_user_id;

    RAISE NOTICE 'Дата возврата успешно обновлена для пользователя % и книги %', p_user_name, p_book_id;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE EXCEPTION 'Пользователь "%" или запись займа не найдены.', p_user_name;

    WHEN OTHERS THEN
        RAISE NOTICE 'Произошла ошибка: %', SQLERRM;
END;
$$;


create or replace procedure extent_loan_manual(
    p_user_name VARCHAR,
    p_book_id INTEGER,
    p_new_return_date DATE
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_user_id INTEGER;
    v_old_date DATE;
BEGIN
    -- Получаем user_id по user_name
    SELECT u.user_id
    INTO v_user_id
    FROM users u
    WHERE u.user_name = p_user_name;

    -- Получаем старую дату возврата
    SELECT return_date
    INTO v_old_date
    FROM book_loans
    WHERE book_id = p_book_id AND user_id = v_user_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Заем для пользователя "%" и книги с id % не найден.', p_user_name, p_book_id;
    END IF;

    -- Проверка: новая дата не может быть раньше старой
    IF p_new_return_date < v_old_date THEN
        RAISE EXCEPTION 'Новая дата возврата (%), меньше текущей (%).', p_new_return_date, v_old_date;
    END IF;

    -- Обновляем дату возврата
    UPDATE book_loans
    SET return_date = p_new_return_date
    WHERE book_id = p_book_id AND user_id = v_user_id;

    -- Удаляем все запросы на продление от пользователя (по всем книгам)
    DELETE FROM extention_requests
    WHERE user_id = v_user_id;

    RAISE NOTICE 'Заем продлен до % и запросы удалены.', p_new_return_date;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE EXCEPTION 'Пользователь "%" не найден.', p_user_name;

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

--	GET USER
create or replace function get_user(p_user_name varchar)
RETURNS TABLE(
    user_id INT,
    user_name VARCHAR,
    user_role varchar,
    registration_date date,
    loans json_agg,
    wishlist json_agg,
    extension_request json_agg
) AS $$
BEGIN
SELECT
    u.user_id,
    u.user_name,
    u.user_role,
    u.registration_date,
    (
        SELECT json_agg(json_build_object(
            'book_id', bl.book_id,
            'borrow_date', bl.borrow_date,
            'return_date', bl.return_date
        )) FROM book_loans bl
        WHERE bl.user_id = u.user_id
    ) AS loans,
    (
        SELECT json_agg(json_build_object(
            'book_id', wl.book_id,
            'request_date', wl.request_date
        )) FROM wishlist wl
        WHERE wl.user_id = u.user_id
    ) AS wishlist,
    (
        SELECT json_agg(json_build_object(
            'book_id', er.book_id,
            'request_date', er.request_date
        )) FROM extention_requests er
        WHERE er.user_id = u.user_id
    ) AS extension_requests
FROM users u
where u.user_name = ;
END;
$$ LANGUAGE plpgsql;

create or replace procedure update_password(p_user_name varchar, p_new_password text)
LANGUAGE plpgsql
AS $$
DECLARE
    v_user_id INTEGER;
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
-- drop function get_users();
CREATE OR REPLACE FUNCTION get_users()
RETURNS SETOF JSON AS $$
BEGIN
    RETURN QUERY
    SELECT json_build_object(
        'user_id', u.user_id,
        'user_name', u.user_name,
        'user_role', u.user_role,
        'registration_date', u.registration_date,

        'loans', (
            SELECT json_agg(json_build_object(
                'book_id', bl.book_id,
                'borrow_date', bl.borrow_date,
                'return_date', bl.return_date
            ))
            FROM book_loans bl
            WHERE bl.user_id = u.user_id
        ),

        'wishlist', (
            SELECT json_agg(json_build_object(
                'book_id', wl.book_id,
                'request_date', wl.request_date
            ))
            FROM wishlist wl
            WHERE wl.user_id = u.user_id
        ),

        'extension_requests', (
            SELECT json_agg(json_build_object(
                'book_id', er.book_id,
                'request_date', er.request_date
            ))
            FROM extention_requests er
            WHERE er.user_id = u.user_id
        )
    )
    FROM users u;
END;
$$ LANGUAGE plpgsql;

--	DELETE USER
CREATE OR REPLACE FUNCTION delete_user(p_user_id integer)
RETURNS TABLE(success BOOLEAN, message TEXT) AS $$
DECLARE
    v_user_exists BOOLEAN;
BEGIN
    SELECT EXISTS (SELECT 1 FROM users WHERE user_id = p_user_id) INTO v_user_exists;

    IF NOT v_user_exists THEN
        RETURN QUERY SELECT FALSE, 'User not found';
        RETURN;
    END IF;

	DELETE FROM book_loans where user_id = p_user_id;
	DELETE FROM wishlist where user_id = p_user_id;
	DELETE FROM extention_requests where user_id = p_user_id;

    DELETE FROM users WHERE user_id = p_user_id;

    IF NOT EXISTS (SELECT 1 FROM users WHERE user_id = p_user_id) THEN
        RETURN QUERY SELECT TRUE, 'User deleted successfully';
    ELSE
        RETURN QUERY SELECT FALSE, 'Failed to delete user';
    END IF;
END;
$$ LANGUAGE plpgsql;

--	EDIT BOOK
drop function edit_book(json);
CREATE OR REPLACE FUNCTION edit_book(p_book JSON)
RETURNS BOOLEAN AS $$
DECLARE
    -- Основные поля книги
    p_book_id INT := (p_book->>'book_id')::INT;
    p_title VARCHAR(255) := p_book->>'title';
    p_total_pages INT := COALESCE(NULLIF(p_book->>'total_pages', ''), NULL)::INT;
    p_rating DECIMAL(4, 2) := COALESCE(NULLIF(p_book->>'rating', ''), NULL)::DECIMAL(4, 2);
    p_isbn VARCHAR(13) := COALESCE(NULLIF(p_book->>'isbn', ''), NULL);
    p_published_date DATE := NULLIF(p_book->>'published_date', '')::DATE;

    -- Вспомогательные переменные
    author JSON;
    genre_name TEXT;
    v_author_id INT;
    v_genre_id INT;
    rows_updated INT;
BEGIN
    -- Проверка наличия книги
    IF NOT EXISTS (SELECT 1 FROM books WHERE book_id = p_book_id) THEN
        RETURN FALSE;
    END IF;

    -- Обновление записи в books
    UPDATE books
    SET title = p_title,
        total_pages = p_total_pages,
        rating = p_rating,
        isbn = p_isbn,
        published_date = p_published_date
    WHERE book_id = p_book_id;

    GET DIAGNOSTICS rows_updated = ROW_COUNT;

    -- Удаляем старые связи авторов
    DELETE FROM book_authors WHERE book_id = p_book_id;

    -- Обработка авторов
    FOR author IN SELECT * FROM json_array_elements(p_book->'authors')
    LOOP
        SELECT author_id INTO v_author_id
        FROM authors
        WHERE first_name = author->>'first_name'
          AND COALESCE(middle_name, '') = COALESCE(author->>'middle_name', '')
          AND COALESCE(last_name, '') = COALESCE(author->>'last_name', '')
        LIMIT 1;

        IF v_author_id IS NULL THEN
            INSERT INTO authors (first_name, middle_name, last_name)
            VALUES (
                author->>'first_name',
                NULLIF(author->>'middle_name', ''),
                NULLIF(author->>'last_name', '')
            )
            RETURNING author_id INTO v_author_id;
        END IF;

        INSERT INTO book_authors (book_id, author_id)
        VALUES (p_book_id, v_author_id)
        ON CONFLICT DO NOTHING;
    END LOOP;

    -- Удаляем старые связи жанров
    DELETE FROM book_genres WHERE book_id = p_book_id;

    -- Обработка жанров
    FOR genre_name IN SELECT json_array_elements_text(p_book->'genres')
    LOOP
        SELECT genre_id INTO v_genre_id
        FROM genres
        WHERE genre = genre_name
        LIMIT 1;

        IF v_genre_id IS NULL THEN
            INSERT INTO genres (genre)
            VALUES (genre_name)
            RETURNING genre_id INTO v_genre_id;
        END IF;

        INSERT INTO book_genres (book_id, genre_id)
        VALUES (p_book_id, v_genre_id)
        ON CONFLICT DO NOTHING;
    END LOOP;

    RETURN rows_updated > 0;

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error in edit_book: %', SQLERRM;
        RETURN FALSE;
END;
$$ LANGUAGE plpgsql;


-- get genres
create or replace function get_genres()
RETURNS TABLE(genre_id INT, genre varchar) AS $$
BEGIN
    RETURN QUERY
    SELECT genre_id, genre
    FROM genres;
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