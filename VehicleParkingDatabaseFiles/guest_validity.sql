drop procedure check_guestValidity;

delimiter $

create procedure check_guestValidity(in oid1 int,in vid1 int,in email1 text,in adate1 date,in ddate1 date)

begin
	declare dif_days int default 0;
	declare dif_days1 int default 0;
	
	
	
	if((select count(*) from guestList where o_id=oid1 and email=email1 and (adate1 between A_date and adddate(A_date,interval days-1 day)) and (ddate1 between A_date and adddate(A_date,interval days-1 day)))>0)
	then
		select 0 as result;
		
	
		
	elseif((select count(*) from guestList where o_id=oid1 and email=email1 and not(adate1 between A_date and adddate(A_date,interval days-1 day)) and (ddate1 between A_date and adddate(A_date,interval days-1 day)))>0)
	then
		select datediff(A_date,adddate(adate1,interval 0 day)) from guestList where email=email1 and o_id=oid1 into dif_days;
		
		select 1 as result,adate1 as arrival,dif_days as dayLimit;
		
	elseif((select count(*) from guestList where o_id=oid1 and email=email1 and (adate1 between A_date and adddate(A_date,interval days-1 day)) and not(ddate1 between A_date and adddate(A_date,interval days-1 day)))>0)
	then
		select datediff(ddate1,adddate(A_date,interval days-1 day)) from guestList where email=email1 and o_id=oid1 into dif_days;
		
		select 1 as result,adddate(A_date,interval days day) as arrival,dif_days as dayLimit from guestList where email=email1 and o_id=oid1;
	
	else
		
		if(((select count(*) from guestList where o_id=oid1 and email=email1 and adate1<A_date and ddate1<A_date)>0) or ((select count(*) from guestList where o_id=oid1 and email=email1)=0))
		then
			select 1 as result,adate1 as arrival,datediff(ddate1,adate1)+1 as dayLimit;
			
		elseif((select count(*) from guestList where o_id=oid1 and email=email1 and adate1>A_date and ddate1>A_date)>0)
		then
			select 1 as result,adate1 as arrival,datediff(ddate1,adate1)+1 as dayLimit;
		else
			select datediff(A_date,adddate(adate1,interval 0 day)) from guestList where email=email1 and o_id=oid1 into dif_days;
			select datediff(ddate1,adddate(A_date,interval days-1 day)) from guestList where email=email1 and o_id=oid1 into dif_days1;
		
		select 2 as result,adate1 as arrival,dif_days as dayLimit,adddate(A_date,interval days day) as arrival2,dif_days1 as dayLimit2  from guestList where email=email1 and o_id=oid1;
		
		
		
		
		end if;
	end if;
		
		
		
		
	
	
	
	
	
	
	
	
		
end$

delimiter ;
