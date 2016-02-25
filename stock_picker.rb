def stock_picker(array)
  answer = []
  total = 0
  array.each do |buy|
    array.each do |sell|
      if (buy < sell) && (array.index(buy) < array.index(sell)) && (sell - buy > total)
        total = sell - buy
        answer = [array.index(buy), array.index(sell)]
      end
    end
  end
  return answer.inspect
end

puts stock_picker([17,3,6,9,15,8,6,1,10])
