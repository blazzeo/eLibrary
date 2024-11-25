-- Create database 
create database elibrary;

-- Create admin, user roles
create role dbadmin with LOGIN password 'masteradmin' SUPERUSER;
create role dbuser with LOGIN password 'masteruser';


-- Grant privileges
grant connect on database elibrary to dbuser;
grant connect on database elibrary to dbuser;

--	Drop database
drop database elibrary;
