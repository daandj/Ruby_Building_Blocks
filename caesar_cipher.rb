def caesar_cipher(string, shift)
  normal_letters = ("a".."z").to_a
  capital_letters = ("A".."Z").to_a
  string.split(//).map do |chr|
    if normal_letters.include?(chr)
      index = normal_letters.index(chr)
      chr = normal_letters.rotate(shift).at(index)
    elsif capital_letters.include?(chr)
      index = capital_letters.index(chr)
      chr = capital_letters.rotate(shift).at(index)
    else
      chr
    end
  end.join
end

puts "What string do you want to encript?"
string = gets.chomp
puts "By how many do you want me to shift it?"
shift = gets.chomp.to_i
puts caesar_cipher(string, shift)
