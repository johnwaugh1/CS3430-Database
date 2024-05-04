drop table if exists dependent;
create table dependent(
	Essn int,
    Dependent_name varchar(20),
    Sex char(6),
    Bdate date,
    Relationship char(10) not null,
    primary key(Essn, Dependent_name)
    );

desc dependent;