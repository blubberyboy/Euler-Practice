#Starting in the top left corner of a 2x2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.


#How many such routes are there through a 20x20 grid?
	def create_grid(z)
		
		my_array =[]
		my_grid = []
		fill = 1.to_s * z
		
		(0..z - 1).each do |y|
			
			my_array[y] = fill
		end
		(0..z - 1).each do |x|
			
			my_grid[x] = my_array[x].split("")
		end
		return my_grid
	end

x = 20
my_grid = []
my_grid = create_grid(x)

(0..x - 2).each do |y|
	
	(0..x - 2).each do |line|
	
		my_grid[x - 2 - y][x - 2 - line] = my_grid[x - 1 - y][x - 2 - line].to_i + my_grid[x - 2 - y][x - 1 - line].to_i
		my_grid[x - 2 - line][x - 2 - y] = my_grid[x - 1 - y][x - 2 - line].to_i + my_grid[x - 2 - y][x - 1 - line].to_i
	end
end

sum = 1
(0..x-1).each do |y|
	my_grid[y].each do |x|

		sum += x.to_i
	end
	
end

puts sum