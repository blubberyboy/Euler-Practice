#n! means n x(n -1) x ... x 3 x 2 x 1

#For example, 10! = 10 x 9 x ... x 3 x 2 x 1 = 3628800,
#and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

#Find the sum of the digits in the number 100!

factorial_multi = 1
break_down = []

(1..100).each do |x|
	
	factorial_multi *= x
end
break_down = factorial_multi.to_s.split('').map(&:to_i)
sum = 0

break_down.each do |y|
	
	sum += y
end

puts sum