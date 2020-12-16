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
	top_user_won varchar (10),
	CONSTRAINT PK_tournament_round_match_id PRIMARY KEY (tournament_round_match_id));
	
	



--populate default data: 'password'
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'user@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin', 'admin@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('youser','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfast@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('mouse_keyed_yaboy','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfa@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('car_stab','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfats@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('welcome_to_ute_machina','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfavs@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('even_hairier','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfars@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('watch_me_doot','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfarks@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('ghastly_ghost_gusts','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfaurk@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('legend_of_the_rent','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfrost@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('smurf_minneapolis','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyflost@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('weakened_farce','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyflossed@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('we_got_divs','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfur@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('divinations','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfop@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('weary_loser','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyflop@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('furry_tanks','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyflip@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('vacker_backs','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfripper@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('please_waxmycar','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'tastethepain@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('giggle_sludge','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfast@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('youcantread','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfa@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('illiterate_oxford','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfats@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('guns_are_made','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfavs@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('sixteen_carp','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfars@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('vine_swingin','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfarks@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('never_sweat_theFonz','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfaurk@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('core_gore','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfrost@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('glisten_glint','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyflost@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('Jerry_Blank','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyflossed@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('Chuck_noblet','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfur@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('party_tickler','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfop@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('kaerbatoese','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyflop@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('get_turnt','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyflip@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('watch_outFather','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfripper@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('never_gonnaGIVEUP','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'tastethepain@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('ship_of_mustard','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfast@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('barbyqueued','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfa@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('Swasonite_Way_Off','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfats@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('Showmee_Grogus_hog','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfavs@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('No_Jedi','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfars@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('Kissimee_Lake','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfarks@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('give_me_an_Ache','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfaurk@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('match_force','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfrost@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('mushy_glibs','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyflost@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('dontmakeOUCH','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyflossed@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('Kreator','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfur@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('Cattle_Removal','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfop@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('GustsofTime','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyflop@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('YiffyJiffySpiffy','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyflip@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('PookieBear','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfripper@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('WinningThePooh','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'tastethepain@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('MyMATERIAL','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfast@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('Chicken_Giblets','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfa@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('steak_stake_out','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfats@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('boolean_marine','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfavs@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('march_to_vatsofMayo','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfars@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('KoopaKING','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfarks@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('HairyCobra','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfaurk@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('GI-JOKE','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfrost@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('mexican_standoff','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyflost@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('stuck_truck','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyflossed@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('brony_hunter','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfur@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('commenceDAjigglin','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfop@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('neat_flyswatter','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyflop@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('shippy555','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyflip@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('back_meUP','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'slartybartyfripper@gmail.com');
INSERT INTO users (username, password_hash, salt, user_role, email) VALUES ('Curses_ConfoundYou','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'tastethepain@gmail.com');



GO