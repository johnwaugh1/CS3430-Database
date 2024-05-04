use waughjm;

drop trigger if exists delete_comp_sci_course;

delimiter $$
create trigger delete_comp_sci_course
before delete
on course for each row
begin
    if left(old.course_number, 2) = 'CS' then
        signal sqlstate 'ERROR' set message_text = 'You cannot delete a computer science course.';
    end if;
end$$
delimiter ;

delete from course where course_number = 'CS3380';

