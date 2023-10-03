use library;

/* Searching for the cheapest book (min): */

select * from books
where price = (select min(price) from books);


/* Searching for the average of books per author (avg): */

select
	avg(booksPerAuthor) as averageBooksPerAuthor
from (
	select count(books.book_id) booksPerAuthor
    from books
    group by author_id
) as bookCounts;