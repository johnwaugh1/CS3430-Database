use waughjm;
drop table if exists student, course, section, grade_report, prerequisite;

create table student(
	name char(10) not null,
    Student_number int primary key,
    class int,
    major char(4)
);

create table course(
	Course_name char(100) unique,
    Course_number char(10) primary key,
    Credit_hours int default '4' not null,
    Department char(4) not null
);

create table section(
	Section_identifier int primary key,
    Course_number char(10),
    Semester char(10) not null,
    Year int not null,
    Instructor char(20),
    foreign key (Course_number) references course(Course_number)
);

create table grade_report(
	Student_number int,
    Section_identifier int,
    Grade char,
    foreign key (Student_number) references student(Student_number),
    foreign key (Section_identifier) references section(Section_identifier)
);

create table prerequisite(
	Course_number char(10),
    Prerequisite_number char(10),
    foreign key (Course_number) references course(Course_number),
    foreign key (Prerequisite_number) references course(Course_number)
);

insert into student values
('Smith', null, '1', 'CS'),
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

select Semester, count(*) as Number_Sections from Section group by Semester;

select C.Course_name, S.Course_number, S.Semester, S.Year, count(G.Student_number) as numStudents
from section S
join course C on S.Course_number = C.Course_number
join grade_report G on S.Section_identifier = G.Section_identifier
where S.Instructor = 'Anderson'
group by C.Course_name, S.Course_number, S.Semester, S.Year;

Select C.Course_name, C.Course_number, C.Credit_hours, S.Semester, S.Year, G.Grade
from section S
join course C on s.Course_number = c.Course_number
join grade_report G on S.Section_identifier = G.Section_identifier
where G.Student_number = '17'
group by C.Course_name, C.Course_number, C.Credit_hours, S.Semester, S.Year, G.Grade;

select Student_number 
from grade_report 
where Section_identifier in ('102','135')
group by Student_number
having count(distinct Section_identifier) = 2;

select distinct s.name
from student s
where not exists(
	select 1
    from prerequisite p
    left join grade_report g on p.Prerequisite_number = g.Section_identifier
    where p.Course_number = 'CS3380'
    and g.Student_number = s.Student_number
    and g.grade is null
)
and not exists(
	select 1
    from section S
    left join grade_report g on S.Section_identifier = g.Section_identifier
    where S.Course_number = 'CS3380'
    and g.Student_number = s.Student_number
);