#A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

#012   021   102   120   201   210

#What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

#1
#1 * 2 = 2	
#2 * 3 = 6	
#6 * 4 = 24	
#24 * 5 = 120
#120 * 6 = 720
#720 * 7 = 5040
#5040 * 8 = 40320
#40320 * 9 = 362880
#362880 * 10 = 3628800

class Integer
	
	def digit_unused?
		
		$my_answer.split("").map(&:to_i).each do |y|
			
			if y == self
				
				return false
			end
		end
		return true
	end
end
	
my_digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
digits_vs_place = []
current_total = 1

#pattern for permutations per digit
(1..10).each do |x|

	digits_vs_place << current_total * x
	current_total *= x
end

my_digit_place = []
y = 999999

(0..9).each do |z|

	my_digit_place << y / digits_vs_place[8 - z]
	y %= digits_vs_place[8 - z]
end

$my_answer = ""
count = 0

my_digit_place.each do |x|
	
	count = 0
	
	my_digits.each do |y|
		
		if y.digit_unused?
			
			count += 1
		end
		
		if count == x + 1
		
			$my_answer += y.to_s
			break
		end
	end
end

puts $my_answer