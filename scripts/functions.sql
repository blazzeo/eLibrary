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
RETURNS TABLE(success BOOLEAN, message TEXT) AS $$
DECLARE
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
    -- Валидация входных данных
    IF v_title IS NULL OR trim(v_title) = '' THEN
        RETURN QUERY SELECT false, 'Название книги не может быть пустым';
        RETURN;
    END IF;

    IF v_rating IS NOT NULL AND (v_rating < 0 OR v_rating > 5) THEN
        RETURN QUERY SELECT false, 'Рейтинг должен быть между 0 и 5';
        RETURN;
    END IF;

    IF v_isbn IS NOT NULL AND length(v_isbn) > 13 THEN
        RETURN QUERY SELECT false, 'ISBN не может быть длиннее 13 символов';
        RETURN;
    END IF;

    -- Создаем книгу
    BEGIN
        INSERT INTO books (title, total_pages, rating, isbn, published_date)
        VALUES (v_title, v_total_pages, v_rating, v_isbn, v_published_date)
        RETURNING book_id INTO v_book_id;
        
        RAISE NOTICE 'Created book with ID: %', v_book_id;
    EXCEPTION WHEN OTHERS THEN
        RETURN QUERY SELECT false, 'Ошибка при создании книги: ' || SQLERRM;
        RETURN;
    END;

    -- Добавляем авторов
    IF book->'authors' IS NULL OR json_array_length(book->'authors') = 0 THEN
        RETURN QUERY SELECT false, 'Необходимо указать хотя бы одного автора';
        RETURN;
    END IF;

    BEGIN
        FOR author IN SELECT * FROM json_array_elements(book->'authors')
        LOOP
            RAISE NOTICE 'Processing author: %', author;
            
            SELECT create_or_get_author(
                author->>'first_name',
                author->>'middle_name',
                author->>'last_name'
            ) INTO v_author_id;
            
            INSERT INTO book_authors (book_id, author_id)
            VALUES (v_book_id, v_author_id);
        END LOOP;
    EXCEPTION WHEN OTHERS THEN
        -- Удаляем созданную книгу в случае ошибки
        DELETE FROM books WHERE book_id = v_book_id;
        RETURN QUERY SELECT false, 'Ошибка при добавлении авторов: ' || SQLERRM;
        RETURN;
    END;

    -- Добавляем жанры
    IF book->'genres' IS NULL OR json_array_length(book->'genres') = 0 THEN
        RETURN QUERY SELECT false, 'Необходимо указать хотя бы один жанр';
        RETURN;
    END IF;

    BEGIN
        FOR genre_name IN SELECT json_array_elements_text(book->'genres')
        LOOP
            RAISE NOTICE 'Processing genre: %', genre_name;
            
            SELECT create_or_get_genre(genre_name) INTO v_genre_id;
            
            INSERT INTO book_genres (book_id, genre_id)
            VALUES (v_book_id, v_genre_id);
        END LOOP;
    EXCEPTION WHEN OTHERS THEN
        -- Удаляем созданную книгу в случае ошибки
        DELETE FROM books WHERE book_id = v_book_id;
        RETURN QUERY SELECT false, 'Ошибка при добавлении жанров: ' || SQLERRM;
        RETURN;
    END;

    RETURN QUERY SELECT true, 'Книга успешно добавлена';
END;
$$ LANGUAGE plpgsql;


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
  FROM books b
  ORDER BY b.book_id ASC;
END;
$$;



-- 	CONFIRM EXNTENSION
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

-- 	EXTENT LOAN
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
    p_user_id INTEGER,
    p_book_id INTEGER,
    p_request_date DATE
)
LANGUAGE plpgsql
AS $$
DECLARE
    req_exists BOOLEAN;
BEGIN
    -- Check if there is already request
    SELECT EXISTS (
        SELECT 1
        FROM extention_requests er
        WHERE er.book_id = p_book_id AND er.user_id = p_user_id
    )
    INTO req_exists;

    IF req_exists THEN
        -- There IS request: update date
        UPDATE extention_requests
        SET request_date = p_request_date
        WHERE book_id = p_book_id AND user_id = p_user_id;
    ELSE
        -- No request: insert new one
        INSERT INTO extention_requests(user_id, book_id, request_date)
        VALUES (p_user_id, p_book_id, p_request_date);
    END IF;
END;
$$;

