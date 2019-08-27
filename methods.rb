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
end

%w[cat dog horse].my_each_with_index do |value,i|
  puts "#{value} is at position #{i}"
end
