drop function get_remaining_days;

delimiter $

create function get_remaining_days(email1 text,md date) returns int deterministic

begin
	declare rd int default 0;
	
	 select datediff(adddate(A_date,interval days day),adddate(md,interval 0 day)) from guestList where (md between A_date and adddate(A_date,interval days-1 day)) and email=email1 into rd;
	 
	 return rd;

	
end $

delimiter ;
	
		
