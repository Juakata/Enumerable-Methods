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
    my_each { |e| arr.push(e) if block.call(e) }
    arr
  end

  def my_all?
    result = true
    my_each { |e| result = false unless yield(e) }
    result
  end

  def my_any?
    result = false
    my_each { |e| result = true if yield(e) }
    result
  end

  def my_none?
    result = true
    my_each { |e| result = false if yield(e) }
    result
  end

  def my_count
    result = 0
    my_each { |e| result += 1 if yield(e) }
    result
  end

  def my_map(proc = nil, &block)
    arr = []
    if proc
      my_each { |e| arr.push(proc.call(e)) }
    else
      my_each { |e| arr.push(block.call(e)) }
    end
    arr
  end

  def my_inject(&block)
    if instance_of? Range
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
      while i < length
        result = block.call(result, self[i])
        i += 1
      end
    end
    result
  end
end
