#The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

#Find the sum of all the primes below two million.
sum = 5

(5..2000000).step(2) do |x|

	prime = true

	(3..x**0.5).step(2) do |y|
		
		if x % y == 0
			
			prime = false
			break
		end
	end
	
	if prime

		sum += x
	end
end
puts sum