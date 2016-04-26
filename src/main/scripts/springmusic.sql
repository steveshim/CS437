drop database if exists springmusic;
create database springmusic;
use springmusic;



    create table albums (
        album_id integer not null auto_increment,
        genre varchar(255),
        img_src varchar(255),
        album_name varchar(255),
        artist_id integer,
        primary key (album_id)
    );

    create table artists (
        artist_id integer not null auto_increment,
        artist_name varchar(255),
        primary key (artist_id)
    );
    
     create table tracks (
        track_id integer not null auto_increment,
        audio_src varchar(255),
        count integer default 0,
        feature boolean default false,
        lyric_date DATETIME DEFAULT CURRENT_TIMESTAMP,
        track_lyric varchar(1000) default "hello world",
        track_name varchar(255),
        track_num integer,
        album_id integer,
        primary key (track_id)
    );
    
  	create table users (
        user_id integer not null auto_increment,
        email varchar(255),
        first_name varchar(255),
        last_name varchar(255),
        password varchar(255),
        state varchar(255),
        primary key (user_id)
    );

    create table comments (
        comment_id integer not null auto_increment,
        comment varchar(60000),
        comment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
        rating integer,
        title varchar(255),
        track_id integer,
        user_id integer,
        primary key (comment_id)
    );

    create table downloads (
        track_id integer not null,
        user_id integer not null
    );

    create table playlists (
        track_id integer not null,
        user_id integer not null
    );

   create table upload_tracks (
    upload_id integer not null auto_increment,
    name varchar(255),
    user_id integer,
    primary key (upload_id)
	
    );
 
    alter table albums 
        add index FK_9bokmir0yccvq915bi2lsd10m (artist_id), 
        add constraint FK_9bokmir0yccvq915bi2lsd10m 
        foreign key (artist_id) 
        references artists (artist_id);

    alter table comments 
        add index FK_it6fb5et81ibskwtmwx7gjolt (track_id), 
        add constraint FK_it6fb5et81ibskwtmwx7gjolt 
        foreign key (track_id) 
        references tracks (track_id);

    alter table comments 
        add index FK_1x3vdhb5vv8eu5708riqe07wc (user_id), 
        add constraint FK_1x3vdhb5vv8eu5708riqe07wc 
        foreign key (user_id) 
        references users (user_id);

    alter table downloads 
        add index FK_oiijjxat348u3924yk85shtyh (user_id), 
        add constraint FK_oiijjxat348u3924yk85shtyh 
        foreign key (user_id) 
        references users (user_id);

    alter table downloads 
        add index FK_fvdgoi4y3ws9hvgy2aagcu7oj (track_id), 
        add constraint FK_fvdgoi4y3ws9hvgy2aagcu7oj 
        foreign key (track_id) 
        references tracks (track_id);

    alter table playlists 
        add index FK_o1cjkwid9wmumca7fc4jf1hgo (user_id), 
        add constraint FK_o1cjkwid9wmumca7fc4jf1hgo 
        foreign key (user_id) 
        references users (user_id);

    alter table playlists 
        add index FK_jwomr1d9wpn2xoxd7c2l6mg8d (track_id), 
        add constraint FK_jwomr1d9wpn2xoxd7c2l6mg8d 
        foreign key (track_id) 
        references tracks (track_id);

    alter table tracks 
        add index FK_fkc3io0y5n0p93pp4auy2ym86 (album_id), 
        add constraint FK_fkc3io0y5n0p93pp4auy2ym86 
        foreign key (album_id) 
        references albums (album_id);
        
    alter table upload_tracks 
        add index FK_4wv61dd73wuejn6byv7kwp2ej (user_id), 
        add constraint FK_4wv61dd73wuejn6byv7kwp2ej 
        foreign key (user_id) 
        references users (user_id);
        
    ALTER TABLE tracks MODIFY COLUMN track_lyric varchar(6000) NULL DEFAULT 
    'I stay out too late <br/>
	Got nothing in my brain <br/>
	That''s what people say, mmm-mmm <br/>
	That''s what people say, mmm-mmm <br/> <br/>
	
	I go on too many dates [chuckle] <br/>
	But I can''t make them stay <br/>
	At least that''s what people say, mmm-mmm <br/>
	That''s what people say, mmm-mmm <br/>';
	
        
        
        /** ------------------- tracks -------------------------- **/
insert into Users(user_id, first_name, last_name, state, email, password)
    values(1, 'Abraham', 'Lincoln', 'CA', 'abe@gmail.com', '123');
