#A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,

#a2 + b2 = c2
#For example, 32 + 42 = 9 + 16 = 25 = 52.

#There exists exactly one Pythagorean triplet for which a + b + c = 1000.
#Find the product abc.

(1..1000).each do |a|
	
	(1..1000).each do |b|
		
		c = (a**2 + b**2)**0.5
		
		if a + b + c == 1000
		
			puts a * b * c
			exit
		end
	end
end
