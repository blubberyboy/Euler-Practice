puts "type"
text = gets.chomp.to_s

words = text.split(" ")
frequencies = Hash.new(0)
words.each {|word| frequencies[word] += 1}
frequencies.sort_by!{|a, b| b}