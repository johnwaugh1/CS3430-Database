use waughjm;

drop procedure if exists return_course_number;

delimiter $$
create procedure return_course_number(in nm varchar(30))
begin
	select course_number into nm from course where course_name = nm;
		if substring(nm, 1, 2) = 'CS' then
			select 'This course is a computer science course' as Result;
		else
			select 'This course is not a computer science course' as Result;
		end if;
end$$
delimiter ;

call return_course_number('Discrete Mathematics');