insert into Users(user_id, first_name, last_name, state, email, password)
    values(2, 'Zoe', 'Anderson', 'CA', 'zoe@gmail.com', '123');
insert into Users(user_id, first_name, last_name, state, email, password)
    values(3, 'Homer', 'Simpson', 'CA', 'homer@gmail.com', '123');
insert into Users(user_id, first_name, last_name, state, email, password)
    values(4, 'Marge', 'Simpson', 'CA', 'marge@gmail.com', '123');
insert into Users(user_id, first_name, last_name, state, email, password)
    values(5, 'Bart', 'Simpson', 'CA', 'bart@gmail.com', '123');
insert into Users(user_id, first_name, last_name, state, email, password)
    values(6, 'Lisa', 'Simpson', 'CA', 'lisa@gmail.com', '123');
insert into Users(user_id, first_name, last_name, state, email, password)
    values(7, 'Maggie', 'Simpson', 'CA', 'maggie@gmail.com', '123');
    
    
    
 /**** artists ***/
insert into Artists (artist_id, artist_name)
    values (1, 'Bonobo');
insert into Artists (artist_id, artist_name)
    values (2, 'Radiohead');
insert into Artists (artist_id, artist_name)
    values (3, 'Belle & Sebastian');
insert into Artists (artist_id, artist_name) 
	values (4, 'Savages');
insert into Artists (artist_id, artist_name)
	values (5, 'Odesza');
/* 5 */
insert into Artists (artist_id, artist_name)
	values (6, 'Todd Terje');
insert into Artists (artist_id, artist_name)
	values (7, 'Kendrick Lamar');
insert into Artists (artist_id, artist_name)
	values (8, 'Little Dragon');
insert into Artists (artist_id, artist_name)
	values (9, 'Frank Ocean');
insert into Artists (artist_id, artist_name)
	values (10, 'Deafheaven');
/* 10 */
insert into Artists (artist_id, artist_name)
	values (11, 'Courtney Barnett');
insert into Artists (artist_id, artist_name)
	values (12, 'St. Vincent');
insert into Artists (artist_id, artist_name)
	values (13, 'Rustie');
insert into Artists (artist_id, artist_name)
	values (14, 'Dead To A Dying World');
insert into Artists (artist_id, artist_name)
	values (15,'Pinkish Black');
/* 15 */
insert into Artists (artist_id, artist_name)
	values (16, 'Chance The Rapper');
insert into Artists (artist_id, artist_name)
	values (17, 'Imagine Dragons');
insert into Artists (artist_id, artist_name)
	values (18, 'Nirvana');
insert into Artists (artist_id, artist_name)
	values (19, 'Pearl Jam');
insert into Artists (artist_id, artist_name)
	values (20, 'Justin Bieber');
/* 20 */
insert into Artists (artist_id, artist_name)
	values (21, 'Backstreet Boys');
insert into Artists (artist_id, artist_name)
	values (22, 'Daft Punk');
insert into Artists (artist_id, artist_name)
	values (23, 'Red Hot Chili Peppers');
insert into Artists (artist_id, artist_name)
	values (24, 'Smashing Pumpkins');
insert into Artists (artist_id, artist_name)
	values (25, 'Slayer');
/* 25 */
insert into Artists (artist_id, artist_name)
	values (26, 'Iron Maiden');	
insert into Artists (artist_id, artist_name)
	values (27, 'Metallica');
insert into Artists (artist_id, artist_name)
	values (28, 'No Doubt');
insert into Artists (artist_id, artist_name)
	values (29, 'Reel Big Fish');
insert into Artists (artist_id, artist_name)
	values (30, 'Jay Z');
/* 30 */
insert into Artists (artist_id, artist_name)
	values (31, 'Kanye West');
insert into Artists (artist_id, artist_name)
	values(32, 'Sleater-Kinney');
insert into Artists (artist_id, artist_name)
	values(33, 'John Adams');
insert into Artists (artist_id, artist_name)
	values(34, 'Yo-Yo Ma');
insert into Artists (artist_id, artist_name)
	values(35, 'Taylor Swift');    
    
/*** albums ***/
    
/* 1 */
insert into Albums(album_id, artist_id, album_name, genre, img_src)
    values(1, 1, 'Black Sands', 'ELECTRONIC', 'http://goo.gl/UUWIFV');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
    values(2, 1, 'Days To Come', 'ELECTRONIC', 'http://goo.gl/9tFpOQ');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
    values(3, 3, 'The Life Pursuit', 'POP', 'http://goo.gl/cIXyWM');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
    values(4, 2, 'In Rainbows', 'ALTERNATIVE', 'https://goo.gl/XWspN9');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(5, 4, 'Adore Life', 'ROCK', 'https://goo.gl/ItYqIR');
	
