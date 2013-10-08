#2**15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

#What is the sum of the digits of the number 2**1000?

my_num = 2**1000
int_split = my_num.to_s.split('')
sum = 0

int_split.each do |x|
	
	sum += x.to_i
end

puts sum