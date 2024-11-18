/*	insert data	*/
-- genres
INSERT INTO genres (genre_id, genre, parent_id) VALUES (69, 'Genres', NULL);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (4, 'Anthropology', 69);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (10, 'Biography', 69);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (17, 'Comics', 69);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (14, 'Children''s', 69);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (15, 'Christian', 69);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (12, 'Buisness', 69);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (29, 'Fantasy', 69);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (30, 'Feminism', 69);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (31, 'Fiction', 69);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (7,  'Art', 69);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (38, 'Humanities', 69);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (39, 'Inspirational', 69);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (55, 'Reference', 69);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (56, 'Religion', 69);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (57, 'Science', 69);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (58, 'Science Fiction', 69);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (60, 'Sequential Art', 69);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (62, 'Sports and Games', 69);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (8,  'Artificial Intelligence', 69);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (49, 'Nonfiction', 69);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (59, 'Self Help', 49);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (6,  'Architecture', 49);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (1,  'Academic', 49);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (23, 'Design', 49);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (25, 'Economics', 49);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (51, 'Philosophy', 49);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (20, 'Computer Science', 57);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (61, 'Software', 20);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (3,  'Algorithms', 20);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (53, 'Programming', 20);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (54, 'Programming Languages', 20);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (63, 'Technical', 20);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (22, 'Cyberpunk', 58);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (24, 'Dystopia', 58);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (65, 'Usability', 23);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (68, 'Website Design', 23);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (52, 'Physics', 57);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (64, 'Technology', 57);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (11, 'Biology', 57);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (46, 'Mathematics', 57);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (2,  'Algebra', 46);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (19, 'Computation', 46);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (5,  'Apple', 12);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (44, 'Management', 12);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (50, 'Personal Development', 59);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (21, 'Computers', 20);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (40, 'Internet', 21);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (37, 'Hackers', 21);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (9,  'Autobiography', 10);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (34, 'Games', 62);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (35, 'Gaming', 62);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (33, 'Game Design', 34);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (66, 'Video Games', 34);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (13, 'Chess', 34);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (16, 'Coding', 20);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (41, 'Language', 38);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (18, 'Communication', 41);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (27, 'Engineering', 57);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (26, 'Electrical Engineering', 27);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (28, 'Entrepreneurship', 12);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (32, 'Finance', 25);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (36, 'Graphic Novels', 60);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (42, 'Linguistics', 38);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (43, 'Logic', 51);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (45, 'Manga', 60);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (47, 'Memoir', 9);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (48, 'Neuroscience', 11);
INSERT INTO genres (genre_id, genre, parent_id) VALUES (67, 'Web', 40);

-- authors
 
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1,'Merritt',null,'Eric');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (2,'Linda',null,'Mui');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (3,'Alecos',null,'Papadatos');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (4,'Paul','C.van','Oorschot');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (5,'David',null,'Cronin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (6,'Richard',null,'Blum');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (7,'Yuval','Noah','Harari');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (8,'Paul',null,'Albitz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (9,'David',null,'Beazley');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (10,'John','Paul','Shen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (11,'Andrew',null,'Miller');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (12,'Melanie',null,'Swan');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (13,'Neal',null,'Ford');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (14,'Nir',null,'Shavit');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (15,'Tim',null,'Kindberg');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (16,'Mike',null,'McQuaid');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (17,'Brian','P.','Hogan');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (18,'Jean-Philippe',null,'Aumasson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (19,'Lance',null,'Fortnow');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (20,'Richard','C.','Jeffrey');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (21,'William','L.','Simon');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (22,'Magnus','Lie','Hetland');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (23,'Mike',null,'McShaffry');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (24,'Norman',null,'Matloff');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (25,'John','E.','Hopcroft');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (26,'S.',null,'Sudarshan');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (27,'Bruce',null,'Eckel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (28,'Bill',null,'Gates');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (29,'Shane',null,'Harvie');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (30,'Ralph','P.','Grimaldi');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (31,'Garry',null,'Kasparov');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (32,'Lawrence','C.','Paulson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (33,'Donella','H.','Meadows');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (34,'Maria',null,'Levitin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (35,'Joy','A.','Thomas');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (36,'Scott',null,'Rosenberg');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (37,'Mark',null,'Nelson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (38,'Hal',null,'Abelson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (39,'Ray',null,'Seyfarth');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (40,'Fred',null,'Turner');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (41,'Andrew',null,'Honig');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (42,'Helen',null,'Sharp');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (43,'Katie',null,'Hafner');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (44,'Christopher',null,'Negus');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (45,'Ralph',null,'Kimball');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (46,'Trent','R.','Hein');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (47,'Venkat',null,'Subramaniam');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (48,'Simon','J.D.','Prince');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (50,'Stephen',null,'Wolfram');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (51,'Jennifer',null,'Petoff');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (52,'Massimo',null,'Banzi');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (53,'Mickey',null,'Petersen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (54,'Ethem',null,'Alpaydin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (55,'Ytaelena',null,'LA3pez');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (56,'John','L.','Hennessy');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (57,'Cameron',null,'Moll');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (58,'Jamie',null,'Levy');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (59,'Janet',null,'Gregory');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (60,'Jenifer',null,'Tidwell');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (61,'Steven','S.','Skiena');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (62,'Jimmy',null,'Soni');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (63,'Tracy',null,'Kidder');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (64,'Douglas','R.','Hofstadter');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (65,'Zed',null,'Shaw');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (66,'Yoav',null,'Shoham');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (67,'Danny',null,'Goodman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (68,'Bert',null,'Bates');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (69,'David',null,'Gries');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (70,'Eric',null,'Newcomer');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (71,'Jim','R.','Wilson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (72,'Maarten','van','Steen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (73,'Tsung-Hsien',null,'Lee');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (74,'M.','Mitchell','Waldrop');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (75, 'George', NULL, 'Pólya');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (76,'Richard','S.','Bird');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (77,'Ben',null,'Collins-Sussman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (78,'Micha',null,'Gorelick');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (79,'Christopher','T.','Haynes');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (80,'Carlos',null,'Bueno');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (81,'Michael','L.','Scott');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (82,'William','Jr.','Gwaltney');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (83,'Binu',null,'John');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (84,'Dan',null,'Bader');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (85,'Chris',null,'Smith');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (86,'Andrew',null,'Stellman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (87,'Kevin',null,'Poulsen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (88,'Peter',null,'Linz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (89,'Jim',null,'OGorman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (90,'Ali',null,'Almossawi');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (91,'David',null,'Robson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (92,'Brad',null,'Abrams');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (93,'Timothy',null,'Downs');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (94,'Kyle',null,'Loudon');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (95,'Robert',null,'Eckstein');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (96,'Wolfgang',null,'Banzhaf');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (97,'Mike',null,'Beedle');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (98,'Luke',null,'Ruth');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (99,'Brad',null,'Stone');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (100,'David',null,'Gourley');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (101,'Greg',null,'Kroah-Hartman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (102,'Jurgen',null,'Appelo');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (103,'Eric',null,'Ries');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (104,'Ian',null,'Parberry');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (105,'Johan',null,'Vromans');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (106,'Corey',null,'Sandler');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (107,'Devon',null,'Kearns');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (108,'Steven',null,'Feiner');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (109,'Kevlin',null,'Henney');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (110,'Abraham',null,'Silberschatz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (111,'Mark',null,'Russinovich');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (112,'Carl',null,'Eastlund');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (113,'Hans',null,'Langtangen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (114,'Carin',null,'Meier');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (115,'Rebecca',null,'Wirfs-Brock');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (116,'Lasse',null,'Koskela');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (117,'David',null,'Chelimsky');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (118,'Why','Stiff','Lucky');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (119,'Christopher',null,'Hadnagy');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (120,'Sebastian',null,'Raschka');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (121,'Henk',null,'Barendregt');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (122,'Tobias',null,'Nipkow');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (123,'Chris',null,'Bernhardt');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (124,'Joost-Pieter',null,'Katoen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (125,'R.G.',null,'Dromey');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (126,'Andrew',null,'McAfee');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (127,'Jeff',null,'Hawkins');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (128,'Paul',null,'Deitel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (129,'Albert',null,'Meyer');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (130,'Angus',null,'Croll');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (131,'Jason',null,'Hickey');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (132,'Nathan',null,'Marz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (133,'Miguel',null,'Revilla');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (134,'Maurice',null,'Herlihy');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (135,'Gareth',null,'James');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (136,'Hanne',null,'Nielson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (137,'Vern',null,'Ceder');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (138,'Matt',null,'Pharr');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (139,'Joe',null,'Armstrong');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (140,'Mati',null,'Aharoni');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (141,'Patrick',null,'Debois');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (142,'Sandi',null,'Metz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (143,'Benedikt',null,'GroAY');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (144,'Peter',null,'Sanders');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (145,'Baron',null,'Schwartz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (146,'Paul',null,'Clements');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (147,'Scott',null,'Ambler');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (148,'R.',null,'Dybvig');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (149,'Stephen',null,'Figgins');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (150,'Stephan',null,'Mertens');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (151,'Cay',null,'Horstmann');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (152,'Luis',null,'Atencio');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (153,'Michael',null,'Nielsen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (154,'Aaron',null,'Courville');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (155,'W.H.',null,'Feijen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (156,'Richard',null,'Bejtlich');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (157,'Peter',null,'Bruce');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (158,'Adam',null,'Gibson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (159,'Vernon',null,'Ceder');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (160,'Patrick',null,'Winston');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (161,'Scott',null,'Vanstone');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (162,'Jon',null,'Duckett');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (163,'Nick',null,'Bostrom');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (164,'Michael',null,'Dahlin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (165,'Eric',null,'Meyer');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (166,'David',null,'Harel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (167,'Claude',null,'Shannon');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (168,'Daryl',null,'Harms');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (169,'Dan',null,'North');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (170,'Roberto',null,'Tamassia');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (171,'Paul',null,'Freiberger');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (172,'George',null,'Heineman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (173,'Jeffrey',null,'Yost');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (174,'Matt',null,'Weisfeld');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (175,'Luciano',null,'Ramalho');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (176,'Mary',null,'Poppendieck');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (177,'M.',null,'Ozsu');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (178,'Emily',null,'Chang');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (179,'Douglas',null,'Stinson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (180,'Sara',null,'Wachter-Boettcher');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (181,'Rajeev',null,'Motwani');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (182,'John',null,'Sonmez');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (183,'Y.',null,'Liang');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (184,'Stanley',null,'Selkow');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (185,'Christopher',null,'Duncan');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (186,'Michael',null,'Whitman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (187,'Ron',null,'Jeffries');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (188,'Johannes',null,'Braams');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (189,'SaA!a',null,'Juric');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (190,'Peter',null,'Thiel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (191,'Steve',null,'Souders');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (192,'Jerome',null,'Friedman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (193,'Scott',null,'Mueller');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (194,'Mark',null,'Dowd');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (195,'Kelli',null,'Houston');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (196,'Hinrich',null,'Schütze');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (197,'Ethan',null,'Marcotte');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (198,'Mark',null,'Pilgrim');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (199,'Martin',null,'Davis');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (200,'Craig',null,'Sharkie');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (201,'Addy',null,'Osmani');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (202,'N.',null,'Friedman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (203,'Daniel',null,'Rose');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (204,'Chris',null,'Houser');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (205,'Linus',null,'Torvalds');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (206,'Matthew',null,'Helmke');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (207,'John',null,'Battelle');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (208,'Jon',null,'Kleinberg');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (209,'Alan',null,'Cooper');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (210,'Yoshua',null,'Bengio');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (211,'Henrik',null,'Kniberg');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (212,'Anshul',null,'Gupta');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (213,'Judith',null,'Gersting');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (214,'Jared',null,'Spool');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (215,'William',null,'Brown');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (216,'Ward',null,'Cunningham');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (217,'Wladston',null,'Filho');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (218,'Johnny',null,'Long');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (219,'Cathy',null,'ONeil');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (220,'June',null,'Barrow-Green');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (221,'Jason',null,'Williams');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (222,'Edward',null,'Skoudis');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (223,'Jérémie',null,'Zimmermann');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (224,'Mario',null,'Fusco');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (225,'Jason',null,'Gregory');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (226,'Micah',null,'Martin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (227,'Lloyd',null,'Trefethen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (228,'Erwin',null,'Schrödinger');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (229,'Chris',null,'Dannen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (230,'Shlomo',null,'Angel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (231,'Tom',null,'Badgett');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (232,'Shon',null,'Harris');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (233,'Brian',null,'Krebs');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (234,'Graham',null,'Hutton');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (235,'Ross',null,'Anderson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (236,'Linda',null,'Torczon');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (237,'Steve',null,'Freeman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (238,'Simson',null,'Garfinkel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (239,'Ilya',null,'Grigorik');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (240,'Jan',null,'Eijck');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (241,'Philip',null,'Bernstein');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (242,'Larry',null,'Ullman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (243,'Michael',null,'Feathers');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (244,'Linda',null,null);
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (245,'Martin',null,'Ford');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (246,'Sandro',null,'Mancuso');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (248,'Donald',null,'Rubin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (249,'Steve',null,'Matyas');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (250,'Richard',null,'Woods');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (251,'Tim',null,'Roughgarden');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (252,'Jeff',null,'Edmonds');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (253,'Eoin',null,'Woods');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (254,'Brian',null,'Fitzpatrick');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (255,'N.',null,'Mermin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (256,'Karl',null,'Seguin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (257,'Leo',null,'Brodie');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (258,'Robert',null,'Sebesta');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (259,'Janet',null,'Valade');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (260,'Bill',null,'Fenner');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (261,'Lorna',null,'Mitchell');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (262,'Satya',null,'Nadella');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (263,'Dan',null,'Cederholm');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (264,'Bryan',null,'Helmkamp');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (265,'Dale',null,'Dougherty');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (266,'Ka',null,'Cheung');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (267,'Mark',null,'Lutz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (268,'Tom',null,'Phoenix');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (269,'Mark',null,'Hamstra');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (270,'Gayle',null,'McDowell');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (271,'Michael',null,'Swaine');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (272,'Yvonne',null,'Rogers');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (273,'Edmond',null,'Lau');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (274,'Mike',null,'Clark');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (275,'Gordon',null,'Blair');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (276,'Mark',null,'Ciampa');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (277,'Pramod',null,'Sadalage');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (278,'Subrata',null,'Dasgupta');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (279,'Stuart',null,'McClure');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (280,'Gary',null,'Bradski');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (281,'Brian',null,'Lonsdorf');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (282,'Jesse',null,'Robbins');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (283,'Steven',null,'Pinker');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (284,'David',null,'Stork');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (285,'Luke',null,'Wroblewski');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (286,'Graham',null,'Lee');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (287,'J.',null,'Adams');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (288,'Stephen',null,'Thorne');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (289,'Dmitry',null,'Jemerov');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (290,'Thomas',null,'Connolly');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (291,'J.',null,'Brookshear');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (292,'W.',null,'Hillis');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (293,'Petar',null,'Tahchiev');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (294,'Arnold',null,'Robbins');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (295,'Chris',null,'Hankin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (296,'Jack',null,'Moffett');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (297,'Andreas',null,'Wittig');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (298,'Kjell',null,'Johnson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (299,'Christine',null,'Bresnahan');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (300,'Tom',null,'Christiansen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (301,'Harvey',null,'Deitel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (302,'Allan',null,'Friedman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (303,'Tom',null,'DeMarco');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (304,'Chris',null,'Rowley');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (305,'Chris',null,'Eagle');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (306,'Gina',null,'Smith');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (307,'David',null,'LeBlanc');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (308,'Andrea',null,'Arpaci-Dusseau');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (309,'Martin',null,'Reddy');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (310,'Eliezer',null,'Yudkowsky');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (311,'Alfred',null,'Aho');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (312,'John',null,'Maeda');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (313,'Janna',null,'Levin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (314,'Christopher',null,'Cunningham');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (315,'Flemming',null,'Nielson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (316,'Anne',null,'Troelstra');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (317,'Hartley',null,'Rogers');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (318,'Jonathan',null,'Katz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (319,'Cory',null,'Althoff');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (320,'Betty',null,'Toole');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (321,'H.',null,'Schwichtenberg');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (322,'Sara',null,'Ishikawa');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (323,'Dennis',null,'Shasha');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (324,'Daniela',null,'Witten');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (325,'Nilanjan',null,'Raychaudhuri');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (326,'Avdi',null,'Grimm');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (327,'Martin',null,'Fowler');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (328,'Brian',null,'Carper');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (329,'Mat',null,'Buckland');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (330,'Amit',null,'Prakash');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (331,'V.',null,'Spraul');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (332,'Craig',null,'Martell');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (333,'Svetlana',null,'Isakova');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (334,'James',null,'Trott');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (335,'Kenneth',null,'Rubin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (336,'William','Jr.','Shotts');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (337,'Ian',null,'Sommerville');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (338,'Dennis',null,'Ritchie');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (339,'Brendan',null,'Burns');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (340,'Adele',null,'Goldberg');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (341,'Conor',null,'McBride');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (342, 'Andy', NULL, 'Müller-Maguhn');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (343,'Foster',null,'Provost');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (344,'Tom',null,'Mitchell');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (345,'Duncan',null,'Watts');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (346,'David',null,'Wood');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (347,'Ming',null,'Li');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (348,'Alan',null,'McKean');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (349,'Tatiana',null,'Diaz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (350,'David',null,'III');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (351,'Nelson',null,'Beebe');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (352,'Mike',null,'Meyers');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (353,'Bruce',null,'MacLennan');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (354,'Suzanne',null,'Robertson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (355,'David',null,'Carlisle');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (356,'Peter',null,'Weinberger');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (357,'Ingrid',null,'Fiksdahl-King');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (358,'Igal',null,'Tabachnik');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (359,'Greg',null,'Michaelson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (360,'Jeroen',null,'Janssens');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (361,'Nicholas',null,'Haemel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (362,'Felix',null,'Halim');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (363,'David',null,'Kennedy');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (364,'Roger',null,'Pressman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (365,'J.P.',null,'Vossen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (366,'Daniel',null,'Higginbotham');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (367,'Colin',null,'Evans');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (368,'Robert',null,'Nystrom');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (369,'Ron',null,'White');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (370,'Justin',null,'Schuh');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (371,'Carlos',null,'Coronel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (372,'Matt',null,'Carter');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (373,'Guy',null,'Theraulaz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (374,'Zachary',null,'Tong');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (375,'Richard',null,'Stallman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (376,'David',null,'Holmes');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (377,'George',null,'Dyson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (378,'Kent',null,'Beck');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (379,'Nathan',null,'Ensmenger');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (380,'Micah',null,'Alpern');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (381,'Steven',null,'Halim');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (382,'Greg',null,'Riccardi');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (383,'Matthew',null,'Lyon');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (384,'Dan',null,'Jurafsky');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (385,'Asanovi',null,null);
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (386,'Richard',null,'Gabriel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (387,'Marco',null,'Dorigo');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (388,'Brian',null,'Flannery');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (389,'Thomas',null,'Anderson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (390,'Ben',null,'Albahari');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (391,'Gary',null,'Pollice');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (392,'Jon',null,'Orwant');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (393,'Dave',null,'Fancher');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (394,'John',null,'Smart');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (395,'Wallace',null,'Wang');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (396,'Julian',null,'Assange');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (397,'Alex',null,'Payne');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (398,'Terence',null,'Parr');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (399,'Kees',null,'Doets');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (400,'Eldad',null,'Eilam');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (401,'John',null,'Zelle');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (402,'Marsha',null,'Zaidman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (403,'Kip',null,'Irvine');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (404,'Deepak',null,'Alur');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (405,'Magnus',null,'Christerson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (406,'Martin',null,'Abbott');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (407,'F.',null,'Lawvere');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (408,'Robert',null,'Harper');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (409,'K.N.',null,'King');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (410,'Diana',null,'Wright');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (411,'Daniel',null,'Velleman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (412,'Frank',null,'OBrien');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (413,'Andrew',null,'Farris');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (414,'Niranjan',null,'Shivaratri');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (415,'Don',null,'Jones');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (416,'Adam',null,'Freeman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (417,'William',null,'Cook');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (418,'Andrei',null,'Alexandrescu');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (419,'Yehuda',null,'Katz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (420,'Richard',null,'Monson-Haefel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (421,'George',null,'Kurtz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (422,'Seth',null,'Stephens-Davidowitz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (423,'Martin',null,'Gardner');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (424,'Bruce',null,'Lawson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (425,'Robert',null,'Knake');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (426,'Ellen',null,'Ullman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (427,'John',null,'Crupi');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (428,'Diana',null,'Larsen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (429,'Eric',null,'Giguere');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (430,'Derek',null,'Balling');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (431,'Paul',null,'Ceruzzi');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (432,'Tom',null,'Fawcett');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (433,'Jeff',null,'Johnson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (434,'Jon',null,'Gertner');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (435,'Yashavant',null,'Kanetkar');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (436,'Andy',null,'Oram');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (437,'Kenneth',null,'Steiglitz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (438,'Trevor',null,'Hastie');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (439,'Jeffrey',null,'Ullman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (440,'Adrian',null,'Holovaty');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (441,'Kevin',null,'Kelly');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (442,'Paul',null,'Barry');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (443, 'Uwe', NULL, 'SchÃ¶ning');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (444,'John',null,'Burgess');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (445,'Christopher',null,'Steiner');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (446,'Eric',null,'Redmond');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (447,'Jon',null,'Erickson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (448,'Timothy',null,'Gowers');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (449,'Karl',null,'Matthias');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (450,'Jason',null,'Fried');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (451,'Jacquelyn',null,'Carter');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (452,'Jacob',null,'Appelbaum');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (453,'Andrew',null,'Glover');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (454,'John',null,'White');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (455,'Ed',null,'Yourdon');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (456,'The',null,'Consortium');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (457,'Michael',null,'Lucas');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (458,'Raphael',null,'Malveau');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (459,'Simon',null,'Marlow');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (460,'Ralph',null,'Johnson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (461,'Bjarne',null,'Stroustrup');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (462,'Jeremy',null,'Kubica');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (463,'Dan',null,'Malks');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (464,'Michael',null,'Folk');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (465,'Allen',null,'Dutoit');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (466,'Jack',null,'Falk');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (467,'Andrew',null,'Tanenbaum');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (468,'Andrew',null,'Appel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (469,'Rachel',null,'Warren');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (470,'Nick',null,'Rozanski');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (471,'Gunnar',null,'Overgaard');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (472,'Debra',null,'Cameron');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (473,'Sanjay',null,'Patel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (474,'Greg',null,'Perry');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (475,'Andrew',null,'Barto');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (476,'Pedro',null,'Domingos');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (477,'Mordechai',null,'Ben-Ari');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (478,'John',null,'Koza');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (479,'Peter',null,'Pacheco');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (480,'David',null,'Bourg');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (481,'Robert',null,'Martin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (482,'Philip',null,'Jackson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (483,'Paul',null,'Duvall');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (484,'Paul',null,'Churchland');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (485,'David',null,'Patterson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (486,'Roland',null,'Mas');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (487,'Imre',null,'Leader');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (488,'Michael',null,'Dirolf');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (489,'Jerome',null,'Saltzer');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (490,'James',null,'Whittaker');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (491,'Betsy',null,'Beyer');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (492, 'Albert-László', NULL, 'Barabási');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (493,'Lisa',null,'Crispin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (494,'Peter',null,'Wallack');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (495,'Trend-Pro',null,'Ltd.');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (496,'Sydney',null,'Padua');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (497,'Niklaus',null,'Wirth');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (498,'James',null,'Foley');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (499,'Lawrence',null,'Lessig');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (500,'Edward',null,'Tufte');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (501,'Carl',null,'Albing');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (502,'Luke',null,'Hohmann');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (503,'Mark',null,'Ryan');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (504,'Richard',null,'Sutton');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (505,'Fletcher',null,'Dunn');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (506,'George',null,'Karypis');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (507,'Maurice',null,'Naftalin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (508,'John',null,'Willis');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (509,'Jez',null,'Humble');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (510,'Neil',null,'Jones');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (511,'Stanley',null,'Lippman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (512,'Simon',null,'Brown');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (513,'Eric',null,'Lengyel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (514,'Marc',null,'Kreveld');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (515,'Chris',null,'Jones');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (516,'Andrew',null,'Hodges');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (517,'Earle',null,'Castledine');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (518,'F.',null,'Leighton');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (519,'Philippe',null,'Flajolet');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (520,'Peter',null,'Hart');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (521,'Philip',null,'Japikse');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (522,'Michael',null,'Ligh');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (523,'Mark',null,'Richards');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (524,'Gary',null,'Wright');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (525, 'Viktor', NULL, 'Mayer-Schönberger');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (526,'Gautam',null,'Shroff');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (527,'Jonathan',null,'Stoddard');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (528,'Richard',null,'Hamming');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (529,'Cristina',null,'Lopes');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (530,'Stoyan',null,'Stefanov');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (531,'Michael',null,'Abrash');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (532,'Bradley',null,'Miller');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (533,'Jim',null,'Highsmith');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (534,'Anthony',null,'Molinaro');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (535,'Frank',null,'Buschmann');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (536,'Peter',null,'Dayan');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (537,'James',null,'Gleick');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (538,'Tony',null,'Mason');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (539,'Nell',null,'Dale');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (540,'Kevin',null,'Fall');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (541,'Ryan',null,'Breidenbach');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (542,'Doug',null,'Hoyte');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (543,'Remy',null,'Sharp');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (544,'Chas',null,'Emerick');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (545,'Daniel',null,'Shiffman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (546,'Flavio',null,'Junqueira');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (547,'Nello',null,'Cristianini');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (548,'Greg',null,'Wilson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (549,'Mike',null,'Cohn');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (550,'Michael',null,'Lewis');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (551,'Neal',null,'Gafter');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (552,'William',null,'Byrd');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (553,'Frederick','Jr.','Brooks');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (554,'OReilly',null,'Team');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (555,'Axel',null,'Rauschmayer');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (556,'Andrew',null,'Ng');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (557,'William',null,'Press');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (558,'ACM',null,'Staff');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (559,'Michael',null,'Fisher');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (560,'John',null,'Lewis');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (561,'Simon',null,'Haykin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (562,'Jim',null,'Blandy');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (563,'Herbert',null,'Schildt');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (564,'Rich',null,'Gibson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (565,'Markus',null,'Winand');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (566,'Seymour',null,'Papert');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (567,'Raghu',null,'Ramakrishnan');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (568,'Greg',null,'Newman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (569,'Christopher',null,'Manning');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (570,'Gregor',null,'Hohpe');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (571,'Roland',null,'Kuhn');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (572,'Doug',null,'Cutting');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (573,'Daniel',null,'Cohen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (574,'Brian',null,'Foy');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (575,'Alan',null,'Mycroft');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (576,'Ian',null,'Witten');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (577,'Chad',null,'Fowler');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (578,'Ronen',null,'Feldman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (579,'Marvin',null,'Zelkowitz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (580,'Mana',null,'Takahashi');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (581,'John',null,'Foreman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (582,'Andries',null,'Dam');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (583,'John',null,'Hughes');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (584,'William',null,'Kent');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (585,'Gene',null,'Kim');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (586,'Wes',null,'McKinney');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (587,'Brian',null,'Totty');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (588,'Matt',null,'Welsh');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (589,'Gojko',null,'Adzic');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (590,'Greg',null,'Nudelman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (591,'Dean',null,'Leffingwell');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (592,'Peter',null,'Salus');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (593,'Jared',null,'Richardson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (594,'Willi',null,'Richert');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (595,'Winston',null,'Chang');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (596,'Martin',null,'Odersky');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (597,'Drew',null,'Neil');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (598,'Gilbert',null,'Strang');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (599,'Jon',null,'Loeliger');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (600,'Christos',null,'Papadimitriou');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (601,'Chris',null,'Shiflett');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (602,'Glenn',null,'Greenwald');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (603,'Mike',null,'Gancarz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (604,'Kevin',null,'Beaver');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (605,'James',null,'Warren');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (606,'Reto',null,'Meier');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (607,'Jennifer',null,'Robbins');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (608,'Mike',null,'Loukides');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (609,'Aaron',null,'Tenenbaum');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (610,'Anany',null,'Levitin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (611,'Joshua',null,'Bloch');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (612,'Benjamin',null,'Reed');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (613,'Michael',null,'Goldwasser');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (614,'Marcus',null,'Pinto');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (615,'Robert',null,'Vamosi');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (616,'Tariq',null,'Rashid');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (617,'Daphne',null,'Koller');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (618,'James',null,'Reffell');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (619,'Boaz',null,'Barak');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (620,'Steven',null,'Holzner');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (621,'Franz',null,'Baader');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (622,'Sara',null,'Baase');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (623,'Christel',null,'Baier');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (624,'Jon',null,'Bentley');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (625,'Hadley',null,'Wickham');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (626,'Jeff',null,'Atwood');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (627,'John',null,'Mongan');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (628,'Jeff',null,'Hammerbacher');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (629,'John',null,'Mitchell');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (630,'Marc',null,'Goodman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (631,'John',null,'Allen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (632,'Neil',null,'Matthew');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (633,'Tony',null,'Gaddis');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (634,'Timothy',null,'Lister');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (635,'Carl',null,'Meyer');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (636,'Amy',null,'Brown');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (637,'Eric',null,'Matthes');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (638,'Dan',null,'Gusfield');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (639,'Vincent',null,'Massol');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (640,'Robert',null,'Romano');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (641,'Christer',null,'Ericson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (642,'Andreas',null,'Zeller');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (643,'Carolyn',null,'Begg');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (644,'Claire',null,'Evans');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (645,'Dusty',null,'Phillips');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (646,'Dave',null,'Agans');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (647,'Mark',null,'Berg');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (648,'Felipe',null,'Leme');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (649,'John',null,'Kelleher');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (650,'Andy',null,'Hertzfeld');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (651,'Samuel',null,'Arbesman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (652,'Max',null,'Jacobson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (653,'Yale',null,'Patt');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (654,'Dick',null,'Grune');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (655,'Michael',null,'Stonebraker');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (656, 'Tomas', NULL, 'Akenine-Möller');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (657,'Ken',null,'Schwaber');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (658,'Michael',null,'Taylor');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (659,'Grady',null,'Booch');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (660,'Pete',null,'Goodliffe');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (661,'Joshua',null,'Suereth');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (662,'Garth',null,'Snyder');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (663,'Leo',null,'Dorst');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (664,'Barry',null,'OReilly');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (665,'Jennifer',null,'Greene');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (666,'Douglas',null,'Schmidt');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (667,'Joseph',null,'Schmuller');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (668,'Andrew',null,'Gelman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (669,'Karl',null,'Wiegers');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (670,'Andreas',null,'Wirthensohn');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (672,'Tom',null,'Liston');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (673,'Dean',null,'Miller');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (674,'Jakob',null,'Nielsen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (675,'Elaine',null,'Rich');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (676,'Leland',null,'Purvis');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (677,'Ivan',null,'Ristic');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (678,'Richard',null,'Warburton');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (679,'Michel',null,'Goossens');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (680,'S.',null,'Cooper');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (681,'Michael',null,'Mitzenmacher');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (682,'Shamkant',null,'Navathe');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (683,'Gordon',null,'Lyon');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (684,'Matthew',null,'Gast');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (685,'William',null,'Lidwell');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (686,'Bruce',null,'Sterling');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (687,'Chuck',null,'Musciano');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (688,'Benjamin',null,'Lipchak');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (689,'Peter',null,'Zaitsev');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (690,'Keith',null,'Jones');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (691,'Steven',null,'Levithan');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (692,'Bryan',null,'OSullivan');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (693,'Ken',null,'Ledeen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (694,'Christopher',null,'Alexander');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (695,'Lar',null,'Kaufman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (696,'David',null,'Leavitt');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (697,'Sam',null,'Williams');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (698,'Marco',null,'Cesati');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (699,'Alan',null,'Turing');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (700,'Ira',null,'Pohl');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (701,'Ernest',null,'Nagel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (702,'Eibe',null,'Frank');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (703,'George',null,'Boolos');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (704,'Peter',null,'Robson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (705,'Michael',null,'Lopp');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (707,'Dean',null,'Wampler');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (708,'Brett',null,'McLaughlin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (709,'P.J.',null,'Plauger');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (710,'Herb',null,'Sutter');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (711,'Peter',null,'Kim');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (712,'Russ',null,'Miles');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (713,'Alex',null,'Ionescu');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (714,'Prabhakar',null,'Raghavan');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (715,'Chris',null,'Anley');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (716,'Mor',null,'Harchol-Balter');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (717,'Neal',null,'Stephenson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (718,'Harry',null,'Lewis');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (719,'Andriy',null,'Burkov');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (720,'Vaughn',null,'Vernon');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (721,'David',null,'Barber');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (722,'David',null,'Kahn');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (723,'Toby',null,'Segaran');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (724,'Holden',null,'Karau');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (725,'Nancy',null,'Lynch');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (726,'Shawn',null,'Hedman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (727,'Peter',null,'Hruschka');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (728,'Sailu',null,'Reddy');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (729,'Christophe',null,'Grand');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (730,'Daniel',null,'Holden');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (731,'Joseph',null,'Bonneau');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (732,'Andrew',null,'Blum');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (733,'Mark',null,'Overmars');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (734, 'Miran', NULL, 'LipovaÄa');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (735,'Gerald',null,'Weinberg');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (736,'Aoife',null,'DArcy');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (737,'Anthony',null,'Williams');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (738,'Kent',null,'Kawahara');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (739,'Jeff',null,'Duntemann');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (740,'Robert',null,'Glass');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (741,'Donald',null,'Yacktman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (742,'Terrence',null,'Pratt');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (743,'Rachid',null,'Guerraoui');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (744,'Jan',null,'Goyvaerts');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (745,'Steve',null,'Oualline');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (746,'Edsger',null,'Dijkstra');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (747,'Jaron',null,'Lanier');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (748,'Bruce',null,'Dang');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (749,'Adam',null,'Tornhill');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (750,'Robert',null,'Maksimchuk');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (751,'Jon',null,'Skeet');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (752,'Richard',null,'Clarke');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (753,'David',null,'Goldberg');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (754,'Vadim',null,'Tkachenko');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (755,'Jeff',null,'Langr');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (756,'Andrew',null,'Case');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (757, 'Ãleen', NULL, 'Frisch');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (758,'Robert',null,'Tibshirani');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (759,'Edward',null,'Loper');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (760,'Martin',null,'Kleppmann');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (761,'Narasimha',null,'Karumanchi');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (762,'Elias',null,'Bachaalany');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (763,'Adam',null,'Chlipala');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (764,'Jamie',null,'Allen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (765,'Ellen',null,'Siever');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (766,'Don',null,'Widrig');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (767,'Laurence',null,'Abbott');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (768,'Hung',null,'Nguyen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (769,'Alvaro',null,'Videla');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (770,'Nikhil',null,'Buduma');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (771, 'LuÃ­s', NULL, 'Rodrigues');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (772,'Stephen',null,'Schanuel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (773,'Kim',null,'Zetter');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (774,'Raoul-Gabriel',null,'Urma');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (775,'Remzi',null,'Arpaci-Dusseau');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (776,'Linda',null,'Liukas');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (777,'Mukesh',null,'Singhal');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (778,'Ron',null,'Sigal');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (779,'Paul',null,'Hudak');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (780,'Jonathan',null,'Rosenberg');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (781,'Duane',null,'Bibby');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (782,'Ajay',null,'Agrawal');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (783,'Brendan',null,'Gregg');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (784,'Trevor',null,'Foucher');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (785,'Steven',null,'Bird');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (786,'Jimmy',null,'Nilsson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (787,'David',null,'Herman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (788,'Aaron',null,'Hillegass');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (789,'Edward',null,'Reingold');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (790,'Tom',null,'White');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (791,'Christopher',null,'Bishop');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (792,'Cathy',null,'Lazere');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (793,'Mark',null,'Chu-Carroll');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (794,'Gerard',null,'Tel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (795,'Jeffrey',null,'Zeldman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (796,'James',null,'Grenning');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (797,'Antonio',null,'Goncalves');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (798, 'György', 'E.', 'Révész');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (799,'Robert',null,'Reimann');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (800,'Tom',null,'Poppendieck');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (801,'William',null,'Poundstone');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (802,'George',null,'Reese');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (803,'Susannah',null,'Pfalzer');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (804,'Chris',null,'Sims');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (805,'Mark',null,'Sobell');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (806,'Philipp',null,'Janert');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (807,'Nicolai',null,'Josuttis');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (808,'Michael',null,'Huth');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (809,'Jonathan',null,'Seldin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (810,'William',null,'Couie');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (811,'Dave',null,'Shreiner');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (812,'Gabriella',null,'Coleman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (813,'Douglas',null,'Comer');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (814,'Indra',null,'Widjaja');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (815,'Albert',null,'Woodhull');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (816,'Daniel',null,'Brolund');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (817,'Jeremy',null,'Kun');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (818,'Curtis',null,'Rose');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (819,'Vijay',null,'Vazirani');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (820,'Leonard',null,'Richardson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (821,'Mitchell',null,'Wand');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (822,'Jonas',null,'BonA©r');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (823,'Judea',null,'Pearl');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (824,'Richard','Jr.','Wright');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (825,'Jeff',null,'Sutherland');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (826,'Scott',null,'McCartney');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (827,'Mikko',null,'Lipasti');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (828,'George',null,'Varghese');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (829,'Alessandro',null,'Rubini');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (830,'Behrouz',null,'Forouzan');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (831,'Marc',null,'Loy');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (832,'Micheline',null,'Kamber');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (833,'Jamis',null,'Buck');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (834,'John',null,'Carlin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (835,'John',null,'Lions');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (836,'Ivar',null,'Jacobson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (837,'Ben',null,'Clark');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (838,'Joseph',null,'Weizenbaum');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (839,'John',null,'Resig');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (840,'Stephen',null,'Huston');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (841,'Simon',null,'Collison');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (842,'Bill',null,'Phillips');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (843,'Jake',null,'Vanderplas');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (844,'David',null,'Black');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (845,'Hans',null,'Rohnert');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (846,'Arthur',null,'Riel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (847,'Doug',null,'Brown');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (848,'James',null,'Newman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (849,'David',null,'Harris');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (850,'Swaroop',null,'C.H.');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (851,'Hsuan-Tien',null,'Lin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (852,'Dana',null,'Mackenzie');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (853,'Ray',null,'Kurzweil');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (854,'Walter',null,'Isaacson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (855,'Brian',null,'Okken');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (856,'Donald',null,'Knuth');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (857,'Ben',null,'Forta');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (858,'Hannah',null,'Fry');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (859,'Philip',null,'Klein');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (860,'Sanjoy',null,'Dasgupta');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (861,'Walter',null,'Savitch');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (862, 'Uwe', NULL, 'Schöning');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (863,'J.',null,'Scott');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (864,'George',null,'Neville-Neil');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (865,'Leon',null,'Breedt');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (866,'Donald',null,'Norman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (867,'David',null,'McFarland');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (868,'Conrad',null,'Barski');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (869,'Nathaniel',null,'Popper');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (870,'Martin',null,'Logan');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (871,'Randall',null,'Hyde');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (872,'Raymond',null,'Chen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (873,'Emil',null,'Eifrem');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (874,'Kevin',null,'Murphy');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (875,'A.E.',null,'Eiben');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (876,'Andreas',null,'Antonopoulos');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (877,'Dan',null,'Pilone');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (878,'George',null,'Luger');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (879,'Nat',null,'Pryce');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (880,'Mark',null,'Bowden');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (881,'Eben',null,'Hewitt');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (882,'Joshua',null,'Gay');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (883,'Ryan',null,'Boyd');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (884,'David',null,'Solomon');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (885,'Alistair',null,'Cockburn');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (886,'Melanie',null,'Mitchell');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (887,'Sam',null,'Ruby');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (888,'B.',null,'Copeland');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (889,'Clifford',null,'Stoll');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (890,'Paul',null,'Butcher');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (891,'Roger',null,'Penrose');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (892,'Alberto',null,'Leon-Garcia');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (893,'Thomas',null,'Sudkamp');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (894,'Gary',null,'Flake');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (895, 'Aurélien', NULL, 'Géron');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (896,'Susanne',null,'Teschl');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (897,'Jacob',null,'Kaplan-Moss');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (898,'Robert',null,'Sedgewick');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (899,'Tobias',null,'Klein');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (900,'Rob',null,'Goodman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (901,'Jamie',null,'Bartlett');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (902,'Nicholas',null,'Carr');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (903,'Steve',null,'Wozniak');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (904,'Michael',null,'Dawson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (905,'J.E.',null,'Smith');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (906,'Grant',null,'Ingersoll');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (907,'David',null,'Anderson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (908,'Thomas',null,'Limoncelli');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (909,'Peter',null,'Kogge');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (910,'Zvonko',null,'Vranesic');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (911,'Luis',null,'Coelho');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (912,'Cameron',null,'Newham');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (913,'Zbigniew',null,'Michalewicz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (914,'T.J.',null,'OConnor');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (915,'Vipin',null,'Kumar');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (916,'Kristina',null,'Chodorow');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (917,'Ceriel',null,'Jacobs');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (918,'Casey',null,'Reas');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (919,'Mirco',null,'Mannucci');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (920,'Adnan',null,'Aziz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (921,'Luke',null,'Muehlhauser');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (922,'Daniel',null,'Dennett');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (923,'Frank',null,'Mittelbach');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (924,'Marjorie',null,'Sayer');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (925,'Jeff',null,'Carollo');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (926,'Kenneth',null,'Cukier');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (927,'A.K.',null,'Dewdney');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (928,'Helen',null,'Gaines');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (929,'Audrey',null,'Greenfeld');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (930,'M.',null,'Mano');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (931,'Keith',null,'Cooper');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (932,'Simon',null,'Thompson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (933,'Greg',null,'Gagne');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (934,'Per',null,'Hansen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (935,'Paul',null,'Wilson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (936,'Otfried',null,'Schwarzkopf');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (937,'Nathan',null,'Torkington');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (938,'David',null,'Vise');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (939,'Jeremy',null,'Zawodny');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (940,'Paul',null,'Horowitz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (941,'Douglas',null,'Rushkoff');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (942,'David',null,'Christiansen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (943,'Joe',null,'Celko');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (944,'Samuel','III','Harbison');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (945,'Michael',null,'Tilson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (946,'John',null,'Heasman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (947,'Yaser',null,'Abu-Mostafa');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (948,'Eric',null,'Haines');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (949, 'Paul', NULL, 'Vitányi');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (950,'Noam',null,'Nisan');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (951,'Mark',null,'Summerfield');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (952,'Evi',null,'Nemeth');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (953,'Adewale',null,'Oshineye');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (954,'John',null,'Markoff');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (955,'Zach',null,'Dennis');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (956,'Matthias',null,'Felleisen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (957,'Ola',null,'Ellnestam');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (958,'Peter',null,'Harrington');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (959,'Aaron',null,'Weber');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (960,'Anil',null,'Madhavapeddy');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (961,'Bob',null,'Baxley');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (963,'Kyle',null,'Simpson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (964,'David',null,'Rogers');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (965, 'Jürgen', NULL, 'Holdorf');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (966,'Warren',null,'Weaver');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (967,'Ian',null,'Goodfellow');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (968,'Hillary',null,'Johnson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (969,'Barbara',null,'Moo');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (970,'Justin',null,'Seitz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (971,'Eric',null,'Raymond');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (972,'Edward',null,'Yourdon');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (973,'Mark',null,'Seemann');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (974,'Bobbi',null,'Young');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (975,'Jim',null,'Conallen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (976,'Edwin',null,'Brady');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (977,'Steve',null,'Krug');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (978,'Jonathan',null,'Rasmusson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (979,'Russ',null,'Olsen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (980,'Paul',null,'Vigna');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (981,'Kelsey',null,'Hightower');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (982,'Caroline',null,'Jarrett');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (983,'Keith',null,'Frankish');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (984,'Joseph',null,'Albahari');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (985,'Allen',null,'Downey');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (987,'Peter',null,'Seibel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (988,'Peter',null,'Norvig');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (989,'David',null,'Flanagan');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (990,'April',null,'Chu');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (991,'Marshall',null,'McKusick');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (992,'Rick',null,'Kazman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (993,'Cynthia',null,'Andres');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (994,'Francesco',null,'Cesarini');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (995,'Pavel',null,'Pevzner');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (996,'Andrew',null,'Koenig');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (997,'Anshu',null,'Aggarwal');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (998,'Krzysztof',null,'Cwalina');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (999,'John',null,'Pierce');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1000,'Alexander',null,'Stepanov');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1001,'Blake',null,'Masters');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1002,'Stephen',null,'Prata');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1003,'Thomas',null,'Cormen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1004,'Joshua',null,'Kerievsky');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1005,'Niall',null,'Murphy');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1006,'Patrick',null,'Niemeyer');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1007,'Udi',null,'Manber');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1008,'Tom',null,'Stuart');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1009,'Kate',null,'Thompson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1010,'Joshua',null,'Gans');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1011,'Paolo',null,'Perrotta');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1012,'David',null,'Horn');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1013,'Lex',null,'Spoon');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1014,'Henry',null,'Korth');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1015,'Bill',null,'Wagner');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1016,'Matt',null,'Carter');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1017,'Philip',null,'Wadler');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1018,'Pete',null,'McBreen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1019,'Paul',null,'Graham');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1020,'Dave',null,'Hoover');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1021,'Robert',null,'Cringely');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1022,'Stephen',null,'Davis');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1023,'Kurt',null,'Beyer');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1024,'Christian',null,'Rudder');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1025,'Randal',null,'Schwartz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1026,'Alan',null,'Beaulieu');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1027,'Jamie',null,'Taylor');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1028,'Bill',null,'Rosenblatt');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1029,'David',null,'West');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1030,'Ben',null,'Whaley');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1031,'Donald',null,'Stewart');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1032,'Christopher',null,'Date');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1033, 'Ãva', NULL, 'Tardos');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1034,'Tadayoshi',null,'Kohno');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1035,'George',null,'Coulouris');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1036,'Gary',null,'Gregory');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1037,'Cricket',null,'Liu');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1038,'Elizabeth',null,'Castro');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1039,'Jay',null,'Wengrow');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1040,'Dave',null,'Thomas');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1041,'Murray',null,'Silverstein');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1042,'Scott',null,'Oaks');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1043,'Apostolos',null,'Doxiadis');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1044,'Peter','Linden','der');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1045,'Robin',null,'Williams');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1046,'Saul',null,'Teukolsky');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1047,'Anand',null,'Rajaraman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1048,'Daniel',null,'Bovet');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1049,'Kevin',null,'Goldberg');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1050,'Mark',null,'Masse');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1051,'Andrew',null,'Troelsen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1052,'William',null,'Aspray');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1053,'Adam',null,'Shook');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1054,'Ryan',null,'Mitchell');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1055,'Christian',null,'Cachin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1056,'Avi',null,'Goldfarb');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1057,'Max',null,'Kanat-Alexander');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1058,'Noson',null,'Yanofsky');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1059,'Elbert',null,'Hannah');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1060,'Bill',null,'Venners');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1061,'Rafael',null,'Gonzalez');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1062,'Eric',null,'Bonabeau');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1063,'Richard',null,'Trudeau');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1064,'Ananth',null,'Grama');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1065,'Robert',null,'Daigneau');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1066,'Aleen',null,'Frisch');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1067,'Adam',null,'Drozdek');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1068,'Alfred',null,'Menezes');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1069,'Hal',null,'Stern');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1070,'P.W.',null,'Singer');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1071,'Shoko',null,'Azuma');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1072,'Malik',null,'Magdon-Ismail');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1073,'Daniel',null,'Greenfeld');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1074,'Kurt',null,'Mehlhorn');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1075,'Kevin',null,'Leyton-Brown');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1076,'Scott',null,'Page');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1077,'Brian',null,'Christian');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1078,'John',null,'Neumann');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1079,'Jane',null,'Margolis');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1080,'Adrian',null,'Kaehler');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1081,'Allen',null,'Harper');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1082,'Steven',null,'Muchnick');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1083,'Herbert',null,'Simon');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1084,'Stuart',null,'Halloway');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1085,'Ken',null,'Arnold');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1086,'Joseph',null,'Hellerstein');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1087,'Rob',null,'Conery');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1088,'Gerard',null,'Meszaros');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1089,'Kritina',null,'Holden');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1090,'Niels',null,'Ferguson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1091,'Annie',null,'Donna');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1092,'Jim',null,'Gray');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1093,'Oleg',null,'Kiselyov');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1094,'Ian',null,'Wienand');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1095,'Trevor',null,'Burnham');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1096,'Josh',null,'Patterson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1097,'Amy',null,'Langville');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1098,'C.A.R.',null,'Hoare');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1099,'Susanna',null,'Epp');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1100,'Rina',null,'Dechter');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1101,'Eric',null,'Sink');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1102,'Carlos',null,'Varela');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1103,'Lawrie',null,'Brown');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1104,'Jonathan',null,'Corbet');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1105,'Andrew',null,'Rudoff');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1106,'James',null,'Gosling');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1107,'Steve',null,'Maguire');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1108,'Michael',null,'Howard');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1109,'Audrey',null,'Roy');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1110,'David',null,'Easley');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1112,'Jean',null,'Dollimore');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1113,'James',null,'Sanger');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1114,'Gerald',null,'Teschl');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1115,'Eric',null,'Merritt');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1116,'Damian',null,'Conway');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1117,'Roy',null,'Osherove');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1118,'Randy',null,'Pausch');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1119,'Scott',null,'Millett');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1120,'Hays','McCormick','Skip');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1121,'Jack',null,'Koziol');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1122,'John',null,'Allspaw');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1123,'Jonathan',null,'Bartlett');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1124,'Eli',null,'Bressert');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1125,'Julia',null,'Lobur');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1126,'David',null,'Fogel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1127,'Dafydd',null,'Stuttard');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1128,'Jason',null,'Arbon');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1129,'Thomas',null,'Fuchs');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1130,'Charlie',null,'Hunt');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1131,'Patrik',null,'Jonsson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1132,'Benjamin',null,'Pierce');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1133,'Sanjeev',null,'Arora');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1134,'Noah',null,'Suojanen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1135,'Jeffrey',null,'Hicks');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1136,'Brian',null,'Macnamee');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1137,'Ada',null,'Lovelace');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1138,'Ehud',null,'Shapiro');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1139,'Jim',null,'Webber');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1140, 'Josée', NULL, 'Lajoie');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1141,'Scott',null,'Granneman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1142,'Clinton',null,'Gormley');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1143,'David',null,'Kadavy');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1144,'James',null,'Broad');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1145,'Bryan',null,'Basham');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1146,'Yehuda',null,'Lindell');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1147,'Richard',null,'Stones');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1148,'Len',null,'Bass');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1149,'Leon',null,'Sterling');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1150,'Stephen',null,'Brown');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1151,'Max',null,'Kuhn');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1152,'Jim',null,'Ottaviani');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1153,'Nick',null,'Bilton');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1154,'Jesse',null,'Storimer');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1155,'Leslie',null,'Valiant');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1156,'Robert',null,'Love');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1157,'Robert',null,'Lafore');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1158,'Michael',null,'Heath');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1159,'D.S.',null,'Malik');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1160,'Richard',null,'Carlsson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1161, 'Raphaël', NULL, 'Hertzog');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1162,'Haralambos',null,'Marmanis');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1163,'John',null,'Miller');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1164,'Hubert',null,'Dreyfus');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1165,'Michael',null,'Sikorski');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1166,'Erik',null,'Brynjolfsson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1167,'Ramez',null,'Elmasri');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1168,'Erik',null,'Buck');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1169,'Ron',null,'Patton');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1170,'Brian',null,'Kernighan');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1171,'Dmitry',null,'Babenko');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1172,'Yves',null,'Bertot');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1173,'37',null,'Signals');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1174,'Dustin',null,'Boswell');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1175,'Bertrand',null,'Meyer');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1176,'Stephen',null,'Mann');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1177,'David',null,'Hansson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1178,'Brian',null,'Hardy');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1179,'Sandra',null,'Blakeslee');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1180,'Mason',null,'Woo');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1181,'Rod',null,'Stephens');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1182,'Andrew',null,'Bruce');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1183,'Martin',null,'Campbell-Kelly');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1184,'James',null,'Elliott');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1185,'J.',null,'Hindley');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1186,'Michael',null,'Engle');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1187,'Kenneth',null,'Louden');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1188,'Mig',null,'Greengard');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1189,'Richard',null,'Jones');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1190,'Alex',null,'Tapscott');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1191,'Frank',null,'Pasquale');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1192,'Gene',null,'Spafford');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1193,'Raymond',null,'Smullyan');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1194,'Christopher',null,'Allen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1195,'Julie',null,'Moronuki');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1196,'Craig',null,'Walls');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1197,'Bruce',null,'Schneier');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1198,'Caleb',null,'Doxsey');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1199,'John',null,'Vlissides');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1200,'Dave',null,'Astels');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1201,'Reshma',null,'Saujani');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1202,'Noam',null,'Nison');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1203,'Drew',null,'Conway');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1204,'James',null,'Martin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1205,'Maurice',null,'Bach');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1206,'Stephen',null,'Marsland');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1207,'Andy',null,'Terrel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1208,'Joe',null,'Kutner');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1209,'Brian',null,'Jones');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1210,'Andrew',null,'Davison');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1211,'Nachum',null,'Dershowitz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1212,'Matthew',null,'Hahn');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1213,'Mark',null,'Weiss');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1214,'Kevin',null,'Mitnick');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1215,'John',null,'Ousterhout');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1216,'Elisabeth',null,'Hendrickson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1217,'Wesley',null,'Chun');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1218,'Tim',null,'Wu');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1219,'Ian',null,'Robinson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1220,'Gigi',null,'Estabrook');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1221,'Andy',null,'Hunt');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1222,'Alexandre',null,'Gazet');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1223,'James',null,'Barrat');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1224,'Joel',null,'Grus');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1225,'Doug',null,'Hellmann');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1226,'Jonathan',null,'Knudsen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1227,'Patricia',null,'Churchland');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1228,'David',null,'Ascher');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1229,'Antonio',null,'MartAfÂ­nez');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1230,'Michael',null,'Fogus');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1231,'Richard',null,'Szeliski');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1232,'Michael',null,'Casey');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1233,'Ben',null,'Fry');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1234,'David',null,'Kushner');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1235,'Daniel',null,'Fontijne');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1236,'Ole-Johan',null,'Dahl');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1237,'Ben',null,'Klemens');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1238,'V.',null,'Hamacher');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1239,'Patrick',null,'Engebretson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1240,'Alex',null,'Martelli');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1241,'Scott',null,'Meyers');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1242,'Justin',null,'Zobel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1243,'Thomas',null,'Morton');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1244,'Douglas',null,'West');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1245,'Jill',null,'Butler');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1246,'Marvin',null,'Minsky');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1247,'Savas',null,'Parastatidis');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1248,'John',null,'Goerzen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1249,'Donald',null,'Reinertsen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1250,'Aaron',null,'Gustafson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1251,'Winfield',null,'Hill');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1252,'Aslak',null,'Hellesoy');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1253,'Tim',null,'OReilly');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1254,'John',null,'Guttag');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1255,'Isaac',null,'Chuang');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1256,'Robin',null,'Milner');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1257,'Pekka',null,'Himanen');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1258,'Vitalik',null,'Buterin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1259,'Nathan',null,'Yau');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1260,'Michael',null,'Wittig');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1261,'Craig',null,'Hunt');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1262,'Michael',null,'Morrison');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1263,'David',null,'Rensin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1264,'Christian',null,'Queinnec');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1265,'Rachel',null,'Schutt');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1266,'Brett',null,'Slatkin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1267,'Yedidyah',null,'Langsam');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1268,'Donald',null,'Miner');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1269,'Daniel',null,'Friedman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1270,'David',null,'Agans');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1271,'Thomas',null,'Cover');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1272,'Cristopher',null,'Moore');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1273,'Jeremy',null,'Keith');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1274,'Richard',null,'Duda');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1275,'Jay',null,'Fields');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1276,'Joel',null,'Spolsky');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1277,'John',null,'Levine');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1278,'Bill',null,'Kennedy');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1279,'Steven',null,'Levy');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1280,'David',null,'Diamond');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1281,'Glynn',null,'Winskel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1282,'Gary',null,'Cornell');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1283,'W.',null,'Stevens');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1284,'Aaron',null,'Walters');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1285,'Peter',null,'Shirley');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1286,'Shriram',null,'Krishnamurthi');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1287,'Alan',null,'Shalloway');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1288,'Sarah',null,'Harris');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1289,'Karim',null,'Yaghmour');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1290,'Al',null,'Sweigart');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1291,'Debasish',null,'Ghosh');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1292,'William',null,'Mougayar');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1293,'Stephane',null,'Faroult');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1294,'Brett',null,'Lantz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1295,'Michael',null,'Goodrich');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1296,'Eric',null,'Schmidt');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1297,'Raimondo',null,'Pictet');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1298,'Brian',null,'Ward');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1299,'Peter',null,'Denning');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1300,'Vint',null,'Cert');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1301,'Peter',null,'Abel');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1302,'Cory',null,'Doctorow');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1303,'Matei',null,'Zaharia');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1305,'Elisabeth',null,'Robson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1306,'Sean',null,'Kane');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1307,'Eric',null,'Lehman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1308,'Al',null,'Kelley');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1309,'John',null,'Gall');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1310,'Yaron',null,'Minsky');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1311,'Glyn',null,'Moody');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1312,'Jon',null,'Stokes');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1313,'Joel',null,'Scambray');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1314,'Eric',null,'Freeman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1315,'Ken',null,'Thompson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1316,'John',null,'Lakos');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1317,'Andrew',null,'Huang');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1319,'Paul',null,'McJones');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1320,'Ewan',null,'Klein');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1321,'Artur',null,'Ejsmont');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1322,'Hans','Baeyer','Von');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1323,'Joy',null,'Beatty');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1324,'William',null,'Stallings');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1325,'Satnam',null,'Alag');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1327,'George',null,'Fairbanks');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1328,'Linda',null,'Lamb');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1329,'Ian',null,'Millington');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1330,'Andy',null,'Budd');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1331,'Stephen',null,'Kochan');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1332,'Yukihiro',null,'Matsumoto');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1333,'Bobby',null,'Woolf');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1334,'Guy','Jr.','Steele');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1335,'Leland',null,'Wilkinson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1336,'Parmy',null,'Olson');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1337,'Bartosz',null,'Milewski');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1338,'Jerry',null,'Peek');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1339,'Peter',null,'Galvin');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1340,'Doug',null,'Lea');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1341,'David',null,'Simon');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1342,'Arvind',null,'Narayanan');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1343,'Edward',null,'Felten');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1344,'Elaine',null,'Weyuker');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1345,'Martin',null,'Erwig');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1346,'Michael',null,'Hiltzik');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1347,'Johannes',null,'Gehrke');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1348,'Carl',null,'Gunter');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1349,'Pat',null,'Shaughnessy');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1350,'Michal',null,'Zalewski');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1351,'Alan','Donovan','A.');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1352,'Joanne',null,'Molesky');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1353,'William',null,'Vetterling');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1354,'Kathy',null,'Sierra');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1355,'Esther',null,'Derby');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1356,'Jeffrey',null,'Ulman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1357,'Hartmut',null,'Bohnacker');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1358,'Cem',null,'Kaner');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1359,'Jonathan',null,'Gennick');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1360,'Cole',null,'Knaflic');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1361,'Michael',null,'Nygard');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1362,'Umesh',null,'Vazirani');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1363,'G.',null,'Zachary');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1364,'Nigel',null,'Cutland');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1365,'Joe',null,'Beda');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1366,'Glenford',null,'Myers');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1367,'Eric',null,'Roberts');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1368,'Gabe',null,'Zichermann');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1369,'John',null,'McDonald');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1370,'Peter',null,'Rob');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1371,'Steve',null,'McConnell');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1372,'Steven',null,'Goldfeder');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1373,'Mark',null,'Fenoglio');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1374,'Max',null,'Tegmark');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1375,'Laurie',null,'Wallmark');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1376,'Colleen',null,'Gorman');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1377,'Bear',null,'Bibeault');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1378,'Nicholas',null,'Zakas');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1379,'Herbert',null,'Mattord');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1380,'Bernd',null,'Bruegge');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1381,'Don',null,'Tapscott');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1382,'Jason',null,'Brownlee');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1383,'Anthony',null,'Hey');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1384,'Jiawei',null,'Han');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1385,'Andreas',null,'Schwarz');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1386,'Jennifer',null,'Widom');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1387,'Larry',null,'Wall');
INSERT INTO authors (author_id, first_name, middle_name, last_name) VALUES (1388,'Seth',null,'Lloyd');

select * from authors;

select * from books;
TRUNCATE TABLE books RESTART identity CASCADE;
-- books
insert into books (title,total_pages,rating,isbn,published_date) values 
	 ('Lean Software Development: An Agile Toolkit',240,4.17,'9780320000000','2003-05-18'),
	 ('Facing the Intelligence Explosion',91,3.87,null,'2013-02-01'),
	 ('Scala in Action',419,3.74,'9781940000000','2013-04-10'),
	 ('Patterns of Software: Tales from the Software Community',256,3.84,'9780200000000','1996-08-15'),
	 ('Anatomy Of LISP',446,4.43,'9780070000000','1978-01-01'),
	 ('Computing machinery and intelligence',24,4.17,null,'2009-03-22'),
	 ('XML: Visual QuickStart Guide',269,3.66,'9780320000000','2009-01-01'),
	 ('SQL Cookbook',595,3.95,'9780600000000','2005-12-01'),
	 ('The Apollo Guidance Computer: Architecture And Operation (Springer Praxis Books / Space Exploration)',439,4.29,'9781440000000','2010-07-01'),
	 ('Minds and Computers: An Introduction to the Philosophy of Artificial Intelligence',222,3.54,'9780750000000','2007-02-13'),
	 ('The Architecture of Symbolic Computers',739,4.50,'9780070000000','1990-11-01'),
	 ('Exceptional Ruby: Master the Art of Handling Failure in Ruby',102,4.00,null,null),
	 ('Nmap Network Scanning: The Official Nmap Project Guide to Network Discovery and Security Scanning',468,4.32,'9780980000000','2009-01-01'),
	 ('The It Handbook for Business: Managing Information Technology Support Costs',180,4.40,'9781450000000','2010-09-17'),
	 ('Accidental Empires',384,4.00,'9780890000000','1996-09-13'),
	 ('Introducing HTML5',223,3.97,'9780320000000','2010-07-21'),
	 ('Are You Smart Enough to Work at Google?',290,3.52,'9780320000000','2012-01-04'),
	 ('Elements of ML Programming, Ml97 Edition',400,3.70,'9780140000000','1998-01-01'),
	 ('Scrum and XP from the Trenches',140,4.17,'9781430000000','2007-10-05'),
	 ('What is HTML 5?',27,3.31,null,null),
	 ('Becoming a Technical Leader: An Organic Problem-Solving Approach',284,4.09,'9780930000000','1986-01-01'),
	 ('The Text Mining Handbook: Advanced Approaches in Analyzing Unstructured Data',410,3.95,'9780520000000','2013-08-15'),
	 ('Constraint Processing',480,3.38,'9781560000000','2003-05-19'),
	 ('Essential PHP Security',109,4.07,'9780600000000','2005-11-01'),
	 ('A Book on C: Programming in C',576,3.74,'9780810000000','1994-11-01'),
	 ('Scientific Computing',576,3.42,'9780070000000','2001-07-17'),
	 ('Cocoa Design Patterns',427,4.00,'9780320000000','2009-09-01'),
	 ('Cocoa Programming for Mac OS X',433,3.97,'9780320000000','2008-05-05'),
	 ('Six Degrees: The Science of a Connected Age',384,3.90,'9780390000000','2004-02-17'),
	 ('Big Data Now: Current Perspectives from O''Reilly Radar',137,3.33,null,null),
	 ('OpenGL Programming Guide: The Official Guide to Learning OpenGL, Version 2',838,3.66,'9780320000000','2005-08-11'),
	 ('Killer Game Programming in Java',969,3.26,'9780600000000','2005-05-30'),
	 ('Mathematik Fur Informatiker: Band 1: Diskrete Mathematik Und Lineare Algebra',514,4.10,'9783540000000','2010-10-13'),
	 ('C++ Network Programming, Volume I: Mastering Complexity with ACE and Patterns',336,3.85,'9780200000000','2001-12-20'),
	 ('Gamification by Design',208,3.66,'9781450000000','2011-08-19'),
	 ('Cyberwar: The Next Threat to National Security & What to Do About It',304,3.72,'9780060000000','2010-04-20'),
	 ('More Effective C#: 50 Specific Ways to Improve Your C#',297,4.09,'9780320000000','2008-10-17'),
	 ('C++ Programming: From Problem Analysis to Program Design',1344,4.18,'9781420000000','2006-02-01'),
	 ('Numerical Linear Algebra',184,4.17,'9780900000000','1997-06-01'),
	 ('The Principles of Product Development Flow: Second Generation Lean Product Development',276,4.16,'9781940000000','2009-05-01'),
	 ('An Embedded Software Primer',448,3.71,'9780200000000','1999-08-15'),
	 ('Free Culture: The Nature and Future of Creativity',368,4.12,'9780140000000','2005-02-22'),
	 ('Upgrading and Repairing PCs',1608,4.13,'9780790000000','2006-04-03'),
	 ('Perfect Software--And Other Illusions about Testing',182,4.13,'9780930000000','2008-01-01'),
	 ('Mastering Algorithms with C',562,3.78,'9781570000000','1999-08-12'),
	 ('Ant: The Definitive Guide',336,3.08,'9780600000000','2005-04-20'),
	 ('Version Control By Example',null,3.49,null,'2011-07-22'),
	 ('A Primer on Scientific Programming with Python',693,3.85,'9783640000000','2009-09-10'),
	 ('Practical C++ Programming',574,3.58,'9780600000000','2002-12-20'),
	 ('Computer Science from the Bottom Up',null,3.80,null,null),
	 ('ZooKeeper: Distributed process coordination',238,3.92,'9781450000000','2013-12-02'),
	 ('Two Scoops of Django: Best Practices for Django 1.5',277,4.23,null,'2013-01-20'),
	 ('Git in Practice',225,4.12,'9781620000000','2014-10-31'),
	 ('Programming F# 3.0',476,3.86,'9781450000000','2012-10-26'),
	 ('No Place to Hide: Edward Snowden, the NSA, and the U.S. Surveillance State',260,4.08,'9781630000000','2014-05-13'),
	 ('Android Design Patterns: Interaction Design Solutions for Developers',456,3.72,'9781120000000','2013-03-11'),
	 ('The Career Programmer: Guerilla Tactics for an Imperfect World (Expert''s Voice)',264,3.15,'9781590000000','2006-02-01'),
	 ('Principles of Concurrent and Distributed Programming',361,3.44,'9780320000000','2006-02-01'),
	 ('The Elements of Scrum',184,3.94,'9780980000000','2011-03-22'),
	 ('Java Se8 for the Really Impatient: A Short Course on the Basics',215,3.92,'9780320000000','2014-01-24'),
	 ('The Book of F#: Breaking Free with Managed Functional Programming',352,3.88,'9781590000000','2014-03-22'),
	 ('Good Math: A Geek''s Guide to the Beauty of Numbers, Logic, and Computation',262,3.62,'9781940000000','2013-09-06'),
	 ('Methods of Programming',272,4.08,'9780200000000','1988-01-01'),
	 ('Principles of Information Security',624,3.42,'9781420000000','2008-01-01'),
	 ('Learn Windows PowerShell 3 in a Month of Lunches',368,4.30,'9781620000000','2012-11-22'),
	 ('Professional Android 4 Application Development',817,3.94,'9781120000000','2012-05-01'),
	 ('Show Stopper,: The Breakneck Race to Create Windows NT and the Next Generation at Microsoft',312,4.12,'9780030000000','1994-06-01'),
	 ('Explore It,: Reduce Risk and Increase Confidence with Exploratory Testing',162,4.33,'9781940000000','2012-03-22'),
	 ('The Python Standard Library by Example',672,4.23,'9780320000000','2011-06-11'),
	 ('JUnit in Action',504,3.54,'9781940000000','2010-08-04'),
	 ('The Mikado Method',245,3.36,'9781620000000','2014-03-22'),
	 ('REST API Design Rulebook',116,3.29,null,null),
	 ('Scrum: a Breathtakingly Brief and Agile Introduction',54,3.93,null,'2014-07-30'),
	 ('Security+ Guide to Network Security Fundamentals',592,3.65,'9781430000000','2008-11-11'),
	 ('Classic Shell Scripting: Hidden Commands that Unlock the Power of Unix',560,4.03,'9780600000000','2005-05-23'),
	 ('Head First HTML and CSS',768,4.25,'9780600000000','2012-09-05'),
	 ('Mobile First',130,3.96,null,'2011-10-18'),
	 ('Genetic Algorithms in Search, Optimization, and Machine Learning',432,4.14,'785342000000','1989-01-11'),
	 ('Introduction to Distributed Algorithms',612,3.73,'9780520000000','2004-01-05'),
	 ('Debug It,: Find, Repair, and Prevent Bugs in Your Code',232,3.45,'9781930000000','2009-11-22'),
	 ('Visual Explanations: Images and Quantities, Evidence and Narrative',156,4.29,'9780960000000','1998-04-22'),
	 ('The Intelligent Web: Search, Smart Algorithms, and Big Data',295,3.70,'9780200000000','2014-01-28'),
	 ('Principles of Transaction Processing',378,3.78,'9781560000000','2009-06-01'),
	 ('The Mindi?1s I: Fantasies and Reflections on Self and Soul',512,4.14,'9780550000000','1985-04-01'),
	 ('Managing Software Requirements: A Use Case Approach',502,3.50,'9780320000000','2003-05-05'),
	 ('Software Testing',416,3.74,'9780670000000','2005-07-01'),
	 ('Teach Yourself Uml In 24 Hours',null,3.36,'9780670000000',null),
	 ('MySQL Pocket Reference',96,3.84,'9780600000000','2003-03-03'),
	 ('Fundamentals of Digital Logic with VHDL Design With CDROM',939,3.76,'9780070000000','2004-07-15'),
	 ('Calendrical Calculations',479,4.23,'9780520000000','2007-12-01'),
	 ('Liars and Outliers: Enabling the Trust that Society Needs to Thrive',348,3.77,'9781120000000','2012-02-01'),
	 ('Beautiful Data: The Stories Behind Elegant Data Solutions (Theory In Practice, #31)',384,3.64,'9780600000000','2009-07-28'),
	 ('Programming Distributed Computing Systems: A Foundational Approach',296,3.72,'9780260000000','2013-05-31'),
	 ('Applied Predictive Modeling',600,4.45,'9781460000000','2018-03-30'),
	 ('Living Clojure',300,4.09,null,'2015-01-25'),
	 ('Refactoring: Ruby Edition, Adobe Reader',480,4.10,'9780320000000','2009-10-15'),
	 ('Embedded Android: Porting, Extending, and Customizing',null,4.14,'9781450000000','2011-10-22'),
	 ('Jenkins: The Definitive Guide',406,3.42,'9781450000000','2011-07-27'),
	 ('The Lambda Calculus: Its Syntax and Semantics',654,4.21,'9780440000000','1985-11-15'),
	 ('Generative Design: Visualize, Program, and Create with Processing',472,4.55,'9781620000000','2012-08-22'),
	 ('API Design for C++',472,4.09,'9780120000000','2011-02-18'),
	 ('Test-Driven iOS Development',256,3.56,'9780320000000','2012-04-19'),
	 ('Designing with the Mind in Mind: Simple Guide to Understanding User Interface Design Rules',201,4.09,'9780080000000','2010-05-20'),
	 ('The Imitation Game',197,3.63,null,'2014-06-22'),
	 ('The Systems Bible: The Beginner''s Guide to Systems Large and Small: Being the Third Edition of Systemantics',314,4.04,'9780960000000','2002-01-01'),
	 ('Great Principles of Computing',320,3.13,'9780260000000','2015-01-23'),
	 ('Erlang and OTP in Action',432,4.27,'9781930000000','2010-12-05'),
	 ('Pattern Oriented Software Architecture Volume 5: On Patterns and Pattern Languages',450,3.73,'9780470000000','2007-06-01'),
	 ('Who Owns the Future?',367,3.77,'9781450000000','2013-05-07'),
	 ('C# 6.0 and the .NET 4.6 Framework',1660,4.58,null,'2015-11-11'),
	 ('Mazes for Programmers: Code Your Own Twisty Little Passages',275,4.31,'9781680000000','2015-09-25'),
	 ('Computer Science: Discovering God''s Glory in Ones and Zeros',32,3.82,null,'2015-03-08'),
	 ('The Unicode Standard',1472,4.22,'9780320000000','2006-11-01'),
	 ('Linux Phrasebook',382,4.12,'9780670000000','2006-06-22'),
	 ('Cryptanalysis: A Study of Ciphers and Their Solution',256,3.79,'9780490000000','1989-04-01'),
	 ('Swarm Intelligence: From Natural to Artificial Systems',307,3.96,'9780200000000','1999-09-23'),
	 ('Programming in Go: Creating Applications for the 21st Century',475,3.75,'9780320000000','2012-05-14'),
	 ('Head First JavaScript Programming',661,4.24,'9781450000000','2014-03-22'),
	 ('Learning Web Design: A Beginner''s Guide to Html, Css, Javascript, and Web Graphics',624,4.17,'9781450000000','2012-08-24'),
	 ('Two Scoops of Django: Best Practices for Django 1.8',505,4.53,null,'2015-04-29'),
	 ('Theoretical Neuroscience: Computational and Mathematical Modeling of Neural Systems',480,4.26,'9780260000000','2005-08-12'),
	 ('Geometric Algebra for Computer Science: An Object-Oriented Approach to Geometry',626,3.97,'9780120000000','2007-04-01'),
	 ('Elasticsearch: The Definitive Guide: A Distributed Real-Time Search and Analytics Engine',724,4.23,'9781450000000','2015-02-14'),
	 ('Bayesian Data Analysis',690,4.20,'9781580000000','2003-07-29'),
	 ('The Art of Software Security Assessment: Identifying and Preventing Software Vulnerabilities',1174,4.45,'9780320000000','2006-11-01'),
	 ('Principles of Distributed Database Systems',666,3.94,'9780140000000','1999-01-19'),
	 ('Algorithms And Data Structures: The Basic Toolbox',300,4.00,'9783640000000','2010-11-10'),
	 ('The Idea Factory: Bell Labs and the Great Age of American Innovation',432,4.15,'9781590000000','2012-03-15'),
	 ('Bulletproof SSL and TLS: The Complete Guide to Deploying Secure Servers and Web Applications',425,4.59,'9781910000000','2014-07-31'),
	 ('Pro ASP.NET MVC 5',832,4.13,null,'2013-12-19'),
	 ('PHP and MySQL for Dynamic Web Sites: Visual QuickPro Guide',692,3.83,'9780320000000','2005-06-21'),
	 ('Java 8 Lambdas: Pragmatic Functional Programming',182,3.99,'9781450000000','2014-04-22'),
	 ('Learn Ruby the Hard Way',173,3.67,null,'2011-12-11'),
	 ('Cybersecurity and Cyberwar: What Everyone Needs to Know(r)',306,3.83,'9780200000000','2014-01-03'),
	 ('3D Math Primer for Graphics and Game Development',429,4.16,'9781560000000','2002-06-21'),
	 ('HTML5 for Web Designers',87,4.02,'9780980000000','2010-05-04'),
	 ('The Practice of Network Security Monitoring: Understanding Incident Detection and Response',376,4.03,'9781590000000','2013-08-02'),
	 ('Hacker, Hoaxer, Whistleblower, Spy: The Many Faces of Anonymous',453,3.84,'9781780000000','2014-11-04'),
	 ('Computer Vision: Models, Learning, and Inference',600,4.38,'9781110000000','2012-06-18'),
	 ('Introduction to Graph Theory',224,4.09,'9780490000000','1994-02-09'),
	 ('Performance Modeling and Design of Computer Systems: Queueing Theory in Action',576,4.70,'9781110000000','2013-02-01'),
	 ('Comptia A+ Certification All-In-One Exam Guide: Exams 220-801 & 220-802',1200,4.16,'9780070000000','2012-08-22'),
	 ('Thinking Functionally with Haskell',350,4.14,'9781110000000','2014-10-09'),
	 ('Data Science at the Command Line: Facing the Future with Time-Tested Tools',212,3.87,'9781490000000','2014-10-12'),
	 ('Linked Data',336,3.66,'9781620000000','2013-03-22'),
	 ('The Black Box Society: The Secret Algorithms That Control Money and Information',320,3.63,'9780670000000','2015-01-05'),
	 ('Applying Domain-Driven Design and Patterns : With Examples in C# and .NET',528,3.61,'9780320000000','2006-05-01'),
	 ('Hatching Twitter: A True Story of Money, Power, Friendship, and Betrayal',299,4.04,'9781590000000','2013-11-05'),
	 ('Algorithms Illuminated: Part 1: The Basics',null,4.49,null,'2017-09-26'),
	 ('IBM PC Assembly Language and Programming',545,4.02,'9780130000000','2000-08-22'),
	 ('Assembly Language for Intel-Based Computers',676,4.07,'9780140000000','1998-09-08'),
	 ('Functional Programming in JavaScript',272,4.17,null,'2016-06-22'),
	 ('Brotopia: Breaking Up the Boys'' Club of Silicon Valley',317,4.03,null,'2018-02-06'),
	 ('High Performance MySQL: Optimization, Backups, and Replication',826,4.39,null,'2012-03-05'),
	 ('Reactive Microservices Architecture',54,3.66,null,'2016-03-22'),
	 ('Essential Algorithms: A Practical Approach to Computer Algorithms',301,3.90,'9781120000000','2013-08-12'),
	 ('The Unix Philosophy',176,4.05,'9781560000000','1994-12-28'),
	 ('Programming Rust: Fast, Safe Systems Development',622,4.61,'9781490000000','2017-12-21'),
	 ('Reactive Microsystems',84,4.48,null,'2017-08-07'),
	 ('Async JavaScript',104,4.02,null,'2012-03-21'),
	 ('A Common-Sense Guide to Data Structures and Algorithms: Level Up Your Core Programming Skills',null,4.16,'9781680000000','2017-10-25'),
	 ('Bad Choices',160,3.28,'9780740000000','2017-04-04'),
	 ('Life in Code: A Personal History of Technology',320,3.96,'9780370000000','2017-08-08'),
	 ('The Everything Store: Jeff Bezos and the Age of Amazon',384,4.12,'9780320000000','2013-10-15'),
	 ('Computer Science: A Very Short Introduction',144,3.78,'9780200000000','2016-06-01'),
	 ('Make Your Own Neural Network: An In-depth Visual Introduction For Beginners',316,4.21,null,'2017-08-29'),
	 ('Practical Statistics for Data Scientists: 50 Essential Concepts',318,4.05,'9781490000000','2017-05-28'),
	 ('What Is Life? with Mind and Matter and Autobiographical Sketches',184,4.15,'9780520000000','1992-01-31'),
	 ('Python Testing with Pytest: Simple, Rapid, Effective, and Scalable',null,4.16,'9781680000000','2017-10-25'),
	 ('The Age of Cryptocurrency: How Bitcoin and Digital Money Are Challenging the Global Economic Order',368,3.89,'9781250000000','2015-01-27'),
	 ('Introducing Ethereum and Solidity: Foundations of Cryptocurrency and Blockchain Programming for Beginners',208,3.37,'9781480000000','2017-03-18'),
	 ('The Cambridge Handbook of Artificial Intelligence',368,4.10,'9780520000000','2014-07-31'),
	 ('Understanding the Digital World: What You Need to Know about Computers, the Internet, Privacy, and Security',256,4.28,'9780690000000','2017-01-24'),
	 ('The Non-Designer''s Design Book',191,4.05,'9780320000000','2003-08-28'),
	 ('The CS Detective: An Algorithmic Tale of Crime, Conspiracy, and Computation',246,3.98,'9781590000000','2016-08-16'),
	 ('High Performance Spark: Best Practices for Scaling and Optimizing Apache Spark',358,3.89,'9781490000000','2017-06-16'),
	 ('Multiagent Systems: Algorithmic, Game-Theoretic, and Logical Foundations',504,3.68,'9780520000000','2008-12-01'),
	 ('Exploring ES6',630,4.42,null,'2015-06-13'),
	 ('Web Scalability for Startup Engineers',416,4.58,'9780070000000','2015-06-23'),
	 ('Hacking For Dummies',388,3.69,'9780470000000','2006-11-01'),
	 ('The Nature of Software Development',null,4.13,null,null),
	 ('Computational Science and Engineering',716,4.00,'9780960000000','2007-11-01'),
	 ('PHP Web Services: APIs for the Modern Web',118,3.64,'9781450000000','2013-05-03'),
	 ('The Debian Administrator''s Handbook',498,4.09,null,'2012-04-22'),
	 ('Lean Enterprise: How High Performance Organizations Innovate at Scale',352,4.25,'9781450000000','2014-12-04'),
	 ('C++ For Dummies',432,3.59,null,'2004-05-07'),
	 ('Agile Project Management with Scrum',188,3.70,'9780740000000','2004-02-18'),
	 ('Fundamentals of Machine Learning for Predictive Data Analytics: Algorithms, Worked Examples, and Case Studies',624,4.48,'9780260000000','2015-07-24'),
	 ('Information: The New Language of Science',null,3.91,'9780670000000','2004-04-30'),
	 ('Machine Learning Yearning',null,4.30,null,null),
	 ('Game Physics Engine Development With CDROM',456,4.22,'9780120000000','2007-03-07'),
	 ('Software Requirements 3',672,4.29,'9780740000000','2013-08-12'),
	 ('The Developer''s Code: What Real Programmers Do',142,3.42,null,'2012-02-22'),
	 ('Test Driven Development for Embedded C',352,4.20,'9781930000000','2011-05-02'),
	 ('Coding Interview Questions',520,4.09,'9781480000000','2012-05-02'),
	 ('Internetworking with TCP/IP Vol.1: Principles, Protocols, and Architecture',750,4.12,'9780130000000','2000-01-18'),
	 ('Absolute C++',943,3.84,'9780320000000','2007-03-01'),
	 ('Python Algorithms: Mastering Basic Algorithms in the Python Language',316,4.01,'9781430000000','2010-11-24'),
	 ('Genetic Programming: On the Programming of Computers by Means of Natural Selection',836,4.28,'9780260000000','1992-12-11'),
	 ('Ada, the Enchantress of Numbers: A Selection from the Letters of Lord Byron''s Daughter and Her Description of the First Computer',439,3.34,'9780910000000','1992-01-08'),
	 ('The Last Lecture',217,4.26,null,'2008-04-11'),
	 ('Principles of Program Analysis',452,3.87,'9783540000000','2004-12-10'),
	 ('Term Rewriting and All That',316,4.11,'9780520000000','2006-07-31'),
	 ('Java Examples in a Nutshell: A Companion Volume to Java in a Nutshell',397,3.47,'9781570000000','1997-09-08'),
	 ('Database in Depth: Relational Theory for Practitioners',232,3.96,'9780600000000','2005-05-15'),
	 ('Communication and Concurrency',300,4.73,'9780130000000','1995-12-01'),
	 ('ERLANG Programming',496,4.09,'9780600000000','2009-06-26'),
	 ('Data Compression Book',576,3.93,'9781560000000','1995-12-14'),
	 ('Blown to Bits: Your Life, Liberty, and Happiness After the Digital Explosion',366,3.63,'9780140000000','2008-06-01'),
	 ('Programming Languages: Design and Implementation',672,3.91,'9780130000000','2000-09-07'),
	 ('The Art of Assembly Language',928,3.70,'9781890000000','2003-09-08'),
	 ('Introduction to Parallel Computing',656,3.39,'9780200000000','2003-01-26'),
	 ('Introduction to Computational Genomics',182,4.00,'9780520000000','2007-02-01'),
	 ('Problem Solving with C++: The Object of Programming',800,3.72,'9780810000000','1996-01-01'),
	 ('Ship It,',200,3.75,'9780970000000','2005-06-08'),
	 ('Cloud Application Architectures: Building Applications and Infrastructure in the Cloud',208,3.07,'9780600000000','2009-04-10'),
	 ('Common LISP: The Language',1029,4.26,'9781560000000','1984-06-29'),
	 ('C++: The Complete Reference',1056,4.04,'9780070000000','2002-12-10'),
	 ('Revolution in The Valley: The Insanely Great Story of How the Mac Was Made',291,4.17,'9780600000000','2004-12-16'),
	 ('Introduction to Computer Theory',648,3.89,'9780470000000','1996-10-25'),
	 ('Network Security Essentials: Applications and Standards',413,3.81,'9780130000000','2006-07-01'),
	 ('The Formal Semantics of Programming Languages: An Introduction',384,3.68,'9780260000000','1993-02-05'),
	 ('Java Performance',720,4.11,null,null),
	 ('C++ from the Ground Up',624,4.02,'9780070000000','2003-04-09'),
	 ('Lionsi?1 Commentary on UNIX 6th Edition with Source Code',254,4.38,'9781570000000','1996-01-01'),
	 ('Beyond Fear: Thinking Sensibly about Security in an Uncertain World',296,4.00,'9780390000000','2006-05-04'),
	 ('Communication Networks: Fundamental Concepts and Key Architectures',928,4.17,'639786000000','2003-07-16'),
	 ('Computability: An Introduction to Recursive Function Theory',264,3.76,'9780520000000','1980-06-19'),
	 ('Logik fA1r Informatiker',200,3.23,'9783830000000','2000-01-01'),
	 ('Fluid Concepts and Creative Analogies',528,3.98,'9780470000000','1996-03-22'),
	 ('Core Java 2, Volume I--Fundamentals (Core Series)',784,3.83,'9780130000000','2004-08-27'),
	 ('VI Editor Pocket Reference (Pocket Reference',80,4.02,'9781570000000','1999-01-25'),
	 ('Practical UNIX & Internet Security',1004,3.86,'9781570000000','1996-04-08'),
	 ('An Introduction to Bioinformatics Algorithms',456,3.78,'9780260000000','2004-08-06'),
	 ('Eniac: The Triumphs and Tragedies of the World''s First Computer',262,3.78,'9780430000000','2001-02-01'),
	 ('No Tech Hacking: A Guide to Social Engineering, Dumpster Diving, and Shoulder Surfing',285,4.00,'9781600000000','2008-02-01'),
	 ('The Google Story: Inside the Hottest Business, Media, and Technology Success of Our Time',336,3.84,'9780550000000','2008-09-23'),
	 ('Quality Software Management: Systems Thinking',336,4.26,'9780930000000','1992-01-01'),
	 ('The Standard C Library',512,4.12,'9780130000000','1991-07-11'),
	 ('Beginning Linux Programming',848,3.78,'9780760000000','2004-01-02'),
	 ('Ruminations on C++: A Decade of Programming Insight and Experience',400,3.91,'9780200000000','1996-08-17'),
	 ('The Hundred-Page Machine Learning Book',null,4.64,null,null),
	 ('Starting Out with C++: From Control Structures Through Objects',1248,3.90,'9780130000000','2011-03-07'),
	 ('Building Machine Learning Systems with Python',350,3.86,'9781780000000','2013-09-30'),
	 ('Core J2EE Patterns: Best Practices and Design Strategies',528,3.41,'9780130000000','2003-06-20'),
	 ('Java Generics and Collections: Speed Up the Java Development Process',286,3.94,'9780600000000','2006-10-24'),
	 ('UNIX Network Programming, Volume 2: Interprocess Communications',592,4.35,'9780130000000','1998-09-04'),
	 ('Pattern-Oriented Software Architecture Volume 2: Patterns for Concurrent and Networked Objects',666,3.65,'9780470000000','2000-10-03'),
	 ('Computer: A History of the Information Machine',376,4.11,'9780810000000','2013-07-30'),
	 ('A Programmer''s Introduction to Mathematics',378,3.83,'9781730000000','2018-11-27'),
	 ('Programming Languages: Principles and Practice',720,3.12,'9780530000000','2002-07-16'),
	 ('Machine Learning in Action',384,3.74,'9781620000000','2012-04-16'),
	 ('What is DevOps?',18,3.53,null,'2012-06-11'),
	 ('Let Us C',746,4.12,'9788180000000','2004-03-22'),
	 ('Working with UNIX Processes',148,4.06,null,'2012-01-01'),
	 ('Computability and Unsolvability',288,3.87,'9780490000000','1985-12-01'),
	 ('File Structures: An Object-Oriented Approach with C++',724,3.89,'9780200000000','1997-12-16'),
	 ('Mathematical Logic for Computer Science',354,3.77,'9781850000000','2011-11-22'),
	 ('Operating System Concepts Essentials',725,3.76,'9780470000000','2010-11-23'),
	 ('Python Programming for the Absolute Beginner',472,3.89,'9781600000000','2005-11-08'),
	 ('Algorithms of the Intelligent Web',368,3.61,'9781930000000','2009-07-05'),
	 ('Making Software: What Really Works, and Why We Believe It',624,3.48,'9780600000000','2010-10-27'),
	 ('Operating System Concepts with Java',1020,3.74,'9780470000000','2009-11-01'),
	 ('An Introduction to Kolmogorov Complexity and Its Applications',637,3.96,'9780390000000','1997-02-27'),
	 ('Responsive Web Design',150,4.16,null,'2011-06-07'),
	 ('The Hacker Ethic: A Radical Approach to the Philosophy of Business',256,3.71,'9780380000000','2002-02-12'),
	 ('Invent Your Own Computer Games with Python',438,4.05,'9780980000000','2010-05-01'),
	 ('Machine Learning: An Algorithmic Perspective',390,3.64,'9781420000000','2009-04-01'),
	 ('DSLs in Action',376,3.49,'9781940000000','2011-01-04'),
	 ('Real Digital Forensics: Computer Security and Incident Response',688,4.13,null,'2005-09-23'),
	 ('Game Coding Complete',928,4.01,'9781930000000','2003-06-15'),
	 ('Principles of Programming Languages: Design, Evaluation, and Implementation',528,3.70,'9780200000000','1999-03-25'),
	 ('Discrete and Combinatorial Mathematics',800,3.62,'9780200000000','2003-07-27'),
	 ('Object-Oriented Software Engineering: Using UML, Patterns and Java',762,3.68,'9780130000000','2003-09-25'),
	 ('The Art of Doing Science and Engineering: Learning to Learn',376,4.28,'9789060000000','1997-10-28'),
	 ('Numerical Recipes: The Art of Scientific Computing',1235,4.23,'9780520000000','2007-10-01'),
	 ('Worm: The First Digital World War',233,3.55,'9780800000000','2011-09-27'),
	 ('CSS Mastery: Advanced Web Standards Solutions',255,4.11,'9781590000000','2006-02-01'),
	 ('Unlocking the Clubhouse: Women in Computing',184,4.18,'9780260000000','2003-02-28'),
	 ('D Is for Digital: What a Well-Informed Person Should Know about Computers and Communications',238,4.22,'9781460000000','2011-09-23'),
	 ('A Practical Guide to Linux Commands, Editors, and Shell Programming',1008,4.00,'9780130000000','2005-07-01'),
	 ('Introduction to Evolutionary Computing',300,4.03,'9783540000000','2007-08-06'),
	 ('Wikinomics: How Mass Collaboration Changes Everything',324,3.72,'9781590000000','2006-12-12'),
	 ('Software Craftsmanship: The New Imperative',182,3.92,'9780200000000','2001-09-02'),
	 ('Head First HTML with CSS & XHTML',702,4.14,'9780600000000','2005-12-01'),
	 ('Webmaster in a Nutshell',537,3.65,'9781570000000','1999-06-11'),
	 ('A Gift of Fire: Social, Legal, and Ethical Issues for Computers and the Internet',464,3.33,'9780130000000','2002-06-05'),
	 ('Perl Pocket Reference',96,4.22,'9780600000000','2002-07-29'),
	 ('More Exceptional C++: 40 New Engineering Puzzles, Programming Problems, and Solutions',304,4.20,'9780200000000','2001-12-17'),
	 ('Real-Time Collision Detection (The Morgan Kaufmann Series in Interactive 3d Technology)',632,4.45,'9781560000000','2004-12-22'),
	 ('Clever Algorithms: Nature-Inspired Programming Recipes',436,3.73,null,'2011-01-22'),
	 ('Learning OpenCV: Computer Vision with the OpenCV Library',580,4.01,'9780600000000','2008-10-01'),
	 ('Grace Hopper and the Invention of the Information Age (Lemelson Center Studies in Invention and Innovation series)',408,3.83,'9780260000000','2009-07-10'),
	 ('Deep Thinking: Where Machine Intelligence Ends and Human Creativity Begins',null,3.94,'9781480000000','2017-05-02'),
	 ('Deep Learning: A Practitioner''s Approach',200,3.71,'9781490000000','2015-08-15'),
	 ('Professor Frisby''s Mostly Adequate Guide to Functional Programming',115,4.36,null,null),
	 ('Turing''s Vision: The Birth of Computer Science',208,4.29,'9780260000000','2016-05-13'),
	 ('Mathematical Elements for Computer Graphics',611,4.02,'9780070000000','1989-08-01'),
	 ('Chaos: Making a New Science',352,3.99,'9780140000000','1988-12-01'),
	 ('Operating Systems: Internals and Design Principles',818,3.65,'9780130000000','2005-02-14'),
	 ('Working Effectively with Unit Tests',204,4.04,null,'2014-06-29'),
	 ('Best Practices of Spell Design',140,3.84,'9781480000000','2013-01-21'),
	 ('Mathematical Structures for Computer Science',784,3.98,'9780720000000','2006-07-07'),
	 ('BDD in Action: Behavior-driven development for the whole software lifecycle',384,4.09,'9781620000000','2014-10-12'),
	 ('Understanding Computation: From Simple Machines to Impossible Programs',332,4.23,'9781450000000','2013-05-10'),
	 ('The Business Blockchain: Promise, Practice, and Application of the Next Internet Technology',208,3.49,'9781120000000','2016-04-26'),
	 ('Basic Proof Theory',355,3.83,'9780520000000','1996-09-13'),
	 ('Patterns Principles and Practices of Domain Driven Design',736,4.29,null,'2015-03-22'),
	 ('The Princeton Companion to Mathematics',1034,4.39,'9780690000000','2008-09-28'),
	 ('Docker: Up & Running: Shipping Reliable Containers in Production',230,3.76,'9781490000000','2015-06-09'),
	 ('Introduction to 64 Bit Intel Assembly Language Programming for Linux: Second Edition',310,3.86,null,'2012-07-02'),
	 ('Pragmatic Unit Testing in Java 8 with Junit',200,3.77,'9781940000000','2015-03-19'),
	 ('Modern Processor Design: Fundamentals of Superscalar Processors',642,4.25,'9781480000000','2013-08-12'),
	 ('Visualize This: The FlowingData Guide to Design, Visualization, and Statistics',358,3.88,'9780470000000','2011-07-20'),
	 ('Data Structures Using C and C++',672,4.21,'9780130000000','1995-12-29'),
	 ('How to Think About Algorithms',472,3.87,null,'2008-05-19'),
	 ('Operating Systems: Principles and Practice',674,4.10,'9780990000000','2012-07-17'),
	 ('Complex Adaptive Systems: An Introduction to Computational Models of Social Life',263,3.95,'9780690000000','2007-03-01'),
	 ('Exercises in Programming Style',304,4.39,'9781480000000','2014-06-16'),
	 ('An Introduction to Parallel Programming',370,3.78,'9780120000000','2011-01-21'),
	 ('SSH Mastery: OpenSSH, PuTTY, Tunnels and Keys',150,4.16,null,'2012-01-18'),
	 ('How to Break Software: A Practical Guide to Testing',208,3.66,null,'2002-05-09'),
	 ('Taming Text',322,3.81,'9781930000000','2013-01-21'),
	 ('Write Great Code: Volume 2: Thinking Low-Level, Writing High-Level',640,4.05,'9781590000000','2006-03-18'),
	 ('Core Java, Volume II--Advanced Features',1002,3.96,'9780130000000',null),
	 ('Adrenaline Junkies and Template Zombies: Understanding Patterns of Project Behavior',238,3.95,'9780930000000','2008-03-01'),
	 ('The Art of Memory Forensics: Detecting Malware and Threats in Windows, Linux, and Mac Memory',912,4.38,'9781120000000','2014-07-28'),
	 ('Testing Computer Software',480,3.88,'9780470000000','1999-04-26'),
	 ('Beginning Java EE 7',603,3.95,null,'2013-06-26'),
	 ('Web Operations: Keeping the Data on Time',315,4.11,'9781450000000','2010-07-01'),
	 ('Object Design: Roles, Responsibilities, and Collaborations',416,3.70,'785342000000','2002-11-18'),
	 ('Bash Cookbook: Solutions and Examples for Bash Users',630,3.90,'9780600000000','2007-05-31'),
	 ('RabbitMQ in Action',312,3.94,'9781940000000','2012-05-01'),
	 ('How the Mind Works',660,3.97,'9780390000000','1999-01-17'),
	 ('Pro C# 5.0 and the .Net 4.5 Framework',1560,4.26,'9781430000000','2012-08-27'),
	 ('Service Design Patterns: Fundamental Design Solutions for SOAP/WSDL and RESTful Web Services',321,3.71,'9780320000000','2011-10-28'),
	 ('Linux Command Line and Shell Scripting Bible',809,4.12,'9780470000000','2008-06-01'),
	 ('The Art of R Programming: A Tour of Statistical Software Design',400,4.08,'9781590000000','2011-10-12'),
	 ('Computer Security: Principles and Practice',798,3.74,'9780140000000','2008-07-01'),
	 ('C# 5.0 in a Nutshell: The Definitive Reference',1064,4.30,'9781450000000','2012-06-26'),
	 ('An Introduction to Programming in Go',161,3.77,null,'2012-09-03'),
	 ('Principles of Model Checking',975,3.72,'9780260000000','2008-05-01'),
	 ('Essential System Administration',788,3.84,'9781570000000','1995-09-08'),
	 ('MapReduce Design Patterns: Building Effective Algorithms and Analytics for Hadoop and Other Systems',230,3.91,'9781450000000','2012-12-22'),
	 ('Real World OCaml: Functional programming for the masses',510,4.23,'9781450000000','2013-11-22'),
	 ('The Latex Companion',1120,4.03,'9780200000000','2004-05-02'),
	 ('The Definitive Guide to Django: Web Development Done Right',447,3.86,'9781590000000','2007-12-01'),
	 ('Succeeding with Agile: Software Development Using Scrum',475,4.00,'9780320000000','2009-10-01'),
	 ('Type Theory And Functional Programming',372,4.20,'9780200000000','1991-08-01'),
	 ('CSS: The Missing Manual',560,4.12,'9780600000000','2009-09-01'),
	 ('Semantics of Programming Languages: Structures and Techniques',null,3.44,'9780260000000','1992-09-14'),
	 ('What Computers Still Can''t Do: A Critique of Artificial Reason',408,4.12,'9780260000000','1992-10-30'),
	 ('The Recursive Universe: Cosmic Complexity and the Limits of Scientific Knowledge',252,3.95,'9780810000000','1985-10-01'),
	 ('ML for the Working Programmer',500,3.76,'9780520000000','1996-06-28'),
	 ('Designing With Web Standards',456,4.09,'9780740000000','2003-05-14'),
	 ('Languages and Machines: An Introduction to the Theory of Computer Science',654,3.56,'9780320000000','2005-02-24'),
	 ('Object-Oriented Design Heuristics',379,4.18,'9780200000000','1996-04-30'),
	 ('802.11 Wireless Networks: The Definitive Guide',672,3.64,'9780600000000','2005-05-02'),
	 ('Object-Oriented JavaScript',337,4.16,'9781850000000','2008-07-24'),
	 ('Programming in Objective-C 2.0',600,3.85,'9780320000000','2008-11-01'),
	 ('Little Brother',382,3.93,'9780770000000','2008-04-29'),
	 ('Physics for Game Developers',344,3.47,'9780600000000','2001-11-23'),
	 ('Network Algorithmics: An Interdisciplinary Approach to Designing Fast Networked Devices',496,4.30,'9780120000000','2004-12-01'),
	 ('Google''s Pagerank and Beyond: The Science of Search Engine Rankings',224,3.70,'9780690000000','2006-05-01'),
	 ('Approximation Algorithms',380,4.19,'9783540000000','2002-12-05'),
	 ('Software Systems Architecture: Working with Stakeholders Using Viewpoints and Perspectives',576,4.07,'9780320000000','2005-04-01'),
	 ('Operating System Principles',366,3.78,'9780140000000','1973-01-01'),
	 ('Writing Efficient Programs',170,4.00,'9780140000000','1982-01-01'),
	 ('HTTP: The Definitive Guide',656,4.14,'9781570000000','2002-10-07'),
	 ('Rebel Code: Linux and the Open Source Revolution',344,3.90,'9780740000000','2002-07-11'),
	 ('Computers & Typesetting, Volume A: The TeXBook',483,4.32,'9780200000000','1986-01-11'),
	 ('SQL Pocket Guide',184,3.90,'9780600000000','2006-04-27'),
	 ('Linux Device Drivers',615,4.08,'9780600000000','2005-02-17'),
	 ('JavaScript Bible',1236,3.70,'9780760000000','2004-03-22'),
	 ('Computer Algorithms: Introduction to Design and Analysis',600,3.53,'9780200000000','1988-01-01'),
	 ('Object-Oriented Software Engineering',552,3.79,'785343000000','1992-07-01'),
	 ('Pattern-Oriented Software Architecture Volume 1: A System of Patterns',476,3.85,'9780470000000','1996-08-16'),
	 ('Large-Scale C++ Software Design',896,3.90,'9780200000000','1996-07-20'),
	 ('Documenting Software Architectures: Views and Beyond',560,3.69,'9780200000000','2002-10-06'),
	 ('Pattern Hatching: Design Patterns Applied',160,3.73,'9780200000000','1998-07-02'),
	 ('Serious Cryptography: A Practical Introduction to Modern Encryption',312,4.25,null,'2017-11-21'),
	 ('Python Tricks',304,4.40,'9781780000000','2017-10-25'),
	 ('Beyond Software Architecture: Creating and Sustaining Winning Solutions',352,3.72,'9780200000000','2003-02-09'),
	 ('The Site Reliability Workbook: Practical Ways to Implement SRE',512,4.29,'9781490000000','2018-08-04'),
	 ('Kubernetes: Up & Running',202,3.99,'9781490000000','2016-01-31'),
	 ('Hit Refresh',273,3.77,'9780060000000','2017-11-15'),
	 ('Fundamentals of Deep Learning: Designing Next-Generation Artificial Intelligence Algorithms',298,3.90,'9781490000000','2015-07-22'),
	 ('Homo Deus: A Brief History of Tomorrow',450,4.29,null,'2017-02-21'),
	 ('From Counterculture to Cyberculture: Stewart Brand, the Whole Earth Network, and the Rise of Digital Utopianism',327,3.97,'9780230000000','2006-09-23'),
	 ('Practical Reverse Engineering: x86, x64, ARM, Windows Kernel, Reversing Tools, and Obfuscation',355,3.88,'9781120000000','2014-02-17'),
	 ('Storytelling with Data: A Data Visualization Guide for Business Professionals',288,4.37,'9781120000000','2015-11-02'),
	 ('Overcomplicated: Technology at the Limits of Comprehension',240,3.38,'9781590000000','2016-07-19'),
	 ('Node.Js the Right Way: Practical, Server-Side JavaScript That Scales',148,3.86,'9781940000000','2013-12-05'),
	 ('Probably Approximately Correct: Nature''s Algorithms for Learning and Prospering in a Complex World',208,3.62,'9780470000000','2013-06-04'),
	 ('SmallTalk 80 Language: The Language and Its Implementation',714,4.68,'9780200000000','1983-03-01'),
	 ('CSS: The Definitive Guide',518,3.99,'9780600000000','2006-11-01'),
	 ('Universal Principles of Design: 100 Ways to Enhance Usability, Influence Perception, Increase Appeal, Make Better Design Decisions, and Teach Through Design',216,4.13,'9781590000000','2003-10-01'),
	 ('Lean from the Trenches',176,4.20,'9781930000000','2011-12-21'),
	 ('Genetic Programming: An Introduction On The Automatic Evolution Of Computer Programs And Its Applications',null,3.82,'9781560000000',null),
	 ('Graphics Programming Black Book Special Edition',1200,4.48,'9781580000000','1997-09-01'),
	 ('Linux System Programming: Talking Directly to the Kernel and C Library',429,4.20,'9781450000000','2013-06-05'),
	 ('How to Solve It by Computer',442,4.12,'9780130000000','1982-07-01'),
	 ('The Grammar of Graphics',691,4.20,'9780390000000','2005-06-01'),
	 ('Effective C#: 50 Specific Ways to Improve Your C#',307,4.01,'9780320000000','2004-12-13'),
	 ('Slack: Getting Past Burnout, Busywork, and the Myth of Total Efficiency',256,4.01,'9780770000000','2002-04-09'),
	 ('Software Requirements: Practical Techniques for Gathering and Managing Requirements Throughout the Product Development Cycle',516,3.97,'9780740000000','2003-03-08'),
	 ('Collective Intelligence in Action',425,3.74,'9781930000000','2008-11-04'),
	 ('The Hacker Crackdown: Law and Disorder on the Electronic Frontier',336,3.74,'9780550000000','1993-11-01'),
	 ('The Art of SQL',349,3.92,'9780600000000','2006-03-01'),
	 ('Algorithms in C, Part 5: Graph Algorithms',512,3.96,'9780200000000','2001-08-26'),
	 ('Computability Theory',420,4.62,'9781580000000','2003-11-17'),
	 ('Tmux: Productive Mouse-Free Development',88,3.92,'9781930000000','2012-02-29'),
	 ('Linked: How Everything Is Connected to Everything Else and What It Means for Business, Science, and Everyday Life',304,3.93,'9780450000000','2003-04-29'),
	 ('The AWK Programming Language',224,4.25,'9780200000000','1988-01-11'),
	 ('Inside the C++ Object Model',304,4.20,'9780200000000','1996-05-13'),
	 ('Agile Testing: A Practical Guide for Testers and Agile Teams',533,3.83,'9780320000000','2009-01-09'),
	 ('Clojure Programming',630,4.18,'9781450000000','2012-04-19'),
	 ('Programming in Objective C',556,3.96,'9780670000000','2003-12-08'),
	 ('Lambda-Calculus, Combinators and Functional Programming',192,3.00,'9780520000000','2009-02-27'),
	 ('Causality: Models, Reasoning, and Inference',400,4.18,'9780520000000','2000-03-13'),
	 ('Why Programs Fail: A Guide to Systematic Debugging',400,3.91,'9780120000000','2009-06-01'),
	 ('The Best Software Writing I: Selected and Introduced by Joel Spolsky',305,3.84,'9781590000000','2005-10-21'),
	 ('The Architecture of Open Source Applications, Volume II',390,4.05,'9781110000000','2012-05-08'),
	 ('Head First HTML5 Programming',610,3.99,'9781450000000','2011-10-18'),
	 ('Code Craft: The Practice of Writing Excellent Code',610,3.96,'9781590000000','2006-12-21'),
	 ('High Performance MySQL: Optimization, Backups, Replication & Load Balancing',304,4.24,'9780600000000','2004-04-18'),
	 ('Web Form Design: Filling in the Blanks',226,4.04,'9781930000000','2008-12-01'),
	 ('Antipatterns: Refactoring Software, Architectures, and Projects in Crisis',336,3.79,'9780470000000','1998-04-03'),
	 ('Cassandra: The Definitive Guide',330,3.59,'9781450000000','2010-11-29'),
	 ('Algorithms in C++',672,3.94,'785343000000','1992-04-30'),
	 ('Agile Retrospectives: Making Good Teams Great',170,3.91,'9780980000000','2006-08-02'),
	 ('The Art of Scalability: Scalable Web Architecture, Processes, and Organizations for the Modern Enterprise',559,3.96,'9780140000000','2009-12-01'),
	 ('Core Python Programming',1100,3.86,'9780130000000','2006-09-28'),
	 ('Algorithms in C, Parts 1-4: Fundamentals, Data Structures, Sorting, Searching',720,4.14,'785342000000','1997-09-27'),
	 ('The Art of Computer Programming, Volume 4, Fascicles 0-4',944,5.00,'9780320000000','2009-04-01'),
	 ('Concepts in Programming Languages',540,3.45,'9780520000000','2010-07-23'),
	 ('Data and Computer Communications',878,3.87,'9780130000000','2006-08-01'),
	 ('The Society of Mind',336,4.01,'9780670000000','1988-03-15'),
	 ('The Emotion Machine: Commonsense Thinking, Artificial Intelligence, and the Future of the Human Mind',400,3.76,'9780740000000','2006-11-07'),
	 ('Data Structures and Algorithms in C++',528,3.70,'9780530000000','2000-06-30'),
	 ('Artificial Intelligence for Games (The Morgan Kaufmann Series in Interactive 3D Technology)',896,4.17,'9780120000000','2006-06-21'),
	 ('Programming in Python 3: A Complete Introduction to the Python Language',552,3.69,'9780140000000','2008-12-26'),
	 ('The Internet of Money',150,4.13,null,'2016-08-29'),
	 ('The Art of Electronics',1152,4.33,'9780520000000','1989-07-28'),
	 ('A Pattern Language: Towns, Buildings, Construction',1216,4.39,'9780200000000','1977-08-25'),
	 ('Distributed Systems',582,4.09,'9781540000000','2017-02-01'),
	 ('The Hardware Hacker: Adventures in Making and Breaking Hardware',396,4.29,'9781590000000','2017-03-09'),
	 ('Kotlin in Action',360,4.50,'9781620000000','2016-05-23'),
	 ('Web Scraping with Python: Collecting Data from the Modern Web',256,4.14,null,'2015-06-15'),
	 ('What the Dormouse Said: How the Sixties Counterculture Shaped the Personal Computer Industry',310,3.81,'9780140000000','2006-02-28'),
	 ('Chaos Monkeys: Obscene Fortune and Random Failure in Silicon Valley',528,3.72,'9780060000000','2016-06-28'),
	 ('Hello Ruby: Adventures in Coding',112,3.90,'9781250000000','2015-10-06'),
	 ('Zero Bugs and Program Faster',182,3.71,'9781000000000','2016-01-01'),
	 ('Steal This Computer Book 4.0 Acâ¬âo What They WonAcâ¬2t Tell You About the Internet 4e',376,3.66,'9781590000000','2006-05-11'),
	 ('Software Architecture Patterns',47,3.69,null,'2015-03-23'),
	 ('Elixir in Action, Second Edition',384,4.50,null,'2019-01-23'),
	 ('Clojure for the Brave and True',352,4.27,null,null),
	 ('The Robert C. Martin Clean Code Collection (Collection)',699,4.51,'9780130000000','2011-11-10'),
	 ('The Inevitable: Understanding the 12 Technological Forces That Will Shape Our Future',336,3.96,null,'2016-06-07'),
	 ('Database Systems: A Practical Approach to Design, Implementation and Management',1424,3.67,'9780320000000','2004-05-24'),
	 ('Mastering Emacs',280,4.16,null,'2015-05-23'),
	 ('Ada Byron Lovelace and the Thinking Machine',40,4.19,'9781940000000','2015-10-13'),
	 ('Structured Programming',234,4.23,'9780120000000','1972-03-23'),
	 ('Amazon Web Services in Action',424,3.81,'9781620000000','2015-10-17'),
	 ('Free Software, Free Society: Selected Essays',224,4.13,'9781880000000','2002-10-01'),
	 ('Reactive Messaging Patterns with the Actor Model: Applications and Integration in Scala and Akka',480,3.56,'9780130000000','2015-08-17'),
	 ('Management 3.0: Leading Agile Developers, Developing Agile Leaders',451,4.14,'9780320000000','2010-12-28'),
	 ('Modern C++ Programming with Test-Driven Development: Code Better, Sleep Better',380,4.43,'9781940000000','2013-10-20'),
	 ('Java: A Beginner''s Guide (Beginner''s Guide)',null,3.96,'9780070000000','2005-04-01'),
	 ('Program or Be Programmed: Ten Commands for a Digital Age',152,3.69,null,'2010-11-01'),
	 ('Data Structure and Algorithmic Thinking with Python',468,4.10,'9788190000000','2015-01-29'),
	 ('Theory of Recursive Functions and Effective Computability',506,4.00,'9780260000000','1987-04-22'),
	 ('Dataclysm: Who We Are (When We Think No One''s Looking)',304,3.74,'9780390000000','2014-09-09'),
	 ('Linux Bible',864,4.30,'9781120000000','2012-09-11'),
	 ('Java:  The Complete Reference',1000,4.15,'9780070000000','2011-02-07'),
	 ('Black Hat Python: Python Programming for Hackers and Pentesters',171,4.07,'9781590000000','2014-12-14'),
	 ('Build Your Own Lisp',null,4.22,null,'2014-03-23'),
	 ('Ruby Under a Microscope',272,4.37,null,'2012-03-23'),
	 ('A Bug Hunter''s Diary: A Guided Tour Through the Wilds of Software Security',208,3.92,'9781590000000','2011-11-11'),
	 ('Advanced Concepts in Operating Systems',448,3.96,'9780070000000','1994-01-01'),
	 ('A History of Modern Computing',459,3.96,'9780260000000','2003-04-08'),
	 ('Machine Learning with R',396,4.22,'9781310000000','2014-06-13'),
	 ('The Hacker Playbook: Practical Guide To Penetration Testing',294,3.99,null,'2014-03-20'),
	 ('Intuition Pumps And Other Tools for Thinking',496,3.79,'9780390000000','2014-05-05'),
	 ('Flash Boys: A Wall Street Revolt',320,4.14,'9780390000000','2015-03-23'),
	 ('The Search: How Google and Its Rivals Rewrote the Rules of Business and Transformed Our Culture',320,3.83,'9781590000000','2005-09-08'),
	 ('Introduction to Reliable and Secure Distributed Programming',367,4.41,'9783640000000','2011-02-12'),
	 ('Reinventing Discovery: The New Era of Networked Science',264,3.92,'9780690000000','2011-10-23'),
	 ('Hacking the Xbox: An Introduction to Reverse Engineering',288,4.07,'9781590000000','2003-07-01'),
	 ('R Graphics Cookbook: Practical Recipes for Visualizing Data',416,4.24,'9781450000000','2012-12-06'),
	 ('21st Century C: C Tips from the New School',296,3.81,'9781450000000','2012-11-05'),
	 ('MongoDB: The Definitive Guide',216,3.85,'9781450000000','2010-09-24'),
	 ('Foundations of Computer Science',624,3.95,'9781840000000','2007-12-01'),
	 ('Programming from the Ground Up',332,4.12,'9780980000000','2004-07-01'),
	 ('Confident Ruby',296,4.40,null,'2012-06-05'),
	 ('Agile Software Development with Scrum',158,3.82,'9780130000000','2001-10-21'),
	 ('The Quick Python Book',367,3.82,'9781940000000','2010-01-22'),
	 ('Kanban: Successful Evolutionary Change for Your Technology Business',262,3.97,'9780980000000','2010-04-07'),
	 ('Team Geek: A Software Developer''s Guide to Working Well with Others',167,3.97,'9781450000000','2012-07-21'),
	 ('Data Structures and Algorithm Analysis in Java',576,3.63,'9780320000000','2006-03-03'),
	 ('Fundamentals of Computer Graphics',392,3.67,'9781570000000','2002-06-15'),
	 ('Rework',279,3.94,'9780310000000','2010-03-09'),
	 ('Conceptual Mathematics: A First Introduction To Categories',null,4.32,'9780520000000','1997-11-28'),
	 ('Object-Oriented Programming in C++',1012,4.11,'9780670000000','2001-12-29'),
	 ('Design for Hackers: Reverse Engineering Beauty',352,3.74,'9781120000000','2011-08-29'),
	 ('The Sciences of the Artificial',248,4.23,'9780260000000','1996-09-26'),
	 ('Certified Programming with Dependent Types: A Pragmatic Introduction to the Coq Proof Assistant',424,4.09,'9780260000000','2013-12-06'),
	 ('Test Driven: Practical TDD and Acceptance TDD for Java Developers',513,3.83,'9781930000000','2007-10-19'),
	 ('Python Pocket Reference',148,4.00,'9780600000000','2005-03-06'),
	 ('SCJP Sun Certified Programmer for Java 6 Study Guide',851,4.28,'9780070000000','2008-06-24'),
	 ('Computer Organization',832,3.67,'9780070000000','2001-08-02'),
	 ('Refactoring Databases: Evolutionary Database Design',384,3.70,'9780320000000','2006-03-03'),
	 ('jQuery: Novice to Ninja',407,3.91,'9780980000000','2010-03-07'),
	 ('Thinking in C++, Volume One: Introduction to Standard C++',840,4.12,'76092006565','2000-03-25'),
	 ('Learning Java',954,3.60,'9780600000000','2005-05-30'),
	 ('Managing Humans: Biting and Humorous Tales of a Software Engineering Manager',209,3.97,'9781590000000','2007-06-01'),
	 ('Programming the Semantic Web',302,3.69,'9780600000000','2009-07-21'),
	 ('CSS3 For Web Designers',125,4.06,null,'2010-11-16'),
	 ('Data Communications and Networking (McGraw-Hill Forouzan Networking)',1168,3.90,'9780070000000','2006-02-09'),
	 ('SQL and Relational Theory: How to Write Accurate SQL Code',428,3.75,'9780600000000','2009-01-30'),
	 ('The Art of Computer Programming, Volume 4, Fascicle 4: Generating All Trees--History of Combinatorial Generation',120,4.50,'9780320000000','2006-02-01'),
	 ('How Would You Move Mount Fuji? Microsoft''s Cult of the Puzzle--How the World''s Smartest Companies Select the Most Creative Thinkers',288,3.57,'9780320000000','2004-04-02'),
	 ('The Road Ahead',286,3.69,'9780670000000','1995-11-21'),
	 ('Being Geek: The Software Developer''s Career Handbook',318,3.70,'9780600000000','2010-08-10'),
	 ('The Art of Software Testing',256,3.69,'9780470000000','2004-06-21'),
	 ('The RSpec Book',426,3.87,'9781930000000','2010-12-22'),
	 ('The Implementation (TCP/IP Illustrated, Volume 2)',1174,4.21,'9780200000000','1995-02-10'),
	 ('Communicating Sequential Processes (Prentice Hall International Series in Computing Science)',256,4.33,'9780130000000','1985-04-01'),
	 ('Interactive Theorem Proving and Program Development: Coq Art: The Calculus of Inductive Constructions',472,3.86,'9783540000000','2004-05-14'),
	 ('Garbage Collection: Algorithms for Automatic Dynamic Memory Management',404,4.13,'9780470000000','1996-08-16'),
	 ('Database Systems: Design, Implementation, and Management',696,3.56,'9781420000000','2006-01-27'),
	 ('Learning GNU Emacs',536,3.63,'9780600000000','2004-12-20'),
	 ('Essential System Administration: Tools and Techniques for Linux and Unix Administration',1176,3.96,'9780600000000','2002-09-02'),
	 ('TCP/IP Network Administration',748,3.86,'9780600000000','2002-04-11'),
	 ('PHP & MySQL For Dummies',436,3.54,'9780470000000','2006-12-01'),
	 ('The Art of Computer Programming, Volume 1, Fascicle 1: MMIX -- A RISC Computer for the New Millennium',134,4.19,'9780200000000','2005-02-24'),
	 ('Exceptional C++: 47 Engineering Puzzles, Programming Problems, and Solutions',208,4.18,'9780200000000','1999-11-28'),
	 ('The Little Typer',424,4.35,'9780260000000','2018-09-18'),
	 ('Mathematics for Computer Science',1048,3.91,null,'2010-09-08'),
	 ('Cryptography: Theory and Practice (Discrete Mathematics and Its Applications)',593,3.71,'9781580000000','2005-11-01'),
	 ('Introduction to Artificial Intelligence',454,3.75,'9780490000000','1985-06-01'),
	 ('Software Project Survival Guide',306,3.82,'9781570000000','1997-10-22'),
	 ('Speaking JavaScript',460,4.37,'9781450000000','2014-03-24'),
	 ('Prediction Machines: The Simple Economics of Artificial Intelligence',272,4.00,null,'2018-04-17'),
	 ('Introduction to Linear Algebra',568,4.20,'9780960000000','2003-01-01'),
	 ('Girls Who Code: Learn to Code and Change the World',176,4.10,'9780750000000','2017-08-24'),
	 ('Technically Wrong: Sexist Apps, Biased Algorithms, and Other Threats of Toxic Tech',240,4.16,'9780390000000','2018-10-16'),
	 ('Think Java: How to Think Like a Computer Scientist',248,3.66,null,'2012-03-23'),
	 ('Quantum Computer Science',220,3.59,'9780520000000','2007-08-01'),
	 ('Designing Distributed Systems: Patterns and Paradigms for Scalable, Reliable Services',149,3.53,'9781490000000','2018-03-05'),
	 ('UNIX in a Nutshell: A Desktop Quick Reference - Covers GNU/Linux, Mac OS X, and Solaris',908,3.90,'9780600000000','2005-11-02'),
	 ('Envisioning Information',126,4.22,'9780960000000','1992-12-23'),
	 ('Programming Collective Intelligence: Building Smart Web 2.0 Applications',362,4.07,'9780600000000','2007-08-23'),
	 ('Bitcoin and Cryptocurrency Technologies: A Comprehensive Introduction',336,4.41,'9780690000000','2016-07-19'),
	 ('Intermediate Perl',256,3.97,'9780600000000','2006-03-18'),
	 ('Head First Python',494,3.77,'9781450000000','2010-12-07'),
	 ('Type-Driven Development with Idris',453,4.51,'9781620000000','2017-04-07'),
	 ('Functional and Reactive Domain Modeling',320,4.19,'9781620000000','2016-08-28'),
	 ('Future Crimes: Everything Is Connected, Everyone Is Vulnerable, and What We Can Do About It',393,3.94,'9780390000000','2015-02-24'),
	 ('Blockchain: Blueprint for a New Economy',152,3.31,null,'2015-01-24'),
	 ('Metaprogramming Ruby 2: Program Like the Ruby Pros',280,4.47,'9781940000000','2014-08-18'),
	 ('Computing: A Concise History',199,3.63,'9780260000000','2012-06-15'),
	 ('If Hemingway Wrote JavaScript',192,4.17,'9781590000000','2014-10-23'),
	 ('Just Enough Software Architecture: A Risk-Driven Approach',360,3.53,'9780980000000','2010-09-01'),
	 ('Software Architecture for Developers: Volume 1 - Technical leadership and the balance with agility',133,3.84,null,'2016-11-18'),
	 ('High Performance Python: Practical Performant Programming for Humans',370,4.17,'9781450000000','2014-08-25'),
	 ('Introduction to Computing Systems: From Bits & Gates to C & Beyond',656,3.77,'9780070000000','2003-08-05'),
	 ('Learning Agile: Understanding Scrum, XP, Lean, and Kanban',400,4.12,'9781450000000','2014-06-22'),
	 ('Computability, Complexity, and Languages: Fundamentals of Theoretical Computer Science (Computer Science and Scientific Computing)',609,3.96,'9780120000000','1994-02-17'),
	 ('Reactive Design Patterns',325,3.54,'9781620000000','2014-03-28'),
	 ('Counter Hack Reloaded: A Step-By-Step Guide to Computer Attacks and Effective Defenses',748,3.96,'9780130000000','2005-12-23'),
	 ('Android Programming: The Big Nerd Ranch Guide',602,4.31,'9780320000000','2013-04-07'),
	 ('Data Structures and Algorithms in Python',768,4.08,'9781120000000','2013-03-18'),
	 ('The Basics of Hacking and Penetration Testing: Ethical Hacking and Penetration Testing Made Easy',159,3.91,'9781600000000','2011-08-04'),
	 ('Getting Started with OAuth 2.0',82,3.50,'9781450000000','2012-02-29'),
	 ('Parallel and Concurrent Programming in Haskell: Techniques for Multicore and Multithreaded Programming',322,4.54,'9781450000000','2013-08-15'),
	 ('In Pursuit of the Traveling Salesman: Mathematics at the Limits of Computation',228,3.88,'691152705','2012-01-16'),
	 ('ggplot2: Elegant Graphics for Data Analysis',212,4.31,'9780390000000','2009-08-01'),
	 ('Distributed Operating Systems',632,3.96,'9780130000000','1994-09-04'),
	 ('SciPy and NumPy: An Overview for Developers',82,2.96,'9781450000000','2012-11-22'),
	 ('Scala in Depth',276,3.93,null,'2012-05-23'),
	 ('Implementation Patterns',157,3.62,'9780320000000','2007-10-01'),
	 ('Networks, Crowds, and Markets: Reasoning about a Highly Connected World',727,4.17,'9780520000000','2010-07-31'),
	 ('Cypherpunks: Freedom and the Future of the Internet',192,3.70,'9781940000000','2012-11-23'),
	 ('Selected Writings on Computing: A Personal Perspective',362,4.25,'9780390000000','1982-10-25'),
	 ('The Practice of System and Network Administration',1011,4.39,'9780320000000','2007-06-01'),
	 ('Tubes: A Journey to the Center of the Internet',294,3.50,'9780060000000','2012-05-23'),
	 ('Getting Started with Arduino',128,3.78,'9780600000000','2009-03-31'),
	 ('The Object-Oriented Thought Process',330,3.68,'9780670000000','2008-08-01'),
	 ('Foundations of Programming - Building Better Software',79,3.81,null,'2008-03-23'),
	 ('Joe Celko''s SQL for Smarties: Advanced SQL Programming',840,3.95,'9780120000000','2005-08-01'),
	 ('Practical C Programming',456,3.68,'9781570000000','1997-08-11'),
	 ('Java in a Nutshell',1224,3.81,'9780600000000','2005-03-25'),
	 ('Parsing Techniques: A Practical Guide',662,4.20,'9780390000000','2008-01-01'),
	 ('The Art of Computer Programming, Volume 4, Fascicle 2: Generating All Tuples and Permutations',127,4.70,'9780200000000','2005-02-24'),
	 ('The Old New Thing: Practical Development Throughout the Evolution of Windows',517,3.92,'9780320000000','2006-12-01'),
	 ('Inside the Machine',320,4.13,'9781590000000','2006-12-08'),
	 ('Python in a Nutshell',695,3.88,'9780600000000','2006-07-24'),
	 ('Head First Software Development',498,3.93,'9780600000000','2007-12-27'),
	 ('Programming Game AI by Example',495,4.07,'9781560000000','2004-09-30'),
	 ('Lex & Yacc',388,3.68,'9781570000000','1992-10-08'),
	 ('Implementing Lean Software Development: From Concept to Cash',276,4.16,'9780320000000','2006-10-01'),
	 ('Head First Servlets and JSP: Passing the Sun Certified Web Component Developer Exam',888,4.16,'9780600000000','2004-08-30'),
	 ('Distributed Algorithms',904,4.19,'9781560000000','1996-03-15'),
	 ('Why''s (Poignant) Guide to Ruby',176,4.05,null,'2007-03-23'),
	 ('Perl Best Practices: Standards and Styles for Developing Maintainable Code',517,4.27,'9780600000000','2005-07-22'),
	 ('HTML & XHTML: The Definitive Guide',680,3.91,'9780600000000','2006-10-24'),
	 ('Lisp',611,3.98,'9780200000000','1989-01-11'),
	 ('Broad Band: The Untold Story of the Women Who Made the Internet',288,4.00,'9780740000000','2018-03-06'),
	 ('Gray Hat Hacking: The Ethical Hacker''s Handbook',434,4.09,'9780070000000','2004-12-01'),
	 ('Machine Learning',224,3.62,null,'2016-09-30'),
	 ('Once Upon an Algorithm: How Stories Explain Computing',336,3.81,'9780260000000','2017-08-11'),
	 ('Feynman And Computation',462,4.42,'9780810000000','2002-06-27'),
	 ('Your Code As a Crime Scene: Use Forensic Techniques to Arrest Defects, Bottlenecks, and Bad Design in Your Programs',190,3.59,'9781680000000','2014-05-23'),
	 ('Python Data Science Handbook: Tools and Techniques for Developers',500,4.28,'9781490000000','2016-12-25'),
	 ('Programming Elixir: Functional |> Concurrent |> Pragmatic |> Fun',287,4.33,'9781940000000','2013-03-23'),
	 ('Spam Nation: The Inside Story of Organized Cybercrime Acâ¬â? from Global Epidemic to Your Front Door',256,3.72,'9781400000000','2014-11-18'),
	 ('C Programming Absolute Beginner''s Guide',352,4.24,null,'2013-08-02'),
	 ('Assembly Language: Step-By-Step',448,4.22,'9780470000000','1992-10-06'),
	 ('The Little MLer',198,3.91,'9780260000000','1998-01-05'),
	 ('Lambda-Calculus and Combinators: An Introduction',345,3.80,'9780520000000','2008-07-01'),
	 ('More Programming Pearls: Confessions of a Coder',224,4.03,'9780200000000','1988-01-11'),
	 ('But How Do It Know? - The Basic Principles of Computers for Everyone',221,4.49,'9780620000000','2009-07-04'),
	 ('Learning Spark',300,3.87,'9781450000000','2014-07-22'),
	 ('Java Performance: The Definitive Guide',500,4.38,'9781450000000','2014-05-22'),
	 ('Red Team Field Manual (RTFM)',96,4.22,'9781490000000','2014-02-11'),
	 ('Systems Performance: Enterprise and the Cloud',735,4.47,'9780130000000','2013-10-26'),
	 ('Learning Javascript Design Patterns',227,3.84,null,'2012-05-01'),
	 ('SQL Performance Explained',204,4.34,'9783950000000','2012-07-30'),
	 ('Python 3 Object Oriented Programming',388,4.01,'9781850000000','2010-07-19'),
	 ('The Google Resume: How to Prepare for a Career and Land a Job at Apple, Microsoft, Google, or Any Top Tech Company',280,3.77,'9780470000000','2011-03-01'),
	 ('C++ Coding Standards: 101 Rules, Guidelines, and Best Practices',240,4.20,'76092018117','2004-11-01'),
	 ('WindowsÂ® Internals, Part 2: Covering Windows ServerÂ® 2008 R2 and Windows 7',674,4.54,'9780740000000','2012-10-02'),
	 ('The Healthy Programmer',220,3.73,'9781940000000','2013-03-23'),
	 ('Practical Cryptography',385,4.18,'9780470000000','2003-04-17'),
	 ('Continuous Integration: Improving Software Quality and Reducing Risk',283,3.79,'9780320000000','2007-07-09'),
	 ('Sams Teach Yourself SQLAcâc in 10 Minutes',242,4.02,'9780670000000','2004-03-01'),
	 ('Data Structures and Algorithm Analysis in C',528,3.80,'9780200000000','1996-09-19'),
	 ('The Master Switch: The Rise and Fall of Information Empires',384,3.84,'9780310000000','2010-11-02'),
	 ('Bayesian Reasoning and Machine Learning',697,4.11,'9780520000000','2012-04-01'),
	 ('Computer Science Illuminated',636,3.55,'9780760000000','2006-12-01'),
	 ('Functional JavaScript: Introducing Functional Programming with Underscore.js',260,4.07,'9781450000000','2013-06-17'),
	 ('The Design of Everyday Things',240,4.19,'9780470000000','2002-09-19'),
	 ('We Are Anonymous: Inside the Hacker World of LulzSec, Anonymous, and the Global Cyber Insurgency',512,3.94,'9780320000000','2012-06-05'),
	 ('A First Course in Logic: An Introduction to Model Theory, Proof Theory, Computability, and Complexity',431,4.31,'9780200000000','2004-09-01'),
	 ('Effective JavaScript: 68 Specific Ways to Harness the Power of JavaScript',240,4.32,'9780320000000','2012-12-06'),
	 ('Fire in the Valley: The Making of the Personal Computer',463,4.11,'9780070000000','1999-11-29'),
	 ('Practical Malware Analysis: The Hands-On Guide to Dissecting Malicious Software',800,4.43,'9781590000000','2012-02-29'),
	 ('Objective-C Programming: The Big Nerd Ranch Guide',263,4.17,'9780320000000','2011-10-18'),
	 ('The Art Of Prolog: Advanced Programming Techniques',437,3.79,'9780260000000','1986-05-01'),
	 ('Think Stats',138,3.66,'9781450000000','2011-07-22'),
	 ('Data and Reality',null,4.05,'9781590000000',null),
	 ('Learning SQL',289,3.86,'9780600000000','2005-09-01'),
	 ('GA¶del''s Proof',129,4.14,'9780810000000','2001-10-01'),
	 ('Essentials of Computer Organization and Architecture',673,3.20,'9780760000000','2003-01-01'),
	 ('jQuery in Action',347,3.94,'9781930000000','2008-02-01'),
	 ('The Art and Science of Java',587,3.99,'9780320000000','2007-02-01'),
	 ('Death March',230,3.83,'9780130000000','2003-11-16'),
	 ('Programming Scala: Scalability = Functional Programming + Objects',448,3.72,'9780600000000','2009-09-22'),
	 ('Compiler Construction: Principles and Practice',592,3.90,'9780530000000','1997-01-24'),
	 ('Programming Clojure',304,3.82,'9781930000000','2009-06-04'),
	 ('OpenGL SuperBible: Comprehensive Tutorial and Reference',1205,3.99,'9780320000000','2007-06-01'),
	 ('Thinking Forth',316,3.91,'9780980000000','2004-12-27'),
	 ('Linkers and Loaders',256,3.96,'9781560000000','1999-10-25'),
	 ('Processing: A Programming Handbook for Visual Designers and Artists',710,4.15,'9780260000000','2007-08-17'),
	 ('Designing Web Usability',432,3.80,'9781560000000','2000-01-01'),
	 ('The Scheme Programming Language',295,3.94,'9780260000000','2003-09-26'),
	 ('Python Essential Reference (Developer''s Library)',648,4.21,'9780670000000','2006-03-02'),
	 ('C Programming: A Modern Approach',832,4.26,'9780390000000','2008-04-01'),
	 ('Modern Compiler Implementation in Java',512,3.47,'9780520000000','2015-01-28'),
	 ('WindowsAÂ® Internals (PRO-Developer)',1232,4.46,'9780740000000','2009-06-17'),
	 ('Designing Interfaces: Patterns for Effective Interaction Design',352,3.82,'9780600000000','2005-11-28'),
	 ('Theoretische Informatik - kurzgefasst',198,3.67,'9783830000000','2001-03-01'),
	 ('The Manga Guide to Databases',224,4.05,'9781590000000','2008-12-01'),
	 ('Randomized Algorithms',496,4.06,'9780520000000','1995-08-01'),
	 ('The Haskell School of Expression: Learning Functional Programming Through Multimedia',382,3.72,'9780520000000','2000-02-01'),
	 ('Rocket Surgery Made Easy: The Do-It-Yourself Guide to Finding and Fixing Usability Problems',161,4.11,'9780320000000','2009-12-01'),
	 ('Artificial Intelligence: Structures and Strategies for Complex Problem Solving',928,3.69,'9780320000000','2004-10-21'),
	 ('A Madman Dreams of Turing Machines',230,3.67,'9781400000000','2006-08-22'),
	 ('High Performance JavaScript',242,4.05,'9780600000000','2010-03-30'),
	 ('Principles of Computer System Design: An Introduction',526,3.70,'9780120000000','2009-07-07'),
	 ('Algorithmic Game Theory',776,4.19,'9780520000000','2013-12-06'),
	 ('Neural Networks: A Comprehensive Foundation',842,3.89,'9780130000000','1998-07-06'),
	 ('Running Linux',749,3.70,'9781570000000','1999-08-11'),
	 ('UNIX Network Programming, Volume 1: The Sockets Networking API',991,4.35,'76092025917','2003-11-24'),
	 ('The Java Programming Language',891,3.80,'9780320000000','2005-08-25'),
	 ('Computer Power and Human Reason: From Judgment to Calculation',300,4.29,'9780720000000','1976-01-01'),
	 ('Programming Challenges: The Programming Contest Training Manual',364,4.04,'9780390000000','2003-05-12'),
	 ('How to Solve It: Modern Heuristics',554,3.98,'9783540000000','2004-09-21'),
	 ('Writing Effective Use Cases',304,3.95,'9780200000000','2000-10-15'),
	 ('Concurrent Programming in Javai?1: Design Principles and Pattern',432,4.18,'9780200000000','1999-11-04'),
	 ('Hello World: Being Human in the Age of Algorithms',246,4.14,'9780390000000','2018-09-18'),
	 ('A Mind at Play: How Claude Shannon Invented the Information Age',384,4.15,'9781480000000','2017-07-18'),
	 ('More Effective C++',336,4.33,'785343000000','1996-01-08'),
	 ('The Little Prover',248,3.96,'9780260000000','2015-07-10'),
	 ('The Dark Net: Inside the Digital Underworld',320,3.66,'9780430000000','2014-08-21'),
	 ('Physically Based Rendering: From Theory to Implementation',1167,4.58,'9780120000000','2010-07-12'),
	 ('Competitive Programming 3',447,4.62,null,'2013-06-07'),
	 ('Coding the Matrix: Linear Algebra through Computer Science Applications',528,4.32,'9780620000000','2013-07-26'),
	 ('Zero to One: Notes on Startups, or How to Build the Future',195,4.16,'9780800000000','2014-09-16'),
	 ('Readings in Database Systems',685,4.71,'9781560000000','1998-01-01'),
	 ('The Data Warehouse Toolkit: The Complete Guide to Dimensional Modeling',464,4.12,'9780470000000','2002-04-26'),
	 ('Python Crash Course: A Hands-On, Project-Based Introduction to Programming',560,4.25,'9781590000000','2015-12-03'),
	 ('Data Smart: Using Data Science to Transform Information into Insight',409,4.17,'9781120000000','2013-10-31'),
	 ('The Principles of Object-Oriented JavaScript',120,4.38,null,'2014-02-07'),
	 ('The UNIX Hater''s Handbook: The Best of UNIX-Haters On-line Mailing Reveals Why UNIX Must Die,',329,3.68,'9781570000000','1994-06-01'),
	 ('Thinking in Systems: A Primer',240,4.26,'9781600000000','2008-12-03'),
	 ('The Art of Prolog: Advanced Programming Techniques',552,3.91,'9780260000000','1994-03-10'),
	 ('Tcp/IP Illustrated, Volume 1: The Protocols',1017,4.60,'9780320000000','2011-11-25'),
	 ('Realm of Racket: Learn to Program, One Game at a Time,',312,3.69,'9781590000000','2013-06-25'),
	 ('Metamagical Themas: Questing for the Essence of Mind and Pattern',880,4.18,'9780470000000','1996-04-05'),
	 ('Hadoop: The Definitive Guide',528,3.94,'9780600000000','2009-06-12'),
	 ('Complexity: A Guided Tour',349,4.06,'9780200000000','2009-04-01'),
	 ('Principles of Compiler Design',604,3.97,'9780200000000','1977-03-23'),
	 ('Version Control with Git',297,3.89,'9780600000000','2009-06-11'),
	 ('Mindstorms: Children, Computers, And Powerful Ideas',252,4.30,'9780470000000','1993-08-04'),
	 ('Specification by Example',249,4.04,'9781620000000','2011-06-03'),
	 ('Algorithmic Puzzles',257,4.11,'9780200000000','2011-10-14'),
	 ('You Are Not a Gadget',221,3.54,'9780310000000','2010-01-12'),
	 ('Smalltalk Best Practice Patterns',224,4.18,'9780130000000','1996-10-13'),
	 ('Mathematics for 3D Game Programming and Computer Graphics',545,4.05,'8581030000000','2011-06-02'),
	 ('Code Simplicity: The Fundamentals of Software',84,3.62,'9781450000000','2012-04-05'),
	 ('Framework Design Guidelines: Conventions, Idioms, and Patterns for Reusable .NET Libraries',480,4.21,'9780320000000','2008-10-22'),
	 ('Logicomix: An Epic Search for Truth',352,4.03,'9781600000000','2009-10-05'),
	 ('Introduction to Modern Cryptography: Principles and Protocols',534,4.30,'9781580000000','2007-08-31'),
	 ('Modern Compiler Implementation in ML',552,3.91,'9780520000000','2004-05-26'),
	 ('Debugging: The 9 Indispensable Rules for Finding Even the Most Elusive Software and Hardware Problems',192,4.22,'9780810000000','2006-11-05'),
	 ('Metaprogramming Ruby',296,4.33,'9781930000000','2010-02-22'),
	 ('DNS and BIND',642,3.96,'9780600000000','2006-06-02'),
	 ('Social Engineering: The Art of Human Hacking',382,3.82,'9780470000000','2010-12-21'),
	 ('Modern Compiler Implementation in C',556,3.60,'9780520000000','2004-05-26'),
	 ('Data Analysis with Open Source Tools: A Hands-On Guide for Programmers and Data Scientists',509,4.05,'9780600000000','2010-11-28'),
	 ('The Art of Computer Programming, Volume 4, Fascicle 3: Generating All Combinations and Partitions',160,4.50,'9780200000000','2005-07-01'),
	 ('The Agile Samurai: How Agile Masters Deliver Great Software',267,3.93,null,'2010-03-23'),
	 ('Handbook of Applied Cryptography',810,4.03,'9780850000000','1996-10-16'),
	 ('Algorithmics: The Spirit of Computing',480,3.94,'9780200000000','1992-01-23'),
	 ('Haskell: The Craft of Functional Programming',487,3.53,'9780200000000','1999-03-29'),
	 ('WindowsÂ® Internals, Part 1: Covering Windows ServerÂ® 2008 R2 and Windows 7',754,4.43,'9780740000000','2012-04-05'),
	 ('Data Structures and Algorithms in Java',800,4.09,'9780670000000','2002-11-16'),
	 ('The Man Who Knew Too Much: Alan Turing and the Invention of the Computer',336,3.48,'9780390000000','2006-11-17'),
	 ('Free as in Freedom: Richard Stallman''s Crusade for Free Software',240,3.81,'9780600000000','2002-03-08'),
	 ('The Design and Implementation of the FreeBSD Operating System',720,4.31,'9780200000000','2004-08-01'),
	 ('Eloquent Ruby',413,4.35,'9780320000000','2011-02-21'),
	 ('Dealers of Lightning: Xerox PARC and the Dawn of the Computer Age',480,4.13,'9780890000000','2000-04-05'),
	 ('LISP in Small Pieces',514,4.28,'9780520000000','2003-10-18'),
	 ('User Stories Applied: For Agile Software Development',268,3.88,'9780320000000','2004-03-11'),
	 ('REST in Practice: Hypermedia and Systems Architecture',448,3.82,'9780600000000','2010-09-24'),
	 ('Programming Languages: Application and Interpretation',360,4.09,null,null),
	 ('Agile Estimating and Planning',330,4.09,'9780130000000','2005-11-01'),
	 ('Neural Networks for Pattern Recognition',504,4.07,'9780200000000','1996-01-18'),
	 ('iWoz: Computer Geek to Cult Icon: How I Invented the Personal Computer, Co-Founded Apple, and Had Fun Doing It',313,3.85,'9780390000000','2007-10-17'),
	 ('Database Management Systems',1104,3.76,'9780070000000','2002-08-14'),
	 ('97 Things Every Software Architect Should Know: Collective Wisdom from the Experts',222,3.60,'9780600000000','2009-02-12'),
	 ('Snow Crash',480,4.03,null,'2003-08-26'),
	 ('ANSI Common Lisp',444,4.12,'9780130000000','1996-03-23'),
	 ('An Introduction to Genetic Algorithms',221,3.75,'9780260000000','1998-03-02'),
	 ('Writing Solid Code',288,4.09,'9781560000000','1993-01-01'),
	 ('Writing Secure Code',768,4.01,'9780740000000','2002-12-14'),
	 ('The Nature of Code',520,4.60,'9780990000000','2012-12-13'),
	 ('Computer System Architecture',544,3.80,'9780130000000','1992-10-29'),
	 ('C++ Standard Library: A Tutorial and Reference',832,4.15,'9780200000000','1999-08-12'),
	 ('The Design and Analysis of Computer Algorithms',480,3.85,'9780200000000','1974-01-11'),
	 ('Combinatorial Optimization: Algorithms and Complexity',528,3.98,'9780490000000','1998-01-29'),
	 ('The Art of Computer Programming, Volume 4, Fascicle 0: Introduction to Combinatorial Algorithms and Boolean Functions',216,4.53,'9780320000000','2008-05-01'),
	 ('Algorithms on Strings, Trees and Sequences: Computer Science and Computational Biology',556,4.05,'9780520000000','1997-05-01'),
	 ('Analysis Patterns: Reusable Object Models',384,3.78,'9780200000000','1996-10-19'),
	 ('The Design and Evolution of C++',480,4.29,'9780200000000','1994-04-08'),
	 ('Design Patterns Explained: A New Perspective on Object-Oriented Design',480,3.87,'9780320000000','2004-10-22'),
	 ('Introduction to Machine Learning',415,3.67,'9780260000000','2004-10-01'),
	 ('Blockchain Revolution: How the Technology Behind Bitcoin Is Changing Money, Business, and the World',368,3.36,'9780670000000','2016-05-10'),
	 ('Rise of the Robots: Technology and the Threat of a Jobless Future',352,4.03,'9780470000000','2015-05-05'),
	 ('High Performance Browser Networking',400,4.52,null,'2013-03-23'),
	 ('Scrum: The Art of Doing Twice the Work in Half the Time',237,4.19,'9780390000000','2014-09-30'),
	 ('Data Science for Business: What you need to know about data mining and data-analytic thinking',414,4.17,'9781450000000','2013-08-16'),
	 ('The Mathematical Theory of Communication',125,4.39,'9780250000000','1963-03-23'),
	 ('The Shallows: What the Internet Is Doing to Our Brains',280,3.87,'9780390000000','2011-06-06'),
	 ('Object Thinking',334,3.97,'9780740000000','2004-02-21'),
	 ('Scala for the Impatient',384,4.12,'9780320000000','2012-03-16'),
	 ('Effective Programming: More Than Writing Code',283,3.91,null,'2012-07-10'),
	 ('Violent Python: A Cookbook for Hackers, Forensic Analysts, Penetration Testers and Security Engineers',288,4.03,'9781600000000','2012-11-22'),
	 ('The Lean Startup: How Today''s Entrepreneurs Use Continuous Innovation to Create Radically Successful Businesses',299,4.06,'9780310000000','2011-09-13'),
	 ('Digital Design and Computer Architecture',592,4.29,'9780120000000','2007-03-01'),
	 ('Design Patterns in Ruby',352,4.16,'9780320000000','2007-12-01'),
	 ('Linux in a Nutshell',925,3.91,'9780600000000','2005-08-06'),
	 ('Computer Vision: Algorithms and Applications',812,4.17,'9781850000000','2010-10-19'),
	 ('Writing for Computer Science',270,3.98,'9781850000000','2004-06-03'),
	 ('C: A Reference Manual',458,4.15,'9780130000000','1994-12-01'),
	 ('Quantum Computing for Computer Scientists',384,4.13,'9780520000000','2008-08-11'),
	 ('To Mock a Mockingbird and Other Logic Puzzles',256,4.13,'9780190000000','2000-11-01'),
	 ('A Byte of Python',149,4.05,null,null),
	 ('Discrete Mathematics with Applications',928,3.94,'9780530000000','2003-12-22'),
	 ('Artificial Intelligence',640,3.82,'9780070000000','1991-03-01'),
	 ('Computation: Finite and Infinite Machines (Automatic Computation)',317,4.57,'9780130000000','1967-06-01'),
	 ('sed & awk',434,3.83,'9781570000000','1997-03-23'),
	 ('The Inmates Are Running the Asylum: Why High Tech Products Drive Us Crazy and How to Restore the Sanity',255,3.94,null,'2004-03-05'),
	 ('Software Craftsmanship',305,4.31,null,'2014-03-10'),
	 ('You Don''t Know JS: Async & Performance',296,4.28,'9781490000000','2015-03-09'),
	 ('You Don''t Know JS: ES6 & Beyond',278,4.37,'9781490000000','2015-12-27'),
	 ('The Architecture of Open Source Applications',432,3.68,'9781260000000','2011-05-25'),
	 ('Modern C++ Design: Generic Programming and Design Patterns Applied',360,4.24,'9780200000000','2001-02-23'),
	 ('The Complete Software Developer''s Career Guide: How to Learn Programming Languages Quickly, Ace Your Programming Interview, and Land Your Software Developer Dream Job',796,4.20,null,'2017-07-12'),
	 ('Countdown to Zero Day: Stuxnet and the Launch of the World''s First Digital Weapon',406,4.12,'9780770000000','2014-11-11'),
	 ('Elements of Programming Interviews: The Insiders'' Guide C++',480,4.28,'9781480000000','2012-10-11'),
	 ('Hacking Exposed: Network Security Secrets & Solutions',692,3.77,'9780070000000','2005-04-19'),
	 ('The Codebreakers: The Comprehensive History of Secret Communication from Ancient Times to the Internet',1200,4.20,'9780680000000','1996-12-05'),
	 ('Advanced Compiler Design and Implementation',856,3.90,'9781560000000','1997-08-15'),
	 ('Getting Real: The Smarter, Faster, Easier Way to Build a Web Application',171,4.01,null,'2006-03-23'),
	 ('The Art of Readable Code',204,3.93,'9780600000000','2011-11-23'),
	 ('Digital Design',516,3.98,'9780130000000','2001-08-01'),
	 ('Language Implementation Patterns: Techniques for Implementing Domain-Specific Languages',350,3.80,'9781930000000','2010-01-07'),
	 ('The Ruby Programming Language',448,4.02,'9780600000000','2008-02-01'),
	 ('An Introduction to the Analysis of Algorithms',512,4.00,'9780200000000','1995-12-10'),
	 ('The Web Application Hacker''s Handbook: Discovering and Exploiting Security Flaws',722,4.15,'9780470000000','2007-10-01'),
	 ('Python Machine Learning',454,4.30,'9781780000000','2015-10-01'),
	 ('Write Great Code: Volume 1: Understanding the Machine',456,3.92,'9781590000000','2004-11-08'),
	 ('Doing Data Science',375,3.74,'9781450000000','2013-11-03'),
	 ('The Shellcoder''s Handbook: Discovering and Exploiting Security Holes',718,4.13,'9780470000000','2007-08-01'),
	 ('The Science of Programming',null,3.90,'9780390000000','1989-04-21'),
	 ('Logic in Computer Science: Modelling and Reasoning about Systems',447,3.87,'9780520000000','2004-08-26'),
	 ('Interaction Design: Beyond Human-Computer Interaction',773,3.72,'9780470000000','2007-03-01'),
	 ('Transaction Processing: Concepts and Techniques',1070,4.38,'9781560000000','1992-09-15'),
	 ('RESTful Web Services',454,3.84,'9780600000000','2007-05-15'),
	 ('Object-Oriented Software Construction (Book/CD-ROM)',1296,4.06,'9780140000000','1997-04-03'),
	 ('Literate Programming',384,3.86,'9780940000000','1992-06-01'),
	 ('Unix Network Programming, Volume 1: Networking APIs - Sockets and XTI',1009,4.29,'9780130000000','1997-10-17'),
	 ('The Well-Grounded Rubyist',520,4.34,'9781930000000','2009-06-04'),
	 ('Category Theory for Programmers',396,4.13,null,'2018-10-21'),
	 ('The Self-Taught Programmer: The Definitive Guide to Programming Professionally',301,4.05,null,'2017-01-24'),
	 ('Digital Gold: Bitcoin and the Inside Story of the Misfits and Millionaires Trying to Reinvent Money',416,4.17,'9780060000000','2015-05-19'),
	 ('Haskell Programming From First Principles',1189,4.48,null,'2015-03-23'),
	 ('Regular Expressions Cookbook',510,4.09,'9780600000000','2009-05-29'),
	 ('You Don''t Know JS: Types & Grammar',182,4.47,'9781490000000','2015-02-21'),
	 ('Introduction to Java Programming: Comprehensive Version',1301,4.08,'9780130000000','2006-06-01'),
	 ('JavaScript Patterns',216,4.17,'9780600000000','2010-09-28'),
	 ('Elements of Information Theory',748,4.15,'9780470000000','2006-06-01'),
	 ('Practical Common LISP',499,4.14,'9781590000000','2007-06-26'),
	 ('Graph Databases',224,3.66,'9781450000000','2013-06-17'),
	 ('Computational Fairy Tales',204,3.99,'9781480000000','2012-06-26'),
	 ('Crypto: How the Code Rebels Beat the Government--Saving Privacy in the Digital Age',368,3.98,'9780140000000','2001-12-31'),
	 ('Learning the vi and Vim Editors',494,3.90,'9780600000000','2008-07-22'),
	 ('Big Data: Principles and best practices of scalable realtime data systems',328,3.83,'9781620000000','2012-09-23'),
	 ('NoSQL Distilled: A Brief Guide to the Emerging World of Polyglot Persistence',192,4.09,'9780320000000','2012-08-13'),
	 ('UNIX and Linux System Administration Handbook',1327,4.40,'9780130000000','2014-03-23'),
	 ('UNIX Power Tools',1122,4.14,'9781570000000','1997-08-09'),
	 ('Silence on the Wire: A Field Guide to Passive Reconnaissance and Indirect Attacks',312,4.20,'9781590000000','2005-04-22'),
	 ('Problem Solving with Algorithms and Data Structures Using Python',357,4.09,'9781590000000','2005-09-01'),
	 ('Everybody Lies: Big Data, New Data, and What the Internet Can Tell Us About Who We Really Are',338,3.92,'9780060000000','2017-05-09'),
	 ('The DevOps Handbook: How to Create World-Class Agility, Reliability, and Security in Technology Organizations',437,4.35,'9781940000000','2016-10-06'),
	 ('Masters of Doom: How Two Guys Created an Empire and Transformed Pop Culture',339,4.25,'9780810000000','2004-05-11'),
	 ('The Productive Programmer',226,3.71,'9780600000000','2008-07-10'),
	 ('The Haskell Road to Logic, Maths and Programming',432,3.68,'9780950000000','2012-03-23'),
	 ('Python for Data Analysis',400,4.10,'9781450000000','2012-10-23'),
	 ('Land of LISP: Learn to Program in LISP, One Game at a Time,',504,4.14,'9781590000000','2010-04-28'),
	 ('Programming in Scala',736,4.21,'9780980000000','2008-01-01'),
	 ('Head First Object-Oriented Analysis and Design: A Brain Friendly Guide to OOA&D',600,3.96,'9780600000000','2006-11-01'),
	 ('Perl Cookbook',927,4.01,'9780600000000','2003-08-31'),
	 ('Cryptography and Network Security: Principles and Practice',681,4.02,'9780130000000','2002-08-27'),
	 ('Spring in Action',650,3.93,'9781930000000','2007-08-23'),
	 ('The Art of Invisibility: The World''s Most Famous Hacker Teaches You How to Be Safe in the Age of Big Brother and Big Data',320,3.99,'9780320000000','2017-02-14'),
	 ('Programming: Principles and Practice Using C++',1236,4.17,'9780320000000','2008-12-25'),
	 ('The Imposter''s Handbook',463,3.97,null,'2016-09-23'),
	 ('Where Wizards Stay Up Late: The Origins of the Internet',304,3.87,'9780680000000','1998-01-21'),
	 ('The Go Programming Language',380,4.45,'9780130000000','2015-08-27'),
	 ('The Thrilling Adventures of Lovelace and Babbage',317,4.05,'9780310000000','2015-04-21'),
	 ('The Dream Machine: J.C.R. Licklider and the Revolution That Made Computing Personal',512,4.48,'9780140000000','2002-08-27'),
	 ('Java 8 in Action',394,4.31,null,'2014-08-23'),
	 ('Essential Scrum: A Practical Guide to the Most Popular Agile Process',496,4.14,'9780140000000','2012-08-05'),
	 ('Learning From Data: A Short Course',213,4.43,'9781600000000','2012-03-23'),
	 ('High Performance Web Sites',146,4.17,'9780600000000','2007-09-21'),
	 ('Dependency Injection in .NET',584,4.35,'9781940000000','2011-09-28'),
	 ('Introduction to Functional Programming',293,4.13,'9780130000000',null),
	 ('Pattern Classification',688,4.02,'9780470000000','2000-11-09'),
	 ('Real-Time Rendering',1027,4.48,'9781570000000','2008-07-25'),
	 ('Kingpin: How One Hacker Took Over the Billion-Dollar Cybercrime Underground',288,3.94,'9780310000000','2011-02-22'),
	 ('Practical Foundations for Programming Languages',582,4.03,null,'2012-01-30'),
	 ('The Golden Ticket: P, Np, and the Search for the Impossible',176,3.60,'9780690000000','2013-03-31'),
	 ('xUnit Test Patterns: Refactoring Test Code',883,3.92,'9780130000000','2007-05-01'),
	 ('Computational Geometry: Algorithms and Applications',367,4.05,'9783540000000','2000-02-18'),
	 ('Head First C#',714,3.92,'9780600000000','2007-12-03'),
	 ('Programming Erlang',519,3.97,'9781930000000','2007-07-18'),
	 ('C Primer Plus',959,4.10,'752063000000','2004-11-23'),
	 ('Dive Into Python',413,3.96,'9781590000000','2004-11-05'),
	 ('Java Puzzlers: Traps, Pitfalls, and Corner Cases',282,4.20,'9780320000000','2005-09-01'),
	 ('Learning the bash Shell',333,3.89,'9780600000000','2005-04-08'),
	 ('Practices of an Agile Developer: Working in the Real World',189,3.88,'9780970000000','2006-04-01'),
	 ('A New Kind of Science',1264,3.56,'9781580000000','2002-05-01'),
	 ('The Computational Beauty of Nature: Computer Explorations of Fractals, Chaos, Complex Systems, and Adaptation',514,4.34,'9780260000000','2000-01-27'),
	 ('Introduction to Algorithms: A Creative Approach',478,4.23,'9780200000000','1989-01-11'),
	 ('The Art of Multiprocessor Programming',508,3.96,'9780120000000','2008-03-01'),
	 ('An Introduction to Information Theory: Symbols, Signals and Noise',306,3.95,'9780490000000','1980-11-01'),
	 ('The Book of Why: The New Science of Cause and Effect',432,4.01,'9780470000000','2018-05-15'),
	 ('Selected Papers on Computer Science',276,3.88,'9781880000000','2004-11-15'),
	 ('Software Estimation: Demystifying the Black Art',308,4.03,'9780740000000','2006-03-04'),
	 ('An Introduction to Database Systems',1040,3.93,'9780320000000','2003-08-01'),
	 ('Programming Python',1552,3.96,'9780600000000','2006-08-01'),
	 ('Object-Oriented Analysis and Design with Applications',720,3.90,'9780200000000','2007-04-01'),
	 ('Data Mining: Practical Machine Learning Tools and Techniques',525,3.87,'9780120000000','2005-06-01'),
	 ('Make Your Own Neural Network',252,4.36,null,'2016-03-29'),
	 ('The Effective Engineer: How to Leverage Your Efforts In Software Engineering to Make a Disproportionate and Meaningful Impact',260,4.30,'9781000000000','2015-03-19'),
	 ('The Little Book of Semaphores: The Ins and Outs of Concurrency Control and Common Mistakes',294,4.41,'9781440000000','2009-03-20'),
	 ('Neural Networks and Deep Learning',null,4.49,null,'2013-11-25'),
	 ('How Google Works',305,4.05,null,'2014-09-23'),
	 ('Seven Concurrency Models in Seven Weeks: When Threads Unravel',267,3.84,'9781940000000','2014-02-25'),
	 ('Think Complexity: Complexity Science and Computational Modeling',160,3.89,'9781450000000','2012-03-09'),
	 ('Introduction to Computation and Programming Using Python',268,4.20,'9780260000000','2013-01-18'),
	 ('Mining of Massive Datasets',326,4.37,'9781110000000','2011-12-30'),
	 ('About Face 3: The Essentials of Interaction Design',610,4.04,'9780470000000','2007-05-01'),
	 ('Computability and Logic',350,4.01,'9780520000000','2007-10-01'),
	 ('Pearls of Functional Algorithm Design',277,4.18,'9780520000000','2010-11-01'),
	 ('Reversing: Secrets of Reverse Engineering',624,4.03,'9780760000000','2005-04-15'),
	 ('An Introduction to Formal Language and Automata',415,3.80,'9780760000000','2006-02-17'),
	 ('Effective STL: 50 Specific Ways to Improve Your Use of the Standard Template Library',288,4.20,'9780200000000','2001-06-16'),
	 ('Just for Fun: The Story of an Accidental Revolutionary',288,3.91,'9780070000000','2002-06-04'),
	 ('Cryptography Engineering: Design Principles and Practical Applications',353,4.18,'9780470000000','2010-03-08'),
	 ('The Art of Intrusion: The Real Stories Behind the Exploits of Hackers, Intruders and Deceivers',270,3.88,'9780470000000','2006-01-01'),
	 ('Life 3.0: Being Human in the Age of Artificial Intelligence',384,4.08,'9780450000000','2017-08-29'),
	 ('Machine Learning: A Probabilistic Perspective',1104,4.37,'9780260000000','2012-08-24'),
	 ('You Don''t Know JS: this & Object Prototypes',174,4.46,'9781490000000','2014-07-27'),
	 ('Probability and Computing: Randomized Algorithms and Probabilistic Analysis',370,4.09,'9780520000000','2005-03-01'),
	 ('The Second Machine Age: Work, Progress, and Prosperity in a Time of Brilliant Technologies',336,3.95,'9780390000000','2016-01-25'),
	 ('Our Final Invention: Artificial Intelligence and the End of the Human Era',336,3.75,'9780310000000','2013-10-01'),
	 ('Automate This: How Algorithms Came to Rule Our World',256,3.83,'9781590000000','2012-08-30'),
	 ('The Essential Turing: Seminal Writings in Computing, Logic, Philosophy, Artificial Intelligence, and Artificial Life Plus the Secrets of Eni',622,4.19,'9780200000000','2013-06-24'),
	 ('How to Prove It: A Structured Approach',384,4.26,'9780520000000','2006-03-01'),
	 ('How Google Tests Software',281,3.77,'9780320000000','2012-04-02'),
	 ('Lauren Ipsum',150,3.90,null,'2011-12-03'),
	 ('Basic Category Theory for Computer Scientists',100,3.54,'9780260000000','1991-08-07'),
	 ('Python Cookbook',706,4.13,'9781450000000','2013-05-29'),
	 ('Mastering Bitcoin: Unlocking Digital Cryptocurrencies',298,4.32,'9781450000000','2014-12-27'),
	 ('Facts and Fallacies of Software Engineering',216,3.95,'9780320000000','2002-11-07'),
	 ('Metasploit: The Penetration Tester''s Guide',328,4.04,'9781590000000','2011-07-22'),
	 ('Seven Databases in Seven Weeks: A Guide to Modern Databases and the NoSQL Movement',352,4.02,'9781930000000','2012-05-18'),
	 ('The Most Human Human: What Talking with Computers Teaches Us About What It Means to Be Alive',303,3.93,'9780390000000','2011-03-01'),
	 ('Domain-Specific Languages',597,3.87,'9780320000000','2011-03-23'),
	 ('Numerical Recipes in C: The Art of Scientific Computing',1020,4.17,'9780520000000','1992-10-30'),
	 ('Things a Computer Scientist Rarely Talks About',257,3.98,'9781580000000','2003-08-01'),
	 ('Advanced Topics in Types and Programming Languages',588,3.92,'9780260000000','2004-12-23'),
	 ('The Emperor''s New Mind: Concerning Computers, Minds and the Laws of Physics',640,3.86,'9780190000000','2002-12-12'),
	 ('The Seasoned Schemer',224,4.30,'9780260000000','1995-12-21'),
	 ('Dreaming in Code: Two Dozen Programmers, Three Years, 4,732 Bugs, and One Quest for Transcendent Software',416,3.69,'9781400000000','2007-01-16'),
	 ('Machine Learning for Hackers',322,3.72,null,'2012-02-23'),
	 ('The Universal Computer: The Road from Leibniz to Turing',257,4.12,'9780390000000','2000-10-17'),
	 ('On Lisp: Advanced Techniques for Common Lisp',413,4.31,'9780130000000','1993-09-09'),
	 ('UML Distilled: A Brief Guide to the Standard Object Modeling Language',208,3.78,'9780320000000','2003-09-25'),
	 ('Practical Vim: Edit Text at the Speed of Thought',300,4.47,'9781930000000','2012-09-23'),
	 ('Probabilistic Graphical Models: Principles and Techniques',1231,4.21,'9780260000000','2009-08-01'),
	 ('C++ Primer Plus',1202,4.05,'752063000000','2004-11-15'),
	 ('Game Engine Architecture',860,4.33,'9781570000000','2009-06-15'),
	 ('Algorithms in a Nutshell',343,3.88,'9780600000000','2008-10-01'),
	 ('Data Mining: Concepts and Techniques (The Morgan Kaufmann Series in Data Management Systems)',772,3.89,'9781560000000','2006-03-01'),
	 ('Cryptonomicon',1139,4.25,'9780060000000','2002-11-01'),
	 ('Computer Science: An Overview',599,3.77,'9780320000000','2006-02-01'),
	 ('Think Like a Programmer: An Introduction to Creative Problem Solving',233,3.90,'9781590000000','2012-08-08'),
	 ('Data Structures and Algorithms',448,3.87,'9780200000000','1983-01-11'),
	 ('Programming in Haskell',171,4.00,'9780520000000','2007-01-15'),
	 ('The Nature of Computation',1032,4.59,'9780200000000','2011-09-26'),
	 ('Quantum Computation and Quantum Information',700,4.31,'9780520000000','2000-10-23'),
	 ('The Singularity is Near: When Humans Transcend Biology',652,3.94,'9780140000000','2006-09-26'),
	 ('Security Engineering: A Guide to Building Dependable Distributed Systems',1040,4.20,'9780470000000','2008-04-01'),
	 ('A Philosophy of Software Design',190,4.12,'9781730000000','2018-04-06'),
	 ('Computer Science Distilled: Learn the Art of Solving Computational Problems',null,4.10,'9781000000000','2017-01-17'),
	 ('Soft Skills: The Software Developer''s Life Manual',470,3.92,null,null),
	 ('How to Solve It: A New Aspect of Mathematical Method',288,4.16,'9780690000000','2015-09-25'),
	 ('Game Programming Patterns',300,4.51,'9781430000000','2011-01-01'),
	 ('You Don''t Know JS: Up & Going',72,4.31,'9781490000000','2015-04-23'),
	 ('Reinforcement Learning: An Introduction',322,4.45,'9780260000000','1998-02-26'),
	 ('Learn Python The Hard Way',210,3.89,null,null),
	 ('Data and Goliath: The Hidden Battles to Collect Your Data and Control Your World',448,4.03,'9780390000000','2016-02-08'),
	 ('A Tour of C++',192,4.24,'9780320000000','2013-10-03'),
	 ('JavaScript and jQuery: Interactive Front-End Web Development',640,4.35,'9781120000000','2014-06-30'),
	 ('The Art of Computer Programming, Volume 4A: Combinatorial Algorithms, Part 1',912,4.54,'9780200000000','2011-01-22'),
	 ('Agile Principles, Patterns, and Practices in C#',732,4.32,'9780130000000','2006-07-30'),
	 ('Agile Web Development with Rails: A Pragmatic Guide',558,3.91,'9780980000000','2005-07-28'),
	 ('Elements of the Theory of Computation',384,3.84,'9780130000000','1997-08-17'),
	 ('Digital Image Processing',793,4.01,'9780200000000','2001-11-09'),
	 ('Secrets of the JavaScript Ninja',370,4.17,'9781930000000','2013-01-14'),
	 ('On Intelligence',261,4.13,'9780810000000','2005-08-01'),
	 ('Secrets and Lies: Digital Security in a Networked World',401,3.89,'9780470000000','2004-01-30'),
	 ('Software Architecture in Practice',560,3.72,'785342000000','2003-04-09'),
	 ('The Pattern on the Stone: The Simple Ideas that Make Computers Work',176,4.04,'9780470000000','1999-10-08'),
	 ('Software Engineering: A Practitioner''s Approach',793,3.70,'9780070000000','2004-03-01'),
	 ('Foundations of Computer Science: C Edition',800,4.01,'9780720000000','1994-10-15'),
	 ('Python Programming: An Introduction to Computer Science',517,4.00,'9781890000000','2003-12-01'),
	 ('Introduction to the Design and Analysis of Algorithms',565,3.97,'9780130000000','2011-10-09'),
	 ('How Computers Work',464,3.89,'9780790000000','2005-11-19'),
	 ('Thinking in Java',1482,4.16,'9780130000000','2006-02-20'),
	 ('From Mathematics to Generic Programming',320,4.15,'9780130000000','2014-10-29'),
	 ('The Reasoned Schemer',176,4.28,'9780260000000','2005-10-14'),
	 ('Essentials of Programming Languages',389,3.93,'9780260000000','2001-01-29'),
	 ('Algorithms Plus Data Structures Equals Programs (Prentice-Hall series in automatic computation)',400,4.22,'9780130000000','1975-11-11'),
	 ('How Linux Works: What Every Superuser Should Know',368,4.10,'9781590000000','2004-05-24'),
	 ('Fluent Python: Clear, Concise, and Effective Programming',792,4.67,'9781490000000','2015-08-20'),
	 ('C++ Primer',885,4.19,'9780200000000','2005-02-24'),
	 ('Computer Graphics: Principles and Practice',9998,4.16,'9780200000000','1995-08-14'),
	 ('Concepts of Programming Languages',670,3.71,'9780200000000','1998-08-01'),
	 ('The Joy of Clojure',328,4.18,'9781940000000','2011-03-28'),
	 ('The Art of Unit Testing: With Examples in .NET',320,4.10,'9781930000000','2009-07-05'),
	 ('Java: How to Program',1568,3.85,'9780130000000','2004-08-14'),
	 ('Database Systems: The Complete Book',1119,3.77,'9780130000000','2001-10-02'),
	 ('How to Create a Mind: The Secret of Human Thought Revealed',336,3.96,'9780670000000','2012-11-13'),
	 ('Programming Ruby: The Pragmatic Programmers'' Guide',828,4.05,'9780970000000','2004-10-11'),
	 ('The Cuckoo''s Egg: Tracking a Spy Through the Maze of Computer Espionage',399,4.21,'9781420000000','2005-09-13'),
	 ('The Elements of Programming Style',168,4.18,'9780070000000','1988-06-01'),
	 ('You Don''t Know JS: Scope and Closures',98,4.54,'9781450000000','2014-03-24'),
	 ('C# in Depth',554,4.48,'9781940000000','2010-11-22'),
	 ('Weapons of Math Destruction: How Big Data Increases Inequality and Threatens Democracy',259,3.87,'9780550000000','2016-09-06'),
	 ('Data Science from Scratch: First Principles with Python',330,3.91,null,'2015-04-14'),
	 ('C++: How to Program',1536,3.94,'9780130000000','2004-12-01'),
	 ('Implementing Domain-Driven Design',656,4.06,'9780320000000','2013-02-16'),
	 ('Let Over Lambda',384,4.04,'9781440000000','2008-04-02'),
	 ('Understanding the Linux Kernel',923,4.06,'9780600000000','2005-11-24'),
	 ('An Introduction to Functional Programming Through Lambda Calculus',336,4.13,'9780490000000','2011-08-18'),
	 ('Apprenticeship Patterns: Guidance for the Aspiring Software Craftsman',176,4.11,'9780600000000','2009-10-22'),
	 ('Elements of Programming',262,4.01,'9780320000000','2009-06-01'),
	 ('Engineering a Compiler',801,3.97,'9781560000000','2003-11-10'),
	 ('In the Beginning...Was the Command Line',160,3.79,null,'2009-10-13'),
	 ('Introduction to Information Retrieval',482,4.20,'9780520000000','2008-07-01'),
	 ('Programming Perl',1092,4.05,'9780600000000','2000-07-24'),
	 ('Programming the Universe: A Quantum Computer Scientist Takes on the Cosmos',240,4.00,'9781400000000','2006-03-14'),
	 ('Hands-On Machine Learning with Scikit-Learn and TensorFlow',450,4.55,null,'2017-04-09'),
	 ('Rapid Development: Taming Wild Software Schedules',674,3.96,'9781560000000','1996-07-09'),
	 ('Foundations of Statistical Natural Language Processing',679,4.16,'9780260000000','1999-05-28'),
	 ('Out of Their Minds: The Lives and Discoveries of 15 Great Computer Scientists',291,3.80,'9780390000000','1998-07-02'),
	 ('Effective Python: 59 Specific Ways to Write Better Python',227,4.26,'9780130000000','2015-03-08'),
	 ('Big Data: A Revolution That Will Transform How We Live, Work, and Think',242,3.71,'9780540000000','2013-03-05'),
	 ('Effective Modern C++: 42 Specific Ways to Improve Your Use of C++11 and C++14',334,4.52,'9781490000000','2014-12-12'),
	 ('Real World Haskell: Code You Can Believe In',720,3.93,'9780600000000','2008-12-02'),
	 ('Algorithms Unlocked',237,4.17,'9781300000000','2013-05-15'),
	 ('Turing''s Cathedral: The Origins of the Digital Universe',505,3.55,'9780310000000','2012-03-06'),
	 ('The Art of UNIX Programming',560,4.17,'9780130000000','2003-10-03'),
	 ('Database System Concepts',1142,3.77,'9780070000000','2005-06-01'),
	 ('Refactoring to Patterns',400,4.03,'785342000000','2004-08-15'),
	 ('Site Reliability Engineering: How Google Runs Production Systems',552,4.23,'9781490000000','2016-04-16'),
	 ('The Linux Command Line',480,4.36,'9781590000000','2012-01-14'),
	 ('The New Turing Omnibus: 66 Excursions In Computer Science',480,3.88,'9780720000000','1993-04-01'),
	 ('JavaScript: The Definitive Guide',1032,4.02,'9780600000000','2006-08-24'),
	 ('Linux Kernel Development',440,4.29,'9780670000000','2010-06-25'),
	 ('Programming Language Pragmatics',875,3.96,'9780130000000','2005-11-07'),
	 ('The Innovators: How a Group of  Hackers, Geniuses and Geeks Created the Digital Revolution',528,4.08,'9781480000000','2014-10-07'),
	 ('The Soul of a New Machine',293,4.11,'9780320000000','2000-06-01'),
	 ('The Elements of Statistical Learning: Data Mining, Inference, and Prediction',552,4.37,'9780390000000','2003-09-02'),
	 ('The Computer and the Brain',112,3.90,'9780300000000','2000-07-11'),
	 ('Enterprise Integration Patterns: Designing, Building, and Deploying Messaging Solutions',736,4.07,'785342000000','2003-10-20'),
	 ('Release It,: Design and Deploy Production-Ready Software (Pragmatic Programmers)',326,4.21,'9780980000000','2007-04-06'),
	 ('Computational Complexity',579,4.27,'9780520000000','2009-05-01'),
	 ('Automate the Boring Stuff with Python: Practical Programming for Total Beginners',479,4.25,'9781590000000','2015-05-01'),
	 ('HTML and CSS: Design and Build Websites',514,4.34,'9781120000000','2011-11-08'),
	 ('Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics and Speech Recognition',934,4.17,'9780130000000','2000-01-26'),
	 ('Paradigms of Artificial Intelligence Programming: Case Studies in Common LISP',946,4.32,'9781560000000','1991-10-15'),
	 ('Agile Software Development, Principles, Patterns, and Practices',552,4.26,'9780140000000','2002-10-25'),
	 ('Operating Systems: Three Easy Pieces',686,4.72,null,'2012-08-18'),
	 ('Software Engineering (International Computer Science Series)',759,3.75,'9780320000000','2004-05-10'),
	 ('Alan Turing: The Enigma',608,3.80,'9780800000000','2000-03-01'),
	 ('Expert C Programming: Deep C Secrets',384,4.31,'9780130000000','1994-06-24'),
	 ('Operating Systems Design and Implementation',1088,4.03,'9780130000000','2006-01-01'),
	 ('Computer Organization and Architecture: Designing for Performance',815,4.05,'9780130000000','2002-05-23'),
	 ('Learning Perl',312,3.98,'9780600000000','2005-07-21'),
	 ('Extreme Programming Explained: Embrace Change (The XP Series)',224,4.04,'9780320000000','2004-11-26'),
	 ('An Introduction to Statistical Learning: With Applications in R',426,4.61,'9781460000000','2017-09-01'),
	 ('The Design of Design: Essays from a Computer Scientist',421,3.75,'9780200000000','2010-03-26'),
	 ('97 Things Every Programmer Should Know: Collective Wisdom from the Experts',258,3.65,'9780600000000','2010-02-19'),
	 ('The Art of Deception: Controlling the Human Element of Security',352,3.76,'9780760000000','2003-10-17'),
	 ('Natural Language Processing with Python',504,4.14,'9780600000000','2009-07-07'),
	 ('Accelerated C++: Practical Programming by Example',352,4.06,'785343000000','2000-08-24'),
	 ('Distributed Systems: Concepts and Design',1047,3.59,'9780130000000','2011-05-07'),
	 ('Practical Object Oriented Design in Ruby',247,4.55,'9780320000000','2012-08-19'),
	 ('Fundamentals of Database Systems',1139,3.81,'9780320000000','2006-03-07'),
	 ('Distributed Systems: Principles and Paradigms',686,3.90,'9780130000000','2006-10-01'),
	 ('The Psychology of Computer Programming',292,4.10,'9780930000000','2005-10-21'),
	 ('The Design of the UNIX Operating System',471,4.20,'9780130000000','1986-06-06'),
	 ('Programming Interviews Exposed: Secrets to Landing Your Next Job (Programmer to Programmer)',237,3.96,'9780470000000','2007-04-30'),
	 ('Pragmatic Thinking and Learning: Refactor Your Wetware',251,4.12,'9781930000000','2008-09-01'),
	 ('Learn You a Haskell for Great Good,',176,4.32,null,null),
	 ('Designing Data-Intensive Applications',562,4.72,null,null),
	 ('The Master Algorithm: How the Quest for the Ultimate Learning Machine Will Remake Our World',352,3.80,'9780470000000','2015-09-22'),
	 ('Hacking: The Art of Exploitation',241,4.13,'9781590000000','2004-10-08'),
	 ('Pattern Recognition and Machine Learning',738,4.28,'9780390000000','2011-04-06'),
	 ('Peopleware: Productive Projects and Teams',245,4.16,'9780930000000','1999-01-01'),
	 ('The Art of Computer Programming, Volume 2: Seminumerical Algorithms',784,4.39,'9780200000000','1997-11-14'),
	 ('Cracking the Coding Interview: 150 Programming Questions and Solutions',500,4.34,'9781470000000','2011-08-01'),
	 ('Learning Python',1214,3.94,'9780600000000','2003-12-30'),
	 ('Hackers: Heroes of the Computer Revolution',464,4.13,'9780140000000','2001-01-01'),
	 ('Deep Learning',787,4.47,null,'2016-03-23'),
	 ('A Discipline of Programming',256,4.27,'9780130000000','1976-03-29'),
	 ('Algorithm Design',864,4.12,'9780320000000','2005-03-26'),
	 ('The Art of Computer Programming: Volume 3: Sorting and Searching',800,4.38,'785343000000','1998-05-04'),
	 ('Computer Architecture: A Quantitative Approach',704,4.08,'9780120000000','2006-11-03'),
	 ('Growing Object-Oriented Software, Guided by Tests',345,4.17,'9780320000000','2009-10-01'),
	 ('Advanced Programming in the UNIX Environment',768,4.31,'9780200000000','1992-06-30'),
	 ('Algorithms',320,4.21,'9780070000000','2006-09-13');
	

INSERT INTO book_authors (book_id, author_id) values (1,176);
INSERT INTO book_authors (book_id, author_id) values (1,533);
INSERT INTO book_authors (book_id, author_id) values (1,657);
INSERT INTO book_authors (book_id, author_id) values (1,800);
INSERT INTO book_authors (book_id, author_id) values (2,921);
INSERT INTO book_authors (book_id, author_id) values (3,325);
INSERT INTO book_authors (book_id, author_id) values (4,386);
INSERT INTO book_authors (book_id, author_id) values (5,631);
INSERT INTO book_authors (book_id, author_id) values (6,699);
INSERT INTO book_authors (book_id, author_id) values (7,1038);
INSERT INTO book_authors (book_id, author_id) values (7,1049);
INSERT INTO book_authors (book_id, author_id) values (8,534);
INSERT INTO book_authors (book_id, author_id) values (9,412);
INSERT INTO book_authors (book_id, author_id) values (10,372);
INSERT INTO book_authors (book_id, author_id) values (10,1016);
INSERT INTO book_authors (book_id, author_id) values (11,909);
INSERT INTO book_authors (book_id, author_id) values (12,326);
INSERT INTO book_authors (book_id, author_id) values (13,683);
INSERT INTO book_authors (book_id, author_id) values (14,810);
INSERT INTO book_authors (book_id, author_id) values (15,1021);
INSERT INTO book_authors (book_id, author_id) values (16,424);
INSERT INTO book_authors (book_id, author_id) values (16,543);
INSERT INTO book_authors (book_id, author_id) values (17,801);
INSERT INTO book_authors (book_id, author_id) values (18,439);
INSERT INTO book_authors (book_id, author_id) values (19,211);
INSERT INTO book_authors (book_id, author_id) values (20,708);
INSERT INTO book_authors (book_id, author_id) values (21,735);
INSERT INTO book_authors (book_id, author_id) values (22,578);
INSERT INTO book_authors (book_id, author_id) values (22,1113);
INSERT INTO book_authors (book_id, author_id) values (23,1100);
INSERT INTO book_authors (book_id, author_id) values (24,349);
INSERT INTO book_authors (book_id, author_id) values (24,601);
INSERT INTO book_authors (book_id, author_id) values (24,937);
INSERT INTO book_authors (book_id, author_id) values (25,700);
INSERT INTO book_authors (book_id, author_id) values (25,1308);
INSERT INTO book_authors (book_id, author_id) values (26,1158);
INSERT INTO book_authors (book_id, author_id) values (27,741);
INSERT INTO book_authors (book_id, author_id) values (27,1168);
INSERT INTO book_authors (book_id, author_id) values (28,788);
INSERT INTO book_authors (book_id, author_id) values (29,345);
INSERT INTO book_authors (book_id, author_id) values (30,554);
INSERT INTO book_authors (book_id, author_id) values (31,811);
INSERT INTO book_authors (book_id, author_id) values (31,1180);
INSERT INTO book_authors (book_id, author_id) values (32,708);
INSERT INTO book_authors (book_id, author_id) values (32,1210);
INSERT INTO book_authors (book_id, author_id) values (33,896);
INSERT INTO book_authors (book_id, author_id) values (33,1114);
INSERT INTO book_authors (book_id, author_id) values (34,666);
INSERT INTO book_authors (book_id, author_id) values (34,840);
INSERT INTO book_authors (book_id, author_id) values (35,314);
INSERT INTO book_authors (book_id, author_id) values (35,1368);
INSERT INTO book_authors (book_id, author_id) values (36,425);
INSERT INTO book_authors (book_id, author_id) values (36,752);
INSERT INTO book_authors (book_id, author_id) values (37,1015);
INSERT INTO book_authors (book_id, author_id) values (41,1159);
INSERT INTO book_authors (book_id, author_id) values (42,227);
INSERT INTO book_authors (book_id, author_id) values (42,350);
INSERT INTO book_authors (book_id, author_id) values (43,1249);
INSERT INTO book_authors (book_id, author_id) values (44,1341);
INSERT INTO book_authors (book_id, author_id) values (45,499);
INSERT INTO book_authors (book_id, author_id) values (46,193);
INSERT INTO book_authors (book_id, author_id) values (47,735);
INSERT INTO book_authors (book_id, author_id) values (48,94);
INSERT INTO book_authors (book_id, author_id) values (49,620);
INSERT INTO book_authors (book_id, author_id) values (50,1101);
INSERT INTO book_authors (book_id, author_id) values (51,113);
INSERT INTO book_authors (book_id, author_id) values (52,745);
INSERT INTO book_authors (book_id, author_id) values (80,1094);
INSERT INTO book_authors (book_id, author_id) values (81,546);
INSERT INTO book_authors (book_id, author_id) values (81,612);
INSERT INTO book_authors (book_id, author_id) values (82,1073);
INSERT INTO book_authors (book_id, author_id) values (82,1109);
INSERT INTO book_authors (book_id, author_id) values (102,16);
INSERT INTO book_authors (book_id, author_id) values (103,85);
INSERT INTO book_authors (book_id, author_id) values (104,602);
INSERT INTO book_authors (book_id, author_id) values (105,590);
INSERT INTO book_authors (book_id, author_id) values (106,185);
INSERT INTO book_authors (book_id, author_id) values (107,477);
INSERT INTO book_authors (book_id, author_id) values (108,804);
INSERT INTO book_authors (book_id, author_id) values (108,968);
INSERT INTO book_authors (book_id, author_id) values (109,151);
INSERT INTO book_authors (book_id, author_id) values (110,393);
INSERT INTO book_authors (book_id, author_id) values (111,793);
INSERT INTO book_authors (book_id, author_id) values (112,155);
INSERT INTO book_authors (book_id, author_id) values (112,746);
INSERT INTO book_authors (book_id, author_id) values (113,186);
INSERT INTO book_authors (book_id, author_id) values (113,1379);
INSERT INTO book_authors (book_id, author_id) values (114,415);
INSERT INTO book_authors (book_id, author_id) values (114,1135);
INSERT INTO book_authors (book_id, author_id) values (115,606);
INSERT INTO book_authors (book_id, author_id) values (116,1363);
INSERT INTO book_authors (book_id, author_id) values (117,1216);
INSERT INTO book_authors (book_id, author_id) values (118,1225);
INSERT INTO book_authors (book_id, author_id) values (119,293);
INSERT INTO book_authors (book_id, author_id) values (119,639);
INSERT INTO book_authors (book_id, author_id) values (119,648);
INSERT INTO book_authors (book_id, author_id) values (119,1036);
INSERT INTO book_authors (book_id, author_id) values (120,816);
INSERT INTO book_authors (book_id, author_id) values (120,957);
INSERT INTO book_authors (book_id, author_id) values (121,1050);
INSERT INTO book_authors (book_id, author_id) values (122,804);
INSERT INTO book_authors (book_id, author_id) values (122,968);
INSERT INTO book_authors (book_id, author_id) values (123,276);
INSERT INTO book_authors (book_id, author_id) values (124,294);
INSERT INTO book_authors (book_id, author_id) values (124,351);
INSERT INTO book_authors (book_id, author_id) values (124,937);
INSERT INTO book_authors (book_id, author_id) values (125,1305);
INSERT INTO book_authors (book_id, author_id) values (125,1314);
INSERT INTO book_authors (book_id, author_id) values (126,285);
INSERT INTO book_authors (book_id, author_id) values (127,753);
INSERT INTO book_authors (book_id, author_id) values (128,794);
INSERT INTO book_authors (book_id, author_id) values (129,890);
INSERT INTO book_authors (book_id, author_id) values (130,500);
INSERT INTO book_authors (book_id, author_id) values (131,526);
INSERT INTO book_authors (book_id, author_id) values (132,70);
INSERT INTO book_authors (book_id, author_id) values (132,241);
INSERT INTO book_authors (book_id, author_id) values (133,64);
INSERT INTO book_authors (book_id, author_id) values (133,922);
INSERT INTO book_authors (book_id, author_id) values (134,455);
INSERT INTO book_authors (book_id, author_id) values (134,591);
INSERT INTO book_authors (book_id, author_id) values (134,766);
INSERT INTO book_authors (book_id, author_id) values (135,1169);
INSERT INTO book_authors (book_id, author_id) values (136,667);
INSERT INTO book_authors (book_id, author_id) values (137,802);
INSERT INTO book_authors (book_id, author_id) values (138,910);
INSERT INTO book_authors (book_id, author_id) values (138,1150);
INSERT INTO book_authors (book_id, author_id) values (139,789);
INSERT INTO book_authors (book_id, author_id) values (139,1211);
INSERT INTO book_authors (book_id, author_id) values (140,1197);
INSERT INTO book_authors (book_id, author_id) values (141,628);
INSERT INTO book_authors (book_id, author_id) values (141,640);
INSERT INTO book_authors (book_id, author_id) values (141,723);
INSERT INTO book_authors (book_id, author_id) values (142,1102);
INSERT INTO book_authors (book_id, author_id) values (143,298);
INSERT INTO book_authors (book_id, author_id) values (143,1151);
INSERT INTO book_authors (book_id, author_id) values (144,114);
INSERT INTO book_authors (book_id, author_id) values (145,29);
INSERT INTO book_authors (book_id, author_id) values (145,327);
INSERT INTO book_authors (book_id, author_id) values (145,378);
INSERT INTO book_authors (book_id, author_id) values (145,1275);
INSERT INTO book_authors (book_id, author_id) values (146,1289);
INSERT INTO book_authors (book_id, author_id) values (147,394);
INSERT INTO book_authors (book_id, author_id) values (148,121);
INSERT INTO book_authors (book_id, author_id) values (149,143);
INSERT INTO book_authors (book_id, author_id) values (149,1357);
INSERT INTO book_authors (book_id, author_id) values (150,309);
INSERT INTO book_authors (book_id, author_id) values (151,286);
INSERT INTO book_authors (book_id, author_id) values (152,433);
INSERT INTO book_authors (book_id, author_id) values (153,676);
INSERT INTO book_authors (book_id, author_id) values (153,1152);
INSERT INTO book_authors (book_id, author_id) values (154,1309);
INSERT INTO book_authors (book_id, author_id) values (155,332);
INSERT INTO book_authors (book_id, author_id) values (155,1299);
INSERT INTO book_authors (book_id, author_id) values (155,1300);
INSERT INTO book_authors (book_id, author_id) values (156,1);
INSERT INTO book_authors (book_id, author_id) values (156,870);
INSERT INTO book_authors (book_id, author_id) values (156,1115);
INSERT INTO book_authors (book_id, author_id) values (156,1160);
INSERT INTO book_authors (book_id, author_id) values (157,109);
INSERT INTO book_authors (book_id, author_id) values (157,535);
INSERT INTO book_authors (book_id, author_id) values (157,666);
INSERT INTO book_authors (book_id, author_id) values (158,747);
INSERT INTO book_authors (book_id, author_id) values (159,521);
INSERT INTO book_authors (book_id, author_id) values (159,1051);
INSERT INTO book_authors (book_id, author_id) values (160,833);
INSERT INTO book_authors (book_id, author_id) values (161,527);
INSERT INTO book_authors (book_id, author_id) values (162,456);
INSERT INTO book_authors (book_id, author_id) values (163,1141);
INSERT INTO book_authors (book_id, author_id) values (164,928);
INSERT INTO book_authors (book_id, author_id) values (165,373);
INSERT INTO book_authors (book_id, author_id) values (165,387);
INSERT INTO book_authors (book_id, author_id) values (165,1062);
INSERT INTO book_authors (book_id, author_id) values (166,951);
INSERT INTO book_authors (book_id, author_id) values (167,1305);
INSERT INTO book_authors (book_id, author_id) values (167,1314);
INSERT INTO book_authors (book_id, author_id) values (168,607);
INSERT INTO book_authors (book_id, author_id) values (169,929);
INSERT INTO book_authors (book_id, author_id) values (169,1073);
INSERT INTO book_authors (book_id, author_id) values (170,536);
INSERT INTO book_authors (book_id, author_id) values (170,767);
INSERT INTO book_authors (book_id, author_id) values (171,663);
INSERT INTO book_authors (book_id, author_id) values (171,1176);
INSERT INTO book_authors (book_id, author_id) values (171,1235);
INSERT INTO book_authors (book_id, author_id) values (172,374);
INSERT INTO book_authors (book_id, author_id) values (172,1142);
INSERT INTO book_authors (book_id, author_id) values (173,248);
INSERT INTO book_authors (book_id, author_id) values (173,668);
INSERT INTO book_authors (book_id, author_id) values (173,834);
INSERT INTO book_authors (book_id, author_id) values (173,1069);
INSERT INTO book_authors (book_id, author_id) values (174,194);
INSERT INTO book_authors (book_id, author_id) values (174,370);
INSERT INTO book_authors (book_id, author_id) values (174,1369);
INSERT INTO book_authors (book_id, author_id) values (175,177);
INSERT INTO book_authors (book_id, author_id) values (176,144);
INSERT INTO book_authors (book_id, author_id) values (176,1074);
INSERT INTO book_authors (book_id, author_id) values (177,434);
INSERT INTO book_authors (book_id, author_id) values (178,677);
INSERT INTO book_authors (book_id, author_id) values (179,416);
INSERT INTO book_authors (book_id, author_id) values (180,242);
INSERT INTO book_authors (book_id, author_id) values (181,678);
INSERT INTO book_authors (book_id, author_id) values (182,65);
INSERT INTO book_authors (book_id, author_id) values (183,302);
INSERT INTO book_authors (book_id, author_id) values (183,1070);
INSERT INTO book_authors (book_id, author_id) values (184,104);
INSERT INTO book_authors (book_id, author_id) values (184,505);
INSERT INTO book_authors (book_id, author_id) values (185,795);
INSERT INTO book_authors (book_id, author_id) values (185,1273);
INSERT INTO book_authors (book_id, author_id) values (186,156);
INSERT INTO book_authors (book_id, author_id) values (187,812);
INSERT INTO book_authors (book_id, author_id) values (188,48);
INSERT INTO book_authors (book_id, author_id) values (189,1063);
INSERT INTO book_authors (book_id, author_id) values (189,1244);
INSERT INTO book_authors (book_id, author_id) values (190,716);
INSERT INTO book_authors (book_id, author_id) values (191,352);
INSERT INTO book_authors (book_id, author_id) values (192,76);
INSERT INTO book_authors (book_id, author_id) values (193,360);
INSERT INTO book_authors (book_id, author_id) values (194,98);
INSERT INTO book_authors (book_id, author_id) values (194,346);
INSERT INTO book_authors (book_id, author_id) values (194,402);
INSERT INTO book_authors (book_id, author_id) values (195,1191);
INSERT INTO book_authors (book_id, author_id) values (196,786);
INSERT INTO book_authors (book_id, author_id) values (197,1153);
INSERT INTO book_authors (book_id, author_id) values (198,251);
INSERT INTO book_authors (book_id, author_id) values (199,1301);
INSERT INTO book_authors (book_id, author_id) values (200,403);
INSERT INTO book_authors (book_id, author_id) values (201,152);
INSERT INTO book_authors (book_id, author_id) values (205,178);
INSERT INTO book_authors (book_id, author_id) values (206,145);
INSERT INTO book_authors (book_id, author_id) values (206,689);
INSERT INTO book_authors (book_id, author_id) values (206,754);
INSERT INTO book_authors (book_id, author_id) values (223,822);
INSERT INTO book_authors (book_id, author_id) values (224,1181);
INSERT INTO book_authors (book_id, author_id) values (225,603);
INSERT INTO book_authors (book_id, author_id) values (239,562);
INSERT INTO book_authors (book_id, author_id) values (240,822);
INSERT INTO book_authors (book_id, author_id) values (241,1095);
INSERT INTO book_authors (book_id, author_id) values (242,1039);
INSERT INTO book_authors (book_id, author_id) values (243,90);
INSERT INTO book_authors (book_id, author_id) values (244,426);
INSERT INTO book_authors (book_id, author_id) values (245,99);
INSERT INTO book_authors (book_id, author_id) values (246,278);
INSERT INTO book_authors (book_id, author_id) values (247,658);
INSERT INTO book_authors (book_id, author_id) values (248,157);
INSERT INTO book_authors (book_id, author_id) values (248,1182);
INSERT INTO book_authors (book_id, author_id) values (249,228);
INSERT INTO book_authors (book_id, author_id) values (249,891);
INSERT INTO book_authors (book_id, author_id) values (250,855);
INSERT INTO book_authors (book_id, author_id) values (251,980);
INSERT INTO book_authors (book_id, author_id) values (251,1232);
INSERT INTO book_authors (book_id, author_id) values (252,229);
INSERT INTO book_authors (book_id, author_id) values (253,163);
INSERT INTO book_authors (book_id, author_id) values (253,310);
INSERT INTO book_authors (book_id, author_id) values (253,983);
INSERT INTO book_authors (book_id, author_id) values (254,1170);
INSERT INTO book_authors (book_id, author_id) values (255,1045);
INSERT INTO book_authors (book_id, author_id) values (256,462);
INSERT INTO book_authors (book_id, author_id) values (257,469);
INSERT INTO book_authors (book_id, author_id) values (257,724);
INSERT INTO book_authors (book_id, author_id) values (258,66);
INSERT INTO book_authors (book_id, author_id) values (258,1075);
INSERT INTO book_authors (book_id, author_id) values (259,555);
INSERT INTO book_authors (book_id, author_id) values (260,1321);
INSERT INTO book_authors (book_id, author_id) values (261,279);
INSERT INTO book_authors (book_id, author_id) values (261,604);
INSERT INTO book_authors (book_id, author_id) values (262,187);
INSERT INTO book_authors (book_id, author_id) values (263,598);
INSERT INTO book_authors (book_id, author_id) values (264,261);
INSERT INTO book_authors (book_id, author_id) values (265,486);
INSERT INTO book_authors (book_id, author_id) values (265,1161);
INSERT INTO book_authors (book_id, author_id) values (266,509);
INSERT INTO book_authors (book_id, author_id) values (266,664);
INSERT INTO book_authors (book_id, author_id) values (266,1352);
INSERT INTO book_authors (book_id, author_id) values (267,1022);
INSERT INTO book_authors (book_id, author_id) values (268,657);
INSERT INTO book_authors (book_id, author_id) values (269,649);
INSERT INTO book_authors (book_id, author_id) values (269,736);
INSERT INTO book_authors (book_id, author_id) values (269,1136);
INSERT INTO book_authors (book_id, author_id) values (270,1322);
INSERT INTO book_authors (book_id, author_id) values (271,556);
INSERT INTO book_authors (book_id, author_id) values (272,1329);
INSERT INTO book_authors (book_id, author_id) values (273,669);
INSERT INTO book_authors (book_id, author_id) values (273,1323);
INSERT INTO book_authors (book_id, author_id) values (274,17);
INSERT INTO book_authors (book_id, author_id) values (274,266);
INSERT INTO book_authors (book_id, author_id) values (275,796);
INSERT INTO book_authors (book_id, author_id) values (276,761);
INSERT INTO book_authors (book_id, author_id) values (277,813);
INSERT INTO book_authors (book_id, author_id) values (278,861);
INSERT INTO book_authors (book_id, author_id) values (279,22);
INSERT INTO book_authors (book_id, author_id) values (280,478);
INSERT INTO book_authors (book_id, author_id) values (281,320);
INSERT INTO book_authors (book_id, author_id) values (281,1137);
INSERT INTO book_authors (book_id, author_id) values (282,1118);
INSERT INTO book_authors (book_id, author_id) values (283,136);
INSERT INTO book_authors (book_id, author_id) values (283,295);
INSERT INTO book_authors (book_id, author_id) values (283,315);
INSERT INTO book_authors (book_id, author_id) values (284,122);
INSERT INTO book_authors (book_id, author_id) values (284,621);
INSERT INTO book_authors (book_id, author_id) values (285,989);
INSERT INTO book_authors (book_id, author_id) values (286,1032);
INSERT INTO book_authors (book_id, author_id) values (287,1256);
INSERT INTO book_authors (book_id, author_id) values (288,932);
INSERT INTO book_authors (book_id, author_id) values (288,994);
INSERT INTO book_authors (book_id, author_id) values (289,37);
INSERT INTO book_authors (book_id, author_id) values (290,38);
INSERT INTO book_authors (book_id, author_id) values (290,693);
INSERT INTO book_authors (book_id, author_id) values (290,718);
INSERT INTO book_authors (book_id, author_id) values (291,579);
INSERT INTO book_authors (book_id, author_id) values (291,742);
INSERT INTO book_authors (book_id, author_id) values (292,871);
INSERT INTO book_authors (book_id, author_id) values (293,212);
INSERT INTO book_authors (book_id, author_id) values (293,506);
INSERT INTO book_authors (book_id, author_id) values (293,915);
INSERT INTO book_authors (book_id, author_id) values (293,1064);
INSERT INTO book_authors (book_id, author_id) values (294,547);
INSERT INTO book_authors (book_id, author_id) values (294,1212);
INSERT INTO book_authors (book_id, author_id) values (295,861);
INSERT INTO book_authors (book_id, author_id) values (296,82);
INSERT INTO book_authors (book_id, author_id) values (296,593);
INSERT INTO book_authors (book_id, author_id) values (297,802);
INSERT INTO book_authors (book_id, author_id) values (298,1334);
INSERT INTO book_authors (book_id, author_id) values (299,563);
INSERT INTO book_authors (book_id, author_id) values (300,650);
INSERT INTO book_authors (book_id, author_id) values (300,903);
INSERT INTO book_authors (book_id, author_id) values (301,573);
INSERT INTO book_authors (book_id, author_id) values (302,1324);
INSERT INTO book_authors (book_id, author_id) values (303,1281);
INSERT INTO book_authors (book_id, author_id) values (304,83);
INSERT INTO book_authors (book_id, author_id) values (304,1130);
INSERT INTO book_authors (book_id, author_id) values (305,563);
INSERT INTO book_authors (book_id, author_id) values (306,338);
INSERT INTO book_authors (book_id, author_id) values (306,592);
INSERT INTO book_authors (book_id, author_id) values (306,835);
INSERT INTO book_authors (book_id, author_id) values (306,945);
INSERT INTO book_authors (book_id, author_id) values (306,1315);
INSERT INTO book_authors (book_id, author_id) values (307,1197);
INSERT INTO book_authors (book_id, author_id) values (308,814);
INSERT INTO book_authors (book_id, author_id) values (308,892);
INSERT INTO book_authors (book_id, author_id) values (309,1364);
INSERT INTO book_authors (book_id, author_id) values (310,862);
INSERT INTO book_authors (book_id, author_id) values (311,64);
INSERT INTO book_authors (book_id, author_id) values (312,151);
INSERT INTO book_authors (book_id, author_id) values (312,1282);
INSERT INTO book_authors (book_id, author_id) values (313,294);
INSERT INTO book_authors (book_id, author_id) values (313,1220);
INSERT INTO book_authors (book_id, author_id) values (314,238);
INSERT INTO book_authors (book_id, author_id) values (314,1192);
INSERT INTO book_authors (book_id, author_id) values (315,510);
INSERT INTO book_authors (book_id, author_id) values (315,995);
INSERT INTO book_authors (book_id, author_id) values (316,826);
INSERT INTO book_authors (book_id, author_id) values (317,218);
INSERT INTO book_authors (book_id, author_id) values (318,938);
INSERT INTO book_authors (book_id, author_id) values (319,735);
INSERT INTO book_authors (book_id, author_id) values (320,709);
INSERT INTO book_authors (book_id, author_id) values (321,632);
INSERT INTO book_authors (book_id, author_id) values (321,1147);
INSERT INTO book_authors (book_id, author_id) values (322,969);
INSERT INTO book_authors (book_id, author_id) values (322,996);
INSERT INTO book_authors (book_id, author_id) values (323,719);
INSERT INTO book_authors (book_id, author_id) values (324,633);
INSERT INTO book_authors (book_id, author_id) values (325,594);
INSERT INTO book_authors (book_id, author_id) values (325,911);
INSERT INTO book_authors (book_id, author_id) values (326,327);
INSERT INTO book_authors (book_id, author_id) values (326,404);
INSERT INTO book_authors (book_id, author_id) values (326,427);
INSERT INTO book_authors (book_id, author_id) values (326,463);
INSERT INTO book_authors (book_id, author_id) values (326,659);
INSERT INTO book_authors (book_id, author_id) values (327,507);
INSERT INTO book_authors (book_id, author_id) values (327,1017);
INSERT INTO book_authors (book_id, author_id) values (328,1283);
INSERT INTO book_authors (book_id, author_id) values (329,666);
INSERT INTO book_authors (book_id, author_id) values (329,845);
INSERT INTO book_authors (book_id, author_id) values (330,173);
INSERT INTO book_authors (book_id, author_id) values (330,379);
INSERT INTO book_authors (book_id, author_id) values (330,1052);
INSERT INTO book_authors (book_id, author_id) values (330,1183);
INSERT INTO book_authors (book_id, author_id) values (331,817);
INSERT INTO book_authors (book_id, author_id) values (332,1187);
INSERT INTO book_authors (book_id, author_id) values (333,958);
INSERT INTO book_authors (book_id, author_id) values (334,608);
INSERT INTO book_authors (book_id, author_id) values (335,435);
INSERT INTO book_authors (book_id, author_id) values (336,1154);
INSERT INTO book_authors (book_id, author_id) values (337,199);
INSERT INTO book_authors (book_id, author_id) values (338,382);
INSERT INTO book_authors (book_id, author_id) values (338,464);
INSERT INTO book_authors (book_id, author_id) values (339,477);
INSERT INTO book_authors (book_id, author_id) values (340,110);
INSERT INTO book_authors (book_id, author_id) values (340,933);
INSERT INTO book_authors (book_id, author_id) values (340,1339);
INSERT INTO book_authors (book_id, author_id) values (341,904);
INSERT INTO book_authors (book_id, author_id) values (342,1162);
INSERT INTO book_authors (book_id, author_id) values (342,1171);
INSERT INTO book_authors (book_id, author_id) values (343,436);
INSERT INTO book_authors (book_id, author_id) values (343,548);
INSERT INTO book_authors (book_id, author_id) values (344,110);
INSERT INTO book_authors (book_id, author_id) values (344,933);
INSERT INTO book_authors (book_id, author_id) values (344,1339);
INSERT INTO book_authors (book_id, author_id) values (345,347);
INSERT INTO book_authors (book_id, author_id) values (345,949);
INSERT INTO book_authors (book_id, author_id) values (346,197);
INSERT INTO book_authors (book_id, author_id) values (347,205);
INSERT INTO book_authors (book_id, author_id) values (347,1257);
INSERT INTO book_authors (book_id, author_id) values (348,1290);
INSERT INTO book_authors (book_id, author_id) values (349,1206);
INSERT INTO book_authors (book_id, author_id) values (350,1291);
INSERT INTO book_authors (book_id, author_id) values (351,156);
INSERT INTO book_authors (book_id, author_id) values (351,690);
INSERT INTO book_authors (book_id, author_id) values (351,818);
INSERT INTO book_authors (book_id, author_id) values (352,23);
INSERT INTO book_authors (book_id, author_id) values (353,353);
INSERT INTO book_authors (book_id, author_id) values (354,30);
INSERT INTO book_authors (book_id, author_id) values (355,465);
INSERT INTO book_authors (book_id, author_id) values (355,1380);
INSERT INTO book_authors (book_id, author_id) values (356,528);
INSERT INTO book_authors (book_id, author_id) values (357,388);
INSERT INTO book_authors (book_id, author_id) values (357,557);
INSERT INTO book_authors (book_id, author_id) values (357,1046);
INSERT INTO book_authors (book_id, author_id) values (357,1353);
INSERT INTO book_authors (book_id, author_id) values (358,880);
INSERT INTO book_authors (book_id, author_id) values (359,57);
INSERT INTO book_authors (book_id, author_id) values (359,841);
INSERT INTO book_authors (book_id, author_id) values (359,1330);
INSERT INTO book_authors (book_id, author_id) values (360,1079);
INSERT INTO book_authors (book_id, author_id) values (361,1170);
INSERT INTO book_authors (book_id, author_id) values (362,206);
INSERT INTO book_authors (book_id, author_id) values (362,805);
INSERT INTO book_authors (book_id, author_id) values (363,875);
INSERT INTO book_authors (book_id, author_id) values (363,905);
INSERT INTO book_authors (book_id, author_id) values (364,737);
INSERT INTO book_authors (book_id, author_id) values (364,1381);
INSERT INTO book_authors (book_id, author_id) values (365,1018);
INSERT INTO book_authors (book_id, author_id) values (366,564);
INSERT INTO book_authors (book_id, author_id) values (366,1305);
INSERT INTO book_authors (book_id, author_id) values (366,1314);
INSERT INTO book_authors (book_id, author_id) values (366,1354);
INSERT INTO book_authors (book_id, author_id) values (367,95);
INSERT INTO book_authors (book_id, author_id) values (368,622);
INSERT INTO book_authors (book_id, author_id) values (369,2);
INSERT INTO book_authors (book_id, author_id) values (369,105);
INSERT INTO book_authors (book_id, author_id) values (370,710);
INSERT INTO book_authors (book_id, author_id) values (371,641);
INSERT INTO book_authors (book_id, author_id) values (372,1382);
INSERT INTO book_authors (book_id, author_id) values (373,280);
INSERT INTO book_authors (book_id, author_id) values (373,1080);
INSERT INTO book_authors (book_id, author_id) values (374,1023);
INSERT INTO book_authors (book_id, author_id) values (375,31);
INSERT INTO book_authors (book_id, author_id) values (375,1188);
INSERT INTO book_authors (book_id, author_id) values (376,158);
INSERT INTO book_authors (book_id, author_id) values (376,1096);
INSERT INTO book_authors (book_id, author_id) values (377,281);
INSERT INTO book_authors (book_id, author_id) values (378,123);
INSERT INTO book_authors (book_id, author_id) values (379,287);
INSERT INTO book_authors (book_id, author_id) values (379,964);
INSERT INTO book_authors (book_id, author_id) values (380,537);
INSERT INTO book_authors (book_id, author_id) values (381,1324);
INSERT INTO book_authors (book_id, author_id) values (382,243);
INSERT INTO book_authors (book_id, author_id) values (382,1275);
INSERT INTO book_authors (book_id, author_id) values (383,462);
INSERT INTO book_authors (book_id, author_id) values (384,213);
INSERT INTO book_authors (book_id, author_id) values (385,394);
INSERT INTO book_authors (book_id, author_id) values (386,1258);
INSERT INTO book_authors (book_id, author_id) values (386,1292);
INSERT INTO book_authors (book_id, author_id) values (387,316);
INSERT INTO book_authors (book_id, author_id) values (387,321);
INSERT INTO book_authors (book_id, author_id) values (388,1119);
INSERT INTO book_authors (book_id, author_id) values (389,220);
INSERT INTO book_authors (book_id, author_id) values (389,448);
INSERT INTO book_authors (book_id, author_id) values (389,487);
INSERT INTO book_authors (book_id, author_id) values (390,449);
INSERT INTO book_authors (book_id, author_id) values (390,1306);
INSERT INTO book_authors (book_id, author_id) values (391,39);
INSERT INTO book_authors (book_id, author_id) values (392,755);
INSERT INTO book_authors (book_id, author_id) values (392,1040);
INSERT INTO book_authors (book_id, author_id) values (392,1221);
INSERT INTO book_authors (book_id, author_id) values (393,10);
INSERT INTO book_authors (book_id, author_id) values (393,827);
INSERT INTO book_authors (book_id, author_id) values (394,1259);
INSERT INTO book_authors (book_id, author_id) values (395,609);
INSERT INTO book_authors (book_id, author_id) values (395,1267);
INSERT INTO book_authors (book_id, author_id) values (396,252);
INSERT INTO book_authors (book_id, author_id) values (397,164);
INSERT INTO book_authors (book_id, author_id) values (397,389);
INSERT INTO book_authors (book_id, author_id) values (398,1076);
INSERT INTO book_authors (book_id, author_id) values (398,1163);
INSERT INTO book_authors (book_id, author_id) values (399,529);
INSERT INTO book_authors (book_id, author_id) values (400,479);
INSERT INTO book_authors (book_id, author_id) values (401,457);
INSERT INTO book_authors (book_id, author_id) values (402,490);
INSERT INTO book_authors (book_id, author_id) values (403,413);
INSERT INTO book_authors (book_id, author_id) values (403,906);
INSERT INTO book_authors (book_id, author_id) values (403,1243);
INSERT INTO book_authors (book_id, author_id) values (404,871);
INSERT INTO book_authors (book_id, author_id) values (405,151);
INSERT INTO book_authors (book_id, author_id) values (405,1282);
INSERT INTO book_authors (book_id, author_id) values (406,303);
INSERT INTO book_authors (book_id, author_id) values (406,354);
INSERT INTO book_authors (book_id, author_id) values (406,634);
INSERT INTO book_authors (book_id, author_id) values (406,727);
INSERT INTO book_authors (book_id, author_id) values (407,58);
INSERT INTO book_authors (book_id, author_id) values (407,522);
INSERT INTO book_authors (book_id, author_id) values (407,756);
INSERT INTO book_authors (book_id, author_id) values (407,1284);
INSERT INTO book_authors (book_id, author_id) values (408,466);
INSERT INTO book_authors (book_id, author_id) values (408,768);
INSERT INTO book_authors (book_id, author_id) values (408,1358);
INSERT INTO book_authors (book_id, author_id) values (409,797);
INSERT INTO book_authors (book_id, author_id) values (410,282);
INSERT INTO book_authors (book_id, author_id) values (410,1122);
INSERT INTO book_authors (book_id, author_id) values (411,115);
INSERT INTO book_authors (book_id, author_id) values (411,348);
INSERT INTO book_authors (book_id, author_id) values (412,365);
INSERT INTO book_authors (book_id, author_id) values (412,501);
INSERT INTO book_authors (book_id, author_id) values (412,912);
INSERT INTO book_authors (book_id, author_id) values (413,221);
INSERT INTO book_authors (book_id, author_id) values (413,769);
INSERT INTO book_authors (book_id, author_id) values (414,283);
INSERT INTO book_authors (book_id, author_id) values (415,1051);
INSERT INTO book_authors (book_id, author_id) values (417,1065);
INSERT INTO book_authors (book_id, author_id) values (418,6);
INSERT INTO book_authors (book_id, author_id) values (419,24);
INSERT INTO book_authors (book_id, author_id) values (420,1103);
INSERT INTO book_authors (book_id, author_id) values (420,1324);
INSERT INTO book_authors (book_id, author_id) values (421,390);
INSERT INTO book_authors (book_id, author_id) values (421,984);
INSERT INTO book_authors (book_id, author_id) values (422,1198);
INSERT INTO book_authors (book_id, author_id) values (423,124);
INSERT INTO book_authors (book_id, author_id) values (423,623);
INSERT INTO book_authors (book_id, author_id) values (424,1066);
INSERT INTO book_authors (book_id, author_id) values (425,1053);
INSERT INTO book_authors (book_id, author_id) values (425,1268);
INSERT INTO book_authors (book_id, author_id) values (426,131);
INSERT INTO book_authors (book_id, author_id) values (426,960);
INSERT INTO book_authors (book_id, author_id) values (426,1310);
INSERT INTO book_authors (book_id, author_id) values (427,188);
INSERT INTO book_authors (book_id, author_id) values (427,304);
INSERT INTO book_authors (book_id, author_id) values (427,355);
INSERT INTO book_authors (book_id, author_id) values (427,679);
INSERT INTO book_authors (book_id, author_id) values (427,923);
INSERT INTO book_authors (book_id, author_id) values (428,440);
INSERT INTO book_authors (book_id, author_id) values (428,897);
INSERT INTO book_authors (book_id, author_id) values (429,549);
INSERT INTO book_authors (book_id, author_id) values (430,932);
INSERT INTO book_authors (book_id, author_id) values (431,867);
INSERT INTO book_authors (book_id, author_id) values (432,1348);
INSERT INTO book_authors (book_id, author_id) values (433,1164);
INSERT INTO book_authors (book_id, author_id) values (434,801);
INSERT INTO book_authors (book_id, author_id) values (435,32);
INSERT INTO book_authors (book_id, author_id) values (436,795);
INSERT INTO book_authors (book_id, author_id) values (437,893);
INSERT INTO book_authors (book_id, author_id) values (438,846);
INSERT INTO book_authors (book_id, author_id) values (439,684);
INSERT INTO book_authors (book_id, author_id) values (440,530);
INSERT INTO book_authors (book_id, author_id) values (441,1331);
INSERT INTO book_authors (book_id, author_id) values (442,1302);
INSERT INTO book_authors (book_id, author_id) values (443,480);
INSERT INTO book_authors (book_id, author_id) values (444,828);
INSERT INTO book_authors (book_id, author_id) values (445,635);
INSERT INTO book_authors (book_id, author_id) values (445,1097);
INSERT INTO book_authors (book_id, author_id) values (446,819);
INSERT INTO book_authors (book_id, author_id) values (447,253);
INSERT INTO book_authors (book_id, author_id) values (447,470);
INSERT INTO book_authors (book_id, author_id) values (448,934);
INSERT INTO book_authors (book_id, author_id) values (449,624);
INSERT INTO book_authors (book_id, author_id) values (450,100);
INSERT INTO book_authors (book_id, author_id) values (450,587);
INSERT INTO book_authors (book_id, author_id) values (450,728);
INSERT INTO book_authors (book_id, author_id) values (450,924);
INSERT INTO book_authors (book_id, author_id) values (450,997);
INSERT INTO book_authors (book_id, author_id) values (451,1311);
INSERT INTO book_authors (book_id, author_id) values (452,781);
INSERT INTO book_authors (book_id, author_id) values (452,856);
INSERT INTO book_authors (book_id, author_id) values (453,1359);
INSERT INTO book_authors (book_id, author_id) values (454,101);
INSERT INTO book_authors (book_id, author_id) values (454,829);
INSERT INTO book_authors (book_id, author_id) values (454,1104);
INSERT INTO book_authors (book_id, author_id) values (455,67);
INSERT INTO book_authors (book_id, author_id) values (455,1262);
INSERT INTO book_authors (book_id, author_id) values (456,622);
INSERT INTO book_authors (book_id, author_id) values (457,405);
INSERT INTO book_authors (book_id, author_id) values (457,471);
INSERT INTO book_authors (book_id, author_id) values (457,558);
INSERT INTO book_authors (book_id, author_id) values (457,836);
INSERT INTO book_authors (book_id, author_id) values (457,1131);
INSERT INTO book_authors (book_id, author_id) values (458,535);
INSERT INTO book_authors (book_id, author_id) values (458,845);
INSERT INTO book_authors (book_id, author_id) values (459,1316);
INSERT INTO book_authors (book_id, author_id) values (460,146);
INSERT INTO book_authors (book_id, author_id) values (460,1148);
INSERT INTO book_authors (book_id, author_id) values (461,1199);
INSERT INTO book_authors (book_id, author_id) values (462,18);
INSERT INTO book_authors (book_id, author_id) values (463,84);
INSERT INTO book_authors (book_id, author_id) values (464,502);
INSERT INTO book_authors (book_id, author_id) values (465,288);
INSERT INTO book_authors (book_id, author_id) values (465,491);
INSERT INTO book_authors (book_id, author_id) values (465,738);
INSERT INTO book_authors (book_id, author_id) values (465,1005);
INSERT INTO book_authors (book_id, author_id) values (465,1263);
INSERT INTO book_authors (book_id, author_id) values (466,339);
INSERT INTO book_authors (book_id, author_id) values (466,981);
INSERT INTO book_authors (book_id, author_id) values (466,1365);
INSERT INTO book_authors (book_id, author_id) values (467,262);
INSERT INTO book_authors (book_id, author_id) values (468,770);
INSERT INTO book_authors (book_id, author_id) values (469,7);
INSERT INTO book_authors (book_id, author_id) values (469,670);
INSERT INTO book_authors (book_id, author_id) values (469,965);
INSERT INTO book_authors (book_id, author_id) values (470,40);
INSERT INTO book_authors (book_id, author_id) values (471,748);
INSERT INTO book_authors (book_id, author_id) values (471,762);
INSERT INTO book_authors (book_id, author_id) values (471,1222);
INSERT INTO book_authors (book_id, author_id) values (472,1360);
INSERT INTO book_authors (book_id, author_id) values (473,651);
INSERT INTO book_authors (book_id, author_id) values (474,71);
INSERT INTO book_authors (book_id, author_id) values (475,1155);
INSERT INTO book_authors (book_id, author_id) values (476,91);
INSERT INTO book_authors (book_id, author_id) values (476,340);
INSERT INTO book_authors (book_id, author_id) values (477,165);
INSERT INTO book_authors (book_id, author_id) values (478,685);
INSERT INTO book_authors (book_id, author_id) values (478,1089);
INSERT INTO book_authors (book_id, author_id) values (478,1245);
INSERT INTO book_authors (book_id, author_id) values (479,211);
INSERT INTO book_authors (book_id, author_id) values (480,96);
INSERT INTO book_authors (book_id, author_id) values (481,531);
INSERT INTO book_authors (book_id, author_id) values (482,1156);
INSERT INTO book_authors (book_id, author_id) values (483,125);
INSERT INTO book_authors (book_id, author_id) values (484,1335);
INSERT INTO book_authors (book_id, author_id) values (485,1015);
INSERT INTO book_authors (book_id, author_id) values (486,303);
INSERT INTO book_authors (book_id, author_id) values (487,669);
INSERT INTO book_authors (book_id, author_id) values (488,1325);
INSERT INTO book_authors (book_id, author_id) values (489,686);
INSERT INTO book_authors (book_id, author_id) values (490,704);
INSERT INTO book_authors (book_id, author_id) values (490,1293);
INSERT INTO book_authors (book_id, author_id) values (491,898);
INSERT INTO book_authors (book_id, author_id) values (492,680);
INSERT INTO book_authors (book_id, author_id) values (493,17);
INSERT INTO book_authors (book_id, author_id) values (494,492);
INSERT INTO book_authors (book_id, author_id) values (495,311);
INSERT INTO book_authors (book_id, author_id) values (495,356);
INSERT INTO book_authors (book_id, author_id) values (495,1170);
INSERT INTO book_authors (book_id, author_id) values (496,511);
INSERT INTO book_authors (book_id, author_id) values (497,59);
INSERT INTO book_authors (book_id, author_id) values (497,493);
INSERT INTO book_authors (book_id, author_id) values (497,549);
INSERT INTO book_authors (book_id, author_id) values (497,393);
INSERT INTO book_authors (book_id, author_id) values (498,328);
INSERT INTO book_authors (book_id, author_id) values (498,544);
INSERT INTO book_authors (book_id, author_id) values (498,729);
INSERT INTO book_authors (book_id, author_id) values (499,1331);
INSERT INTO book_authors (book_id, author_id) values (500,798);
INSERT INTO book_authors (book_id, author_id) values (501,823);
INSERT INTO book_authors (book_id, author_id) values (502,642);
INSERT INTO book_authors (book_id, author_id) values (503,1276);
INSERT INTO book_authors (book_id, author_id) values (503,1282);
INSERT INTO book_authors (book_id, author_id) values (504,548);
INSERT INTO book_authors (book_id, author_id) values (504,636);
INSERT INTO book_authors (book_id, author_id) values (505,1305);
INSERT INTO book_authors (book_id, author_id) values (505,1314);
INSERT INTO book_authors (book_id, author_id) values (506,660);
INSERT INTO book_authors (book_id, author_id) values (507,430);
INSERT INTO book_authors (book_id, author_id) values (507,939);
INSERT INTO book_authors (book_id, author_id) values (508,214);
INSERT INTO book_authors (book_id, author_id) values (508,285);
INSERT INTO book_authors (book_id, author_id) values (508,296);
INSERT INTO book_authors (book_id, author_id) values (508,380);
INSERT INTO book_authors (book_id, author_id) values (508,494);
INSERT INTO book_authors (book_id, author_id) values (508,618);
INSERT INTO book_authors (book_id, author_id) values (508,961);
INSERT INTO book_authors (book_id, author_id) values (508,982);
INSERT INTO book_authors (book_id, author_id) values (508,1250);
INSERT INTO book_authors (book_id, author_id) values (509,215);
INSERT INTO book_authors (book_id, author_id) values (509,458);
INSERT INTO book_authors (book_id, author_id) values (509,1120);
INSERT INTO book_authors (book_id, author_id) values (510,881);
INSERT INTO book_authors (book_id, author_id) values (511,898);
INSERT INTO book_authors (book_id, author_id) values (512,428);
INSERT INTO book_authors (book_id, author_id) values (512,657);
INSERT INTO book_authors (book_id, author_id) values (512,1355);
INSERT INTO book_authors (book_id, author_id) values (513,406);
INSERT INTO book_authors (book_id, author_id) values (513,559);
INSERT INTO book_authors (book_id, author_id) values (514,1217);
INSERT INTO book_authors (book_id, author_id) values (515,898);
INSERT INTO book_authors (book_id, author_id) values (516,856);
INSERT INTO book_authors (book_id, author_id) values (517,629);
INSERT INTO book_authors (book_id, author_id) values (518,1324);
INSERT INTO book_authors (book_id, author_id) values (519,1246);
INSERT INTO book_authors (book_id, author_id) values (520,1246);
INSERT INTO book_authors (book_id, author_id) values (521,1067);
INSERT INTO book_authors (book_id, author_id) values (522,1329);
INSERT INTO book_authors (book_id, author_id) values (523,951);
INSERT INTO book_authors (book_id, author_id) values (524,876);
INSERT INTO book_authors (book_id, author_id) values (525,940);
INSERT INTO book_authors (book_id, author_id) values (525,1251);
INSERT INTO book_authors (book_id, author_id) values (526,230);
INSERT INTO book_authors (book_id, author_id) values (526,322);
INSERT INTO book_authors (book_id, author_id) values (526,357);
INSERT INTO book_authors (book_id, author_id) values (526,652);
INSERT INTO book_authors (book_id, author_id) values (526,694);
INSERT INTO book_authors (book_id, author_id) values (526,1041);
INSERT INTO book_authors (book_id, author_id) values (527,72);
INSERT INTO book_authors (book_id, author_id) values (527,467);
INSERT INTO book_authors (book_id, author_id) values (528,1317);
INSERT INTO book_authors (book_id, author_id) values (529,289);
INSERT INTO book_authors (book_id, author_id) values (529,333);
INSERT INTO book_authors (book_id, author_id) values (530,1054);
INSERT INTO book_authors (book_id, author_id) values (531,954);
INSERT INTO book_authors (book_id, author_id) values (532,1229);
INSERT INTO book_authors (book_id, author_id) values (533,776);
INSERT INTO book_authors (book_id, author_id) values (534,1009);
INSERT INTO book_authors (book_id, author_id) values (535,395);
INSERT INTO book_authors (book_id, author_id) values (536,523);
INSERT INTO book_authors (book_id, author_id) values (537,189);
INSERT INTO book_authors (book_id, author_id) values (538,366);
INSERT INTO book_authors (book_id, author_id) values (539,481);
INSERT INTO book_authors (book_id, author_id) values (540,441);
INSERT INTO book_authors (book_id, author_id) values (541,290);
INSERT INTO book_authors (book_id, author_id) values (541,643);
INSERT INTO book_authors (book_id, author_id) values (542,53);
INSERT INTO book_authors (book_id, author_id) values (543,990);
INSERT INTO book_authors (book_id, author_id) values (543,1375);
INSERT INTO book_authors (book_id, author_id) values (544,746);
INSERT INTO book_authors (book_id, author_id) values (544,1098);
INSERT INTO book_authors (book_id, author_id) values (544,1236);
INSERT INTO book_authors (book_id, author_id) values (545,297);
INSERT INTO book_authors (book_id, author_id) values (545,1260);
INSERT INTO book_authors (book_id, author_id) values (546,375);
INSERT INTO book_authors (book_id, author_id) values (546,499);
INSERT INTO book_authors (book_id, author_id) values (546,882);
INSERT INTO book_authors (book_id, author_id) values (547,720);
INSERT INTO book_authors (book_id, author_id) values (548,102);
INSERT INTO book_authors (book_id, author_id) values (549,755);
INSERT INTO book_authors (book_id, author_id) values (550,563);
INSERT INTO book_authors (book_id, author_id) values (551,941);
INSERT INTO book_authors (book_id, author_id) values (552,761);
INSERT INTO book_authors (book_id, author_id) values (553,317);
INSERT INTO book_authors (book_id, author_id) values (554,1024);
INSERT INTO book_authors (book_id, author_id) values (555,44);
INSERT INTO book_authors (book_id, author_id) values (555,299);
INSERT INTO book_authors (book_id, author_id) values (556,563);
INSERT INTO book_authors (book_id, author_id) values (558,970);
INSERT INTO book_authors (book_id, author_id) values (559,730);
INSERT INTO book_authors (book_id, author_id) values (560,1349);
INSERT INTO book_authors (book_id, author_id) values (561,899);
INSERT INTO book_authors (book_id, author_id) values (562,414);
INSERT INTO book_authors (book_id, author_id) values (562,777);
INSERT INTO book_authors (book_id, author_id) values (563,431);
INSERT INTO book_authors (book_id, author_id) values (564,1294);
INSERT INTO book_authors (book_id, author_id) values (565,711);
INSERT INTO book_authors (book_id, author_id) values (566,922);
INSERT INTO book_authors (book_id, author_id) values (567,550);
INSERT INTO book_authors (book_id, author_id) values (568,207);
INSERT INTO book_authors (book_id, author_id) values (569,743);
INSERT INTO book_authors (book_id, author_id) values (569,771);
INSERT INTO book_authors (book_id, author_id) values (569,1055);
INSERT INTO book_authors (book_id, author_id) values (570,153);
INSERT INTO book_authors (book_id, author_id) values (571,1317);
INSERT INTO book_authors (book_id, author_id) values (572,595);
INSERT INTO book_authors (book_id, author_id) values (573,1237);
INSERT INTO book_authors (book_id, author_id) values (574,488);
INSERT INTO book_authors (book_id, author_id) values (574,916);
INSERT INTO book_authors (book_id, author_id) values (595,830);
INSERT INTO book_authors (book_id, author_id) values (596,1123);
INSERT INTO book_authors (book_id, author_id) values (597,326);
INSERT INTO book_authors (book_id, author_id) values (598,97);
INSERT INTO book_authors (book_id, author_id) values (598,657);
INSERT INTO book_authors (book_id, author_id) values (628,137);
INSERT INTO book_authors (book_id, author_id) values (628,159);
INSERT INTO book_authors (book_id, author_id) values (628,168);
INSERT INTO book_authors (book_id, author_id) values (629,907);
INSERT INTO book_authors (book_id, author_id) values (630,77);
INSERT INTO book_authors (book_id, author_id) values (630,254);
INSERT INTO book_authors (book_id, author_id) values (631,1213);
INSERT INTO book_authors (book_id, author_id) values (632,1285);
INSERT INTO book_authors (book_id, author_id) values (633,450);
INSERT INTO book_authors (book_id, author_id) values (633,1177);
INSERT INTO book_authors (book_id, author_id) values (634,407);
INSERT INTO book_authors (book_id, author_id) values (634,772);
INSERT INTO book_authors (book_id, author_id) values (635,1157);
INSERT INTO book_authors (book_id, author_id) values (636,1143);
INSERT INTO book_authors (book_id, author_id) values (637,1083);
INSERT INTO book_authors (book_id, author_id) values (638,763);
INSERT INTO book_authors (book_id, author_id) values (639,116);
INSERT INTO book_authors (book_id, author_id) values (640,267);
INSERT INTO book_authors (book_id, author_id) values (641,68);
INSERT INTO book_authors (book_id, author_id) values (641,1354);
INSERT INTO book_authors (book_id, author_id) values (642,1238);
INSERT INTO book_authors (book_id, author_id) values (643,147);
INSERT INTO book_authors (book_id, author_id) values (643,277);
INSERT INTO book_authors (book_id, author_id) values (644,200);
INSERT INTO book_authors (book_id, author_id) values (644,517);
INSERT INTO book_authors (book_id, author_id) values (645,27);
INSERT INTO book_authors (book_id, author_id) values (646,1006);
INSERT INTO book_authors (book_id, author_id) values (646,1226);
INSERT INTO book_authors (book_id, author_id) values (647,705);
INSERT INTO book_authors (book_id, author_id) values (648,367);
INSERT INTO book_authors (book_id, author_id) values (648,723);
INSERT INTO book_authors (book_id, author_id) values (648,1027);
INSERT INTO book_authors (book_id, author_id) values (649,263);
INSERT INTO book_authors (book_id, author_id) values (650,830);
INSERT INTO book_authors (book_id, author_id) values (651,1032);
INSERT INTO book_authors (book_id, author_id) values (652,856);
INSERT INTO book_authors (book_id, author_id) values (653,801);
INSERT INTO book_authors (book_id, author_id) values (654,28);
INSERT INTO book_authors (book_id, author_id) values (655,705);
INSERT INTO book_authors (book_id, author_id) values (656,106);
INSERT INTO book_authors (book_id, author_id) values (656,231);
INSERT INTO book_authors (book_id, author_id) values (656,1366);
INSERT INTO book_authors (book_id, author_id) values (657,117);
INSERT INTO book_authors (book_id, author_id) values (657,169);
INSERT INTO book_authors (book_id, author_id) values (657,264);
INSERT INTO book_authors (book_id, author_id) values (657,451);
INSERT INTO book_authors (book_id, author_id) values (657,955);
INSERT INTO book_authors (book_id, author_id) values (657,1200);
INSERT INTO book_authors (book_id, author_id) values (657,1252);
INSERT INTO book_authors (book_id, author_id) values (658,524);
INSERT INTO book_authors (book_id, author_id) values (658,1283);
INSERT INTO book_authors (book_id, author_id) values (659,1098);
INSERT INTO book_authors (book_id, author_id) values (660,1172);
INSERT INTO book_authors (book_id, author_id) values (661,1189);
INSERT INTO book_authors (book_id, author_id) values (662,371);
INSERT INTO book_authors (book_id, author_id) values (662,1370);
INSERT INTO book_authors (book_id, author_id) values (663,472);
INSERT INTO book_authors (book_id, author_id) values (663,831);
INSERT INTO book_authors (book_id, author_id) values (663,971);
INSERT INTO book_authors (book_id, author_id) values (663,1028);
INSERT INTO book_authors (book_id, author_id) values (663,1184);
INSERT INTO book_authors (book_id, author_id) values (664,757);
INSERT INTO book_authors (book_id, author_id) values (665,1261);
INSERT INTO book_authors (book_id, author_id) values (666,259);
INSERT INTO book_authors (book_id, author_id) values (667,856);
INSERT INTO book_authors (book_id, author_id) values (668,710);
INSERT INTO book_authors (book_id, author_id) values (669,341);
INSERT INTO book_authors (book_id, author_id) values (669,408);
INSERT INTO book_authors (book_id, author_id) values (669,942);
INSERT INTO book_authors (book_id, author_id) values (669,1269);
INSERT INTO book_authors (book_id, author_id) values (670,129);
INSERT INTO book_authors (book_id, author_id) values (670,518);
INSERT INTO book_authors (book_id, author_id) values (670,1307);
INSERT INTO book_authors (book_id, author_id) values (671,179);
INSERT INTO book_authors (book_id, author_id) values (672,482);
INSERT INTO book_authors (book_id, author_id) values (673,1371);
INSERT INTO book_authors (book_id, author_id) values (674,555);
INSERT INTO book_authors (book_id, author_id) values (675,782);
INSERT INTO book_authors (book_id, author_id) values (675,1010);
INSERT INTO book_authors (book_id, author_id) values (675,1056);
INSERT INTO book_authors (book_id, author_id) values (676,598);
INSERT INTO book_authors (book_id, author_id) values (677,1201);
INSERT INTO book_authors (book_id, author_id) values (678,180);
INSERT INTO book_authors (book_id, author_id) values (679,985);
INSERT INTO book_authors (book_id, author_id) values (680,255);
INSERT INTO book_authors (book_id, author_id) values (681,339);
INSERT INTO book_authors (book_id, author_id) values (682,294);
INSERT INTO book_authors (book_id, author_id) values (682,608);
INSERT INTO book_authors (book_id, author_id) values (682,1376);
INSERT INTO book_authors (book_id, author_id) values (683,500);
INSERT INTO book_authors (book_id, author_id) values (684,723);
INSERT INTO book_authors (book_id, author_id) values (685,11);
INSERT INTO book_authors (book_id, author_id) values (685,731);
INSERT INTO book_authors (book_id, author_id) values (685,1342);
INSERT INTO book_authors (book_id, author_id) values (685,1343);
INSERT INTO book_authors (book_id, author_id) values (685,1372);
INSERT INTO book_authors (book_id, author_id) values (686,268);
INSERT INTO book_authors (book_id, author_id) values (686,574);
INSERT INTO book_authors (book_id, author_id) values (686,1025);
INSERT INTO book_authors (book_id, author_id) values (687,442);
INSERT INTO book_authors (book_id, author_id) values (688,976);
INSERT INTO book_authors (book_id, author_id) values (689,1291);
INSERT INTO book_authors (book_id, author_id) values (690,630);
INSERT INTO book_authors (book_id, author_id) values (691,12);
INSERT INTO book_authors (book_id, author_id) values (692,1011);
INSERT INTO book_authors (book_id, author_id) values (693,431);
INSERT INTO book_authors (book_id, author_id) values (694,130);
INSERT INTO book_authors (book_id, author_id) values (695,1327);
INSERT INTO book_authors (book_id, author_id) values (696,512);
INSERT INTO book_authors (book_id, author_id) values (697,78);
INSERT INTO book_authors (book_id, author_id) values (697,1207);
INSERT INTO book_authors (book_id, author_id) values (698,473);
INSERT INTO book_authors (book_id, author_id) values (698,653);
INSERT INTO book_authors (book_id, author_id) values (699,86);
INSERT INTO book_authors (book_id, author_id) values (699,665);
INSERT INTO book_authors (book_id, author_id) values (700,199);
INSERT INTO book_authors (book_id, author_id) values (700,778);
INSERT INTO book_authors (book_id, author_id) values (700,1344);
INSERT INTO book_authors (book_id, author_id) values (701,571);
INSERT INTO book_authors (book_id, author_id) values (701,764);
INSERT INTO book_authors (book_id, author_id) values (702,222);
INSERT INTO book_authors (book_id, author_id) values (702,672);
INSERT INTO book_authors (book_id, author_id) values (703,842);
INSERT INTO book_authors (book_id, author_id) values (703,1178);
INSERT INTO book_authors (book_id, author_id) values (704,170);
INSERT INTO book_authors (book_id, author_id) values (704,613);
INSERT INTO book_authors (book_id, author_id) values (704,1295);
INSERT INTO book_authors (book_id, author_id) values (705,1144);
INSERT INTO book_authors (book_id, author_id) values (705,1239);
INSERT INTO book_authors (book_id, author_id) values (706,883);
INSERT INTO book_authors (book_id, author_id) values (707,459);
INSERT INTO book_authors (book_id, author_id) values (708,417);
INSERT INTO book_authors (book_id, author_id) values (709,625);
INSERT INTO book_authors (book_id, author_id) values (710,467);
INSERT INTO book_authors (book_id, author_id) values (711,1124);
INSERT INTO book_authors (book_id, author_id) values (712,596);
INSERT INTO book_authors (book_id, author_id) values (712,661);
INSERT INTO book_authors (book_id, author_id) values (713,378);
INSERT INTO book_authors (book_id, author_id) values (714,208);
INSERT INTO book_authors (book_id, author_id) values (714,1110);
INSERT INTO book_authors (book_id, author_id) values (715,223);
INSERT INTO book_authors (book_id, author_id) values (715,342);
INSERT INTO book_authors (book_id, author_id) values (715,396);
INSERT INTO book_authors (book_id, author_id) values (715,452);
INSERT INTO book_authors (book_id, author_id) values (716,746);
INSERT INTO book_authors (book_id, author_id) values (717,908);
INSERT INTO book_authors (book_id, author_id) values (718,732);
INSERT INTO book_authors (book_id, author_id) values (719,52);
INSERT INTO book_authors (book_id, author_id) values (720,174);
INSERT INTO book_authors (book_id, author_id) values (721,256);
INSERT INTO book_authors (book_id, author_id) values (722,943);
INSERT INTO book_authors (book_id, author_id) values (723,745);
INSERT INTO book_authors (book_id, author_id) values (724,989);
INSERT INTO book_authors (book_id, author_id) values (725,654);
INSERT INTO book_authors (book_id, author_id) values (725,917);
INSERT INTO book_authors (book_id, author_id) values (726,856);
INSERT INTO book_authors (book_id, author_id) values (727,856);
INSERT INTO book_authors (book_id, author_id) values (728,872);
INSERT INTO book_authors (book_id, author_id) values (729,1312);
INSERT INTO book_authors (book_id, author_id) values (730,1240);
INSERT INTO book_authors (book_id, author_id) values (731,712);
INSERT INTO book_authors (book_id, author_id) values (731,877);
INSERT INTO book_authors (book_id, author_id) values (732,329);
INSERT INTO book_authors (book_id, author_id) values (733,538);
INSERT INTO book_authors (book_id, author_id) values (733,847);
INSERT INTO book_authors (book_id, author_id) values (733,1277);
INSERT INTO book_authors (book_id, author_id) values (734,176);
INSERT INTO book_authors (book_id, author_id) values (734,800);
INSERT INTO book_authors (book_id, author_id) values (735,68);
INSERT INTO book_authors (book_id, author_id) values (735,1145);
INSERT INTO book_authors (book_id, author_id) values (735,1354);
INSERT INTO book_authors (book_id, author_id) values (736,725);
INSERT INTO book_authors (book_id, author_id) values (737,118);
INSERT INTO book_authors (book_id, author_id) values (738,1116);
INSERT INTO book_authors (book_id, author_id) values (739,687);
INSERT INTO book_authors (book_id, author_id) values (739,1278);
INSERT INTO book_authors (book_id, author_id) values (740,160);
INSERT INTO book_authors (book_id, author_id) values (741,644);
INSERT INTO book_authors (book_id, author_id) values (742,232);
INSERT INTO book_authors (book_id, author_id) values (742,305);
INSERT INTO book_authors (book_id, author_id) values (742,1081);
INSERT INTO book_authors (book_id, author_id) values (743,54);
INSERT INTO book_authors (book_id, author_id) values (743,344);
INSERT INTO book_authors (book_id, author_id) values (744,1345);
INSERT INTO book_authors (book_id, author_id) values (745,1383);
INSERT INTO book_authors (book_id, author_id) values (746,749);
INSERT INTO book_authors (book_id, author_id) values (747,843);
INSERT INTO book_authors (book_id, author_id) values (748,1040);
INSERT INTO book_authors (book_id, author_id) values (749,233);
INSERT INTO book_authors (book_id, author_id) values (750,474);
INSERT INTO book_authors (book_id, author_id) values (750,673);
INSERT INTO book_authors (book_id, author_id) values (751,739);
INSERT INTO book_authors (book_id, author_id) values (752,956);
INSERT INTO book_authors (book_id, author_id) values (752,1269);
INSERT INTO book_authors (book_id, author_id) values (753,809);
INSERT INTO book_authors (book_id, author_id) values (753,1185);
INSERT INTO book_authors (book_id, author_id) values (754,624);
INSERT INTO book_authors (book_id, author_id) values (755,863);
INSERT INTO book_authors (book_id, author_id) values (756,269);
INSERT INTO book_authors (book_id, author_id) values (756,1303);
INSERT INTO book_authors (book_id, author_id) values (757,1042);
INSERT INTO book_authors (book_id, author_id) values (758,837);
INSERT INTO book_authors (book_id, author_id) values (759,783);
INSERT INTO book_authors (book_id, author_id) values (760,201);
INSERT INTO book_authors (book_id, author_id) values (761,565);
INSERT INTO book_authors (book_id, author_id) values (762,645);
INSERT INTO book_authors (book_id, author_id) values (763,270);
INSERT INTO book_authors (book_id, author_id) values (764,418);
INSERT INTO book_authors (book_id, author_id) values (764,710);
INSERT INTO book_authors (book_id, author_id) values (765,111);
INSERT INTO book_authors (book_id, author_id) values (765,713);
INSERT INTO book_authors (book_id, author_id) values (765,884);
INSERT INTO book_authors (book_id, author_id) values (766,1208);
INSERT INTO book_authors (book_id, author_id) values (767,1090);
INSERT INTO book_authors (book_id, author_id) values (767,1197);
INSERT INTO book_authors (book_id, author_id) values (768,249);
INSERT INTO book_authors (book_id, author_id) values (768,453);
INSERT INTO book_authors (book_id, author_id) values (768,483);
INSERT INTO book_authors (book_id, author_id) values (769,857);
INSERT INTO book_authors (book_id, author_id) values (770,1213);
INSERT INTO book_authors (book_id, author_id) values (771,1218);
INSERT INTO book_authors (book_id, author_id) values (772,721);
INSERT INTO book_authors (book_id, author_id) values (773,539);
INSERT INTO book_authors (book_id, author_id) values (773,560);
INSERT INTO book_authors (book_id, author_id) values (774,1230);
INSERT INTO book_authors (book_id, author_id) values (775,1336);
INSERT INTO book_authors (book_id, author_id) values (776,726);
INSERT INTO book_authors (book_id, author_id) values (777,787);
INSERT INTO book_authors (book_id, author_id) values (778,171);
INSERT INTO book_authors (book_id, author_id) values (778,271);
INSERT INTO book_authors (book_id, author_id) values (779,41);
INSERT INTO book_authors (book_id, author_id) values (779,1165);
INSERT INTO book_authors (book_id, author_id) values (780,788);
INSERT INTO book_authors (book_id, author_id) values (780,1373);
INSERT INTO book_authors (book_id, author_id) values (781,1138);
INSERT INTO book_authors (book_id, author_id) values (781,1149);
INSERT INTO book_authors (book_id, author_id) values (782,985);
INSERT INTO book_authors (book_id, author_id) values (783,584);
INSERT INTO book_authors (book_id, author_id) values (784,1026);
INSERT INTO book_authors (book_id, author_id) values (785,64);
INSERT INTO book_authors (book_id, author_id) values (785,701);
INSERT INTO book_authors (book_id, author_id) values (785,848);
INSERT INTO book_authors (book_id, author_id) values (786,244);
INSERT INTO book_authors (book_id, author_id) values (786,1125);
INSERT INTO book_authors (book_id, author_id) values (787,419);
INSERT INTO book_authors (book_id, author_id) values (787,1377);
INSERT INTO book_authors (book_id, author_id) values (788,1367);
INSERT INTO book_authors (book_id, author_id) values (789,972);
INSERT INTO book_authors (book_id, author_id) values (790,397);
INSERT INTO book_authors (book_id, author_id) values (790,707);
INSERT INTO book_authors (book_id, author_id) values (791,1187);
INSERT INTO book_authors (book_id, author_id) values (792,803);
INSERT INTO book_authors (book_id, author_id) values (792,1084);
INSERT INTO book_authors (book_id, author_id) values (793,361);
INSERT INTO book_authors (book_id, author_id) values (793,688);
INSERT INTO book_authors (book_id, author_id) values (793,824);
INSERT INTO book_authors (book_id, author_id) values (794,257);
INSERT INTO book_authors (book_id, author_id) values (795,1277);
INSERT INTO book_authors (book_id, author_id) values (796,312);
INSERT INTO book_authors (book_id, author_id) values (796,918);
INSERT INTO book_authors (book_id, author_id) values (796,1233);
INSERT INTO book_authors (book_id, author_id) values (797,674);
INSERT INTO book_authors (book_id, author_id) values (798,148);
INSERT INTO book_authors (book_id, author_id) values (799,9);
INSERT INTO book_authors (book_id, author_id) values (800,409);
INSERT INTO book_authors (book_id, author_id) values (801,468);
INSERT INTO book_authors (book_id, author_id) values (802,111);
INSERT INTO book_authors (book_id, author_id) values (802,713);
INSERT INTO book_authors (book_id, author_id) values (802,884);
INSERT INTO book_authors (book_id, author_id) values (803,60);
INSERT INTO book_authors (book_id, author_id) values (804,443);
INSERT INTO book_authors (book_id, author_id) values (805,495);
INSERT INTO book_authors (book_id, author_id) values (805,580);
INSERT INTO book_authors (book_id, author_id) values (805,1071);
INSERT INTO book_authors (book_id, author_id) values (806,181);
INSERT INTO book_authors (book_id, author_id) values (806,714);
INSERT INTO book_authors (book_id, author_id) values (807,779);
INSERT INTO book_authors (book_id, author_id) values (808,977);
INSERT INTO book_authors (book_id, author_id) values (809,878);
INSERT INTO book_authors (book_id, author_id) values (810,313);
INSERT INTO book_authors (book_id, author_id) values (811,1378);
INSERT INTO book_authors (book_id, author_id) values (812,489);
INSERT INTO book_authors (book_id, author_id) values (813,251);
INSERT INTO book_authors (book_id, author_id) values (813,950);
INSERT INTO book_authors (book_id, author_id) values (813,1033);
INSERT INTO book_authors (book_id, author_id) values (813,1202);
INSERT INTO book_authors (book_id, author_id) values (814,561);
INSERT INTO book_authors (book_id, author_id) values (815,588);
INSERT INTO book_authors (book_id, author_id) values (815,695);
INSERT INTO book_authors (book_id, author_id) values (816,260);
INSERT INTO book_authors (book_id, author_id) values (816,1105);
INSERT INTO book_authors (book_id, author_id) values (816,1283);
INSERT INTO book_authors (book_id, author_id) values (817,376);
INSERT INTO book_authors (book_id, author_id) values (817,1085);
INSERT INTO book_authors (book_id, author_id) values (817,1106);
INSERT INTO book_authors (book_id, author_id) values (818,838);
INSERT INTO book_authors (book_id, author_id) values (819,61);
INSERT INTO book_authors (book_id, author_id) values (819,133);
INSERT INTO book_authors (book_id, author_id) values (820,913);
INSERT INTO book_authors (book_id, author_id) values (820,1126);
INSERT INTO book_authors (book_id, author_id) values (821,885);
INSERT INTO book_authors (book_id, author_id) values (822,1340);
INSERT INTO book_authors (book_id, author_id) values (823,858);
INSERT INTO book_authors (book_id, author_id) values (824,62);
INSERT INTO book_authors (book_id, author_id) values (824,900);
INSERT INTO book_authors (book_id, author_id) values (825,1241);
INSERT INTO book_authors (book_id, author_id) values (826,112);
INSERT INTO book_authors (book_id, author_id) values (826,1269);
INSERT INTO book_authors (book_id, author_id) values (827,901);
INSERT INTO book_authors (book_id, author_id) values (828,138);
INSERT INTO book_authors (book_id, author_id) values (829,362);
INSERT INTO book_authors (book_id, author_id) values (829,381);
INSERT INTO book_authors (book_id, author_id) values (830,859);
INSERT INTO book_authors (book_id, author_id) values (831,190);
INSERT INTO book_authors (book_id, author_id) values (831,1001);
INSERT INTO book_authors (book_id, author_id) values (832,655);
INSERT INTO book_authors (book_id, author_id) values (832,1086);
INSERT INTO book_authors (book_id, author_id) values (833,45);
INSERT INTO book_authors (book_id, author_id) values (834,637);
INSERT INTO book_authors (book_id, author_id) values (835,581);
INSERT INTO book_authors (book_id, author_id) values (836,1378);
INSERT INTO book_authors (book_id, author_id) values (837,238);
INSERT INTO book_authors (book_id, author_id) values (838,33);
INSERT INTO book_authors (book_id, author_id) values (838,410);
INSERT INTO book_authors (book_id, author_id) values (839,1138);
INSERT INTO book_authors (book_id, author_id) values (839,1149);
INSERT INTO book_authors (book_id, author_id) values (840,540);
INSERT INTO book_authors (book_id, author_id) values (840,1283);
INSERT INTO book_authors (book_id, author_id) values (841,868);
INSERT INTO book_authors (book_id, author_id) values (841,956);
INSERT INTO book_authors (book_id, author_id) values (841,1012);
INSERT INTO book_authors (book_id, author_id) values (842,64);
INSERT INTO book_authors (book_id, author_id) values (843,572);
INSERT INTO book_authors (book_id, author_id) values (843,790);
INSERT INTO book_authors (book_id, author_id) values (844,886);
INSERT INTO book_authors (book_id, author_id) values (845,311);
INSERT INTO book_authors (book_id, author_id) values (845,439);
INSERT INTO book_authors (book_id, author_id) values (846,599);
INSERT INTO book_authors (book_id, author_id) values (847,566);
INSERT INTO book_authors (book_id, author_id) values (848,589);
INSERT INTO book_authors (book_id, author_id) values (849,34);
INSERT INTO book_authors (book_id, author_id) values (849,610);
INSERT INTO book_authors (book_id, author_id) values (850,747);
INSERT INTO book_authors (book_id, author_id) values (851,378);
INSERT INTO book_authors (book_id, author_id) values (852,513);
INSERT INTO book_authors (book_id, author_id) values (853,1057);
INSERT INTO book_authors (book_id, author_id) values (854,92);
INSERT INTO book_authors (book_id, author_id) values (854,998);
INSERT INTO book_authors (book_id, author_id) values (855,3);
INSERT INTO book_authors (book_id, author_id) values (855,600);
INSERT INTO book_authors (book_id, author_id) values (855,1043);
INSERT INTO book_authors (book_id, author_id) values (855,1091);
INSERT INTO book_authors (book_id, author_id) values (856,318);
INSERT INTO book_authors (book_id, author_id) values (856,1146);
INSERT INTO book_authors (book_id, author_id) values (857,468);
INSERT INTO book_authors (book_id, author_id) values (858,646);
INSERT INTO book_authors (book_id, author_id) values (858,1270);
INSERT INTO book_authors (book_id, author_id) values (859,1011);
INSERT INTO book_authors (book_id, author_id) values (860,8);
INSERT INTO book_authors (book_id, author_id) values (860,1037);
INSERT INTO book_authors (book_id, author_id) values (861,119);
INSERT INTO book_authors (book_id, author_id) values (861,935);
INSERT INTO book_authors (book_id, author_id) values (862,468);
INSERT INTO book_authors (book_id, author_id) values (863,806);
INSERT INTO book_authors (book_id, author_id) values (864,856);
INSERT INTO book_authors (book_id, author_id) values (865,978);
INSERT INTO book_authors (book_id, author_id) values (866,4);
INSERT INTO book_authors (book_id, author_id) values (866,161);
INSERT INTO book_authors (book_id, author_id) values (866,1068);
INSERT INTO book_authors (book_id, author_id) values (867,166);
INSERT INTO book_authors (book_id, author_id) values (868,932);
INSERT INTO book_authors (book_id, author_id) values (869,111);
INSERT INTO book_authors (book_id, author_id) values (869,713);
INSERT INTO book_authors (book_id, author_id) values (869,884);
INSERT INTO book_authors (book_id, author_id) values (870,170);
INSERT INTO book_authors (book_id, author_id) values (870,1157);
INSERT INTO book_authors (book_id, author_id) values (870,1295);
INSERT INTO book_authors (book_id, author_id) values (871,696);
INSERT INTO book_authors (book_id, author_id) values (872,697);
INSERT INTO book_authors (book_id, author_id) values (873,864);
INSERT INTO book_authors (book_id, author_id) values (873,991);
INSERT INTO book_authors (book_id, author_id) values (874,979);
INSERT INTO book_authors (book_id, author_id) values (875,1346);
INSERT INTO book_authors (book_id, author_id) values (876,1264);
INSERT INTO book_authors (book_id, author_id) values (877,378);
INSERT INTO book_authors (book_id, author_id) values (877,549);
INSERT INTO book_authors (book_id, author_id) values (878,1139);
INSERT INTO book_authors (book_id, author_id) values (878,1219);
INSERT INTO book_authors (book_id, author_id) values (878,1247);
INSERT INTO book_authors (book_id, author_id) values (879,1286);
INSERT INTO book_authors (book_id, author_id) values (880,549);
INSERT INTO book_authors (book_id, author_id) values (881,791);
INSERT INTO book_authors (book_id, author_id) values (882,306);
INSERT INTO book_authors (book_id, author_id) values (882,903);
INSERT INTO book_authors (book_id, author_id) values (883,567);
INSERT INTO book_authors (book_id, author_id) values (883,1347);
INSERT INTO book_authors (book_id, author_id) values (884,420);
INSERT INTO book_authors (book_id, author_id) values (885,717);
INSERT INTO book_authors (book_id, author_id) values (886,1019);
INSERT INTO book_authors (book_id, author_id) values (887,886);
INSERT INTO book_authors (book_id, author_id) values (888,1107);
INSERT INTO book_authors (book_id, author_id) values (889,307);
INSERT INTO book_authors (book_id, author_id) values (889,1108);
INSERT INTO book_authors (book_id, author_id) values (890,545);
INSERT INTO book_authors (book_id, author_id) values (891,930);
INSERT INTO book_authors (book_id, author_id) values (892,807);
INSERT INTO book_authors (book_id, author_id) values (893,25);
INSERT INTO book_authors (book_id, author_id) values (893,311);
INSERT INTO book_authors (book_id, author_id) values (893,439);
INSERT INTO book_authors (book_id, author_id) values (894,437);
INSERT INTO book_authors (book_id, author_id) values (894,600);
INSERT INTO book_authors (book_id, author_id) values (895,856);
INSERT INTO book_authors (book_id, author_id) values (896,638);
INSERT INTO book_authors (book_id, author_id) values (897,216);
INSERT INTO book_authors (book_id, author_id) values (897,327);
INSERT INTO book_authors (book_id, author_id) values (897,460);
INSERT INTO book_authors (book_id, author_id) values (898,461);
INSERT INTO book_authors (book_id, author_id) values (899,334);
INSERT INTO book_authors (book_id, author_id) values (899,1287);
INSERT INTO book_authors (book_id, author_id) values (900,54);
INSERT INTO book_authors (book_id, author_id) values (901,1190);
INSERT INTO book_authors (book_id, author_id) values (901,1381);
INSERT INTO book_authors (book_id, author_id) values (902,245);
INSERT INTO book_authors (book_id, author_id) values (903,239);
INSERT INTO book_authors (book_id, author_id) values (904,825);
INSERT INTO book_authors (book_id, author_id) values (905,343);
INSERT INTO book_authors (book_id, author_id) values (905,432);
INSERT INTO book_authors (book_id, author_id) values (906,167);
INSERT INTO book_authors (book_id, author_id) values (906,966);
INSERT INTO book_authors (book_id, author_id) values (907,902);
INSERT INTO book_authors (book_id, author_id) values (908,1029);
INSERT INTO book_authors (book_id, author_id) values (909,151);
INSERT INTO book_authors (book_id, author_id) values (910,626);
INSERT INTO book_authors (book_id, author_id) values (911,914);
INSERT INTO book_authors (book_id, author_id) values (912,103);
INSERT INTO book_authors (book_id, author_id) values (913,849);
INSERT INTO book_authors (book_id, author_id) values (913,1288);
INSERT INTO book_authors (book_id, author_id) values (914,979);
INSERT INTO book_authors (book_id, author_id) values (915,149);
INSERT INTO book_authors (book_id, author_id) values (915,294);
INSERT INTO book_authors (book_id, author_id) values (915,765);
INSERT INTO book_authors (book_id, author_id) values (915,959);
INSERT INTO book_authors (book_id, author_id) values (915,1156);
INSERT INTO book_authors (book_id, author_id) values (916,1231);
INSERT INTO book_authors (book_id, author_id) values (917,1242);
INSERT INTO book_authors (book_id, author_id) values (918,944);
INSERT INTO book_authors (book_id, author_id) values (918,1334);
INSERT INTO book_authors (book_id, author_id) values (919,919);
INSERT INTO book_authors (book_id, author_id) values (919,1058);
INSERT INTO book_authors (book_id, author_id) values (920,1193);
INSERT INTO book_authors (book_id, author_id) values (921,850);
INSERT INTO book_authors (book_id, author_id) values (922,1099);
INSERT INTO book_authors (book_id, author_id) values (923,675);
INSERT INTO book_authors (book_id, author_id) values (924,1246);
INSERT INTO book_authors (book_id, author_id) values (925,265);
INSERT INTO book_authors (book_id, author_id) values (925,294);
INSERT INTO book_authors (book_id, author_id) values (926,209);
INSERT INTO book_authors (book_id, author_id) values (927,246);
INSERT INTO book_authors (book_id, author_id) values (928,963);
INSERT INTO book_authors (book_id, author_id) values (929,963);
INSERT INTO book_authors (book_id, author_id) values (930,548);
INSERT INTO book_authors (book_id, author_id) values (930,636);
INSERT INTO book_authors (book_id, author_id) values (931,418);
INSERT INTO book_authors (book_id, author_id) values (931,1241);
INSERT INTO book_authors (book_id, author_id) values (931,1199);
INSERT INTO book_authors (book_id, author_id) values (932,182);
INSERT INTO book_authors (book_id, author_id) values (933,773);
INSERT INTO book_authors (book_id, author_id) values (934,73);
INSERT INTO book_authors (book_id, author_id) values (934,330);
INSERT INTO book_authors (book_id, author_id) values (934,920);
INSERT INTO book_authors (book_id, author_id) values (935,279);
INSERT INTO book_authors (book_id, author_id) values (935,421);
INSERT INTO book_authors (book_id, author_id) values (935,1313);
INSERT INTO book_authors (book_id, author_id) values (936,722);
INSERT INTO book_authors (book_id, author_id) values (937,1082);
INSERT INTO book_authors (book_id, author_id) values (938,1173);
INSERT INTO book_authors (book_id, author_id) values (939,784);
INSERT INTO book_authors (book_id, author_id) values (939,1174);
INSERT INTO book_authors (book_id, author_id) values (940,930);
INSERT INTO book_authors (book_id, author_id) values (941,398);
INSERT INTO book_authors (book_id, author_id) values (942,118);
INSERT INTO book_authors (book_id, author_id) values (942,989);
INSERT INTO book_authors (book_id, author_id) values (942,1332);
INSERT INTO book_authors (book_id, author_id) values (943,519);
INSERT INTO book_authors (book_id, author_id) values (943,898);
INSERT INTO book_authors (book_id, author_id) values (944,614);
INSERT INTO book_authors (book_id, author_id) values (944,1127);
INSERT INTO book_authors (book_id, author_id) values (945,120);
INSERT INTO book_authors (book_id, author_id) values (946,871);
INSERT INTO book_authors (book_id, author_id) values (947,219);
INSERT INTO book_authors (book_id, author_id) values (947,1265);
INSERT INTO book_authors (book_id, author_id) values (948,715);
INSERT INTO book_authors (book_id, author_id) values (948,946);
INSERT INTO book_authors (book_id, author_id) values (948,1121);
INSERT INTO book_authors (book_id, author_id) values (949,69);
INSERT INTO book_authors (book_id, author_id) values (950,503);
INSERT INTO book_authors (book_id, author_id) values (950,808);
INSERT INTO book_authors (book_id, author_id) values (951,42);
INSERT INTO book_authors (book_id, author_id) values (951,272);
INSERT INTO book_authors (book_id, author_id) values (952,1092);
INSERT INTO book_authors (book_id, author_id) values (953,820);
INSERT INTO book_authors (book_id, author_id) values (953,887);
INSERT INTO book_authors (book_id, author_id) values (954,1175);
INSERT INTO book_authors (book_id, author_id) values (955,856);
INSERT INTO book_authors (book_id, author_id) values (956,1283);
INSERT INTO book_authors (book_id, author_id) values (957,844);
INSERT INTO book_authors (book_id, author_id) values (958,358);
INSERT INTO book_authors (book_id, author_id) values (958,1337);
INSERT INTO book_authors (book_id, author_id) values (959,319);
INSERT INTO book_authors (book_id, author_id) values (960,869);
INSERT INTO book_authors (book_id, author_id) values (961,1194);
INSERT INTO book_authors (book_id, author_id) values (961,1195);
INSERT INTO book_authors (book_id, author_id) values (962,691);
INSERT INTO book_authors (book_id, author_id) values (962,744);
INSERT INTO book_authors (book_id, author_id) values (963,963);
INSERT INTO book_authors (book_id, author_id) values (964,183);
INSERT INTO book_authors (book_id, author_id) values (965,530);
INSERT INTO book_authors (book_id, author_id) values (966,35);
INSERT INTO book_authors (book_id, author_id) values (966,1271);
INSERT INTO book_authors (book_id, author_id) values (967,987);
INSERT INTO book_authors (book_id, author_id) values (968,873);
INSERT INTO book_authors (book_id, author_id) values (968,1139);
INSERT INTO book_authors (book_id, author_id) values (968,1219);
INSERT INTO book_authors (book_id, author_id) values (969,462);
INSERT INTO book_authors (book_id, author_id) values (970,1279);
INSERT INTO book_authors (book_id, author_id) values (971,294);
INSERT INTO book_authors (book_id, author_id) values (971,1059);
INSERT INTO book_authors (book_id, author_id) values (971,1328);
INSERT INTO book_authors (book_id, author_id) values (972,132);
INSERT INTO book_authors (book_id, author_id) values (972,605);
INSERT INTO book_authors (book_id, author_id) values (973,277);
INSERT INTO book_authors (book_id, author_id) values (973,327);
INSERT INTO book_authors (book_id, author_id) values (974,46);
INSERT INTO book_authors (book_id, author_id) values (974,662);
INSERT INTO book_authors (book_id, author_id) values (974,952);
INSERT INTO book_authors (book_id, author_id) values (974,1030);
INSERT INTO book_authors (book_id, author_id) values (975,608);
INSERT INTO book_authors (book_id, author_id) values (975,1253);
INSERT INTO book_authors (book_id, author_id) values (975,1338);
INSERT INTO book_authors (book_id, author_id) values (976,1350);
INSERT INTO book_authors (book_id, author_id) values (977,532);
INSERT INTO book_authors (book_id, author_id) values (978,283);
INSERT INTO book_authors (book_id, author_id) values (978,422);
INSERT INTO book_authors (book_id, author_id) values (979,141);
INSERT INTO book_authors (book_id, author_id) values (979,508);
INSERT INTO book_authors (book_id, author_id) values (979,509);
INSERT INTO book_authors (book_id, author_id) values (979,585);
INSERT INTO book_authors (book_id, author_id) values (980,1234);
INSERT INTO book_authors (book_id, author_id) values (981,13);
INSERT INTO book_authors (book_id, author_id) values (982,240);
INSERT INTO book_authors (book_id, author_id) values (982,399);
INSERT INTO book_authors (book_id, author_id) values (983,586);
INSERT INTO book_authors (book_id, author_id) values (984,868);
INSERT INTO book_authors (book_id, author_id) values (985,596);
INSERT INTO book_authors (book_id, author_id) values (985,1013);
INSERT INTO book_authors (book_id, author_id) values (985,1060);
INSERT INTO book_authors (book_id, author_id) values (986,391);
INSERT INTO book_authors (book_id, author_id) values (986,708);
INSERT INTO book_authors (book_id, author_id) values (986,1029);
INSERT INTO book_authors (book_id, author_id) values (987,300);
INSERT INTO book_authors (book_id, author_id) values (987,937);
INSERT INTO book_authors (book_id, author_id) values (988,1324);
INSERT INTO book_authors (book_id, author_id) values (989,541);
INSERT INTO book_authors (book_id, author_id) values (989,1196);
INSERT INTO book_authors (book_id, author_id) values (990,615);
INSERT INTO book_authors (book_id, author_id) values (990,1214);
INSERT INTO book_authors (book_id, author_id) values (991,461);
INSERT INTO book_authors (book_id, author_id) values (992,1087);
INSERT INTO book_authors (book_id, author_id) values (993,43);
INSERT INTO book_authors (book_id, author_id) values (993,383);
INSERT INTO book_authors (book_id, author_id) values (994,1170);
INSERT INTO book_authors (book_id, author_id) values (994,1351);
INSERT INTO book_authors (book_id, author_id) values (995,496);
INSERT INTO book_authors (book_id, author_id) values (996,74);
INSERT INTO book_authors (book_id, author_id) values (997,224);
INSERT INTO book_authors (book_id, author_id) values (997,575);
INSERT INTO book_authors (book_id, author_id) values (997,774);
INSERT INTO book_authors (book_id, author_id) values (998,335);
INSERT INTO book_authors (book_id, author_id) values (999,851);
INSERT INTO book_authors (book_id, author_id) values (999,947);
INSERT INTO book_authors (book_id, author_id) values (999,1072);
INSERT INTO book_authors (book_id, author_id) values (1000,191);
INSERT INTO book_authors (book_id, author_id) values (1001,973);
INSERT INTO book_authors (book_id, author_id) values (1002,76);
INSERT INTO book_authors (book_id, author_id) values (1002,1017);
INSERT INTO book_authors (book_id, author_id) values (1003,284);
INSERT INTO book_authors (book_id, author_id) values (1003,520);
INSERT INTO book_authors (book_id, author_id) values (1003,1274);
INSERT INTO book_authors (book_id, author_id) values (1004,656);
INSERT INTO book_authors (book_id, author_id) values (1004,948);
INSERT INTO book_authors (book_id, author_id) values (1005,87);
INSERT INTO book_authors (book_id, author_id) values (1006,408);
INSERT INTO book_authors (book_id, author_id) values (1007,19);
INSERT INTO book_authors (book_id, author_id) values (1008,1088);
INSERT INTO book_authors (book_id, author_id) values (1009,514);
INSERT INTO book_authors (book_id, author_id) values (1009,647);
INSERT INTO book_authors (book_id, author_id) values (1009,733);
INSERT INTO book_authors (book_id, author_id) values (1009,936);
INSERT INTO book_authors (book_id, author_id) values (1010,86);
INSERT INTO book_authors (book_id, author_id) values (1010,665);
INSERT INTO book_authors (book_id, author_id) values (1011,139);
INSERT INTO book_authors (book_id, author_id) values (1012,1002);
INSERT INTO book_authors (book_id, author_id) values (1014,198);
INSERT INTO book_authors (book_id, author_id) values (1015,551);
INSERT INTO book_authors (book_id, author_id) values (1015,611);
INSERT INTO book_authors (book_id, author_id) values (1016,912);
INSERT INTO book_authors (book_id, author_id) values (1016,1028);
INSERT INTO book_authors (book_id, author_id) values (1017,47);
INSERT INTO book_authors (book_id, author_id) values (1017,1221);
INSERT INTO book_authors (book_id, author_id) values (1018,50);
INSERT INTO book_authors (book_id, author_id) values (1019,894);
INSERT INTO book_authors (book_id, author_id) values (1020,1007);
INSERT INTO book_authors (book_id, author_id) values (1021,14);
INSERT INTO book_authors (book_id, author_id) values (1021,134);
INSERT INTO book_authors (book_id, author_id) values (1022,999);
INSERT INTO book_authors (book_id, author_id) values (1023,823);
INSERT INTO book_authors (book_id, author_id) values (1023,852);
INSERT INTO book_authors (book_id, author_id) values (1024,856);
INSERT INTO book_authors (book_id, author_id) values (1025,1371);
INSERT INTO book_authors (book_id, author_id) values (1026,1032);
INSERT INTO book_authors (book_id, author_id) values (1027,267);
INSERT INTO book_authors (book_id, author_id) values (1028,195);
INSERT INTO book_authors (book_id, author_id) values (1028,659);
INSERT INTO book_authors (book_id, author_id) values (1028,750);
INSERT INTO book_authors (book_id, author_id) values (1028,974);
INSERT INTO book_authors (book_id, author_id) values (1028,975);
INSERT INTO book_authors (book_id, author_id) values (1028,1186);
INSERT INTO book_authors (book_id, author_id) values (1029,576);
INSERT INTO book_authors (book_id, author_id) values (1029,702);
INSERT INTO book_authors (book_id, author_id) values (1030,616);
INSERT INTO book_authors (book_id, author_id) values (1031,273);
INSERT INTO book_authors (book_id, author_id) values (1032,985);
INSERT INTO book_authors (book_id, author_id) values (1033,153);
INSERT INTO book_authors (book_id, author_id) values (1034,780);
INSERT INTO book_authors (book_id, author_id) values (1034,1296);
INSERT INTO book_authors (book_id, author_id) values (1035,890);
INSERT INTO book_authors (book_id, author_id) values (1036,985);
INSERT INTO book_authors (book_id, author_id) values (1037,1254);
INSERT INTO book_authors (book_id, author_id) values (1038,439);
INSERT INTO book_authors (book_id, author_id) values (1038,1047);
INSERT INTO book_authors (book_id, author_id) values (1039,5);
INSERT INTO book_authors (book_id, author_id) values (1039,209);
INSERT INTO book_authors (book_id, author_id) values (1039,799);
INSERT INTO book_authors (book_id, author_id) values (1040,20);
INSERT INTO book_authors (book_id, author_id) values (1040,444);
INSERT INTO book_authors (book_id, author_id) values (1040,703);
INSERT INTO book_authors (book_id, author_id) values (1041,76);
INSERT INTO book_authors (book_id, author_id) values (1042,400);
INSERT INTO book_authors (book_id, author_id) values (1043,88);
INSERT INTO book_authors (book_id, author_id) values (1044,1241);
INSERT INTO book_authors (book_id, author_id) values (1045,205);
INSERT INTO book_authors (book_id, author_id) values (1045,1280);
INSERT INTO book_authors (book_id, author_id) values (1046,1034);
INSERT INTO book_authors (book_id, author_id) values (1046,1090);
INSERT INTO book_authors (book_id, author_id) values (1046,1197);
INSERT INTO book_authors (book_id, author_id) values (1047,21);
INSERT INTO book_authors (book_id, author_id) values (1047,1214);
INSERT INTO book_authors (book_id, author_id) values (1048,1374);
INSERT INTO book_authors (book_id, author_id) values (1049,874);
INSERT INTO book_authors (book_id, author_id) values (1050,963);
INSERT INTO book_authors (book_id, author_id) values (1051,681);
INSERT INTO book_authors (book_id, author_id) values (1052,126);
INSERT INTO book_authors (book_id, author_id) values (1052,1166);
INSERT INTO book_authors (book_id, author_id) values (1053,1223);
INSERT INTO book_authors (book_id, author_id) values (1054,445);
INSERT INTO book_authors (book_id, author_id) values (1055,699);
INSERT INTO book_authors (book_id, author_id) values (1055,888);
INSERT INTO book_authors (book_id, author_id) values (1056,411);
INSERT INTO book_authors (book_id, author_id) values (1057,490);
INSERT INTO book_authors (book_id, author_id) values (1057,925);
INSERT INTO book_authors (book_id, author_id) values (1057,1128);
INSERT INTO book_authors (book_id, author_id) values (1058,55);
INSERT INTO book_authors (book_id, author_id) values (1058,80);
INSERT INTO book_authors (book_id, author_id) values (1059,1132);
INSERT INTO book_authors (book_id, author_id) values (1060,9);
INSERT INTO book_authors (book_id, author_id) values (1060,1209);
INSERT INTO book_authors (book_id, author_id) values (1061,876);
INSERT INTO book_authors (book_id, author_id) values (1062,740);
INSERT INTO book_authors (book_id, author_id) values (1063,89);
INSERT INTO book_authors (book_id, author_id) values (1063,107);
INSERT INTO book_authors (book_id, author_id) values (1063,140);
INSERT INTO book_authors (book_id, author_id) values (1063,363);
INSERT INTO book_authors (book_id, author_id) values (1064,71);
INSERT INTO book_authors (book_id, author_id) values (1064,446);
INSERT INTO book_authors (book_id, author_id) values (1065,1077);
INSERT INTO book_authors (book_id, author_id) values (1066,327);
INSERT INTO book_authors (book_id, author_id) values (1067,388);
INSERT INTO book_authors (book_id, author_id) values (1067,557);
INSERT INTO book_authors (book_id, author_id) values (1067,1046);
INSERT INTO book_authors (book_id, author_id) values (1067,1353);
INSERT INTO book_authors (book_id, author_id) values (1068,856);
INSERT INTO book_authors (book_id, author_id) values (1069,1132);
INSERT INTO book_authors (book_id, author_id) values (1070,423);
INSERT INTO book_authors (book_id, author_id) values (1070,891);
INSERT INTO book_authors (book_id, author_id) values (1071,956);
INSERT INTO book_authors (book_id, author_id) values (1071,1269);
INSERT INTO book_authors (book_id, author_id) values (1072,36);
INSERT INTO book_authors (book_id, author_id) values (1073,454);
INSERT INTO book_authors (book_id, author_id) values (1073,1203);
INSERT INTO book_authors (book_id, author_id) values (1074,199);
INSERT INTO book_authors (book_id, author_id) values (1075,1019);
INSERT INTO book_authors (book_id, author_id) values (1076,327);
INSERT INTO book_authors (book_id, author_id) values (1077,597);
INSERT INTO book_authors (book_id, author_id) values (1078,202);
INSERT INTO book_authors (book_id, author_id) values (1078,617);
INSERT INTO book_authors (book_id, author_id) values (1079,1002);
INSERT INTO book_authors (book_id, author_id) values (1080,225);
INSERT INTO book_authors (book_id, author_id) values (1081,172);
INSERT INTO book_authors (book_id, author_id) values (1081,184);
INSERT INTO book_authors (book_id, author_id) values (1081,391);
INSERT INTO book_authors (book_id, author_id) values (1082,832);
INSERT INTO book_authors (book_id, author_id) values (1082,1384);
INSERT INTO book_authors (book_id, author_id) values (1083,717);
INSERT INTO book_authors (book_id, author_id) values (1084,291);
INSERT INTO book_authors (book_id, author_id) values (1085,331);
INSERT INTO book_authors (book_id, author_id) values (1086,25);
INSERT INTO book_authors (book_id, author_id) values (1086,311);
INSERT INTO book_authors (book_id, author_id) values (1086,439);
INSERT INTO book_authors (book_id, author_id) values (1087,234);
INSERT INTO book_authors (book_id, author_id) values (1088,150);
INSERT INTO book_authors (book_id, author_id) values (1088,1272);
INSERT INTO book_authors (book_id, author_id) values (1089,153);
INSERT INTO book_authors (book_id, author_id) values (1089,1255);
INSERT INTO book_authors (book_id, author_id) values (1090,853);
INSERT INTO book_authors (book_id, author_id) values (1091,235);
INSERT INTO book_authors (book_id, author_id) values (1092,1215);
INSERT INTO book_authors (book_id, author_id) values (1093,217);
INSERT INTO book_authors (book_id, author_id) values (1093,1297);
INSERT INTO book_authors (book_id, author_id) values (1094,182);
INSERT INTO book_authors (book_id, author_id) values (1095,75);
INSERT INTO book_authors (book_id, author_id) values (1096,368);
INSERT INTO book_authors (book_id, author_id) values (1097,963);
INSERT INTO book_authors (book_id, author_id) values (1098,475);
INSERT INTO book_authors (book_id, author_id) values (1098,504);
INSERT INTO book_authors (book_id, author_id) values (1099,65);
INSERT INTO book_authors (book_id, author_id) values (1099,568);
INSERT INTO book_authors (book_id, author_id) values (1100,1197);
INSERT INTO book_authors (book_id, author_id) values (1101,461);
INSERT INTO book_authors (book_id, author_id) values (1102,162);
INSERT INTO book_authors (book_id, author_id) values (1103,856);
INSERT INTO book_authors (book_id, author_id) values (1104,226);
INSERT INTO book_authors (book_id, author_id) values (1104,481);
INSERT INTO book_authors (book_id, author_id) values (1105,274);
INSERT INTO book_authors (book_id, author_id) values (1105,865);
INSERT INTO book_authors (book_id, author_id) values (1105,1040);
INSERT INTO book_authors (book_id, author_id) values (1105,1129);
INSERT INTO book_authors (book_id, author_id) values (1105,1177);
INSERT INTO book_authors (book_id, author_id) values (1105,1385);
INSERT INTO book_authors (book_id, author_id) values (1106,600);
INSERT INTO book_authors (book_id, author_id) values (1106,718);
INSERT INTO book_authors (book_id, author_id) values (1107,250);
INSERT INTO book_authors (book_id, author_id) values (1107,1061);
INSERT INTO book_authors (book_id, author_id) values (1108,839);
INSERT INTO book_authors (book_id, author_id) values (1108,1377);
INSERT INTO book_authors (book_id, author_id) values (1109,127);
INSERT INTO book_authors (book_id, author_id) values (1109,1179);
INSERT INTO book_authors (book_id, author_id) values (1110,1197);
INSERT INTO book_authors (book_id, author_id) values (1111,146);
INSERT INTO book_authors (book_id, author_id) values (1111,992);
INSERT INTO book_authors (book_id, author_id) values (1111,1148);
INSERT INTO book_authors (book_id, author_id) values (1112,292);
INSERT INTO book_authors (book_id, author_id) values (1113,364);
INSERT INTO book_authors (book_id, author_id) values (1114,311);
INSERT INTO book_authors (book_id, author_id) values (1114,1356);
INSERT INTO book_authors (book_id, author_id) values (1115,401);
INSERT INTO book_authors (book_id, author_id) values (1116,610);
INSERT INTO book_authors (book_id, author_id) values (1117,93);
INSERT INTO book_authors (book_id, author_id) values (1117,369);
INSERT INTO book_authors (book_id, author_id) values (1118,27);
INSERT INTO book_authors (book_id, author_id) values (1119,203);
INSERT INTO book_authors (book_id, author_id) values (1119,1000);
INSERT INTO book_authors (book_id, author_id) values (1120,552);
INSERT INTO book_authors (book_id, author_id) values (1120,1093);
INSERT INTO book_authors (book_id, author_id) values (1120,1269);
INSERT INTO book_authors (book_id, author_id) values (1121,79);
INSERT INTO book_authors (book_id, author_id) values (1121,821);
INSERT INTO book_authors (book_id, author_id) values (1121,1269);
INSERT INTO book_authors (book_id, author_id) values (1122,497);
INSERT INTO book_authors (book_id, author_id) values (1123,1298);
INSERT INTO book_authors (book_id, author_id) values (1124,175);
INSERT INTO book_authors (book_id, author_id) values (1125,511);
INSERT INTO book_authors (book_id, author_id) values (1125,969);
INSERT INTO book_authors (book_id, author_id) values (1125,1140);
INSERT INTO book_authors (book_id, author_id) values (1126,108);
INSERT INTO book_authors (book_id, author_id) values (1126,498);
INSERT INTO book_authors (book_id, author_id) values (1126,582);
INSERT INTO book_authors (book_id, author_id) values (1126,583);
INSERT INTO book_authors (book_id, author_id) values (1127,258);
INSERT INTO book_authors (book_id, author_id) values (1128,204);
INSERT INTO book_authors (book_id, author_id) values (1128,1230);
INSERT INTO book_authors (book_id, author_id) values (1129,1117);
INSERT INTO book_authors (book_id, author_id) values (1130,128);
INSERT INTO book_authors (book_id, author_id) values (1130,301);
INSERT INTO book_authors (book_id, author_id) values (1131,439);
INSERT INTO book_authors (book_id, author_id) values (1131,1386);
INSERT INTO book_authors (book_id, author_id) values (1132,853);
INSERT INTO book_authors (book_id, author_id) values (1133,577);
INSERT INTO book_authors (book_id, author_id) values (1133,1040);
INSERT INTO book_authors (book_id, author_id) values (1133,1221);
INSERT INTO book_authors (book_id, author_id) values (1134,889);
INSERT INTO book_authors (book_id, author_id) values (1135,709);
INSERT INTO book_authors (book_id, author_id) values (1135,1170);
INSERT INTO book_authors (book_id, author_id) values (1136,963);
INSERT INTO book_authors (book_id, author_id) values (1137,751);
INSERT INTO book_authors (book_id, author_id) values (1138,219);
INSERT INTO book_authors (book_id, author_id) values (1139,1224);
INSERT INTO book_authors (book_id, author_id) values (1140,128);
INSERT INTO book_authors (book_id, author_id) values (1140,301);
INSERT INTO book_authors (book_id, author_id) values (1141,720);
INSERT INTO book_authors (book_id, author_id) values (1142,542);
INSERT INTO book_authors (book_id, author_id) values (1143,698);
INSERT INTO book_authors (book_id, author_id) values (1143,1048);
INSERT INTO book_authors (book_id, author_id) values (1144,359);
INSERT INTO book_authors (book_id, author_id) values (1145,953);
INSERT INTO book_authors (book_id, author_id) values (1145,1020);
INSERT INTO book_authors (book_id, author_id) values (1146,1000);
INSERT INTO book_authors (book_id, author_id) values (1146,1319);
INSERT INTO book_authors (book_id, author_id) values (1147,236);
INSERT INTO book_authors (book_id, author_id) values (1147,931);
INSERT INTO book_authors (book_id, author_id) values (1148,717);
INSERT INTO book_authors (book_id, author_id) values (1149,196);
INSERT INTO book_authors (book_id, author_id) values (1149,569);
INSERT INTO book_authors (book_id, author_id) values (1149,714);
INSERT INTO book_authors (book_id, author_id) values (1150,300);
INSERT INTO book_authors (book_id, author_id) values (1150,392);
INSERT INTO book_authors (book_id, author_id) values (1150,1387);
INSERT INTO book_authors (book_id, author_id) values (1151,1388);
INSERT INTO book_authors (book_id, author_id) values (1152,895);
INSERT INTO book_authors (book_id, author_id) values (1153,1371);
INSERT INTO book_authors (book_id, author_id) values (1154,196);
INSERT INTO book_authors (book_id, author_id) values (1154,569);
INSERT INTO book_authors (book_id, author_id) values (1155,323);
INSERT INTO book_authors (book_id, author_id) values (1155,792);
INSERT INTO book_authors (book_id, author_id) values (1156,1266);
INSERT INTO book_authors (book_id, author_id) values (1157,525);
INSERT INTO book_authors (book_id, author_id) values (1157,926);
INSERT INTO book_authors (book_id, author_id) values (1158,1241);
INSERT INTO book_authors (book_id, author_id) values (1159,692);
INSERT INTO book_authors (book_id, author_id) values (1159,1031);
INSERT INTO book_authors (book_id, author_id) values (1159,1248);
INSERT INTO book_authors (book_id, author_id) values (1160,1003);
INSERT INTO book_authors (book_id, author_id) values (1161,377);
INSERT INTO book_authors (book_id, author_id) values (1162,971);
INSERT INTO book_authors (book_id, author_id) values (1163,26);
INSERT INTO book_authors (book_id, author_id) values (1163,110);
INSERT INTO book_authors (book_id, author_id) values (1163,1014);
INSERT INTO book_authors (book_id, author_id) values (1164,327);
INSERT INTO book_authors (book_id, author_id) values (1164,460);
INSERT INTO book_authors (book_id, author_id) values (1164,1004);
INSERT INTO book_authors (book_id, author_id) values (1165,51);
INSERT INTO book_authors (book_id, author_id) values (1165,491);
INSERT INTO book_authors (book_id, author_id) values (1165,515);
INSERT INTO book_authors (book_id, author_id) values (1165,1005);
INSERT INTO book_authors (book_id, author_id) values (1166,336);
INSERT INTO book_authors (book_id, author_id) values (1167,927);
INSERT INTO book_authors (book_id, author_id) values (1168,989);
INSERT INTO book_authors (book_id, author_id) values (1169,1156);
INSERT INTO book_authors (book_id, author_id) values (1170,81);
INSERT INTO book_authors (book_id, author_id) values (1171,1008);
INSERT INTO book_authors (book_id, author_id) values (1172,866);
INSERT INTO book_authors (book_id, author_id) values (1173,854);
INSERT INTO book_authors (book_id, author_id) values (1174,63);
INSERT INTO book_authors (book_id, author_id) values (1175,192);
INSERT INTO book_authors (book_id, author_id) values (1175,438);
INSERT INTO book_authors (book_id, author_id) values (1175,758);
INSERT INTO book_authors (book_id, author_id) values (1176,484);
INSERT INTO book_authors (book_id, author_id) values (1176,1078);
INSERT INTO book_authors (book_id, author_id) values (1176,1227);
INSERT INTO book_authors (book_id, author_id) values (1177,570);
INSERT INTO book_authors (book_id, author_id) values (1177,1333);
INSERT INTO book_authors (book_id, author_id) values (1178,1361);
INSERT INTO book_authors (book_id, author_id) values (1179,600);
INSERT INTO book_authors (book_id, author_id) values (1179,619);
INSERT INTO book_authors (book_id, author_id) values (1179,1133);
INSERT INTO book_authors (book_id, author_id) values (1180,1290);
INSERT INTO book_authors (book_id, author_id) values (1181,162);
INSERT INTO book_authors (book_id, author_id) values (1182,384);
INSERT INTO book_authors (book_id, author_id) values (1182,1204);
INSERT INTO book_authors (book_id, author_id) values (1183,988);
INSERT INTO book_authors (book_id, author_id) values (1184,481);
INSERT INTO book_authors (book_id, author_id) values (1185,308);
INSERT INTO book_authors (book_id, author_id) values (1185,775);
INSERT INTO book_authors (book_id, author_id) values (1186,337);
INSERT INTO book_authors (book_id, author_id) values (1187,64);
INSERT INTO book_authors (book_id, author_id) values (1187,516);
INSERT INTO book_authors (book_id, author_id) values (1188,1044);
INSERT INTO book_authors (book_id, author_id) values (1189,467);
INSERT INTO book_authors (book_id, author_id) values (1189,815);
INSERT INTO book_authors (book_id, author_id) values (1190,1324);
INSERT INTO book_authors (book_id, author_id) values (1191,268);
INSERT INTO book_authors (book_id, author_id) values (1191,574);
INSERT INTO book_authors (book_id, author_id) values (1191,1025);
INSERT INTO book_authors (book_id, author_id) values (1191,1387);
INSERT INTO book_authors (book_id, author_id) values (1192,378);
INSERT INTO book_authors (book_id, author_id) values (1192,993);
INSERT INTO book_authors (book_id, author_id) values (1193,135);
INSERT INTO book_authors (book_id, author_id) values (1193,324);
INSERT INTO book_authors (book_id, author_id) values (1193,438);
INSERT INTO book_authors (book_id, author_id) values (1193,758);
INSERT INTO book_authors (book_id, author_id) values (1194,553);
INSERT INTO book_authors (book_id, author_id) values (1195,109);
INSERT INTO book_authors (book_id, author_id) values (1196,21);
INSERT INTO book_authors (book_id, author_id) values (1196,903);
INSERT INTO book_authors (book_id, author_id) values (1196,1214);
INSERT INTO book_authors (book_id, author_id) values (1197,759);
INSERT INTO book_authors (book_id, author_id) values (1197,785);
INSERT INTO book_authors (book_id, author_id) values (1197,1320);
INSERT INTO book_authors (book_id, author_id) values (1198,996);
INSERT INTO book_authors (book_id, author_id) values (1199,15);
INSERT INTO book_authors (book_id, author_id) values (1199,275);
INSERT INTO book_authors (book_id, author_id) values (1199,1035);
INSERT INTO book_authors (book_id, author_id) values (1199,1112);
INSERT INTO book_authors (book_id, author_id) values (1200,142);
INSERT INTO book_authors (book_id, author_id) values (1201,682);
INSERT INTO book_authors (book_id, author_id) values (1201,1167);
INSERT INTO book_authors (book_id, author_id) values (1202,72);
INSERT INTO book_authors (book_id, author_id) values (1202,467);
INSERT INTO book_authors (book_id, author_id) values (1203,735);
INSERT INTO book_authors (book_id, author_id) values (1205,1205);
INSERT INTO book_authors (book_id, author_id) values (1206,429);
INSERT INTO book_authors (book_id, author_id) values (1206,627);
INSERT INTO book_authors (book_id, author_id) values (1206,1134);
INSERT INTO book_authors (book_id, author_id) values (1207,1221);
INSERT INTO book_authors (book_id, author_id) values (1208,734);
INSERT INTO book_authors (book_id, author_id) values (1209,760);
INSERT INTO book_authors (book_id, author_id) values (1210,476);
INSERT INTO book_authors (book_id, author_id) values (1211,447);
INSERT INTO book_authors (book_id, author_id) values (1212,791);
INSERT INTO book_authors (book_id, author_id) values (1213,303);
INSERT INTO book_authors (book_id, author_id) values (1213,634);
INSERT INTO book_authors (book_id, author_id) values (1214,856);
INSERT INTO book_authors (book_id, author_id) values (1215,270);
INSERT INTO book_authors (book_id, author_id) values (1217,267);
INSERT INTO book_authors (book_id, author_id) values (1217,1228);
INSERT INTO book_authors (book_id, author_id) values (1218,1279);
INSERT INTO book_authors (book_id, author_id) values (1219,154);
INSERT INTO book_authors (book_id, author_id) values (1219,210);
INSERT INTO book_authors (book_id, author_id) values (1219,967);
INSERT INTO book_authors (book_id, author_id) values (1220,746);
INSERT INTO book_authors (book_id, author_id) values (1221,208);
INSERT INTO book_authors (book_id, author_id) values (1221,1033);
INSERT INTO book_authors (book_id, author_id) values (1222,856);
INSERT INTO book_authors (book_id, author_id) values (1223,56);
INSERT INTO book_authors (book_id, author_id) values (1223,308);
INSERT INTO book_authors (book_id, author_id) values (1223,385);
INSERT INTO book_authors (book_id, author_id) values (1223,485);
INSERT INTO book_authors (book_id, author_id) values (1223,775);
INSERT INTO book_authors (book_id, author_id) values (1224,237);
INSERT INTO book_authors (book_id, author_id) values (1224,879);
INSERT INTO book_authors (book_id, author_id) values (1225,1283);
INSERT INTO book_authors (book_id, author_id) values (1226,600);
INSERT INTO book_authors (book_id, author_id) values (1226,860);
INSERT INTO book_authors (book_id, author_id) values (1226,1362);

select * from book_authors;

select * from book_genres;

INSERT INTO book_genres (book_id, genre_id) VALUES(1,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(2,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(2,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(3,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(3,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(3,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(4,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(4,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(4,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(4,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(5,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(6,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(7,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(7,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(7,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(7,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(7,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(8,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(8,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(8,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(8,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(10,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(10,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(11,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(11,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(12,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(12,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(12,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(12,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(13,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(13,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(13,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(13,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(14,28);
INSERT INTO book_genres (book_id, genre_id) VALUES(15,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(16,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(16,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(16,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(16,68);
INSERT INTO book_genres (book_id, genre_id) VALUES(17,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(18,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(18,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(19,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(19,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(19,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(20,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(20,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(20,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(21,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(21,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(21,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(21,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(24,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(24,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(24,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(24,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(24,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(25,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(25,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(25,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(25,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(26,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(27,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(27,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(28,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(28,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(28,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(28,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(28,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(30,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(30,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(31,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(31,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(31,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(31,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(31,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(32,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(32,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(34,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(35,33);
INSERT INTO book_genres (book_id, genre_id) VALUES(35,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(35,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(36,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(37,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(37,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(41,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(41,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(41,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(42,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(42,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(43,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(44,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(44,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(45,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(46,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(46,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(47,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(48,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(48,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(48,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(48,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(49,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(49,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(50,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(50,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(50,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(50,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(50,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(51,19);
INSERT INTO book_genres (book_id, genre_id) VALUES(51,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(51,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(52,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(52,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(52,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(81,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(81,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(81,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(82,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(82,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(82,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(102,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(102,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(102,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(103,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(103,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(103,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(104,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(105,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(105,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(106,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(106,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(106,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(106,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(107,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(107,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(108,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(108,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(109,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(109,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(109,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(109,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(110,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(111,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(111,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(111,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(112,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(112,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(113,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(114,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(114,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(114,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(114,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(114,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(115,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(115,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(115,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(115,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(116,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(116,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(117,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(118,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(118,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(118,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(119,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(119,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(119,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(119,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(120,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(120,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(120,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(121,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(121,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(121,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(122,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(122,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(123,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(124,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(124,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(124,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(125,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(125,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(125,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(125,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(125,68);
INSERT INTO book_genres (book_id, genre_id) VALUES(126,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(126,68);
INSERT INTO book_genres (book_id, genre_id) VALUES(127,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(127,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(128,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(128,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(129,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(129,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(129,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(129,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(130,7);
INSERT INTO book_genres (book_id, genre_id) VALUES(130,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(131,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(131,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(131,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(133,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(133,48);
INSERT INTO book_genres (book_id, genre_id) VALUES(136,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(136,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(137,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(137,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(137,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(137,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(138,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(138,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(140,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(141,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(141,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(141,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(142,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(143,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(143,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(144,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(144,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(144,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(145,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(145,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(145,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(145,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(145,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(146,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(146,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(147,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(147,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(147,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(147,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(148,43);
INSERT INTO book_genres (book_id, genre_id) VALUES(148,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(149,7);
INSERT INTO book_genres (book_id, genre_id) VALUES(149,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(149,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(149,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(149,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(150,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(150,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(150,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(151,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(151,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(153,17);
INSERT INTO book_genres (book_id, genre_id) VALUES(153,36);
INSERT INTO book_genres (book_id, genre_id) VALUES(154,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(154,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(154,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(154,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(155,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(156,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(156,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(156,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(156,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(157,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(157,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(157,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(158,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(159,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(159,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(160,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(160,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(161,15);
INSERT INTO book_genres (book_id, genre_id) VALUES(161,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(161,56);
INSERT INTO book_genres (book_id, genre_id) VALUES(162,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(163,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(163,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(165,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(166,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(166,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(166,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(166,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(167,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(167,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(167,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(167,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(167,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(167,68);
INSERT INTO book_genres (book_id, genre_id) VALUES(168,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(168,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(168,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(168,68);
INSERT INTO book_genres (book_id, genre_id) VALUES(169,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(169,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(169,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(170,48);
INSERT INTO book_genres (book_id, genre_id) VALUES(172,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(172,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(172,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(172,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(174,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(174,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(174,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(174,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(176,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(177,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(178,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(178,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(179,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(179,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(179,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(179,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(180,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(180,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(180,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(181,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(181,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(181,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(181,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(182,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(182,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(182,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(183,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(184,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(184,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(184,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(185,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(185,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(185,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(186,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(187,4);
INSERT INTO book_genres (book_id, genre_id) VALUES(187,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(188,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(189,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(189,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(189,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(189,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(191,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(191,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(191,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(192,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(192,54);
INSERT INTO book_genres (book_id, genre_id) VALUES(193,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(193,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(195,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(196,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(196,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(196,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(196,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(196,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(197,28);
INSERT INTO book_genres (book_id, genre_id) VALUES(197,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(198,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(198,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(198,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(198,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(199,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(200,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(200,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(200,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(201,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(201,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(201,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(205,30);
INSERT INTO book_genres (book_id, genre_id) VALUES(205,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(206,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(206,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(206,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(223,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(223,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(223,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(223,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(224,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(224,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(224,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(225,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(225,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(239,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(239,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(239,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(240,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(240,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(241,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(241,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(241,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(242,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(242,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(242,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(242,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(243,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(244,47);
INSERT INTO book_genres (book_id, genre_id) VALUES(244,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(245,28);
INSERT INTO book_genres (book_id, genre_id) VALUES(245,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(246,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(247,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(247,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(247,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(248,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(248,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(248,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(249,52);
INSERT INTO book_genres (book_id, genre_id) VALUES(250,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(250,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(250,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(250,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(251,32);
INSERT INTO book_genres (book_id, genre_id) VALUES(251,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(252,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(252,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(253,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(253,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(254,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(255,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(255,7);
INSERT INTO book_genres (book_id, genre_id) VALUES(255,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(255,68);
INSERT INTO book_genres (book_id, genre_id) VALUES(256,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(256,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(257,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(257,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(257,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(257,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(258,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(258,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(259,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(259,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(259,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(260,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(260,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(261,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(261,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(261,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(261,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(262,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(262,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(262,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(263,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(264,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(264,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(264,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(265,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(265,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(265,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(266,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(266,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(267,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(267,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(268,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(268,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(268,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(268,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(268,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(268,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(269,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(269,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(271,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(272,52);
INSERT INTO book_genres (book_id, genre_id) VALUES(272,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(272,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(272,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(273,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(273,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(273,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(273,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(273,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(274,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(274,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(274,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(274,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(275,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(275,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(275,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(275,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(275,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(276,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(276,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(276,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(277,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(277,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(277,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(277,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(278,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(278,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(278,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(278,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(279,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(279,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(279,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(279,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(280,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(280,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(280,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(282,39);
INSERT INTO book_genres (book_id, genre_id) VALUES(282,47);
INSERT INTO book_genres (book_id, genre_id) VALUES(284,43);
INSERT INTO book_genres (book_id, genre_id) VALUES(284,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(285,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(285,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(285,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(285,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(286,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(288,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(288,54);
INSERT INTO book_genres (book_id, genre_id) VALUES(288,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(289,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(289,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(289,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(289,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(290,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(290,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(290,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(291,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(291,54);
INSERT INTO book_genres (book_id, genre_id) VALUES(292,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(292,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(292,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(292,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(292,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(292,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(292,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(293,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(293,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(293,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(295,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(295,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(295,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(295,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(295,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(296,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(296,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(296,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(296,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(297,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(297,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(297,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(297,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(298,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(298,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(298,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(299,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(299,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(300,5);
INSERT INTO book_genres (book_id, genre_id) VALUES(300,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(301,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(302,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(303,54);
INSERT INTO book_genres (book_id, genre_id) VALUES(304,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(304,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(304,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(304,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(305,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(305,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(305,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(305,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(306,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(306,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(307,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(308,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(309,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(312,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(312,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(312,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(312,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(312,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(313,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(313,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(313,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(313,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(314,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(314,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(314,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(314,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(315,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(315,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(315,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(316,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(317,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(317,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(317,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(318,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(319,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(319,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(320,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(320,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(320,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(321,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(321,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(321,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(321,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(321,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(322,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(323,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(323,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(323,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(324,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(324,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(325,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(325,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(326,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(326,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(326,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(327,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(327,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(327,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(327,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(328,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(328,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(328,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(329,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(329,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(329,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(329,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(329,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(329,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(330,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(331,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(331,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(331,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(332,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(332,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(333,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(333,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(333,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(333,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(334,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(334,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(335,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(335,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(335,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(336,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(336,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(336,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(336,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(337,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(339,43);
INSERT INTO book_genres (book_id, genre_id) VALUES(341,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(341,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(341,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(342,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(342,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(343,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(343,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(343,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(344,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(346,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(346,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(346,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(346,68);
INSERT INTO book_genres (book_id, genre_id) VALUES(347,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(347,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(348,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(348,35);
INSERT INTO book_genres (book_id, genre_id) VALUES(348,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(348,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(348,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(349,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(349,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(350,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(350,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(350,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(351,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(352,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(352,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(354,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(354,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(354,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(355,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(355,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(356,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(357,52);
INSERT INTO book_genres (book_id, genre_id) VALUES(357,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(357,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(358,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(359,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(359,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(359,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(359,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(359,68);
INSERT INTO book_genres (book_id, genre_id) VALUES(360,30);
INSERT INTO book_genres (book_id, genre_id) VALUES(360,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(360,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(361,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(361,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(362,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(362,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(362,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(363,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(363,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(364,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(365,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(365,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(365,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(365,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(366,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(366,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(366,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(366,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(366,68);
INSERT INTO book_genres (book_id, genre_id) VALUES(367,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(367,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(367,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(367,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(367,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(367,68);
INSERT INTO book_genres (book_id, genre_id) VALUES(368,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(368,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(368,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(368,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(369,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(369,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(369,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(369,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(370,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(370,54);
INSERT INTO book_genres (book_id, genre_id) VALUES(370,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(371,52);
INSERT INTO book_genres (book_id, genre_id) VALUES(371,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(371,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(371,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(371,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(371,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(372,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(372,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(372,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(372,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(372,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(373,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(373,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(373,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(374,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(375,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(375,13);
INSERT INTO book_genres (book_id, genre_id) VALUES(375,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(376,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(376,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(376,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(377,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(377,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(377,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(377,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(378,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(378,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(379,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(380,52);
INSERT INTO book_genres (book_id, genre_id) VALUES(381,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(381,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(381,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(381,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(382,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(382,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(382,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(383,29);
INSERT INTO book_genres (book_id, genre_id) VALUES(383,31);
INSERT INTO book_genres (book_id, genre_id) VALUES(384,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(385,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(385,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(385,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(386,32);
INSERT INTO book_genres (book_id, genre_id) VALUES(386,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(388,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(388,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(388,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(389,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(389,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(390,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(390,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(390,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(390,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(390,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(391,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(392,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(392,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(392,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(394,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(395,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(395,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(395,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(396,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(396,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(397,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(397,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(399,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(399,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(399,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(400,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(400,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(401,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(401,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(401,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(402,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(402,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(403,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(403,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(403,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(404,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(404,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(404,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(404,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(405,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(405,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(405,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(406,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(406,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(406,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(406,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(406,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(407,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(407,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(407,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(407,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(407,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(408,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(408,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(408,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(408,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(408,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(408,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(409,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(409,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(410,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(410,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(410,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(410,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(411,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(411,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(411,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(412,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(412,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(413,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(413,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(413,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(414,48);
INSERT INTO book_genres (book_id, genre_id) VALUES(415,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(415,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(415,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(417,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(417,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(417,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(417,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(417,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(417,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(417,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(418,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(418,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(418,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(419,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(419,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(419,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(419,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(419,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(420,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(421,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(421,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(421,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(421,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(422,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(422,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(422,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(423,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(423,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(424,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(424,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(424,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(425,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(425,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(426,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(426,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(426,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(427,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(427,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(427,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(427,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(428,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(428,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(428,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(429,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(429,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(429,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(430,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(431,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(431,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(431,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(431,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(431,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(431,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(431,68);
INSERT INTO book_genres (book_id, genre_id) VALUES(432,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(433,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(433,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(434,52);
INSERT INTO book_genres (book_id, genre_id) VALUES(435,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(435,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(436,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(436,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(436,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(436,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(436,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(436,68);
INSERT INTO book_genres (book_id, genre_id) VALUES(437,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(438,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(438,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(438,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(439,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(439,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(439,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(440,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(440,54);
INSERT INTO book_genres (book_id, genre_id) VALUES(440,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(440,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(440,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(440,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(440,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(441,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(441,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(441,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(441,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(442,24);
INSERT INTO book_genres (book_id, genre_id) VALUES(442,31);
INSERT INTO book_genres (book_id, genre_id) VALUES(443,52);
INSERT INTO book_genres (book_id, genre_id) VALUES(443,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(443,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(444,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(444,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(445,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(446,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(446,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(446,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(447,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(447,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(447,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(447,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(449,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(449,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(450,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(450,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(450,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(450,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(451,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(451,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(452,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(452,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(453,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(453,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(454,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(454,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(454,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(455,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(455,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(455,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(455,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(455,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(456,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(456,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(456,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(456,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(457,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(457,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(457,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(457,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(458,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(458,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(458,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(458,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(459,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(459,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(460,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(460,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(460,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(461,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(461,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(461,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(462,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(462,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(463,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(463,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(463,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(463,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(464,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(464,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(464,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(464,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(465,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(465,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(465,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(466,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(466,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(466,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(466,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(466,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(467,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(468,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(468,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(470,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(471,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(471,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(471,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(472,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(473,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(474,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(474,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(474,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(474,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(476,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(476,54);
INSERT INTO book_genres (book_id, genre_id) VALUES(476,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(476,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(477,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(477,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(477,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(477,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(477,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(478,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(479,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(479,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(479,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(481,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(481,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(482,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(482,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(482,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(482,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(483,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(485,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(485,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(485,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(485,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(485,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(486,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(487,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(487,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(487,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(487,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(487,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(487,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(488,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(488,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(488,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(489,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(489,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(490,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(490,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(490,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(491,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(491,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(493,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(493,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(493,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(493,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(495,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(495,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(495,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(496,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(496,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(497,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(497,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(497,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(497,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(498,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(498,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(498,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(499,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(499,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(499,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(500,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(501,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(502,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(502,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(503,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(503,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(503,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(504,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(504,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(504,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(505,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(505,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(505,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(505,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(505,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(505,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(505,68);
INSERT INTO book_genres (book_id, genre_id) VALUES(506,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(506,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(506,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(506,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(506,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(507,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(507,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(507,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(507,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(508,65);
INSERT INTO book_genres (book_id, genre_id) VALUES(508,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(508,68);
INSERT INTO book_genres (book_id, genre_id) VALUES(509,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(509,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(509,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(509,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(510,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(510,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(510,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(511,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(511,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(511,54);
INSERT INTO book_genres (book_id, genre_id) VALUES(511,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(511,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(512,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(512,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(512,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(513,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(513,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(513,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(513,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(514,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(514,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(514,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(514,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(514,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(514,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(515,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(515,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(515,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(515,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(515,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(515,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(515,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(516,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(516,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(517,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(517,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(518,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(519,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(520,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(521,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(522,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(522,33);
INSERT INTO book_genres (book_id, genre_id) VALUES(522,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(522,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(522,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(522,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(522,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(523,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(523,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(523,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(524,32);
INSERT INTO book_genres (book_id, genre_id) VALUES(524,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(524,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(525,26);
INSERT INTO book_genres (book_id, genre_id) VALUES(525,52);
INSERT INTO book_genres (book_id, genre_id) VALUES(525,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(525,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(525,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(526,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(527,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(527,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(528,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(528,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(529,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(529,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(529,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(529,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(530,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(530,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(530,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(531,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(532,47);
INSERT INTO book_genres (book_id, genre_id) VALUES(532,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(533,14);
INSERT INTO book_genres (book_id, genre_id) VALUES(533,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(533,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(534,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(534,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(534,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(534,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(534,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(535,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(535,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(536,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(536,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(536,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(536,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(537,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(537,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(537,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(537,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(538,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(538,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(539,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(539,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(539,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(539,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(539,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(540,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(540,28);
INSERT INTO book_genres (book_id, genre_id) VALUES(540,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(541,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(541,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(541,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(541,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(542,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(542,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(543,14);
INSERT INTO book_genres (book_id, genre_id) VALUES(544,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(544,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(544,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(544,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(545,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(545,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(545,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(545,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(545,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(545,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(546,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(547,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(547,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(547,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(547,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(548,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(548,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(549,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(549,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(550,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(550,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(550,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(550,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(551,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(551,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(552,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(552,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(552,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(553,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(554,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(555,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(555,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(555,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(555,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(556,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(556,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(556,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(556,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(558,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(558,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(558,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(558,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(558,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(558,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(558,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(559,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(560,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(560,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(560,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(561,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(561,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(563,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(564,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(564,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(565,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(565,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(565,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(565,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(567,32);
INSERT INTO book_genres (book_id, genre_id) VALUES(568,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(569,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(569,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(569,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(570,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(571,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(571,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(571,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(572,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(572,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(572,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(572,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(572,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(573,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(573,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(573,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(574,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(574,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(574,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(574,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(595,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(596,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(596,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(596,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(597,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(597,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(597,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(597,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(598,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(598,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(598,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(598,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(628,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(628,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(628,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(628,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(628,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(629,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(629,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(630,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(630,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(630,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(631,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(631,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(631,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(632,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(632,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(633,28);
INSERT INTO book_genres (book_id, genre_id) VALUES(633,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(633,50);
INSERT INTO book_genres (book_id, genre_id) VALUES(633,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(634,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(635,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(635,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(636,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(636,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(636,68);
INSERT INTO book_genres (book_id, genre_id) VALUES(637,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(637,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(638,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(639,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(639,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(639,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(639,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(639,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(640,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(640,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(640,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(641,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(641,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(641,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(642,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(642,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(643,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(643,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(643,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(643,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(643,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(644,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(644,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(644,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(644,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(644,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(644,68);
INSERT INTO book_genres (book_id, genre_id) VALUES(645,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(645,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(645,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(646,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(646,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(646,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(647,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(647,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(647,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(648,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(648,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(648,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(649,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(649,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(650,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(650,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(651,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(651,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(651,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(652,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(653,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(653,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(654,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(655,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(655,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(656,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(656,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(657,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(657,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(657,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(657,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(658,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(658,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(658,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(658,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(659,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(659,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(659,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(660,43);
INSERT INTO book_genres (book_id, genre_id) VALUES(660,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(661,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(661,54);
INSERT INTO book_genres (book_id, genre_id) VALUES(661,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(662,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(662,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(662,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(662,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(662,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(662,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(663,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(663,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(664,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(664,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(664,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(664,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(664,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(665,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(665,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(665,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(666,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(666,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(666,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(666,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(666,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(667,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(667,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(668,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(668,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(668,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(669,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(669,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(670,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(670,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(671,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(671,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(672,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(672,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(673,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(673,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(673,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(673,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(674,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(674,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(674,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(674,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(674,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(675,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(675,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(676,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(676,2);
INSERT INTO book_genres (book_id, genre_id) VALUES(676,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(676,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(677,14);
INSERT INTO book_genres (book_id, genre_id) VALUES(677,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(678,30);
INSERT INTO book_genres (book_id, genre_id) VALUES(678,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(679,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(679,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(679,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(680,52);
INSERT INTO book_genres (book_id, genre_id) VALUES(681,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(681,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(681,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(681,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(681,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(682,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(682,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(682,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(683,7);
INSERT INTO book_genres (book_id, genre_id) VALUES(683,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(684,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(684,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(684,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(684,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(685,32);
INSERT INTO book_genres (book_id, genre_id) VALUES(685,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(686,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(686,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(686,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(686,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(687,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(687,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(687,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(688,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(688,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(689,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(689,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(689,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(689,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(690,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(691,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(692,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(692,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(692,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(692,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(693,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(694,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(694,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(695,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(695,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(695,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(695,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(695,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(695,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(696,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(696,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(696,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(696,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(697,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(697,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(697,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(697,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(698,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(698,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(699,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(699,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(699,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(701,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(701,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(701,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(701,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(701,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(702,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(702,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(702,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(703,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(703,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(703,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(703,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(703,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(703,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(704,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(704,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(704,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(704,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(705,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(705,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(705,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(706,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(706,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(706,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(706,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(707,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(707,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(709,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(710,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(710,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(711,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(711,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(712,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(712,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(712,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(713,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(713,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(713,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(713,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(714,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(714,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(714,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(714,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(715,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(716,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(716,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(716,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(717,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(717,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(718,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(719,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(719,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(719,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(719,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(720,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(720,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(720,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(720,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(721,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(721,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(722,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(722,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(722,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(722,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(723,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(723,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(723,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(723,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(723,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(723,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(724,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(724,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(724,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(725,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(725,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(726,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(727,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(728,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(728,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(728,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(729,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(729,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(730,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(730,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(730,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(731,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(731,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(731,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(731,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(732,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(732,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(732,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(733,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(733,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(733,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(734,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(734,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(734,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(735,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(735,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(735,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(735,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(736,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(736,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(736,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(736,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(736,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(737,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(737,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(737,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(738,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(738,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(738,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(738,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(739,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(739,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(739,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(739,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(740,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(741,30);
INSERT INTO book_genres (book_id, genre_id) VALUES(741,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(742,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(742,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(742,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(743,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(743,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(743,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(744,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(744,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(744,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(744,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(745,52);
INSERT INTO book_genres (book_id, genre_id) VALUES(746,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(746,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(746,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(746,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(747,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(747,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(748,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(748,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(748,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(748,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(749,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(750,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(750,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(750,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(751,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(751,54);
INSERT INTO book_genres (book_id, genre_id) VALUES(751,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(751,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(752,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(752,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(752,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(752,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(753,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(754,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(754,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(754,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(754,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(754,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(754,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(755,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(755,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(755,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(755,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(756,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(756,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(756,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(756,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(756,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(757,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(757,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(757,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(757,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(758,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(758,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(758,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(758,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(759,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(759,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(759,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(760,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(760,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(760,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(760,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(761,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(761,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(761,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(762,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(762,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(762,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(763,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(763,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(764,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(764,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(764,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(765,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(765,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(765,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(765,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(766,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(766,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(767,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(767,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(768,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(768,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(768,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(768,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(769,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(769,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(769,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(769,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(770,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(770,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(770,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(771,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(772,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(772,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(773,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(773,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(774,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(774,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(774,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(774,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(774,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(774,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(775,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(775,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(776,43);
INSERT INTO book_genres (book_id, genre_id) VALUES(776,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(777,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(777,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(777,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(777,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(777,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(778,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(779,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(779,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(780,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(780,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(780,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(780,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(780,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(780,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(781,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(781,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(781,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(782,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(782,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(782,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(782,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(782,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(783,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(783,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(783,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(784,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(784,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(784,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(784,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(785,43);
INSERT INTO book_genres (book_id, genre_id) VALUES(786,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(787,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(787,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(787,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(788,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(788,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(788,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(788,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(788,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(789,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(789,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(789,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(790,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(790,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(791,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(791,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(791,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(792,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(792,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(792,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(792,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(793,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(793,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(794,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(794,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(794,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(795,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(795,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(795,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(795,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(796,7);
INSERT INTO book_genres (book_id, genre_id) VALUES(796,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(796,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(796,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(797,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(797,65);
INSERT INTO book_genres (book_id, genre_id) VALUES(797,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(798,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(798,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(799,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(799,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(799,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(799,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(799,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(800,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(800,54);
INSERT INTO book_genres (book_id, genre_id) VALUES(800,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(800,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(800,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(801,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(802,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(802,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(803,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(803,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(805,36);
INSERT INTO book_genres (book_id, genre_id) VALUES(805,45);
INSERT INTO book_genres (book_id, genre_id) VALUES(805,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(805,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(806,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(806,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(806,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(806,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(807,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(807,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(808,65);
INSERT INTO book_genres (book_id, genre_id) VALUES(809,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(809,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(810,31);
INSERT INTO book_genres (book_id, genre_id) VALUES(811,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(811,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(811,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(811,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(813,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(814,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(815,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(815,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(816,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(816,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(816,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(817,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(817,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(817,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(817,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(817,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(818,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(818,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(818,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(819,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(819,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(819,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(819,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(819,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(820,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(820,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(821,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(821,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(822,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(822,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(822,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(822,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(823,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(824,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(825,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(825,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(825,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(826,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(826,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(827,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(828,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(828,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(828,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(829,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(829,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(830,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(831,28);
INSERT INTO book_genres (book_id, genre_id) VALUES(832,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(832,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(832,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(833,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(833,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(833,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(834,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(834,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(834,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(835,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(835,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(836,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(836,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(836,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(837,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(837,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(837,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(839,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(839,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(839,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(840,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(840,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(840,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(840,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(841,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(843,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(843,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(843,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(843,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(843,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(844,52);
INSERT INTO book_genres (book_id, genre_id) VALUES(845,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(845,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(846,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(846,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(846,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(846,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(846,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(846,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(847,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(848,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(848,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(848,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(849,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(849,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(850,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(851,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(851,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(851,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(851,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(852,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(852,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(853,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(853,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(853,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(853,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(854,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(854,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(854,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(854,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(855,17);
INSERT INTO book_genres (book_id, genre_id) VALUES(855,36);
INSERT INTO book_genres (book_id, genre_id) VALUES(855,43);
INSERT INTO book_genres (book_id, genre_id) VALUES(857,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(857,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(857,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(857,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(858,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(858,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(858,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(858,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(858,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(859,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(859,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(859,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(859,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(860,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(860,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(860,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(860,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(861,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(862,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(862,54);
INSERT INTO book_genres (book_id, genre_id) VALUES(863,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(863,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(863,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(864,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(864,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(865,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(865,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(865,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(865,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(865,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(867,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(867,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(867,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(868,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(868,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(868,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(868,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(869,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(869,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(869,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(870,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(870,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(870,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(870,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(870,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(870,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(870,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(872,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(872,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(874,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(874,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(874,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(874,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(874,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(874,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(875,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(875,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(875,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(876,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(876,54);
INSERT INTO book_genres (book_id, genre_id) VALUES(876,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(877,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(877,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(877,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(877,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(877,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(877,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(878,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(878,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(878,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(878,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(879,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(879,54);
INSERT INTO book_genres (book_id, genre_id) VALUES(880,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(880,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(880,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(881,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(881,48);
INSERT INTO book_genres (book_id, genre_id) VALUES(881,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(881,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(881,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(882,47);
INSERT INTO book_genres (book_id, genre_id) VALUES(882,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(883,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(883,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(883,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(883,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(884,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(884,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(884,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(884,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(885,22);
INSERT INTO book_genres (book_id, genre_id) VALUES(885,31);
INSERT INTO book_genres (book_id, genre_id) VALUES(886,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(886,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(886,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(887,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(887,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(888,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(888,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(888,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(888,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(889,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(889,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(889,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(890,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(890,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(891,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(891,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(892,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(892,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(892,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(892,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(892,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(893,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(893,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(893,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(894,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(894,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(894,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(894,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(895,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(895,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(896,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(896,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(897,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(897,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(897,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(897,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(898,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(899,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(899,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(899,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(899,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(900,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(901,32);
INSERT INTO book_genres (book_id, genre_id) VALUES(901,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(902,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(902,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(903,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(903,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(903,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(903,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(904,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(905,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(906,18);
INSERT INTO book_genres (book_id, genre_id) VALUES(907,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(908,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(908,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(908,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(909,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(909,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(909,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(910,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(910,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(910,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(910,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(911,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(911,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(911,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(911,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(912,28);
INSERT INTO book_genres (book_id, genre_id) VALUES(912,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(913,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(913,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(913,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(914,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(914,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(914,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(914,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(915,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(915,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(915,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(916,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(916,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(916,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(917,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(917,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(918,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(918,54);
INSERT INTO book_genres (book_id, genre_id) VALUES(918,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(918,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(918,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(918,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(919,52);
INSERT INTO book_genres (book_id, genre_id) VALUES(919,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(919,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(920,43);
INSERT INTO book_genres (book_id, genre_id) VALUES(920,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(921,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(921,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(921,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(922,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(922,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(923,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(923,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(923,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(924,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(925,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(925,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(925,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(925,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(925,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(926,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(926,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(927,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(927,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(927,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(928,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(928,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(928,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(929,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(929,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(929,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(930,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(930,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(930,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(930,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(931,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(931,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(931,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(932,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(932,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(932,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(933,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(934,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(934,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(934,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(934,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(935,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(935,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(935,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(936,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(936,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(937,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(937,54);
INSERT INTO book_genres (book_id, genre_id) VALUES(937,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(937,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(938,28);
INSERT INTO book_genres (book_id, genre_id) VALUES(938,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(938,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(939,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(939,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(939,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(939,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(939,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(939,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(940,1);
INSERT INTO book_genres (book_id, genre_id) VALUES(940,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(941,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(941,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(941,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(942,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(942,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(942,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(942,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(943,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(943,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(944,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(944,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(944,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(945,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(945,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(945,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(945,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(946,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(946,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(946,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(946,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(947,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(947,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(947,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(948,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(948,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(948,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(949,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(949,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(949,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(950,43);
INSERT INTO book_genres (book_id, genre_id) VALUES(950,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(950,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(950,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(951,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(952,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(952,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(952,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(953,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(953,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(953,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(953,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(953,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(954,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(954,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(954,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(954,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(955,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(955,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(955,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(956,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(956,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(956,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(957,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(957,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(957,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(957,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(957,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(958,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(959,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(959,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(960,32);
INSERT INTO book_genres (book_id, genre_id) VALUES(960,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(961,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(961,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(961,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(962,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(962,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(962,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(962,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(963,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(963,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(963,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(964,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(964,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(965,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(965,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(965,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(965,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(967,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(967,54);
INSERT INTO book_genres (book_id, genre_id) VALUES(968,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(968,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(968,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(968,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(969,29);
INSERT INTO book_genres (book_id, genre_id) VALUES(969,31);
INSERT INTO book_genres (book_id, genre_id) VALUES(969,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(969,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(970,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(971,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(971,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(971,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(971,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(972,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(972,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(972,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(973,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(973,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(973,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(973,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(973,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(974,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(974,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(974,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(974,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(975,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(975,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(975,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(975,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(975,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(975,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(976,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(976,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(977,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(977,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(977,26);
INSERT INTO book_genres (book_id, genre_id) VALUES(977,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(977,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(978,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(979,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(979,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(979,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(980,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(980,66);
INSERT INTO book_genres (book_id, genre_id) VALUES(981,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(981,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(981,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(981,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(982,43);
INSERT INTO book_genres (book_id, genre_id) VALUES(982,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(983,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(983,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(983,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(983,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(983,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(984,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(984,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(985,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(985,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(985,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(986,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(986,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(986,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(986,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(987,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(987,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(987,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(987,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(987,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(988,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(988,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(989,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(989,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(989,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(989,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(989,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(989,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(990,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(990,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(990,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(991,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(991,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(991,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(991,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(991,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(992,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(992,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(992,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(992,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(993,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(994,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(994,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(994,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(994,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(995,17);
INSERT INTO book_genres (book_id, genre_id) VALUES(995,36);
INSERT INTO book_genres (book_id, genre_id) VALUES(996,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(997,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(997,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(997,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(997,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(998,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(998,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(998,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(999,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(999,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1000,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1000,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1000,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1000,67);
INSERT INTO book_genres (book_id, genre_id) VALUES(1001,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1001,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(1001,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1002,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1002,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1003,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1004,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1005,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1006,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1006,54);
INSERT INTO book_genres (book_id, genre_id) VALUES(1006,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1006,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1007,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1008,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1008,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(1008,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1008,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1009,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1010,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1010,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1010,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(1010,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1010,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1010,68);
INSERT INTO book_genres (book_id, genre_id) VALUES(1011,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1011,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1011,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1012,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(1012,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1012,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1012,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1014,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(1014,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1014,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1014,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1014,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1015,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1015,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(1015,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1016,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1016,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1016,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(1016,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1016,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1017,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1017,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(1017,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1017,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1019,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1020,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(1020,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1020,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1020,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1021,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1021,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1021,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1023,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(1024,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1024,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1025,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(1025,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1025,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(1025,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1026,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1026,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1027,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1027,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1027,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1028,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1028,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(1028,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1029,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1029,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1029,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1030,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(1030,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1031,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1031,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(1031,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1031,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1032,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1032,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(1032,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1032,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1033,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(1033,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1034,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(1034,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1035,6);
INSERT INTO book_genres (book_id, genre_id) VALUES(1035,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1035,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(1035,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1035,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1036,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1036,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1037,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1037,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1038,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1039,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1040,43);
INSERT INTO book_genres (book_id, genre_id) VALUES(1040,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1040,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1041,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(1041,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1041,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1042,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(1042,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1042,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1042,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1043,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1044,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1044,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(1044,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1045,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1045,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1046,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1046,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1046,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(1046,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1046,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1047,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(1047,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1048,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(1048,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1049,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(1049,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1050,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(1050,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1050,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1050,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1051,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(1051,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1051,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1052,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(1052,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1053,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(1053,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1054,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1055,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(1055,43);
INSERT INTO book_genres (book_id, genre_id) VALUES(1055,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1056,43);
INSERT INTO book_genres (book_id, genre_id) VALUES(1057,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1057,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1058,14);
INSERT INTO book_genres (book_id, genre_id) VALUES(1058,29);
INSERT INTO book_genres (book_id, genre_id) VALUES(1058,31);
INSERT INTO book_genres (book_id, genre_id) VALUES(1058,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1058,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1060,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1060,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1060,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(1060,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1060,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1061,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1061,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1062,44);
INSERT INTO book_genres (book_id, genre_id) VALUES(1062,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1062,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(1062,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1063,37);
INSERT INTO book_genres (book_id, genre_id) VALUES(1063,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1063,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1064,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1064,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1064,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1065,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1066,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1066,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(1066,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1066,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1067,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1067,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1067,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1068,56);
INSERT INTO book_genres (book_id, genre_id) VALUES(1068,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1069,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1069,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1069,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1070,52);
INSERT INTO book_genres (book_id, genre_id) VALUES(1071,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1071,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1072,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1072,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(1072,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1073,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(1073,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1073,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1075,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(1075,19);
INSERT INTO book_genres (book_id, genre_id) VALUES(1075,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1075,54);
INSERT INTO book_genres (book_id, genre_id) VALUES(1075,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(1075,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1075,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1076,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1076,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1076,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(1076,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1076,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1077,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1077,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1077,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1077,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1078,8);
INSERT INTO book_genres (book_id, genre_id) VALUES(1079,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1079,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1079,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1080,33);
INSERT INTO book_genres (book_id, genre_id) VALUES(1080,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1080,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1080,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1080,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1080,66);
INSERT INTO book_genres (book_id, genre_id) VALUES(1081,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(1081,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1081,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1081,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1082,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1082,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1083,22);
INSERT INTO book_genres (book_id, genre_id) VALUES(1083,31);
INSERT INTO book_genres (book_id, genre_id) VALUES(1084,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1084,55);
INSERT INTO book_genres (book_id, genre_id) VALUES(1084,61);
INSERT INTO book_genres (book_id, genre_id) VALUES(1084,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1084,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1085,16);
INSERT INTO book_genres (book_id, genre_id) VALUES(1085,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1085,63);
INSERT INTO book_genres (book_id, genre_id) VALUES(1086,3);
INSERT INTO book_genres (book_id, genre_id) VALUES(1086,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1087,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1087,64);
INSERT INTO book_genres (book_id, genre_id) VALUES(1088,26);
INSERT INTO book_genres (book_id, genre_id) VALUES(1088,52);
INSERT INTO book_genres (book_id, genre_id) VALUES(1088,53);
INSERT INTO book_genres (book_id, genre_id) VALUES(1089,52);
INSERT INTO book_genres (book_id, genre_id) VALUES(1090,64);