/* 5 */
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(6, 5, 'My Friends Never Die', 'ELECTRONIC', 'http://goo.gl/0qmexm');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(7, 6, 'Its Album Time', 'METAL', 'https://goo.gl/NkDQkq');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(8, 7, 'To Pimp a Butterfly', 'HIPHOP', 'http://goo.gl/qjKg4D');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(9, 8, 'Nabuma Rubberband', 'ALTERNATIVE', 'http://goo.gl/fi0MqJ');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(10, 5, 'In Return', 'ELECTRONIC', 'http://goo.gl/tlfLdj');

/* 10 */
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(11, 9, 'Channel Orange', 'HIPHOP', 'http://goo.gl/IZdpah');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(12, 10, 'New Bermuda', 'METAL', 'http://goo.gl/FF1nHC');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(13, 3, 'Girls In Peacetime Want To Dance', 'POP', 'http://goo.gl/7JvFzb');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(14, 11, 'Sometimes I Sit and Think', 'ROCK', 'http://goo.gl/c33wYJ');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(15, 12, 'St. Vincent', 'ALTERNATIVE', 'http://goo.gl/3FC43Q');

/* 15 */
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(16, 13, 'Green Language', 'OTHER', 'http://goo.gl/6qilH1');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(17, 14, 'Litany', 'METAL', 'https://goo.gl/yYUsXS');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(18, 15, 'Bottom Of The Morning', 'METAL', 'https://goo.gl/vsBX50');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(19, 16, 'Acid Rap', 'HIPHOP', 'http://goo.gl/7PE4wT');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(20, 17, 'Night Visions', 'ALTERNATIVE', 'https://goo.gl/lCojgb');

/* 20 */	
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(21, 18, 'Nevermind', 'ALTERNATIVE', 'https://goo.gl/ciL9WC');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(22, 19, 'Ten', 'ALTERNATIVE', 'https://goo.gl/H8SZIo');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(23, 20, 'Purpose', 'POP', 'https://goo.gl/RUIFNh');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(24, 20, 'Believe', 'POP', 'https://goo.gl/T6HwDt');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(25, 21, 'In a World Like This', 'POP', 'https://goo.gl/4ezxxA');

/* 25 */	
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(26, 22, 'Random Access Memories', 'ELECTRONIC', 'https://goo.gl/euBvfQ');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(27, 22, 'Discovery', 'ELECTRONIC', 'https://goo.gl/YCDj2w');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(28, 22, 'Tron Legacy', 'OTHER', 'https://goo.gl/IjiIJB');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(29, 23, 'By the Way', 'ROCK', 'https://goo.gl/uvDpY1');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(30, 24, 'Monuments to an Elegy', 'ROCK', 'https://goo.gl/MZW5XS');

/* 30 */	
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(31, 24, 'Mellon Collie and the Infinite Sadness', 'ROCK', 'https://goo.gl/5EtTKa');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(32, 25, 'Repentless', 'METAL', 'https://goo.gl/C0wc4x');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(33, 26, 'The Book of Souls', 'METAL', 'https://goo.gl/Xyqunk');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(34, 27, 'Death Magnetic', 'METAL', 'https://goo.gl/7mrDTe');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(35, 28, 'Rock Steady', 'OTHER', 'https://goo.gl/UZQwrf');

/* 35 */	
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(36, 28, 'Return of Saturn', 'OTHER', 'https://goo.gl/pFujzS');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(37, 29, 'Candy Coated Fury', 'OTHER', 'https://goo.gl/XSaZ4W');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(38, 30, 'Magna Carta Holy Grail', 'HIPHOP', 'https://goo.gl/q8O5e0');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(39, 30, 'Watch the Throne', 'HIPHOP', 'https://goo.gl/pau9I9');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(40, 31, 'Graduation', 'HIPHOP', 'https://goo.gl/wH9xCp');

/* 40 */
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(41, 2, 'OK Computer', 'ALTERNATIVE', 'http://goo.gl/r6K4El');	
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(42, 32, 'No Cities To Love', 'ROCK', 'http://goo.gl/kAVz3n');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(43, 7, 'Good Kid Maad City', 'HIPHOP', 'http://goo.gl/UazDsj');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(44, 33, 'Absolute Jest', 'CLASSICAL', 'https://goo.gl/7WOceq');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(45, 34, 'The Goat Rodeo Sessions', 'CLASSICAL', 'https://goo.gl/FzGdlv');

