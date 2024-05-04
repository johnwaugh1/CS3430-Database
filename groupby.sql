use waughjm;

insert into registration values
('Tom', 'CS3430', 85),
('Jerry', 'CS3430', 92),
('Tom', 'CS2440', 93),
('Mickey', 'CS2440', 89),
('Tom', 'CS2490', 95),
('Jerry', 'CS2490', 79),
('Mickey', 'CS2490', 72),
('Tom', 'CS3667', 83);

select * from registration;
select count(distinct stu_name) from registration;
select avg(grade) from registration where stu_name = 'Tom';
select stu_name, avg(grade) from registration group by stu_name;
select stu_name, avg(grade) from registration group by stu_name having avg(grade) > 88;