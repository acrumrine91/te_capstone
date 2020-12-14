USE master
GO

--drop database if it exists
IF DB_ID('final_capstone') IS NOT NULL
BEGIN
	ALTER DATABASE final_capstone SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE final_capstone;
END

CREATE DATABASE final_capstone
GO

USE final_capstone
GO

--create tables
CREATE TABLE users (
	user_id int IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	salt varchar(200) NOT NULL,
	user_role varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id),
)

CREATE TABLE tournaments (
	tournament_id int IDENTITY(1,1) NOT NULL,
	user_id int NOT NULL,
	name varchar (50) NOT NULL,
	in_person bit NOT NULL,
	zip_code int,
	link varchar (200),
	size varchar (20) NOT NULL,
	style varchar (10) NOT NULL,
	match_style varchar (20) NOT NULL,
	match_size int NOT NULL,
	description varchar (5000) NOT NULL,
	registration_closed_date datetime NOT NULL,
	start_date datetime NOT NULL,
	registration_type varchar (20) NOT NULL,
	CONSTRAINT PK_tournament PRIMARY KEY (tournament_id)
)

CREATE TABLE matches (
	tournament_round_match_id varchar (20) NOT NULL,
	tournament_id int NOT NULL,
	round_id int NOT NULL,
	match_id int NOT NULL,
	top_user varchar (50) NOT NULL,
	bottom_user varchar (50) NOT NULL,
	winner bit,
	CONSTRAINT PK_tournament_round_match_id PRIMARY KEY (tournament_round_match_id)
	
	



--populate default data: 'password'
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'user@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin', 'admin@gmail.com');



GO