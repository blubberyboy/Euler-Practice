require 'colorize'

$tiles_left = []
$player_tiles = []
$number_of_players = 0
$played_tile = ""
$played_tiles = []
$grid = []
$turns = 0

$hotel_type = []

def give_tiles
	
	current_rand = rand($tiles_left.length - 1)
	selected_tile = $tiles_left[current_rand]
	$tiles_left.reject! {|x| x == selected_tile}
	return selected_tile
end

def start_game

	$hotel_type[0] = ["American", 0, [], 2]
	$hotel_type[1] = ["Continental", 0, [], 3] 
	$hotel_type[2] = ["Festival", 0, [], 2]
	$hotel_type[3] = ["Imperial", 0, [], 3]
	$hotel_type[4] = ["Luxor", 0, [], 1]
	$hotel_type[5] = ["Tower", 0, [], 1]
	$hotel_type[6] = ["Worldwide", 0, [], 2]
	
	while $number_of_players < 2 || $number_of_players > 4
	
		print "Please enter number of players \n> "
		$number_of_players = gets.chomp.to_i
	end
	
	(0..$number_of_players - 1).each do |x|
		
		$player_tiles[x] = []
	end
	
	(0..$number_of_players - 1).each do |x|
		
		(0..4).each do |y|
		
			$player_tiles[x][y] = give_tiles
		end
	end
end

def grid_refresh

	if $turns == 0
	
		(0...108).each do |x|
		
			$played_tiles[x] = []
		end
		z = "A"
	end
	i = 0
	print "-" * 75
	
	(1..19).each do |x|
		
		puts "\n"
		if x % 2 == 0
		
			(1..12).each do |y|
				
				if $turns == 0
				
					$played_tiles[i] = [y.to_s + z , "None"] 
					$tiles_left << y.to_s + z
				end
				
				case $played_tiles[i][1]
			
					when "None"
						print "| %s |" %$played_tiles[i][0]
				
					when "American"
						print "| %s |" %$played_tiles[i][0].white.on_blue
				
					when "Continental"
						print "| %s |" %$played_tiles[i][0].white.on_red
				
					when "Festival"
						print "| %s |" %$played_tiles[i][0].white.on_green
				
					when "Worldwide"
						print "| %s |" %$played_tiles[i][0].white.on_yellow
				
					when "Luxor"
						print "| %s |" %$played_tiles[i][0].white.on_light_yellow
				
					when "Tower"
						print "| %s |" %$played_tiles[i][0].white.on_cyan
				
					when "Imperial"
						print "| %s |" %$played_tiles[i][0].white.on_magenta
				
					when "Free_tile"
						print "| %s |" %$played_tiles[i][0].white.on_black
				end
				i += 1
			end
			z = (z.ord + 1).chr("UTF-8") if $turns == 0
		else	
			
			(1..12).each do |q|
				
				if q > 9
					
					print "|     |"
				
				else
					
					print "|    |"
				end
			end
		end
	end	
	puts "\n" + "-" * 75
end

def tile_played (position_played)
	
	south = 0
	$played_tiles [position_played][1] = "Free_tile"
	
	if position_played == 0
		
		west = 0
		east = free_connecting_tile? (1 + position_played)
		north = 0
		south = free_connecting_tile? (12 + position_played)
	elsif position_played == 12
		
		west = free_connecting_tile? (position_played -1)
		east = 0
		north = 0
		south = east = free_connecting_tile? (12 + position_played)
	elsif position_played == 96
		
		west = 0
		east = free_connecting_tile? (1 + position_played)
		north = east = free_connecting_tile? (position_played -12)
		south = 0
	elsif position_played == 108
		
		west = free_connecting_tile? (-1 + position_played)
		east = 0
		north = free_connecting_tile? (position_played -12)
		south = 0
	elsif position_played % 12 == 0
	
		west = 0
		east = free_connecting_tile? (1 + position_played)
		north = free_connecting_tile? (position_played -12)
		south = free_connecting_tile? (12 + position_played)
	elsif position_played + 1 % 12 == 0
		
		west = free_connecting_tile? (position_played -1)
		east = 0
		north = free_connecting_tile? (-12 + position_played)
		south = free_connecting_tile? (12 + position_played)
	elsif position_played < 12
		
		west = free_connecting_tile? (position_played -1)
		east = free_connecting_tile? (1 + position_played)
		north = 0
		south = free_connecting_tile? (12 + position_played)
	elsif position_played > 96
		
		west = free_connecting_tile? (position_played -1)
		east = free_connecting_tile? (1 + position_played)
		north = free_connecting_tile? (-12 + position_played)
		south = 0
	else
		
		west = free_connecting_tile? (position_played -1)
		east = free_connecting_tile? (1 + position_played)
		north = free_connecting_tile? (position_played -12)
		south = free_connecting_tile? (12 + position_played)
	end
	
	puts west, east, north, south
	north = free_connecting_tile? (-12 + position_played)
		
	if position_played <= 95

		south = free_connecting_tile? (12 + position_played) 
	end
	
	if west >= 0 && 
		east >= 0 && 
		north >= 0 && 
		south >= 0 &&
		west + east + north + south > 0 &&
		$hotel_type.collect{|ind| ind[1]}.index(0)
		
		puts "You are able to build a hotel. Would you like to build one?"
		if gets.chomp.capitalize == "Yes"
		
			hotel_assign (position_played)
		end	
	end
end

def free_connecting_tile? (x)

	if $played_tiles[x][1]
		
		if $played_tiles[x][1] == "Free_tile"
				
			return 1 
		elsif $played_tiles[x][1] == "None"
			
			return 0
		else 
		
			return -1
		end
	end
	return 0
