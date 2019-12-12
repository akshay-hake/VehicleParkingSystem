drop procedure booking;
delimiter $
create procedure booking(in pid int,in method text,in amount int,in name text,in email text,in e_no int,in c_no text, in purpose text,in em_id int,in vr_id int,in sl_no int,in a_time datetime,in d_time datetime,in book_id int,in lout_id int,in pay_id int,in space int,in rc1 int,in status char)
begin
	DECLARE s varchar(100) DEFAULT '0';
	DECLARE `_rollback` BOOL DEFAULT 0;
    	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
    	
    	
    	if ((select count(*) from entry_detail where status<>'c' and ((car_no=c_no or slot_no=sl_no) and ((arrival_time<=a_time and departure_time>=d_time)  or (arrival_time<=a_time and departure_time>=a_time) or (arrival_time>=a_time and departure_time<=d_time)))=0))
    	then
    	
    	
		START TRANSACTION;
	
		insert into pre_booking values(book_id,a_time,d_time);
 
		
	
		call insert_entry_data(e_no,c_no,purpose,em_id,vr_id,sl_no,a_time,d_time,book_id,lout_id,pid,space,rc1,status);
      
      		insert into payment values(pid,method,amount,name,email,e_no);
      		
		IF `_rollback` THEN
			select '0','0','0' as result;
        		ROLLBACK;
        
    		ELSE
    			select '1','1','1' as result;
        		COMMIT;
   		 END IF;
    
    	elseif((select count(*) from entry_detail where car_no=c_no and ((arrival_time<=a_time and departure_time>=d_time)  or (arrival_time<=a_time and departure_time>=a_time) or (arrival_time>=a_time and departure_time<=d_time)))>0)
    	then
    		select slot_no from entry_detail where car_no=c_no and ((arrival_time<=a_time and departure_time>=d_time)  or (arrival_time<=a_time and departure_time>=a_time) or (arrival_time>=a_time and departure_time<=d_time)) into s;
    		select 'You already booked a slot ',s,' at that time' as result;
    	
    	else
    		select 'Unfortunately this slot(',sl_no,') is booked by another User' as result;
    		
 	end if;
end;
$
delimiter ;




