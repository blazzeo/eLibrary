--	MODER
grant connect on database elibrary to moder;
grant insert on book_loans to moder;
grant delete on book_loans to moder;
grant update on book_loans to moder;

--	USER
grant connect on database elibrary to dbuser;
grant select on books to dbuser;
grant select on books to admin;

grant select on users to dbuser;
grant select on users to admin;
grant select on check_user to dbuser;