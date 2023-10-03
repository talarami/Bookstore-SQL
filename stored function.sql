use library;

/*
Use only once to execute a function:

SET GLOBAL log_bin_trust_function_creators = 1;
*/

/* Stored function that gets a total of all currenty available books. */

delimiter //

create function getAllAvailableBooks() returns decimal (10, 2)
begin
	declare total decimal(10, 2);
    select sum(numberOfBooks) into total from availability;
    return total;
end //

delimiter ;

select getAllAvailableBooks()