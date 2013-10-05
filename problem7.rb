prime_count = 2
current_number = 5
beginning_time = Time.now
loop do
	prime = true

	(3..(current_number ** 0.5 + 1)).each do |x|
		
		if current_number % x == 0
			
			prime = false
			break
		end
	end
	if prime
		
		prime_count += 1
	end
	
	if prime_count == 10001
		
		puts current_number
		end_time = Time.now
		puts "Time elapsed #{(end_time - beginning_time)} seconds"
		exit
	end
	current_number += 2
end