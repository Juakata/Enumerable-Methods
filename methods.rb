# frozen_string_literal: true

module Enumerable
  def my_each
    i = 0
    length = self.length
    while i < length
      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    length = self.length
    while i < length
      yield(self[i], i)
      i += 1
    end
  end

  def my_select(&block)
    arr = []
    my_each  { |e| arr.push(e) if block.call(e) }
    arr
  end

  def my_all?
    result = true
    my_each  { result = false unless yield(self[i]) }
    result
  end

  def my_any?
    result = false
    my_each  { result = true if yield(self[i]) }
    result
  end

  def my_none?
    result = true
    my_each  { result = false if yield(self[i]) }
    result
  end

  def my_count
    result = 0
    my_each  {  result += 1 if yield(self[i]) }
    result
  end

  def my_map(proc = nil, &block)
    arr = []
    i = 0
    if proc
      my_each  { arr.push(proc.call(self[i])) }
    else
      my_each  {  arr.push(block.call(self[i])) }
    end
    arr
  end

  def my_inject(&block)
    type = self.instance_of? Range
    if type
      last = self.last
      first = self.first
      result = self.first
      i = first
      while i <= last
        result = block.call(result, i) unless i == first
        i += 1
      end
    else
      i = 1
      result = self[0]
      my_each  {  result = block.call(result, self[i]) }
    end
    result
  end
end

# testing the methods

[1, 2, 3, 4, 5].my_each do |i|
  puts i
end

%w[cat dog horse].my_each_with_index do |value, i|
  puts "#{value} is at position #{i}"
end

print [1, 2, 3, 4, 5, 6].my_select { |n| n.odd? }

print [1, 2, 3, 4, 5, 6].my_all? { |n| n.positive? }

print [-1, -2, 3, -4, -5].my_any? { |n| n.positive? }

print [-1, -2, -3, -4, -5].my_none? { |n| n.positive? }

print [1, -2, 23, 2, -5].my_count { |n| n.positive? }

print %w[a b c].my_map{ |string| string.upcase }

print (1..5).my_inject { |product, n| product * n }
print [2, 4, 5].my_inject { |product, n| product * n }

proc = proc { |n| n * n }
print [1, 2, 3, 4, 5].my_map(proc)