/* 45 */	
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(46, 34, 'Songs of Joy and Peace', 'CLASSICAL', 'https://goo.gl/WBWLNG');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(47, 34, 'Obrigado Brazil', 'CLASSICAL', 'https://goo.gl/vq630S');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(48, 34, 'Appalachian Journey', 'CLASSICAL', 'https://goo.gl/WAzDCN');
insert into Albums(album_id, artist_id, album_name, genre, img_src)
	values(49, 35, '1989', 'POP', 'https://goo.gl/6Az2Xd');	
	
	
	
/*** tracks ***/
	
insert into Tracks (track_id, track_num, album_id, track_name)
    values (1, 1, 1, 'Prelude');
insert into Tracks (track_id, track_num, album_id, track_name, count)
    values (2, 2, 1, 'Kiara', 10);
insert into Tracks (track_id, track_num, album_id, track_name)
    values (3, 3, 1, 'Kong');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (4, 4, 1, 'Eyesdown');

insert into Tracks (track_id, track_num, album_id, track_name)
    values (5, 1, 2, 'Intro');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (6, 2, 2, 'Days to Come');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (7, 3, 2, 'Between the Lines');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (8, 4, 2, 'The Fever');

    
insert into Tracks (track_id, track_num, album_id, track_name)
    values (9, 1, 3, 'Act of the Apostle');
insert into Tracks (track_id, track_num, album_id, track_name, feature)
    values (10, 2, 3, 'Another Sunny Day', true);
insert into Tracks (track_id, track_num, album_id, track_name, count)
    values (11, 3, 3, 'White Collar Boy', 5);
insert into Tracks (track_id, track_num, album_id, track_name)
    values (12, 4, 3, 'The Blues Are Still Blue');
    

insert into Tracks (track_id, track_num, album_id, track_name)
    values (13, 1, 4, '15 Step');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (14, 2, 4, 'Bodysnatchers');
 insert into Tracks (track_id, track_num, album_id, track_name)
    values (15, 3, 4, 'Nude');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (16, 4, 4, 'Weird Fishes/Arpegii');

    
insert into Tracks (track_id, track_num, album_id, track_name)
	values (17, 1, 5, 'The Answer');
insert into Tracks (track_id, track_num, album_id, track_name) 
	values (18, 2, 5, 'Evil');
insert into Tracks (track_id, track_num, album_id, track_name) 
	values (19, 3, 5, 'Sad Person');
insert into Tracks (track_id, track_num, album_id, track_name, feature) 
	values (20, 4, 5, 'Adore', true);
	
insert into Tracks (track_id, track_num, album_id, track_name, feature)
	values (21, 1, 6, 'My Friends Never Die', true);
insert into Tracks (track_id, track_num, album_id, track_name)
	values (22, 2, 6, 'If Theres Time');
insert into Tracks (track_id, track_num, album_id, track_name) 
	values (23, 3, 6, 'Without You');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (24, 4, 6, 'Home');
	
	
insert into Tracks (track_id, track_num, album_id, track_name)
	values (25, 1, 7, 'Preben Goes to Acapulco');
insert into Tracks (track_id, track_num, album_id, track_name, count, feature)
	values (26, 3, 7, 'Inspector Norse', 99, true);
insert into Tracks (track_id, track_num, album_id, track_name)
	values (27, 8, 7, 'Delorean Dynamite');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (28, 5, 7, 'Alfonso Muskedunder');
	
insert into Tracks (track_id, track_num, album_id, track_name, count)
	values (29, 1,  8, 'King Kunta', 14);
insert into Tracks (track_id, track_num, album_id, track_name)
	values (30, 3,  8, 'For Free?');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (31, 5,  8, 'These Walls');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (32, 7,  8, 'u');
	
insert into Tracks (track_id, track_num, album_id, track_name)
	values (33, 1,  9, 'Mirror');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (34, 3,  9, 'Pretty Girls');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (35, 5,  9, 'Cat Rider');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (36, 7,  9, 'Lurad');
	
insert into Tracks (track_id, track_num, album_id, track_name)
	values (37, 1, 10, 'Always This Late');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (38, 2, 10, 'Say My Name');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (39, 3, 10, 'Bloom');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (40, 4, 10, 'All We Need');
	
insert into Tracks (track_id, track_num, album_id, track_name, count)
	values (41, 2, 11, 'Thinking About You', 41);
