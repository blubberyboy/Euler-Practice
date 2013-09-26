#You are given the following information, but you may prefer to do some research for yourself.
    
#   1 Jan 1900 was a Monday.
#    Thirty days has September,
#    April, June and November.
#    All the rest have thirty-one,
#    Saving February alone,
#    Which has twenty-eight, rain or shine.
#    And on leap years, twenty-nine.
#    A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
#    How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
    
non_leap_year_months = [31,28,31,30,31,30,31,31,30,31,30,31]
leap_year_months = [31,29,31,30,31,30,31,31,30,31,30,31]
normal_year = 365
leap_year = 366

#setting jan 1 1900 as 0 and sun = 6 etc
current_day = 0
last_day_of_month = 6
first_sunday = 0

(1900..2000).each do |year|
	leap_year = false
		
	if year % 4 == 0
			
		if year % 100 == 0 and year % 400 == 0
			
			leap_year = true
		elsif year % 100 != 0
			
			leap_year = true
		end
	end
	if leap_year == true
		
		current_year = leap_year_months
	else
		
		current_year = non_leap_year_months
	end
		
	current_year.each do |month|
			
		(1..month).each do |day|
					
			if current_day == 6 then
					
				current_day = 0
			else
					
				current_day += 1
			end
					
			if day == 1 and current_day == 6 and year != 1900
				
				first_sunday += 1
			end
		end
	end		
end

puts first_sunday
