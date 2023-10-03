use library;

/* Searching for Stephen King's books (inner join): */

select a.author_name, a.author_surname, b.book_title
from authors a
inner join books b
on 
a.author_id=b.author_id
where 
b.author_id = 1;


/* Searching for books titled "Misery" (inner join): */

select a.author_name, a.author_surname, a.author_nickname, b.book_title, a.author_id
from books b
inner join authors a
on 
b.author_id=a.author_id
where 
b.book_title = "Misery";


