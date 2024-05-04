use waughjm;

drop procedure if exists sumNum;

delimiter $$
create procedure sumNum(in num int)
begin
	declare i int;
    declare total int;
    set i = 0;
    set total = 0;
	while i <= num do
		set total = total + i;
        set i = i + 1;
	end while;
    select total;
end$$
delimiter ;

call sumNum(3);