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