--	GET USER
CREATE OR REPLACE FUNCTION get_user(p_user_id INTEGER)
RETURNS JSON AS $$
DECLARE
    result JSON;
    user_exists BOOLEAN;
BEGIN
    -- Проверяем существование пользователя
    SELECT EXISTS (
        SELECT 1 FROM users WHERE user_id = p_user_id
    ) INTO user_exists;

    IF NOT user_exists THEN
        RAISE EXCEPTION 'User with ID % not found', p_user_id;
    END IF;

    SELECT json_build_object(
        'user_id', u.user_id,
        'user_name', u.user_name,
        'user_role', u.user_role,
        'registration_date', u.registration_date,
		'telegram_chat_id', u.telegram_chat_id,
        'loans', COALESCE((
            SELECT json_agg(json_build_object(
                'book_id', bl.book_id,
                'borrow_date', bl.borrow_date,
                'return_date', bl.return_date
            )) FROM book_loans bl WHERE bl.user_id = u.user_id
        ), '[]'::json),
        'wishlist', COALESCE((
            SELECT json_agg(json_build_object(
                'book_id', wl.book_id,
                'request_date', wl.request_date
            )) FROM wishlist wl WHERE wl.user_id = u.user_id
        ), '[]'::json),
        'extension_requests', COALESCE((
            SELECT json_agg(json_build_object(
                'book_id', er.book_id,
                'request_date', er.request_date
            )) FROM extention_requests er WHERE er.user_id = u.user_id
        ), '[]'::json)
    )
    INTO result
    FROM users u
    WHERE u.user_id = p_user_id;

    RETURN result;
END;
$$ LANGUAGE plpgsql;

create or replace procedure update_password(p_user_name varchar, p_new_password text)
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

