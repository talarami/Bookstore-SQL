# create database library;

use library;

drop table if exists author;
drop table if exists book;
drop table if exists borrowing;

create table book (
	book_id int not null auto_increment,
	book_title varchar(100) not null,
	author_id int not null,
    primary key (book_id)
);

create table author (
	author_id int not null auto_increment,
	author_name varchar(100),
	author_surname varchar(100) not null,
    primary key (author_id)
);

create table borrowing (
	borrowing_id int not null auto_increment,
	book_id int not null,
	borrowing_status boolean not null,
    primary key (borrowing_id)
);

insert into author (author_name, author_surname)
values 
("Stephen", "King"),
("aaa", "vvvv"),
("ddd", "eee"),
("dfsd", "bbbbb"),
("sreeere", "ertccccerg"),
("fdgdddf", "sdgfffdfg"),
("dfgfssg", "sddddddrgdf"),
("dgdwwg", "fdhhhhgdfg"),
("rgdfqqgdf", "dgnnndfgd"),
("dfaagfdgfd", "dtttfgdfg"),
("wwzzer", "ddddfgdfg"),
("dfgxxxdff", "gfdgiiidg"),
("dfccfgfb", "dooofdgdd"),
("dfhfvvcggf", "rrgdfllgfg"),
("dgfbbdgfd", "dfgfdpppgdfg");

select * from author;
select * from book;
select * from borrowing;