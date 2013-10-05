#A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 99.

#Find the largest palindrome made from the product of two 3-digit numbers.

largest_product = 999 * 999
split_palindrome = []

(0..largest_product).each do |x|

	is_palindrome = true
	split_palindrome = (largest_product - x).to_s.split("")
	
	(0..split_palindrome.length - 1).each do |y|
		
		if split_palindrome[y] != split_palindrome[split_palindrome.length - y - 1]
			
			is_palindrome = false
			break
		end
	end
	
	largest_palindrome = split_palindrome.join.to_i
	if is_palindrome
		
		(100..999).each do |z|
			
			if largest_palindrome / z > 99 && 
				largest_palindrome % z == 0 &&
				largest_palindrome / z < 999
				
				puts largest_palindrome
				exit
			end
		end
	end
end