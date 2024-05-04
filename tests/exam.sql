drop table if exists exam;
create table exam(
	exam_class char(3),
	exam_date date,
	course char(7),
    primary key(exam_class, exam_date)
);

desc exam;