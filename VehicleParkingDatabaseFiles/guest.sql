drop function get_status;

delimiter $

create function get_status(email1 text,md date) returns int deterministic

begin

	
	if curdate()<md
	then
		return 1;
		
	elseif((select count(*) from visitor where email=email1 )=0)
	then
		return 1;
		
	elseif curdate()>md
	then
	
		if((select count(*) from visitor where email=email1 and visitor_id in(select visitor_id from car where car_no =all(select car_no from entry_detail where status='y' and  departure_time>concat(md,' ','23:59:00') and date(departure_time)=md)))>0)
		then 
			return 2;
		
			
		elseif((select count(*) from visitor where email=email1 and visitor_id in(select visitor_id from car where car_no = all(select car_no from entry_detail where status='n' and date(departure_time)=md)))>0)
		then 
			return 1;
			
		elseif((select count(*) from visitor where email=email1 and visitor_id in(select visitor_id from car where car_no = all(select car_no from entry_detail where status='y' and date(departure_time)=md)))>0)
		then
			return 3;
			
		else
			return 1;
			
		end if;
	
	else
	
		if((select count(*) from visitor where email=email1 and visitor_id in(select visitor_id from car where car_no in (select car_no from entry_detail where status='y' and departure_time>now() and date(departure_time)=md)))>0)
		then 
			return 2;
		
			
		elseif((select count(*) from visitor where email=email1 and visitor_id in(select visitor_id from car where car_no in (select car_no from entry_detail where status='n' and date(departure_time)=md)))>0)
		then 
			return 1;
			
		elseif((select count(*) from visitor where email=email1 and visitor_id in(select visitor_id from car where car_no in (select car_no from entry_detail where status='y' and departure_time<now() and date(departure_time)=md)))>0)
		then
			return 3;
			
		else
			return 1;
			
		end if;
	
	end if;
end $

delimiter ;
	
		
