--	MODER
grant connect on database elibrary to moder;
grant insert on book_loans to moder;
grant delete on book_loans to moder;
grant update on book_loans to moder;
grant select on books to moder;
grant select on book_authors to moder;
grant select on book_loans to moder;
grant select on authors to moder;
grant select on book_genres to moder;
grant select on genres to moder;
grant select on users to moder;
grant select on extention_requests to moder;
grant select on wishlist to moder;
GRANT USAGE, SELECT ON SEQUENCE book_loans_loan_id_seq TO moder;
grant delete on wishlist to moder;
GRANT EXECUTE ON PROCEDURE confirm_extension TO moder;
GRANT EXECUTE ON PROCEDURE reject_extension TO moder;
grant delete on extention_requests to moder;
grant execute on function get_authors() to moder;
grant execute on function search_authors(varchar) to moder;
grant execute on function search_genres(varchar) to moder;



--  ADMIN
grant select on users to admin;
grant select on genres to admin;
grant execute on function get_genres to admin;
grant execute on function get_authors() to admin;
grant execute on function search_authors(varchar) to admin;
grant execute on function search_genres(varchar) to admin;



--	USER
grant connect on database elibrary to dbuser;
grant select on books to dbuser;
grant select on users to dbuser;
grant select on book_authors to dbuser;
grant select on book_genres to dbuser;
grant select on genres to dbuser;
grant select on authors to dbuser;
grant select on book_loans to dbuser;
grant insert on wishlist to dbuser;
grant select on wishlist to dbuser;
grant delete on wishlist to dbuser;
grant execute on function get_books(varchar) to dbuser;
grant execute on function authentificate(varchar, varchar) to dbuser;
grant execute on procedure toggle_wishlist(varchar, integer) to dbuser;
grant insert on extention_requests to dbuser;
grant select on extention_requests to dbuser;
grant update on extention_requests to dbuser;





--revoke insert on book_loans from moder;
--revoke delete on book_loans from moder;
--revoke update on book_loans from moder;
--revoke connect on database elibrary from moder;
--revoke select on users from dbuser;
--revoke select on check_user from dbuser;
--revoke insert on book_loans from dbuser;
--revoke delete on book_loans from dbuser;
--revoke update on book_loans from dbuser;
--revoke select on books from dbuser;
--revoke execute on function get_books (VARCHAR) from dbuser;
--revoke connect on database elibrary from dbuser;

