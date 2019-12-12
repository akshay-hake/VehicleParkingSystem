drop function giveStatus;

delimiter $

create function giveStatus(en int) returns int deterministic

begin
	
	
	declare zer double default 0;
	
	declare st char default 'c';

	if((select count(*) from entry_detail where entry_no=en and status like 'y' and departure_time<now())>0)
	then
		return 3;
		
	elseif((select count(*) from entry_detail where (status like 'c' and entry_no=en) )>0)
	then
		return 4;
		
	elseif((select count(*) from entry_detail where entry_no=en and status like 'n' and departure_time<now())>0)
	then
		return 5;
		
	elseif((select count(*) from entry_detail where entry_no=en and status like 'y')>0)
	then
		return 2;
	
	else
		return 1;
	end if;
	
	
end $

delimiter ;
		
