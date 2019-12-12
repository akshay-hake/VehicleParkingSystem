drop procedure add_guest;

delimiter $

create procedure add_guest(in id1 int,in email1 text,in days1 int,in adate1 date)

begin
	declare dif_days int default 0;
	if((select count(*) from guestList where o_id=id1 and adate1 between A_date and adddate(A_date,interval days-1 day) and email=email1)>0)
	then
		select datediff(adddate(A_date,interval days-1 day),adddate(adate1,interval days1-1 day)) from guestList where email=email1 and o_id=id1 into dif_days;
		if(dif_days < 0) then
			update guestList set days=days-dif_days where email=email1 and o_id=id1;
		
		end if;
	else
		insert into guestList values(id1,email1,days1,adate1);
	end if;		
end$

delimiter ;
