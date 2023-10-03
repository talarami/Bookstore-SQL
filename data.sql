/* create database library; */

use library;

drop table if exists availability;
drop table if exists books;
drop table if exists authors;

/* Creating tables: */


create table authors (
	author_id int not null auto_increment,
	author_name char(100),
	author_surname varchar(100),
    author_nickname varchar(100),
    check (author_nickname is not null or (author_name is not null and author_surname is not null)),
    primary key (author_id)
);

create table books (
	book_id int not null auto_increment,
	book_title varchar(100) not null,
	author_id int not null,
    price decimal(5, 2) default 0.0,
    primary key (book_id),
    foreign key (author_id) references authors(author_id)
);

create table availability (
	availability_id int not null auto_increment,
	book_id int not null,
	numberOfBooks int not null, 
    primary key (availability_id),
    foreign key (book_id) references books(book_id)
);

insert into authors (author_name, author_surname, author_nickname)
values 
("Stephen", "King", null),
("William", "Shakespeare", null),
("Agatha", "Christie", null),
("Barbara", "Cartland", null),
("Danielle", "Steel", null),
("Harold", "Robbins", null),
(null, null, "J.K.Rowling"),
("Sidney", "Sheldon", null),
("Gilbert", "Patten", null),
("Tom", "Clancy", null),
("Leo", "Tolstoy", null),
("Corin", "Tellado", null),
("Dean", "Koontz", null),
("Jackie", "Collins", null),
("Paulo", "Coelho", null);

insert into books (book_title, author_id, price)
values 
("Shining", 1, 10.99),
("Misery", 1, 11.99),
("Treasure Island", 2, 13.99),
("Pride and Prejudice", 3, 3.99),
("Jane Eyre", 4, 6.99),
("Misery", 4, 5.99),
("Green Mile", 1, 6.99),
("Don Quixote", 6, 2.99),
("Carrie", 1, 9.99),
("Fairytale", 5, 8.99),
("Little Women", 6, 8.99),
("Moby Dick", 8, 8.99),
("Dracula", 7, 8.99),
("War and peace", 10, 8.99),
("The Wizard of Oz", 15, 8.99),
("Anna Karenina", 11, 8.99),
("The Call of the Wind", 12, 8.99),
("Heidi", 13, 8.99),
("Lord Jim", 14, 8.99);

insert into books (book_title, author_id, price)
values 
("Cujo", 1, 5.99);

insert into availability (book_id, numberOfBooks)
values
(1, 12),
(2, 2),
(3, 3),
(4, 11),
(5, 0),
(6, 14),
(7, 5),
(8, 0),
(9, 5),
(10, 5),
(11, 5),
(12, 0),
(13, 5),
(14, 2),
(15, 3),
(16, 5),
(17, 0),
(18, 5),
(19, 7);

select * from authors;
select * from books;
select * from availability;








