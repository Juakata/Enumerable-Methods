module Enumerable
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i+=1
    end
  end
end

[1,2,3,4,5].my_each do |i|
  puts i
end
