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
		when 4, 5, 9
			return 4
		else
			return 0
	end
end

def tens_digits(digit)
	
	case digit
		
		when 2, 3, 8, 9
			return 6
		when 4, 5, 6
			return 5
		when 7
			return 7
		when 0
			return 0
	end
end

def hundreds_digits(digit)
	
	case digit
		
		when 1, 2, 6
			return 10
		when 3, 7, 8
			return 12
		when 4, 5, 9
			return 11
	end
end

def teens(digit)
	
	case digit 
		
		when 1, 2
			return  6
		when 3, 4, 8, 9
			return 8
		when 5, 6
			return 7
		when 7
			return 9
		when 0
			return 3
	end
end
def two_digits(a, b)
	if a == 1
	
		return teens(b)
	else
		
		return tens_digits(a) + singles_digits(b)	
	end
end

def three_digits(a, b, c)
	
	if b == 0 && c == 0
		
		return hundreds_digits(a)
	elsif b != 1
	
		return hundreds_digits(a) + 3 + tens_digits(b) + singles_digits(c)
	else
	
		return hundreds_digits(a) + 3 + teens(c)
	end
end

#1000 included in sum
sum = 11
(1..999).each do |x|

	curr_length = x.to_s.length
	num_split = x.to_s.split("").map(&:to_i)
	
	if curr_length == 3
		
		sum += three_digits(num_split[0], num_split[1], num_split[2])
	elsif curr_length == 2
		
		sum += two_digits(num_split[0], num_split[1])
	else
		
		sum += singles_digits(x)
	end	
end

puts sum