use waughjm;

drop table if exists grade;
drop table if exists report;
drop function if exists total_grade;

create table grade(
	student varchar(20) primary key,
    quiz int,
    exam int
);

insert into grade values
('Tom', 95, 85),
('Jerry', 87, 93),
('Mickey', null, 88),
('Minnie', 91, null);

delimiter $$

create function total_grade(input varchar(20)) returns int(3)
begin
	declare result int(3);
    select ((ifnull(quiz,0) * 0.3) + (ifnull(exam,0) * 0.7)) into result from grade where student = input;
    return result;
end$$

delimiter ;

select student, total_grade(student) as total_grade from grade;

create table report 
(
	student varchar(20),
	course varchar(20),
	grade int
);

insert into report values 
('Tom','Java', 75),
('Tom', 'Database', 89),
('Jerry', 'Database', 64),
('Jerry', 'Machine Learning', 83),
('Jerry', 'Operating Systems', 53),
('Mickey', 'Java', 95),
('Mickey', 'Database', 89),
('Mickey', 'Machine Learning', 91),
('Mickey', 'Algorithm', 83);


delimiter $$

create function average(course_name varchar(20)) returns int
begin 
	declare result int(3);
    select avg(grade) into result from report where course = course_name;
    return result;
end$$

delimiter ;

select average(course) as average_course_grade from report where course = 'Database' group by course;
select * from report where grade > (select average('Java'));