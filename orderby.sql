use waughjm;

drop table if exists grade;

create table grade(
	stu_no int,
    exam int,
    quiz int
);

insert into grade values
(1, 95, 85),
(2, 87, 94);

select stu_no, exam, quiz, 0.7 * exam + 0.3 * quiz total from grade
order by total desc;

select * from information_schema.tables
limit 60, 10;
