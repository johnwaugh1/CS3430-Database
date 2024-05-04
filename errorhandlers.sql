use waughjm;

drop procedure if exists balance;

delimiter $$
create procedure balance(in nm varchar(20), out out_balance int)
begin
    declare balance_found boolean default false;
    declare continue handler for not found 
        begin
            select 'Record not found for given name' as Error;
        end;
    
    select balance into out_balance from bank_account where account_name = nm;
    set balance_found = true;

    if not balance_found then
        select 'Record not found for given name' as Error;
    end if;
end$$
delimiter ;

call balance('Tim', @balance);
select @balance;