insert into Tracks (track_id, track_num, album_id, track_name)
	values (42, 3, 11, 'Fertilizer');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (43, 4, 11, 'Sierra Leone');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (44, 5, 11, 'Sweet Life');
	
insert into Tracks (track_id, track_num, album_id, track_name)
	values (45, 1, 12, 'Bought To The Water');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (46, 2, 12, 'Luna');
insert into Tracks (track_id, track_num, album_id, track_name, count)
	values (47, 3, 12, 'Baby Blue', 40);
insert into Tracks (track_id, track_num, album_id, track_name)
	values (48, 4, 12, 'Come Back');
	
insert into Tracks (track_id, track_num, album_id, track_name, feature)
	values (49, 1, 13, 'Nobodys Empire', true);
insert into Tracks (track_id, track_num, album_id, track_name)
	values (50, 2, 13, 'Allie');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (51, 3, 13, 'The Party Line');
insert into Tracks (track_id, track_num, album_id, track_name, count)
	values (52, 4, 13, 'The Power Of Three', 3);
	
insert into Tracks (track_id, track_num, album_id, track_name)
	values (53, 1, 14, 'Elevator Operator');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (54, 2, 14, 'Dedestrian At Best');
insert into Tracks (track_id, track_num, album_id, track_name, count)
	values (55, 3, 14, 'An Illustration Of Loneliness', 12);
insert into Tracks (track_id, track_num, album_id, track_name)
	values (56, 4, 14, 'Small Poppies');
	
insert into Tracks (track_id, track_num, album_id, track_name, count)
	values (57, 1, 15, 'Rattlesnake', 2);
insert into Tracks (track_id, track_num, album_id, track_name, feature)
	values (58, 2, 15, 'Birth In Reverse', true);
insert into Tracks (track_id, track_num, album_id, track_name)
	values (59, 3, 15, 'Prince Johnny');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (60, 4, 15, 'Huey Newton');
	
insert into Tracks (track_id, track_num, album_id, track_name, count)
	values (61, 1, 16, 'Workship', 1);
insert into Tracks (track_id, track_num, album_id, track_name, feature)
	values (62, 2, 16, 'A Glimpse', true);
insert into Tracks (track_id, track_num, album_id, track_name)
	values (63, 3, 16, 'Raptor');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (64, 4, 16, 'Paradise Stone');
	
insert into Tracks (track_id, track_num, album_id, track_name, feature)
	values (65, 1, 17, 'The Hunt Eternal', true);
insert into Tracks (track_id, track_num, album_id, track_name)
	values (66, 2, 17, 'Cicatrix');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (67, 3, 17, 'Eventide');
insert into Tracks (track_id, track_num, album_id, track_name, count)
	values (68, 4, 17, 'Beneath the Loam', 32);
	
insert into Tracks (track_id, track_num, album_id, track_name, feature)
	values (69, 1, 18, 'Brown Rainbow', true);
insert into Tracks (track_id, track_num, album_id, track_name)
	values (70, 2, 18, 'Special Dark');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (71, 3, 18, 'Im All Gone');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (72, 4, 18, 'Burn My Body');
	
insert into Tracks (track_id, track_num, album_id, track_name, feature)
	values (73, 1, 19, 'Good Ass Intro', true);
insert into Tracks (track_id, track_num, album_id, track_name)
	values (74, 2, 19, 'Pusha Man / Paranoia');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (75, 3, 19, 'Cocoa Butter Kisses');
insert into Tracks (track_id, track_num, album_id, track_name)
	values (76, 4, 19, 'Juice');
	
insert into Tracks (track_id, track_num, album_id, track_name, count)
    values (77, 1, 20, 'Radioactive', 10);
insert into Tracks (track_id, track_num, album_id, track_name)
    values (78, 2, 20, 'Tip Toe');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (79, 4, 20, 'Demons');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (80, 6, 20, 'Amsterdam');
    
insert into Tracks (track_id, track_num, album_id, track_name, feature)
    values (81, 2, 21, 'In Bloom', true);
insert into Tracks (track_id, track_num, album_id, track_name)
    values (82, 3, 21, 'Come as You Are');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (83, 4, 21, 'Breed');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (84, 5, 21, 'Lithium');
   
insert into Tracks (track_id, track_num, album_id, track_name, feature)
    values (85, 1, 22, 'Once', true);
insert into Tracks (track_id, track_num, album_id, track_name)
    values (86, 2, 22, 'Even Flow');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (87, 3, 22, 'Alive');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (88, 4, 22, 'Why Go');

