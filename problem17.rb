#If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

#If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


#NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
one two three four five six seven eight nine
def single_digits(digit)
	
	case digit 
		
		when 1, 2, 6
			returns 3
		when 3, 7, 8
			returns 5
		else
			returns 4
	end
end
#twenty thirty forty fifty sixty seventy eighty ninety
def tens_digit(digit)
	
	case digit
		
		when 2, 3, 

sum = 0
puts "Please enter an ending number"
print "> "
ending_num = gets.chomp
(1..ending_num).each do |x|

	curr_length = x.to_s.length
	if curr_length == 1
		sum += single_digits(x)
	end
	if curr_length == 2 && x < 20
		#eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen
		case x 
		
			when 11, 12
				sum += 6
			when 13, 14, 18, 19
				sum += 8
			when 15, 16
				sum += 7
			when 17
				sum += 9
		end

	elsif curr_length == 2
		
		ind_digits = x.to_x.split('')
		sum += tens_digit(ind_digits[0])