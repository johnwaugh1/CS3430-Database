use waughjm;

drop table if exists t1;
drop table if exists t2;

create table t1(
	id int primary key,
    name char(1),
    status char(1)
);

create table t2(
	id int,
    mobile char(5)
);

insert into t1 values
(1, 'a', '1'),(2, 'b', '1'),(3, 'c', '1'),(4, 'd', '1'),(5, 'e', '1'),
(6, 'f', '0'),(7, 'g', '0'),(8, 'h', '0'),(9, 'i', '0'),(10, 'j', '0');

insert into t2 values
(1, '12345'),(2, '23456'),(3, '34567'),(16, '67890'),(17, '78901');

select * from t1 inner join t2 on t1.id = t2.id and t1.status = '1';
select * from t1 inner join t2 on t1.id = t2.id where t1.status = '1';

select * from t1 left join t2 on t1.id = t2.id and t1.status = '1' and t2.id<3;
select * from t1 left join t2 on t1.id = t2.id where t1.status = '1' and t2.id<3;

select * from t1 left join t2 on t1.id = t2.id and t2.id<3 where status = '1';
select * from t1 left join t2 on t1.id = t2.id and t1.status = 1 where t2.id<3;

