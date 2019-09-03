# frozen_string_literal: true

# spec/method_spec.rb

require './methods.rb'

RSpec.describe Enumerable do
  let(:test_array_1) { [1, 2, 3, 4, 5] }
  let(:test_array_2) { [3] }
  let(:test_array_3) { [2, 4, 6, 8, 10] }
  let(:test_array_4) { [nil, true, 99] }
  describe '#my_each' do
    it 'returns all elements in the array' do
      expect(test_array_1.my_each { |e| e }).to eql(test_array_1)
    end
  end

  describe '#my_each_with_index' do
    it 'returns all elements with the index in the array' do
      expect(test_array_1.my_each_with_index { |_e, i| i }).to eql(test_array_1)
    end
  end

  describe '#my_select' do
    it 'returns an array depending on the condition' do
      expect(test_array_1.my_select { |e| e % 3 == 0 }).to eql(test_array_2)
    end
  end

  describe '#my_all' do
    it 'returns true if all the elements meet the condition' do
      expect(test_array_1.my_all? { |e| e % 3 == 0 }).to eql(false)
    end
    it 'returns true if all the elements meet the condition' do
      expect(test_array_4.my_all?).to eql(false)
    end
  end

  describe '#my_any' do
    it 'returns true if any elements meet the condition' do
      expect(test_array_1.my_any? { |e| e % 3 == 0 }).to eql(true)
    end
    it 'returns true if any elements meet the condition' do
      expect(test_array_4.my_any?).to eql(true)
    end
  end

  describe '#my_none' do
    it 'returns true if none elements meet the condition' do
      expect(test_array_1.none? { |e| e % 3 == 0 }).to eql(false)
    end
    it 'returns true if none elements meet the condition' do
      expect(test_array_4.none?).to eql(false)
    end
  end

  describe '#my_count' do
    it 'returns how many times is the number on the array' do
      expect(test_array_1.my_count(3)).to eql(1)
    end
    it 'returns how many times is the number on the array' do
      expect(test_array_1.my_count).to eql(5)
    end
    it 'returns how many times is the number on the array' do
      expect(test_array_1.my_count { |e| e > 2 }).to eql(3)
    end
  end

  describe '#my_map' do
    it 'returns a new array that meets the condition' do
      expect(test_array_1.my_map { |e| e * 2 }).to eql(test_array_3)
    end
    it 'returns a new array that meets the condition' do
      expect(test_array_1.my_map(proc { |e| e * 2 })).to eql(test_array_3)
    end
  end

  describe '#my_inject' do
    it 'returns a new array that meets the condition' do
      expect(test_array_1.my_inject(5) { |sum, e| sum + e }).to eql(20)
    end
    it 'returns a new array that meets the condition' do
      expect((1..5).my_inject(5) { |sum, e| sum + e }).to eql(20)
    end
  end
end
