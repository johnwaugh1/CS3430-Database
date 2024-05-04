use waughjm;
drop table if exists dependent;
drop table if exists employee;

create table employee(
	Fname char(20),
    Minit char(2),
    Lname char(20),
    Ssn char(10) primary key,
    Bdate date,
    Address text,
    Sex char(1),
    Salary decimal(10, 2),
    Super_ssn int,
    Dno tinyint
);

create table dependent(
	Essn char(10),
	Dependent_name varchar(20),
    Sex char(6),
    Bdate date,
    Relationship char(10),
    primary key (Essn, Dependent_name),
    foreign key (Essn) references employee (Ssn)
);

show create table employee;
show create table dependent;

