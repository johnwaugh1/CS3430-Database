show variables like 'autocommit';

set autocommit = 0;

select * from bank_account;

update bank_account set balance = 1800 where account_no = 2;

rollback;