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