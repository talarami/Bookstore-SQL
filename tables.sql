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

insert into books (book_title, author_id, price)
values 
("Shining", 1, 10.99),
("Misery", 1, 11.99),
("sdfdfd", 2, 13.99),
("vdfgdfgd", 3, 3.99),
("dgdfgf", 4, 6.99),
("Misery", 4, 5.99),
("Green Mile", 1, 6.99),
("werewre", 6, 2.99),
("Carrie", 1, 9.99),
("Fairytale", 1, 8.99);

insert into books (book_title, author_id, price)
values 
("Cujo", 1, 5.99);

# Deleting data:

# delete from books 
# where book_title = "Cujo";

insert into availability (book_id, numberOfBooks)
values
(1, 12),
(2, 2),
(3, 3),
(4, 11),
(5, 30),
(6, 20),
(7, 5);


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


# Finding out how many books are in a library using count:

select count(book_id)
from books;


# Showing how many books each author has using inner join and count:

select 
a.author_id, 
a.author_name, 
a.author_surname, 
count(b.book_id) as numberOfBooks 
from authors a 
inner join books b on a.author_id = b.author_id
group by a.author_id, a.author_name, a.author_surname;


# Searching for author who has the most books using count and inner join:

select 
	a.author_id, 
	a.author_name, 
	a.author_surname,
	count(b.book_id) as numberOfBooks
from authors a
inner join  books b on a.author_id = b.author_id
group by a.author_id, a.author_name, a.author_surname
order by numberOfBooks desc
limit 1;


# Searching for the average of books per author using avg: 

select
	avg(booksPerAuthor) as averageBooksPerAuthor
from (
	select count(books.book_id) booksPerAuthor
    from books
    group by author_id
) as bookCounts;


# Searching for authors by surname alphabetically:

select * from authors
order by author_surname;


# Changing book availability:

update 
availability
set available = replace(available, "yes", "no")
where
book_id = 1;

# Searching for books from the cheapest:

select book_title, price
from books
order by price asc;

# Searching for books cheaper than 10:

select book_title, price from books where price <= 10;

# Searching for the cheapest book using min:

select * from books
where price = (select min(price) from books);



select * from authors;
select * from books;
select * from availability;



# zmienic table availability na ilosc dostepnych sztuk poszczegolnych ksiazek zamiast yes no i w funkcji wywolac 
# np sumowanie wszystkich dostepnych ksiazek w zasobach ksiegarni albo cena ksiazki * ilosc zeby sprawdzic wartosc
# wszystkich ksiazek danego autora







