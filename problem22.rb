#Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

#For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938  53 = 49714.

#What is the total of all the name scores in the file?

file = File.open("names.txt", 'r')
names = file.gets.split(",")
names.map! {|x| x.gsub("\"", "")}
names.sort!
puts names
letters =[]
sub_total = 0
count = 1
final_total = 0

names.each do |name|
	
	sub_total = 0
	letters = []

	(0..name.length - 1).each do |x|
		
		sub_total += name[x].ord - 64
	end
	final_total += sub_total * count
	count += 1
end

puts final_total