use waughjm;

drop table if exists order_record;
drop procedure if exists new_order;

create table order_record(
	order_id int primary key auto_increment,
    account_no int,
    amount int not null,
    order_type char(10),
    order_posted tinyint,
	foreign key (account_no) references bank_account(account_no)
);

delimiter $$
CREATE PROCEDURE new_order (a INT, m INT, t CHAR(10))
begin
	declare continue handler for sqlexception
	begin
		rollback;
		select 'Error: Unexpected error occurred' as Error;
	end;
	start transaction;
    if(t = 'debit') then
		update bank_account set balance = balance - m where account_no = a;
        insert into order_record (account_no, amount, order_type, order_posted) values (a, m, t, 1);
    elseif(t = 'credit') then
        insert into order_record (account_no, amount, order_type, order_posted) values (a, m, t, 0);
    else
		signal sqlstate 'ERROR' set message_text = 'Transaction type must be credit or debit';
	end if;
    commit;
end$$
delimiter ;

-- call new_order(1, 500, 'debit');
-- call new_order(1, 800, 'debit');
-- call new_order(1, -800, 'debit');
-- call new_order(2, 200, 'credit');
-- call new_order(3, 200, 'credit');
call new_order(2, 200, 'order');

select * from order_record;
select * from bank_account;
