module Enumerable
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i+=1
    end
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i],i)
      i+=1
    end
  end

  def my_select
    arr = []
    i = 0
    while i < self.length
      arr.push(self[i]) if yield(self[i])
      i+=1
    end
    arr
  end

  def my_all?
    result = true
    i = 0
    while i < self.length
      if !yield(self[i])
        result=false
      end
      i+=1
    end
    result
  end

  def my_any?
    result = false
    i = 0
    while i < self.length
      result = true if yield(self[i])
      i+=1
    end
    result
  end

  def my_none?
    result = true
    i = 0
    while i < self.length
      result=false if yield(self[i])
      i+=1
    end
    result
  end
end

#testing the methods

[1,2,3,4,5].my_each do |i|
  puts i
end

%w[cat dog horse].my_each_with_index do |value,i|
  puts "#{value} is at position #{i}"
end

print [1,2,3,4,5,6].my_select { |n| n.odd? }

print [1,2,3,4,5,6].my_all? { |n| n>0 }

print [-1,-2,3,-4,-5].my_any? { |n| n>0 }

print [-1,-2,-3,-4,-5].my_none? { |n| n>0 }
