use waughjm;

drop procedure if exists return_course_number;

delimiter $$
create procedure return_course_number(inout nm varchar(20))
begin
	select course_number into nm from course where course_name = nm;
end$$
delimiter ;

set @coursename = 'Database';
call return_course_number(@coursename);
select @coursename as course_name;

