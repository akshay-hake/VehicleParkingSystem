drop trigger check_slot;
delimiter $
create trigger check_slot before insert on entry_detail for each row
begin
	if ((select count(*) from entry_detail where status<>'c' and (slot_no=NEW.slot_no and ((arrival_time<=NEW.departure_time and departure_time>=NEW.departure_time)  or (arrival_time<=NEW.arrival_time and departure_time>=NEW.arrival_time) or (arrival_time>=NEW.arrival_time and departure_time<=NEW.departure_time))))>0)
	then
		signal sqlstate '45000'
			set message_text='Error';
	end if;
	
end;

$
	




delimiter ;