-- Функция для получения списка пользователей, отложивших книгу, по book_id
--drop function get_wishlist_by_book_id(int);
CREATE OR REPLACE FUNCTION get_wishlist_by_book_id(p_book_id INT)
RETURNS TABLE (
    user_id INT,
    user_name VARCHAR,
    telegram_chat_id bigint,
    book_title varchar,
    request_date DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT
        w.user_id,
        u.user_name,
		u.telegram_chat_id,
		b.title,
        w.request_date
    FROM
        wishlist w
    JOIN
        users u ON w.user_id = u.user_id
	join
		books b on b.book_id = p_book_id
    WHERE
        w.book_id = p_book_id
    ORDER BY
        w.request_date ASC; -- Сортировка по дате запроса, чтобы видеть, кто первый в очереди
END;
$$;


--  GET BOOKS + USER's BOOKSHELF (Финальная версия с учетом return_date как даты "до которой")
CREATE OR REPLACE FUNCTION get_books(p_user_id INTEGER)
RETURNS TABLE(
    book_id INT,
    title VARCHAR,
    authors text[],
    genres varchar[],
    total_pages INT,
    rating DECIMAL(4, 2),
    isbn VARCHAR,
    published_date DATE,
    borrow_date DATE,   -- Дата выдачи текущего активного займа (у кого-то)
    return_date DATE,   -- Ожидаемая дата возврата текущего активного займа (у кого-то)
    loan_status INT,    -- 0: Available, 1: My Book, 3: Borrowed By Other
    is_in_my_wishlist BOOLEAN -- Новое поле: находится ли книга в списке желаний текущего пользователя
) AS $$
BEGIN
    RETURN QUERY
    WITH book_active_loans AS (
        SELECT
            bl.book_id,
            bl.user_id AS loan_user_id,
            bl.borrow_date AS loan_borrow_date,
            bl.return_date AS loan_expected_return_date
        FROM book_loans bl
        WHERE bl.return_date IS NOT NULL -- Предполагаем, что return_date всегда указана для активного займа
        -- ИЛИ, если вы используете поле is_active: WHERE bl.is_active = TRUE
        -- ИЛИ, если return_date может быть в будущем: WHERE bl.return_date >= CURRENT_DATE
    ),
    user_wishlist_books AS (
        SELECT
            w.book_id
        FROM wishlist w
        WHERE w.user_id = p_user_id
    ),
    book_status_cte AS (
        SELECT
            b.book_id,
            b.title,
            b.total_pages,
            b.rating,
            b.isbn,
            b.published_date,

            -- Информация о текущем активном займе (любого пользователя)
            bal.loan_borrow_date AS borrow_date,
            bal.loan_expected_return_date AS return_date,

            -- Определяем loan_status без статуса 2 (In My Wishlist)
            CASE
                WHEN bal.loan_user_id = p_user_id THEN 1 -- My Book (Книга на руках у p_user_id)
                WHEN bal.book_id IS NOT NULL THEN 3      -- Borrowed By Other (Книга на руках у другого пользователя)
                ELSE 0                                    -- Available (Доступна для бронирования/добавления в вишлист)
            END AS loan_status,
            
            -- Определяем is_in_my_wishlist
            CASE
                WHEN uwb.book_id IS NOT NULL THEN TRUE
                ELSE FALSE
            END AS is_in_my_wishlist
        FROM
            books b
        LEFT JOIN
            book_active_loans bal ON bal.book_id = b.book_id
        LEFT JOIN
            user_wishlist_books uwb ON uwb.book_id = b.book_id
    )
    SELECT
        bs.book_id,
        bs.title,
        (SELECT ARRAY_AGG(DISTINCT a.first_name || ' ' || a.last_name) FROM book_authors ba JOIN authors a ON a.author_id = ba.author_id WHERE ba.book_id = bs.book_id) AS authors,
        (SELECT ARRAY_AGG(DISTINCT g.genre) FROM book_genres bg JOIN genres g ON bg.genre_id = g.genre_id WHERE bg.book_id = bs.book_id) AS genres,
        bs.total_pages,
        bs.rating,
        bs.isbn,
        bs.published_date,
        bs.borrow_date,
        bs.return_date,
        bs.loan_status,
        bs.is_in_my_wishlist
    FROM
        book_status_cte bs
    ORDER BY bs.book_id ASC;
END;
$$ LANGUAGE plpgsql;

--	GET USERS
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

--	EDIT BOOK (ФИНАЛЬНАЯ ИСПРАВЛЕННАЯ ВЕРСИЯ)
CREATE OR REPLACE FUNCTION edit_book(p_book JSON)
RETURNS TABLE(success BOOLEAN, message TEXT) AS $$
DECLARE
    -- Основные поля книги
    p_book_id INT := (p_book->>'book_id')::INT;
    p_title VARCHAR(255) := p_book->>'title';
    p_total_pages INT := COALESCE(NULLIF(p_book->>'total_pages', ''), NULL)::INT;
    p_rating DECIMAL(4, 2) := COALESCE(NULLIF(p_book->>'rating', ''), NULL)::DECIMAL(4, 2);
    p_isbn VARCHAR(13) := COALESCE(NULLIF(p_book->>'isbn', ''), NULL);
    p_published_date DATE := NULLIF(p_book->>'published_date', '')::DATE;

    -- Вспомогательные переменные
    author JSON; -- Используется для элементов JSON-массива авторов
    genre_text TEXT; -- Используется для элементов JSON-массива жанров (текстовые значения)
    v_author_id INT;
    v_genre_id INT;
    v_new_author_ids INT[] := '{}'; -- Массив для сбора ID авторов из обновленного списка
    v_new_genre_ids INT[] := '{}';  -- Массив для сбора ID жанров из обновленного списка

BEGIN
    -- Валидация входных данных
    IF p_title IS NULL OR trim(p_title) = '' THEN
        RETURN QUERY SELECT false, 'Название книги не может быть пустым';
        RETURN;
    END IF;

    IF p_rating IS NOT NULL AND (p_rating < 0 OR p_rating > 5) THEN
        RETURN QUERY SELECT false, 'Рейтинг должен быть между 0 и 5';
        RETURN;
    END IF;

    IF p_isbn IS NOT NULL AND length(p_isbn) > 13 THEN
        RETURN QUERY SELECT false, 'ISBN не может быть длиннее 13 символов';
        RETURN;
    END IF;

    -- Проверка существования книги
    IF NOT EXISTS (SELECT 1 FROM books WHERE book_id = p_book_id) THEN
        RETURN QUERY SELECT false, 'Книга не найдена';
        RETURN;
    END IF;

    -- Начинаем транзакцию
    BEGIN
        -- Обновление основной информации о книге
        UPDATE books
        SET title = p_title,
            total_pages = p_total_pages,
            rating = p_rating,
            isbn = p_isbn,
            published_date = p_published_date
        WHERE book_id = p_book_id;

        -- ************** ОБРАБОТКА АВТОРОВ **************
        -- Проверяем наличие авторов
        IF p_book->'authors' IS NULL OR json_array_length(p_book->'authors') = 0 THEN
            RETURN QUERY SELECT false, 'Необходимо указать хотя бы одного автора';
            RETURN;
        END IF;

        -- Цикл по всем авторам из входящего JSON (теперь они НОРМАЛИЗОВАНЫ до объектов)
        FOR author IN SELECT * FROM json_array_elements(p_book->'authors')
        LOOP
            -- Проверяем, что first_name не NULL или пустая строка
            -- Эта проверка уже происходит в create_or_get_author, но можно оставить для быстрой валидации
            IF author->>'first_name' IS NULL OR trim(author->>'first_name') = '' THEN
                RETURN QUERY SELECT false, 'Имя автора не может быть пустым';
                RETURN;
            END IF;

            -- Получаем или создаем ID автора
            SELECT create_or_get_author(
                author->>'first_name',
                NULLIF(trim(author->>'middle_name'), ''), -- NULLIF для пустых строк
                author->>'last_name'
            ) INTO v_author_id;
            
            -- Добавляем ID автора в массив для дальнейшего использования (удаления старых связей)
            v_new_author_ids := array_append(v_new_author_ids, v_author_id);

            -- Вставляем связь между книгой и автором, если ее еще нет
            IF NOT EXISTS (
                SELECT 1 FROM book_authors
                WHERE book_id = p_book_id AND author_id = v_author_id
            ) THEN
                INSERT INTO book_authors (book_id, author_id)
                VALUES (p_book_id, v_author_id);
            END IF;
        END LOOP;

        -- Удаляем связи с авторами, которых нет в обновленном списке (эффективное удаление)
        DELETE FROM book_authors
        WHERE book_id = p_book_id
        AND author_id NOT IN (SELECT unnest(v_new_author_ids));

        -- ************** ОБРАБОТКА ЖАНРОВ **************
        -- Проверяем наличие жанров
        IF p_book->'genres' IS NULL OR json_array_length(p_book->'genres') = 0 THEN
            RETURN QUERY SELECT false, 'Необходимо указать хотя бы один жанр';
            RETURN;
        END IF;

        -- Цикл по всем жанрам из входящего JSON (они являются текстовыми значениями)
        FOR genre_text IN SELECT json_array_elements_text(p_book->'genres')
        LOOP
            RAISE NOTICE 'Processing genre: %', genre_text; -- Для отладки
            
            SELECT create_or_get_genre(genre_text) INTO v_genre_id;
            
            -- Добавляем ID жанра в массив для дальнейшего использования (удаления старых связей)
            v_new_genre_ids := array_append(v_new_genre_ids, v_genre_id);

            -- Вставляем связь между книгой и жанром, если ее еще нет
            IF NOT EXISTS (
                SELECT 1 FROM book_genres
                WHERE book_id = p_book_id AND genre_id = v_genre_id
            ) THEN
                INSERT INTO book_genres (book_id, genre_id)
                VALUES (p_book_id, v_genre_id);
            END IF;
        END LOOP;

        -- Удаляем связи с жанрами, которых нет в обновленном списке (эффективное удаление)
        DELETE FROM book_genres
        WHERE book_id = p_book_id
        AND genre_id NOT IN (SELECT unnest(v_new_genre_ids));

        -- ************** ЗАВЕРШЕНИЕ **************
        RETURN QUERY SELECT true, 'Книга успешно обновлена';
        
    EXCEPTION WHEN OTHERS THEN
        -- В случае любой ошибки в транзакции, откатываем изменения и возвращаем сообщение об ошибке
        RAISE NOTICE 'Error in edit_book: %, SQLSTATE: %', SQLERRM, SQLSTATE;
        RETURN QUERY SELECT false, 'Ошибка при обновлении книги: ' || SQLERRM;
    END;
END;
$$ LANGUAGE plpgsql;

--	CREATE USER
CREATE OR REPLACE FUNCTION create_user(
  p_user_name VARCHAR,
  p_user_password VARCHAR,
  p_user_role user_role
)
RETURNS TABLE(success BOOLEAN, message TEXT) AS $$
BEGIN
  -- Проверка: существует ли пользователь с таким именем
  IF EXISTS (
    SELECT 1 FROM users WHERE user_name = p_user_name
  ) THEN
    RETURN QUERY SELECT false, 'Имя пользователя уже занято';
  ELSE
    -- Добавление нового пользователя
    INSERT INTO users (user_name, user_password, user_role)
    VALUES (p_user_name, p_user_password, p_user_role);

    RETURN QUERY SELECT true, 'Пользователь успешно создан';
  END IF;
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
    p_user_id INTEGER,
    p_book_id INTEGER
)
LANGUAGE plpgsql
AS $$
DECLARE
    user_exists BOOLEAN;
    book_exists BOOLEAN;
    already_in_wishlist BOOLEAN;
    affected_rows INTEGER;
    operation_result BOOLEAN;