end #called by tile_played

def game_end?
	
	if $played_tile == "forfeit"
		
		return true
	end
end

def hotel_assign (position_played)
	
	hotel = ""
	possible_choices = []
	puts "Your available hotels are:"
			
	(0..$hotel_type.length - 1).each do |x|
			
		if $hotel_type[x][1] == 0
			
			possible_choices << $hotel_type[x][0]
		end
	end
	puts possible_choices
	
	until possible_choices.include?(hotel)

		puts "Please type in the hotel type you would like to establish\n> "
		hotel = gets.chomp.capitalize
	end
	hotel_tiles(position_played)
	puts $tiles
	hotel_index = $hotel_type.collect{|ind| ind[0]}.index(hotel)
	
	$tiles.each do |x|
		
		$hotel_type[hotel_index][2] << x
		$hotel_type[hotel_index][1] += 1
		$played_tiles[x][1] = hotel
	end
	puts $hotel_type[5][1]
end

def hotel_tiles (position_played)
	
	if position_played == 0
		
		positions = [1,12]
	elsif position_played == 12
		
		positions = [-1,12]
	elsif position_played == 96
		
		positions = [-12,1]
	elsif position_played == 108
		
		positions = [-12,-1]
	elsif position_played % 12 == 0
	
		positions = [-12,1,12]
	elsif position_played + 1 % 12 == 0
		
		positions = [-12,-1,12]
	elsif position_played < 12
		
		positions = [-1,1,12]
	elsif position_played > 96
		
		positions = [-12,-1,1]
	else
		
		positions = [-12,-1,1,12]
	end
	$tiles = [position_played]
	
	positions.each do |x|
		
		y = x + position_played
		if $played_tiles[position_played + x][1] == "Free_tile" && 
			(!$tiles.include? y)
			
			$tiles << position_played + x
		elsif $played_tiles[position_played + x][1] != "None" && 
			(!$tiles.include? y)
			
			$tiles << positions_played + x
		end
	end
		
	$tiles.each do |z|
		
		if !$tiles.include? z
		
			hotel_tiles (z)
		end
	end
end

def player_turn x
		
	until ($player_tiles[x].include? $played_tile) || 
		$played_tile == "forfeiT"
	
		puts "Player #{x + 1}'s turn"
		puts "Your tiles are"
		print $player_tiles[x], "\n"
		print "Please enter the tile you would like to play\n> "
		$played_tile = gets.chomp.gsub(/.\b/) { |m| m.upcase }
	end
	
	if $player_tiles[x].include? $played_tile
	
		$player_tiles[x].reject! {|y| y == $played_tile}
		position_played = $played_tiles.collect {|ind| ind[0]}.index($played_tile)
		if position_played.connecting_hotel?
			#to do
		end
		tile_played (position_played)
		$player_tiles[x].sort!
	end	
	
	#hotel_available?
	#change_color
end

def hostile_takeover (dominant_hotel, minor_hotels)
	
	minor_hotels.each do |x|
		
		
	end
	
	
end

def payout


end

class String
	
	def acceptable_input?
	
		if self == "No" || 
			self == "no" || 
			self == "Yes" || 
			self == "yes"
			
			return true
		else
			
			return false
		end
	end
end

class Integer
	
	def connecting_hotel?
		
		minor_hotels = []
		competing_hotels = []
		positions = [-12,-1,1,12]
		largest_hotel = 0
		largest_hotel_name = ""
		hotel_tile_num = []
		take_over_hotel = ""
		
		positions.each do |x|
		
			if self + x > 0
				
				if $hotel_type.collect {|ind| ind[0]}.include? $played_tiles[self + x][1]
					
					competing_hotels << $played_tiles[self + x][1]
				end
			end
		end
		
		competing_hotels.each do |y|
			
			hotel_tile_num << $hotel_type[$hotel_type.collect {|ind| ind[0]}.index (y)][1]
		end
		
		(0..competing_hotels.length - 1).each do |z|
			
			if hotel_tile_num[z] != hotel_tile_num.max
				
				minor_hotels << competing_hotels[z]
				competing_hotels.reject! {|x| x == competing_hotels[z]}
			end
		end
		
		if competing_hotels.length > 1
			
			puts "Please select the hotel you would like to remove. Your choices are:"
			print competing_hotels
			
			until competing_hotels.include? take_over_hotel
				
				take_over_hotel = gets.chomp.capitalize
			end
			
			competing_hotels.each do |i|
				
				if i != take_over_hotel
					
					minor_hotels << i
				end
			end
			hostile_take_over (take_over_hotel minor_hotels)
		
		else
			
			take_over_hotel = competing_hotels[0]
		end
	end
end
		
#main code

restart = ""

until restart == "No" || 
	restart == "no"
	
	end_game = ""	
	restart = ""
	$played_tile = ""
	grid_refresh
	start_game
	
	catch (:done) do
	until game_end?
		
		$turns += 1
		(0..$number_of_players - 1).each do |x|
			
			grid_refresh
			player_turn x
			
			if $played_tile != "forfeiT"
				
				$player_tiles[x] << give_tiles
			end
		
			until $played_tile != "forfeiT"
				
				until end_game.acceptable_input?
					
					puts "Do you really want to end game?"
					end_game = gets.chomp
				end	
				if end_game == "Yes" || end_game == "yes"
					
					throw :done 
				else 
					$played_tile = ""
					player_turn x
				end
			end
		end	
	end	
	end
	until restart.acceptable_input?
	
		puts "Game has ended. Would you like to restart?"
		restart = gets.chomp
	end
end

