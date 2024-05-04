use waughjm;

drop table if exists works_on;
drop table if exists dependent;
drop table if exists project;
drop table if exists dept_locations;
drop table if exists employee;
drop table if exists department;

create table department(
	Dname varchar(20) not null,
    Dnumber int primary key,
    Mgr_ssn char(10),
    Mgr_start_date date,
    foreign key (Mgr_ssn) references employee (Ssn)
);

desc department;

create table employee(
	Fname char(20) not null,
    Minit char(2),
    Lname char(20) not null,
    Ssn char(10) primary key,
    Bdate date not null,
    Address text,
    Sex char(1),
    Salary decimal(10, 2) unsigned,
    Super_ssn char(10),
    Dno int,
    foreign key (Super_ssn) references employee(Ssn),
    foreign	key (Dno) references department (Dnumber)
);

desc employee;

create table dept_locations(
	Dnumber int,
    Dlocation varchar(10),
    primary key (Dnumber, Dlocation),
    foreign key (Dnumber) references department (Dnumber)
);

desc dept_locations;

create table project(
	Pname varchar(30),
    Pnumber int primary key,
    Plocation varchar(20),
    Dnum int,
    foreign key (Dnum) references department (Dnumber)
);

desc project;

create table works_on(
	Essn char(10),
    Pno int,
    Hours decimal(4, 2),
    foreign key (Essn) references Employee (Ssn),
    foreign key (Pno) references Project (Pnumber)
);

desc works_on;

create table dependent(
	Essn char(10),
	Dependent_name varchar(20),
    Sex char(6),
    Bdate date,
    Relationship char(10),
    primary key (Essn, Dependent_name),
    foreign key (Essn) references employee (Ssn)
);

desc dependent;