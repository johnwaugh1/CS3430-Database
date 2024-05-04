use waughjm;

drop table if exists grade;
drop procedure if exists final_proc;

CREATE TABLE grade(
stu_no INT PRIMARY KEY,
exam INT,
quiz INT,
final INT
);

INSERT INTO grade VALUES
(1, 95, 85, 0),
(2, 87,94, 0), 
(3, 92, NULL, 0), 
(4, NULL, 90, 0);

delimiter $$
create procedure final_proc()
begin
	-- declare local variables
	declare stu int;
    declare ex int;
    declare qz int;
    declare ifEnd tinyint default 0;
    -- declare cursor
	declare final_cursor cursor for select stu_no, exam, quiz from grade;
	-- declare error handler
    declare continue handler for not found set ifEnd = 1;
    -- open cursor
	open final_cursor;
    -- iterate cursor
    while ifEnd = 0 do
		fetch final_cursor into stu, ex, qz;
		if ex > qz or qz is null then
			update grade set final = ex where stu_no = stu;
		else
			update grade set final = qz where stu_no = stu;
		end if;
    end while;
    -- close cursor
	close final_cursor;
end$$
delimiter ;

call final_proc;
select * from grade;
