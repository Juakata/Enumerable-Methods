module Enumerable
  def my_each
    self[0]
  end
end

[1,2,3,4,5].each do |i|
  puts i
end
