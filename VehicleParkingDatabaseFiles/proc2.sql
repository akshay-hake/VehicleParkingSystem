drop procedure insert_entry_data;
delimiter $
create procedure insert_entry_data(in e_no int,in c_no text, in purpose text,in em_id int,in vr_id int,in sl_no int,in a_time datetime,in d_time datetime,in book_id int,in lout_id int,in pay_id int,in space int,in rc1 int,in status char)
begin
	declare ep_id int default 0;
	declare v_id int default 0;
	select emp_id from car where car_no=c_no into ep_id;
	select visitor_id from car where car_no=c_no into v_id; 
	if ep_id<>0 or v_id<>0 then
			if em_id<>0 then
				update car set emp_id=em_id,visitor_id=null where car_no = c_no;
			else
				update car set visitor_id=vr_id,emp_id=null where car_no = c_no;
			end if;	
	else
			if em_id<>0 then
		    	insert into car values(c_no,space,rc1,em_id,null);
		    else 
		    	insert into car values(c_no,space,rc1,null,vr_id);
		    	end if;
	end if;
	
	insert into entry_detail values(e_no,c_no,sl_no,purpose,a_time,d_time,book_id,lout_id,status);
end;
$
delimiter ;

