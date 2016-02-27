class Array
  def swap(a,b)
    self[a], self[b] = self[b], self[a]
  end

  def bubble_sort
    n = self.length
    n.times do |i|
      for e in (1..(n-1)) do
        self.swap(e, (e-1)) if self[e-1] > self[e]
      end
      return self
    end
  end

  def bubble_sort_by
    n = self.length
    n.times do |i|
      for e in (1..(n-1)) do
        self.swap(e, (e-1)) if yield(self[e-1], self[e]) > 1
      end
    end
  end
end

puts [3,6,2,5,1,4,8,7,9].bubble_sort.inspect

array_to_sort = ["hi", "hello", "hey"]
array_to_sort.bubble_sort_by do |left, right|
  left.length - right.length
end
puts array_to_sort.inspect
