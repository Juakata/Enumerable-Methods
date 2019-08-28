# frozen_string_literal: true

module Enumerable
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
  end

  def my_select(&block)
    arr = []
    i = 0
    while i < self.length
      arr.push(self[i]) if block.call(self[i])
      i += 1
    end
    arr
  end

  def my_all?
    result = true
    i = 0
    while i < self.length
      result = false unless yield(self[i])
      i += 1
    end
    result
  end

  def my_any?
    result = false
    i = 0
    while i < self.length
      result = true if yield(self[i])
      i += 1
    end
    result
  end

  def my_none?
    result = true
    i = 0
    while i < self.length
      result = false if yield(self[i])
      i += 1
    end
    result
  end

  def my_count
    result = 0
    i = 0
    while i < self.length
      result += 1 if yield(self[i])
      i += 1
    end
    result
  end

  def my_map(proc = nil, &block)
    arr = []
    i = 0
    if proc
      while i < self.length
        arr.push(proc.call(self[i]))
        i += 1
      end
    else
      while i < self.length
        arr.push(block.call(self[i]))
        i += 1
      end
    end
    arr
  end

  def my_inject(&block)
    if self.instance_of? Range
      result = self.first
      i = self.first
      while i <= self.last
        result = block.call(result, i) unless i == self.first
        i += 1
      end
    else
      i = 1
      result = self[0]
      while i < self.length
        result = block.call(result, self[i])
        i += 1
      end
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

print %w[a b c].my_map{ |string| string.upcase}

print (1..5).my_inject { |product, n| product * n }
print [2, 4, 5].my_inject { |product, n| product * n }

proc = Proc.new { |n| n * n }
[1, 2, 3, 4, 5].my_map(proc)
