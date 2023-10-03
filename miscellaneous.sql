use library;

/* Searching for authors by surname alphabetically: */

select * from authors
order by author_surname;

/* Searching for books from the cheapest: */

select book_title, price
from books
order by price asc;

use library;

/* Searching for books cheaper than 10: */

select book_title, price from books where price <= 10;

/* Changing book availability: */

update 
availability
set numberOfBooks = replace(numberOfBooks, 12, 11)
where
book_id = 1;