insert into Tracks (track_id, track_num, album_id, track_name)
    values (89, 3, 23, 'What Do You Mean');
insert into Tracks (track_id, track_num, album_id, track_name, count)
    values (90, 4, 23, 'Sorry', 45);
insert into Tracks (track_id, track_num, album_id, track_name)
    values (91, 5, 23, 'Love Yourself');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (92, 6, 23, 'Company');

insert into Tracks (track_id, track_num, album_id, track_name)
    values (93, 1, 24, 'All Around the World');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (94, 2, 24, 'Boyfriend');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (95, 3, 24, 'As Long As You Love Me');
insert into Tracks (track_id, track_num, album_id, track_name, feature)
    values (96, 4, 24, 'Catching Feelings', true);

insert into Tracks (track_id, track_num, album_id, track_name)
    values (97, 1, 25, 'In a World Like This');
insert into Tracks (track_id, track_num, album_id, track_name, feature)
    values (98, 2, 25, 'Permanent Stain', true);
insert into Tracks (track_id, track_num, album_id, track_name)
    values (99, 3, 25, 'Breathe');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (100, 4, 25, 'Madeleine');
    
insert into Tracks (track_id, track_num, album_id, track_name)
    values (101, 1, 26, 'Give Life Back to Music');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (102, 2, 26, 'The Game of Love');
insert into Tracks (track_id, track_num, album_id, track_name, count)
    values (103, 3, 26, 'Giorgio by Morodor', 25);
insert into Tracks (track_id, track_num, album_id, track_name)
    values (104, 4, 26, 'Within');
    
insert into Tracks (track_id, track_num, album_id, track_name)
    values (105, 1, 27, 'One More Time');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (106, 2, 27, 'Aerodynamic');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (107, 3, 27, 'Digital Love');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (108, 4, 27, 'Harder, Better, Faster, Stronger');

insert into Tracks (track_id, track_num, album_id, track_name)
    values (109, 1, 28, 'Overture');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (110, 2, 28, 'The Grid');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (111, 3, 28, 'The Son of Flynn');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (112, 4, 28, 'Recognizer');

insert into Tracks (track_id, track_num, album_id, track_name)
    values (113, 1, 29, 'By the Way');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (114, 2, 29, 'Universally Speaking');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (115, 3, 29, 'This is the Place');
insert into Tracks (track_id, track_num, album_id, track_name, count)
    values (116, 4, 29, 'Dosed', 17);
    
insert into Tracks (track_id, track_num, album_id, track_name)
    values (117, 1, 30, 'Tiberius');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (118, 2, 30, 'Being Beige');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (119, 3, 30, 'Anaise!');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (120, 4, 30, 'One and All We Are');
    
insert into Tracks (track_id, track_num, album_id, track_name)
    values (121, 1, 31, 'Mellon Collie and the Infinite Sadness');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (122, 1, 31, 'Tonight Tonight');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (123, 1, 31, 'Jellybelly');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (124, 1, 31, 'Zero');

insert into Tracks (track_id, track_num, album_id, track_name, count)
    values (125, 2, 32, 'Repentless', 6);
insert into Tracks (track_id, track_num, album_id, track_name)
    values (126, 3, 32, 'Take Control');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (127, 4, 32, 'Vices');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (128, 8, 32, 'Implode');
    
insert into Tracks (track_id, track_num, album_id, track_name)
    values (129, 1, 33, 'If Eternity Should Fail');
insert into Tracks (track_id, track_num, album_id, track_name, feature)
    values (130, 2, 33, 'Speed of Light', true);
insert into Tracks (track_id, track_num, album_id, track_name)
    values (131, 3, 33, 'The Great Unknown');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (132, 4, 33, 'The Red and the Black');

insert into Tracks (track_id, track_num, album_id, track_name)
    values (133, 1, 34, 'That Was Just Your Life');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (134, 2, 34, 'The End of the Line');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (135, 4, 34, 'The Day that Never Comes');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (136, 5, 34, 'All Nightmare Long');
    
insert into Tracks (track_id, track_num, album_id, track_name)
    values (137, 2, 35, 'Hella Good');
insert into Tracks (track_id, track_num, album_id, track_name, count)
    values (138, 3, 35, 'Hey Baby', 58);
insert into Tracks (track_id, track_num, album_id, track_name)
    values (139, 4, 35, 'Making Out');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (140, 5, 35, 'Underneath It All');
    
