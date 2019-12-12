drop procedure insert_payment_after_extend;
delimiter $

create procedure insert_payment_after_extend(in eno int,in method varchar(30),in amount int ,in name varchar(50),in email varchar(50))

begin

	DECLARE old_pid int default 0;
	DECLARE new_pid int default 0;
	DECLARE new_amt int default 0;
	DECLARE `_rollback` BOOL DEFAULT 0;
    	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
    	
	START TRANSACTION;
	
		
 		select p_id from payment order by p_id desc into new_pid;
 		set new_pid = new_pid+1;
 		
 		
		insert into payment values(new_pid,method,amount,name,email,eno);
		
	
        		COMMIT;
   	
 end;$
 delimiter ;
