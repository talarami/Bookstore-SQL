# create database library;

use library;

drop table if exists availability;
drop table if exists books;
drop table if exists authors;


create table authors (
	author_id int not null auto_increment,
	author_name varchar(100),
	author_surname varchar(100),
    author_nickname varchar(100),
    check (author_nickname is not null or (author_name is not null and author_surname is not null)),
    primary key (author_id)
);

create table books (
	book_id int not null auto_increment,
	book_title varchar(100) not null,
	author_id int not null,
    primary key (book_id),
    foreign key (author_id) references authors(author_id)
);

create table availability (
	availability_id int not null auto_increment,
	book_id int not null,
	available varchar(10) not null, # !!!!!!!!!!!!!!!!
    primary key (availability_id),
    foreign key (book_id) references books(book_id)
);

insert into authors (author_name, author_surname, author_nickname)
values 
("Stephen", "King", null),
("aaa", "vvvv", null),
("ddd", "eee", null),
("dfsd", "bbbbb", null),
("sreeere", "ertccccerg", null),
("fdgdddf", "sdgfffdfg", null),
("dfgfssg", "sddddddrgdf", null),
("dgdwwg", "fdhhhhgdfg", null),
("rgdfqqgdf", "dgnnndfgd", null),
("dfaagfdgfd", "dtttfgdfg", null),
("wwzzer", "ddddfgdfg", null),
("dfgxxxdff", "gfdgiiidg", null),
("dfccfgfb", "dooofdgdd", null),
("dfhfvvcggf", "rrgdfllgfg", null),
("dgfbbdgfd", "dfgfdpppgdfg", null);

insert into books (book_title, author_id)
values 
("Shining", 1),
("Misery", 1),
("sdfdfd", 2),
("vdfgdfgd", 3),
("dgdfgf", 4),
("Misery", 4),
("Green Mile", 1),
("werewre", 6),
("Carrie", 1),
("Fairytale", 1);

insert into availability (book_id, available)
values
(1, "yes"),
(2, "yes"),
(3, "no"),
(4, "yes"),
(5, "no"),
(6, "no"),
(7, "yes");


# Searching for Stephen King's books using inner join:

select a.author_name, a.author_surname, b.book_title
from authors a
inner join books b
on 
a.author_id=b.author_id
where 
b.author_id = 1;


# Searching for books titled "Misery" using inner join:

select a.author_name, a.author_surname, a.author_nickname, b.book_title, a.author_id
from books b
inner join authors a
on 
b.author_id=a.author_id
where 
b.book_title = "Misery";


# Finding out how many books are in a library using aggregate function (count):

select count(book_id)
from books;


# Showing how many books are available in the library using aggregate function (count):

select available, count(available = "yes")
from availability
group by available;

# 



# Searching for authors by surname alphabetically:

select * from authors
order by author_surname;


select * from authors;
select * from books;
select * from availability;


