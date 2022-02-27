CREATE DATABASE music_site
    WITH 
    OWNER = sergey
    ENCODING = 'UTF8'
    LC_COLLATE = 'Russian_Russia.1251'
    LC_CTYPE = 'Russian_Russia.1251'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;


create table if not exists genre (
		id serial primary key,
		name varchar(40)		
);

create table if not exists singer (
		id serial primary key,
		name varchar(40)		
);

create table if not exists singer_genre (
		singer_id integer references singer(id),
		genre_id integer references genre(id),
		constraint pk primary key (singer_id, genre_id)		
);

create table if not exists album (
		id serial primary key,		
		name varchar(40),
		year integer
);

create table if not exists album_singer (
		singer_id integer references singer(id),
		album_id integer references album(id),
		constraint pk1 primary key (singer_id, album_id)		
);

create table if not exists track (
		id serial primary key,
		album_id integer references album(id),
		name varchar(40),
		duration integer		
);

create table if not exists music_collection (
		id serial primary key,		
		name varchar(40),
		year integer
);

create table if not exists track_collection (
		track_id integer references track(id),
		collection_id integer references music_collection(id),
		constraint pk2 primary key (track_id, collection_id)
);