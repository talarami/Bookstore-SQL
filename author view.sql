use library;

drop view if exists authorview;

create view authorview
as
	select author_id, author_name, author_surname 
    from authors;
   
select * from authors;