insert into Tracks (track_id, track_num, album_id, track_name)
    values (141, 1, 36, 'Ex-Girlfriend');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (142, 2, 36, 'Simple Kind of Life');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (143, 3, 36, 'Bathwater');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (144, 4, 36, 'Six Feet Under');

insert into Tracks (track_id, track_num, album_id, track_name)
    values (145, 1, 37, 'Everyone Else is an Asshole');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (146, 2, 37, 'Punisher');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (147, 3, 37, 'Shes Not the End of the World');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (148, 8, 37, 'Your Girlfriend Sucks');

insert into Tracks (track_id, track_num, album_id, track_name)
    values (149, 1, 38, 'Holy Grail');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (150, 2, 38, 'Picasso Baby');
insert into Tracks (track_id, track_num, album_id, track_name, count)
    values (151, 3, 38, 'Tom Ford', 49);
insert into Tracks (track_id, track_num, album_id, track_name)
    values (152, 4, 38, 'FuckWithMeYouKnowIGotIt');

insert into Tracks (track_id, track_num, album_id, track_name)
    values (153, 1, 39, 'No Church in the Wild');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (154, 2, 39, 'Lift Off');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (155, 3, 39, 'Niggas in Paris');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (156, 4, 39, 'Otis');
    
insert into Tracks (track_id, track_num, album_id, track_name)
    values (157, 1, 40, 'Good Morning');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (158, 2, 40, 'Champion');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (159, 3, 40, 'Stronger');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (160, 4, 40, 'I Wonder');
    
    
insert into Tracks (track_id, track_num, album_id, track_name)
    values (161, 1, 41, 'Airbag');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (162, 2, 41, 'Paranoid Android');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (163, 3, 41, 'Subterranean Homesick Alien');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (164, 4, 41, 'Exit Music (For a Film)');
    
insert into Tracks (track_id, track_num, album_id, track_name)
    values (165, 1, 42, 'Price Tag');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (166, 2, 42, 'Fangless');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (167, 3, 42, 'Surface Envy');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (168, 4, 42, 'No Cities To Love');
    
insert into Tracks (track_id, track_num, album_id, track_name)
    values (169, 1, 43, 'Sherane');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (170, 3, 43, 'Bitch Dont Kill My Vibe');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (171, 3, 43, 'Backseat Freesytle');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (172, 4, 43, 'The Art Of Peer Pressure');
    
insert into Tracks (track_id, track_num, album_id, track_name)
    values (173, 1, 44, 'Beginning');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (174, 2, 44, 'Presto');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (175, 3, 44, 'Lo Stesso Tempo');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (176, 4, 44, 'Meno Mosso');
    
insert into Tracks (track_id, track_num, album_id, track_name)
    values (177, 1, 45, 'Attaboy');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (178, 2, 45, 'Quarter Chicken Dark');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (179, 3, 45, 'Helping Hand');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (180, 4, 45, 'Wheres My Bow');
    
insert into Tracks (track_id, track_num, album_id, track_name)
    values (181, 1, 46, 'Give Us Peace');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (182, 2, 46, 'You Couldnt Be Cuter');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (183, 3, 46, 'Joy to the World');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (184, 4, 46, 'Here Comes the Sun');

insert into Tracks (track_id, track_num, album_id, track_name)
    values (185, 1, 47, 'Cristal');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (186, 2, 47, 'Chega de Saudade');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (187, 3, 47, 'A Lenda Do Cabloco');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (188, 4, 47, 'Doce De Coco');

insert into Tracks (track_id, track_num, album_id, track_name)
    values (189, 1, 48, '1B');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (190, 2, 48, 'Misty Moonlight Waltz');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (191, 3, 48, 'Hard Time Come Again No More');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (192, 4, 48, 'Indecision');

    
insert into Tracks (track_id, track_num, album_id, track_name)
    values (193, 1, 49, 'Blank Space');
insert into Tracks (track_id, track_num, album_id, track_name, count)
    values (194, 2, 49, 'Shake it Off', 99);
insert into Tracks (track_id, track_num, album_id, track_name)
    values (195, 3, 49, 'Bad Blood');
insert into Tracks (track_id, track_num, album_id, track_name)
    values (196, 4, 49, 'Out of the Woods');
    
    
    /****** PLAY LIST ***/
    
insert into playlists (user_id, track_id)
    values (1, 5);
insert into playlists (user_id, track_id)
    values (1, 17);
insert into playlists (user_id, track_id)
    values (1, 29);
insert into playlists (user_id, track_id)
    values (1, 36);
insert into playlists (user_id, track_id)
    values (1, 42);
    
