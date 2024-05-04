use waughjm;
drop table if exists grade;

create table grade(
	id int primary key auto_increment,
    student varchar(10) not null,
    exam int unsigned
);

insert into grade values(1, 'Tom', null), (2, 'Jerry', 53), (3, 'Mickey', 73), (4, 'Minnie', 98);

update grade set exam = exam + 5;
update grade set exam = 100 where exam > 100;
update grade set exam = 60 where exam >= 55 and exam <= 60;

truncate table grade;
insert into grade values(null, 'Goofy', 80);


select * from grade;

    