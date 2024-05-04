use waughjm;
drop table if exists student;
drop table if exists parts;
drop table if exists student1;

create table parts(
	id int primary key auto_increment,
	part char(7)
);

create table student(
	stu_id int primary key auto_increment,
	stu_name char(10),
    stu_cell varchar(10),
    stu_part int,
    foreign key (stu_part) references parts (id)
);

insert into parts (part) values ('Soprano'), ('Alto'), ('Tenor'), ('Bass');
insert into student (stu_name, stu_cell, stu_part) values ('Tom', '1112223333', '4'), ('Jerry', '8884447777', '3'), ('Mickey', '2225556666', '3'), ('Minnie', '6663332222', '1'), ('Goofy', '7776669999', '4');

select * from student;
select * from parts;

desc student;
desc parts;

create table student1 (like student);
insert into student1 select * from student;

select * from student1;
desc student1;