BEGIN
    -- Проверка на NULL значения
    IF p_user_id IS NULL THEN
        RAISE EXCEPTION 'User ID cannot be NULL';
    END IF;
    
    IF p_book_id IS NULL THEN
        RAISE EXCEPTION 'Book ID cannot be NULL';
    END IF;
    
    -- Проверка существования пользователя
    SELECT EXISTS(SELECT 1 FROM users WHERE user_id = p_user_id) INTO user_exists;
    IF NOT user_exists THEN
        RAISE EXCEPTION 'User with ID % does not exist', p_user_id;
    END IF;

    -- Проверка существования книги
    SELECT EXISTS(SELECT 1 FROM books WHERE book_id = p_book_id) INTO book_exists;
    IF NOT book_exists THEN
        RAISE EXCEPTION 'Book with ID % does not exist', p_book_id;
    END IF;

    -- Проверка, нет ли уже этой книги в вишлисте пользователя
    SELECT EXISTS(
        SELECT 1 
        FROM wishlist w 
        WHERE w.user_id = p_user_id AND w.book_id = p_book_id
    ) INTO already_in_wishlist;
    RAISE NOTICE 'Already in wishlist: %', already_in_wishlist;

    IF already_in_wishlist THEN
        -- Удаление из списка
        DELETE 
        FROM wishlist 
        WHERE user_id = p_user_id AND book_id = p_book_id;
        GET DIAGNOSTICS affected_rows = ROW_COUNT;
        RAISE NOTICE 'Deleted % rows from wishlist', affected_rows;
        
        IF affected_rows = 0 THEN
            RAISE EXCEPTION 'Failed to delete from wishlist';
        END IF;
        operation_result := false;
    ELSE
        -- Добавление в вишлист
        INSERT
        INTO wishlist (user_id, book_id, request_date)
        VALUES (p_user_id, p_book_id, CURRENT_DATE);
        GET DIAGNOSTICS affected_rows = ROW_COUNT;
        RAISE NOTICE 'Inserted % rows into wishlist', affected_rows;
        
        IF affected_rows = 0 THEN
            RAISE EXCEPTION 'Failed to insert into wishlist';
        END IF;
        operation_result := true;
    END IF;

    -- Проверяем результат
    SELECT EXISTS(
        SELECT 1 
        FROM wishlist w 
        WHERE w.user_id = p_user_id AND w.book_id = p_book_id
    ) INTO already_in_wishlist;
    RAISE NOTICE 'After operation in wishlist: %', already_in_wishlist;

    -- Проверяем общее количество записей в вишлисте для пользователя
    RAISE NOTICE 'Total wishlist items for user %: %', 
        p_user_id, 
        (SELECT COUNT(*) FROM wishlist WHERE user_id = p_user_id);
        
    -- Финальная проверка
    IF already_in_wishlist = (NOT operation_result) THEN
        RAISE EXCEPTION 'Operation failed: wishlist status did not change as expected';
    END IF;
