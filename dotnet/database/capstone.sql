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
	top_user_won bit,
	CONSTRAINT PK_tournament_round_match_id PRIMARY KEY (tournament_round_match_id));
	
	



--populate default data: 'password'
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'user@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin', 'admin@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('youser','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfast@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('mouse_keyed_yaboy','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfa@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('car_stab','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfats@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('welcome_to_ute_machina','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfavs@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('even_hairier','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfars@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('watch_me_doot','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfarks@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('ghastly_ghost_gusts','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfaurk@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('legend_of_the_rent','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfrost@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('smurf_minneapolis','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyflost@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('weakened_farce','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyflossed@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('we_got_divs','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfur@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('divinations','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfop@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('weary_loser','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyflop@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('furry_tanks','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyflip@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('vacker_backs','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfripper@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('please_waxmycar','YhyvGiny', 'reverseEnginner.hash','user', 'tastethepain@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('giggle_sludge','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfast@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('youcantread','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfa@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('illiterate_oxford','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfats@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('guns_are_made','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfavs@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('sixteen_carp','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfars@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('vine_swingin','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfarks@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('never_sweat_theFonz','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfaurk@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('core_gore','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfrost@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('glisten_glint','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyflost@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('Jerry_Blank','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyflossed@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('Chuck_noblet','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfur@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('party_tickler','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfop@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('kaerbatoese','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyflop@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('get_turnt','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyflip@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('watch_outFather','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfripper@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('never_gonnaGIVEUP','YhyvGiny', 'reverseEnginner.hash','user', 'tastethepain@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('ship_of_mustard','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfast@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('barbyqueued','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfa@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('Swasonite_Way_Off','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfats@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('Showmee_Grogus_hog','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfavs@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('No_Jedi','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfars@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('Kissimee_Lake','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfarks@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('give_me_an_Ache','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfaurk@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('match_force','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfrost@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('mushy_glibs','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyflost@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('dontmakeOUCH','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyflossed@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('Kreator','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfur@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('Cattle_Removal','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfop@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('GustsofTime','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyflop@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('YiffyJiffySpiffy','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyflip@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('PookieBear','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfripper@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('WinningThePooh','YhyvGiny', 'reverseEnginner.hash','user', 'tastethepain@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('MyMATERIAL','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfast@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('Chicken_Giblets','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfa@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('steak_stake_out','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfats@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('boolean_marine','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfavs@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('march_to_vatsofMayo','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfars@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('KoopaKING','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfarks@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('HairyCobra','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfaurk@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('GI-JOKE','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfrost@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('mexican_standoff','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyflost@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('stuck_truck','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyflossed@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('brony_hunter','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfur@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('commenceDAjigglin','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfop@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('neat_flyswatter','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyflop@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('shippy555','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyflip@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('back_meUP','YhyvGiny', 'reverseEnginner.hash','user', 'slartybartyfripper@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('Curses_ConfoundYou','YhyvGiny', 'reverseEnginner.hash','user', 'tastethepain@gmail.com');



GO