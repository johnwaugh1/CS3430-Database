insert into student values
('Smith', '17', '1', 'CS'),
('Brown', '8', '2', 'CS');

insert into course values
('Intro to Computer Sciences', 'CS1310', '4', 'CS'),
('Data Structures', 'CS3320', '4', 'CS'),
('Discrete Mathematics', 'MATH2410', '3', 'MATH'),
('Database', 'CS3380', '3', 'CS');

insert into section values
('85', 'MATH2410', 'Fall', '07', 'King'),
('92', 'CS1310', 'Fall', '07', 'Anderson'),
('102', 'CS3320', 'Spring', '08', 'Knuth'),
('112', 'MATH2410', 'Fall', '08', 'Chang'),
('119', 'CS1310', 'Fall', '08', 'Anderson'),
('135', 'CS3380', 'Fall', '08', 'Stone');

insert into grade_report values
('17', '112', 'B'),
('17', '119', 'C'),
('8', '85', 'A'),
('8', '92', 'A'),
('8', '102', 'B'),
('8', '135', 'A');

insert into prerequisite values
('CS3380', 'CS3320'),
('CS3380', 'MATH2410'),
('CS3320', 'CS1310');

update student set class = '1' where Name = 'Brown';
insert into course values('Knowledge Engineering', 'CS4390', '3','CS');
insert into student values('Johnson', '25', '1', 'MATH');
insert into grade_report values('25', '112', 'A');
insert into grade_report values('25', '85', 'B');
insert into grade_report values('25', '135', 'C');

select name from student where major = 'CS';

select count(section_identifier) from section;