END;
$$;

-- GET WISHLIST user
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

-- get authors
create or replace function get_authors()
RETURNS TABLE(
    author_id INT,
    first_name VARCHAR,
    middle_name VARCHAR,
    last_name VARCHAR,
    full_name VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        a.author_id,
        a.first_name,
        a.middle_name,
        a.last_name,
        CASE 
            WHEN a.last_name IS NOT NULL AND a.last_name != '' 
            THEN a.first_name || ' ' || a.last_name || ' ' || COALESCE(a.middle_name, '')
            ELSE a.first_name || ' ' || COALESCE(a.last_name, '')
        END as full_name
    FROM authors a
    ORDER BY a.first_name, a.last_name;
END;
$$ LANGUAGE plpgsql;

-- search authors
create or replace function search_authors(search_term VARCHAR)
RETURNS TABLE(
    author_id INT,
    first_name VARCHAR,
    middle_name VARCHAR,
    last_name VARCHAR,
    full_name VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        a.author_id,
        a.first_name,
        a.middle_name,
        a.last_name,
        (CASE 
            WHEN a.last_name IS NOT NULL AND a.last_name != '' 
            THEN a.first_name || ' ' || a.last_name || ' ' || COALESCE(a.middle_name, '')
            ELSE a.first_name || ' ' || COALESCE(a.last_name, '')
        END)::VARCHAR as full_name
    FROM authors a
    WHERE 
        lower(a.first_name) LIKE lower('%' || search_term || '%')
        OR lower(COALESCE(a.middle_name, '')) LIKE lower('%' || search_term || '%')
        OR lower(COALESCE(a.last_name, '')) LIKE lower('%' || search_term || '%')
        OR lower(
            CASE 
                 WHEN a.last_name IS NOT NULL AND a.last_name != '' 
            THEN a.first_name || ' ' || a.last_name || ' ' || COALESCE(a.middle_name, '')
            ELSE a.first_name || ' ' || COALESCE(a.last_name, '')
            END
        ) LIKE lower('%' || search_term || '%')
    ORDER BY a.first_name, a.last_name;
END;
$$ LANGUAGE plpgsql;

-- search genres
create or replace function search_genres(search_term VARCHAR)
RETURNS TABLE(
    genre_id INT,
    genre VARCHAR,
    parent_id INT,
    parent_genre VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        g.genre_id,
        g.genre,
        g.parent_id,
        pg.genre as parent_genre
    FROM genres g
    LEFT JOIN genres pg ON g.parent_id = pg.genre_id
    WHERE 
        lower(g.genre) LIKE lower('%' || search_term || '%')
    ORDER BY g.genre;
END;
$$ LANGUAGE plpgsql;

-- create_or_get_author
CREATE OR REPLACE FUNCTION create_or_get_author(
    p_first_name VARCHAR,
    p_middle_name VARCHAR,
    p_last_name VARCHAR
) RETURNS INT AS $$
DECLARE
    v_author_id INT;
    v_clean_first_name VARCHAR;
    v_clean_middle_name VARCHAR;
    v_clean_last_name VARCHAR;
BEGIN
    -- Нормализация входных данных
    v_clean_first_name := NULLIF(TRIM(p_first_name), '');
    v_clean_middle_name := NULLIF(TRIM(p_middle_name), '');
    v_clean_last_name := NULLIF(TRIM(p_last_name), '');

    -- Обязательная проверка: имя автора не может быть пустым
    IF v_clean_first_name IS NULL THEN
        RAISE EXCEPTION 'Имя автора (first_name) не может быть пустым';
    END IF;

    -- Проверяем существование автора (с учетом возможных NULL в middle_name)
    SELECT author_id INTO v_author_id
    FROM authors
    WHERE 
        first_name = v_clean_first_name AND
        (
            (middle_name IS NULL AND v_clean_middle_name IS NULL) OR
            (middle_name = v_clean_middle_name)
        ) AND
        -- COALESCE для last_name, чтобы корректно сравнивать NULL с пустой строкой
        COALESCE(last_name, '') = COALESCE(v_clean_last_name, '')
    LIMIT 1;

    IF v_author_id IS NOT NULL THEN
        RAISE NOTICE 'Found existing author with ID: %', v_author_id;
        RETURN v_author_id;
    END IF;

    -- Если автор не найден, создаем нового
    INSERT INTO authors (first_name, middle_name, last_name)
    VALUES (
        v_clean_first_name,
        v_clean_middle_name,
        v_clean_last_name
    )
    RETURNING author_id INTO v_author_id;

    RAISE NOTICE 'Created new author with ID: %', v_author_id;
    RETURN v_author_id;

EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'Error in create_or_get_author: %, SQLSTATE: %', SQLERRM, SQLSTATE;
    RAISE EXCEPTION 'Ошибка при создании/поиске автора: %', SQLERRM;
END;
$$ LANGUAGE plpgsql;

-- create_or_get_genre
CREATE OR REPLACE FUNCTION create_or_get_genre(
    p_genre VARCHAR
) RETURNS INT AS $$
DECLARE
    v_genre_id INT;
BEGIN
    -- Пытаемся найти существующий жанр
    SELECT genre_id INTO v_genre_id
    FROM genres
    WHERE LOWER(genre) = LOWER(p_genre);

    -- Если жанр не найден, создаем новый
    IF v_genre_id IS NULL THEN
        INSERT INTO genres (genre)
        VALUES (p_genre)
        RETURNING genre_id INTO v_genre_id;
    END IF;

    RETURN v_genre_id;
END;
$$ LANGUAGE plpgsql;