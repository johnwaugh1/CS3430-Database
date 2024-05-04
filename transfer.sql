use waughjm;

drop table if exists bank_account;
drop procedure if exists transfer;

CREATE TABLE bank_account(
    account_no INT not null PRIMARY KEY AUTO_INCREMENT,
    account_name CHAR(20) NOT NULL,
    balance INT UNSIGNED default null
);

INSERT INTO bank_account VALUES
	(1, 'Tom', 1000),
	(2, 'Jerry', 1000);
    
delimiter $$

CREATE PROCEDURE transfer (IN from_account INT, IN to_account INT, IN money INT)
BEGIN
	UPDATE bank_account SET balance = balance + money
	WHERE account_no = to_account;
	UPDATE bank_account SET balance = balance - money
	WHERE account_no = from_account;
END$$

delimiter ;

CALL transfer(1, 2, 800);
select * from bank_account;