insert into playlists (user_id, track_id)
    values (2, 8);
insert into playlists (user_id, track_id)
    values (2, 29);
insert into playlists (user_id, track_id)
    values (2, 37);
insert into playlists (user_id, track_id)
    values (2, 42);
insert into playlists (user_id, track_id)
    values (2, 46);
insert into playlists (user_id, track_id)
    values (2, 1);
    
    
    /** Downloads **/
insert into Downloads(user_id, track_id)
    values(1, 23);
insert into Downloads(user_id, track_id)
    values(1, 29);
insert into Downloads(user_id, track_id)
    values(1, 34);
insert into Downloads(user_id, track_id)
    values(1, 42);
insert into Downloads(user_id, track_id)
    values(1, 48);
insert into Downloads(user_id, track_id)
    values(1, 53 );
    
insert into Downloads(user_id, track_id)
    values(2, 1);
insert into Downloads(user_id, track_id)
    values(2, 7);
    insert into Downloads(user_id, track_id)
    values(2, 10);
insert into Downloads(user_id, track_id)
    values(2, 22);
    insert into Downloads(user_id, track_id)
    values(2, 25);
insert into Downloads(user_id, track_id)
    values(2, 29);
    insert into Downloads(user_id, track_id)
    values(2, 45);
insert into Downloads(user_id, track_id)
    values(2, 50);
    
insert into Downloads(user_id, track_id)
    values(3, 55);
insert into Downloads(user_id, track_id)
    values(3, 40);
insert into Downloads(user_id, track_id)
    values(3, 169);
insert into Downloads(user_id, track_id)
    values(3, 86);
    
insert into Downloads(user_id, track_id)
    values(4, 132);
insert into Downloads(user_id, track_id)
    values(4, 18);
insert into Downloads(user_id, track_id)
    values(4, 114);
insert into Downloads(user_id, track_id)
    values(4, 2);
    
insert into Downloads(user_id, track_id)
    values(5, 109);
insert into Downloads(user_id, track_id)
    values(5, 80);
insert into Downloads(user_id, track_id)
    values(5, 24);
insert into Downloads(user_id, track_id)
    values(5, 114);
    
insert into Downloads(user_id, track_id)
    values(6, 44);
insert into Downloads(user_id, track_id)
    values(6, 169);
insert into Downloads(user_id, track_id)
    values(6, 181);
insert into Downloads(user_id, track_id)
    values(6, 151);
    
insert into Downloads(user_id, track_id)
    values(7, 17);
insert into Downloads(user_id, track_id)
    values(7, 6);
insert into Downloads(user_id, track_id)
    values(7, 132);
insert into Downloads(user_id, track_id)
    values(7, 151);


    
    /** comments */
insert into comments (comment_id, user_id, track_id, title, comment, rating, comment_date)
    values (1, 1, 1, 'title#1','Wow', 4, current_date);
insert into comments (comment_id, user_id, track_id, title, comment, rating, comment_date)
    values (2, 2, 1, 'title#2', 'so good', 4, current_date);
insert into comments (comment_id, user_id, track_id, title, comment, rating, comment_date)
    values (3, 2, 2, 'title#3', 'so bad', 1, current_date);
    
    
insert into comments (comment_id, user_id, track_id, title, comment, rating, comment_date)
    values (4, 3, 194, 'Mora Followers', 'The ultimate purpose of Daedric Lords is to instruct and improve the generally deplorable character of mortals.', 1, current_date);
    
 insert into comments (comment_id, user_id, track_id, title, comment, rating, comment_date)
    values (5, 4, 194, 'Fadomai', 'Sheggorath, you are the Skooma Cat, for what is crazier than a cat on skooma?.', 1, current_date);
    
insert into comments (comment_id, user_id, track_id, title, comment, rating, comment_date)
    values (6, 5, 194, 'Gaurd', 'I used to be an adventurer like you. Then I took an arrow in the knee.', 1, current_date);
    
insert into comments (comment_id, user_id, track_id, title, comment, rating, comment_date)
    values (7, 6, 194, 'Dragonborn', 'I… I saw his face. I saw the King of Worms', 4, current_date);
    
insert into comments (comment_id, user_id, track_id, title, comment, rating, comment_date)
    values (8, 7, 194, 'Village Drunkard', 'Bravil is the dark grate of the sewer drain where foul and unappetizing debris collects.', 1, current_date);

    

    
update tracks set count = floor(rand() * 500);
update tracks set count = 999 where track_id = 194;
