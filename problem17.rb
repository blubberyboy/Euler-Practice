#If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

#If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


#NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
#one two three four five six seven eight nine
def singles_digits(digit)
	
	case digit 
		
		when 1, 2, 6
			return 3
		when 3, 7, 8
			return 5
		else
			return 4
	end
end

#twenty thirty forty fifty sixty seventy eighty ninety
def tens_digits(digit)
	
	case digit
		
		when 2, 3, 8, 9
			return 6
		when 4, 5, 6
			return 5
		else
			return 7
	end
end

#one hundred and ..
def hundreds_digits(digit)
	
	case digit
		
		when 1, 2, 6
			return 13
		when 3, 7, 8
			return 15
		else
			return 14
	end
end

def thousands_digits(digit)

	case digit
		
		when 1, 2, 6
			return 11
		when 3, 7, 8
			return 13
		else
			return 12
	end
end
def teens(digit)

	case digit 
		
		when 11, 12
			sum += 6
		when 13, 14, 18, 19
			sum += 8
		when 15, 16
			sum += 7
		when 17
			sum += 9
	end
end

sum = 0
puts "Please enter an ending number less than or equal to 1000"
print "> "
ending_num = gets.chomp.to_i
(1..ending_num).each do |x|

	curr_length = x.to_s.length
	ind_digits = x.to_s.split('')
	
	if curr_length == 1
		sum += singles_digits(x)
	end
	
	if curr_length == 2 && x < 20
		
		if x == 10
		
			sum += 3	
		else
		
			sum += teens(ind_digits[curr_length-2..curr_length-1].join.to_i)
		end
		
	elsif curr_length == 2
		
		sum += tens_digits(ind_digits[0])
		sum += singles_digits(ind_digits[1])
	
	elsif curr_length == 3
		
		sum += hundreds_digits(ind_digits[0])
		
		if ind_digits[1] != 0 && ind_digits[2] != 0 && ind_digits[1] != 1
			
			sum += tens_digits(ind_digits[1])
			sum += singles_digits(ind_digits[2])
		end
	
	elsif curr_length == 4
	
		sum += thousands_digits(ind_digits[0])
		
		if ind_digits[1] != 0 && ind_digits[2] != 0 && ind_digits[3] != 0
			
			sum += hundreds_digits(ind_digits[1])
			sum += tens_digits(ind_digits[2])
			sum += singles_digits(ind_digits[3])
	
		else
	
			sum -= 3
		end
	end
end
puts sum