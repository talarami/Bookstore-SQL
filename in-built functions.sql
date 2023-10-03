use library;

/* Changing book availability (replace): */

update 
availability
set numberOfBooks = replace(numberOfBooks, 12, 11)
where
book_id = 1;



/* Finding out how many books are in a library (count): */

select count(book_id)
from books;

/* Showing how many books each author has using (count): */

select 
	a.author_id, 
	a.author_name, 
	a.author_surname, 
count(b.book_id) as numberOfBooks 
from authors a 
inner join books b on a.author_id = b.author_id
group by a.author_id, a.author_name, a.author_surname;


/* Searching for author who has the most books using (count): */

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
