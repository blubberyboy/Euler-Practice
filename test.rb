sum = 0

(0..100).each do |x|
	
	(0..100).each do |y|
	
		sum += y.to_i
		if x == 10
			break
			break
		end
	end
	puts x
end
	puts sum