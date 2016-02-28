module Enumerable
  def my_each
    n = self.length
    for i in 0..n-1 do
      yield(self[i])
    end
  end

  def my_each_with_index
    n = self.length
    for i in 0..n-1 do
      yield(self[i], i)
    end
  end

  def my_select
    answer = []
    self.my_each do |e|
      answer << e if yield(e)
    end
  end

  def my_all?
    all_true = true
    self.my_each do |v|
      all_true = false if yield(v) == false
    end
    return all_true
  end

  def my_any?
    any_true = false
    if block_given?
      self.my_each do |v|
        any_true = true if yield(v)
      end
      return any_true
    else
      return !self.empty?
    end
  end

  def my_none?
    none_true = true
    none_true = false if self.my_any? { |x| yield(x) }
    return none_true
  end

  def my_count(item = nil)
    count = 0
    if item
      self.my_each do |x|
        count += 1 if x == item
      end
    else
      self.my_each do |x|
        count += 1 if yield(x)
      end
    end
    return count
  end

  def my_map(p=nil)
    answer = []
    self.each do |x|
      answer.push(block_given? ? yield(x) : p.call(x))
    end
    return answer
  end

  def my_inject
    arr = self.to_a
    n = arr.length
    total = arr[0]
    for e in (1..n-1)
      total = yield(total, arr[e])
    end
    return total
  end
end

def multiply_els(arr)
  arr.my_inject { |product, x| product * x }
end

test_array = ["1", 2, "3", "hello", "test", 6]

# puts "each:"
# test_array.each do |x|
#   puts x
# end
# test_array.my_each do |x|
#   puts x
# end
#
# puts "each_with_index:"
# test_array.each_with_index do |x, y|
#   puts "#{y}: #{x}"
# end
# test_array.my_each_with_index do |x, y|
#   puts "#{y}: #{x}"
# end
#
# puts "select:"
# test_array.select do |x|
#   x.class == 1.class
#   puts x if x.class == 1.class
# end
# test_array.my_select do |x|
#   x.class == 1.class
#   puts x if x.class == 1.class
# end
# puts "all?:"
# result = test_array.my_all? do |v|
#   v.class == Bignum
# end
# puts result
# result = test_array.all? do |v|
#   v.class == Bignum
# end
# puts result
# puts "any?:"
# result = test_array.my_any? do |v|
#   v.class == Bignum
# end
# puts result
# result = test_array.any? do |v|
#   v.class == Bignum
# end
# # puts result
# puts "none?:"
# result = test_array.my_none? { |x| x.class == Bignum }
# puts result
# result = test_array.none? { |x| x.class == Bignum }
# puts result
# puts "count:"
# result = test_array.my_count { |x| x == 2 }
# puts result
# result = test_array.count { |x| x == 2 }
# puts result
# puts "map:"
# result = test_array.my_map { |x| x * 2 }
# puts result
# result = test_array.map { |x| x * 2 }
# puts result
# proc_ = Proc.new { |x| x * 2 }
# result = test_array.my_map(proc_)
# puts result
# puts "inject:"
# result = (5..6).my_inject { |product, n| product * n }
# puts result
# result = (5..6).inject { |product, n| product * n }
# puts result
# puts multiply_els([2, 4, 5])
