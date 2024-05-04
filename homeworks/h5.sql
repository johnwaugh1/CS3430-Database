use waughjm;

drop table if exists plays_for;
drop table if exists formation;
drop table if exists player_position;
drop table if exists feedback;
drop table if exists finance;
drop table if exists fanbase;
drop table if exists team;
drop table if exists player;

create table player(
	name char(20) primary key,
    age int(2),
    player_position char(3) unique,
    number int(2),
    nationality char(3)
);

create table team(
	name char(20) primary key,
    coach char(20),
    stadium char(20),
    formation int(10) unique
);

create table fanbase(
	name char(20) primary key,
    attendance int(10),
    membership char(10),
    feedback char(20) unique
);
create table finance(
	transactions int primary key,
    type char(20),
    amount int(20),
    date date
);

create table feedback(
	Id int(10) primary key,
    response char(20),
    foreign key (response) references fanbase(feedback)
);

create table player_position(
	Id char(3) primary key,
    def char,
    mid char,
    forward char,
    gk char,
    foreign key (Id) references player(player_position)
);

create table formation(
	form_id int(10) primary key,
    defensive char(10),
    attacking char(10),
    foreign key (form_id) references team (formation)
);

create table plays_for(
	player char(20) primary key,
    team char(20),
    foreign key (player) references player(name),
    foreign key (team) references team(name)
);


	
