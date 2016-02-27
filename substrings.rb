def substrings(string, dictionary)
  answer = {}
  dictionary.each do |word|
    unless string.downcase.scan(word).empty?
      answer[word] = string.downcase.scan(word).length
    end
  end
  return answer
end

puts "Dictionary please"
dictionary = gets.chomp.split
puts "String please"
string = gets.chomp
puts substrings(string, dictionary)
