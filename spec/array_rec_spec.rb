require 'my_inject_rec'

describe Array do
  context 'recursive method' do
    it 'takes block to add numbers in an array' do
      expect([1, 4, 5].inject { |sum, num| sum + num }).to eq 10
      expect([1, 4, 5].my_inject_rec { |sum, num| sum + num }).to eq 10
    end
    it 'takes block to subtract numbers in an array' do
      expect([1, 4, 5].inject { |sum, num| sum - num }).to eq(-8)
      expect([1, 4, 5].my_inject_rec { |sum, num| sum - num }).to eq(-8)
    end
    it 'takes block to multiply numbers in an array' do
      expect([1, 4, 5].inject { |sum, num| sum * num }).to eq 20
      expect([1, 4, 5].my_inject_rec { |sum, num| sum * num }).to eq 20
    end
    it 'takes block to add numbers in an array with a start number' do
      expect([1, 4, 5].inject(3) { |sum, num| sum + num }).to eq 13
      expect([1, 4, 5].my_inject_rec(3) { |sum, num| sum + num }).to eq 13
    end
    it 'takes block to subtract numbers in an array with a start number' do
      expect([1, 4, 5].inject(3) { |sum, num| sum - num }).to eq(-7)
      expect([1, 4, 5].my_inject_rec(3) { |sum, num| sum - num }).to eq(-7)
    end
    it 'takes block to multiply numbers in an array with a start number' do
      expect([1, 4, 5].inject(3) { |sum, num| sum * num }).to eq 60
      expect([1, 4, 5].my_inject_rec(3) { |sum, num| sum * num }).to eq 60
    end
    it 'takes symbol to add numbers in an array' do
      expect([1, 4, 5].inject(:+)).to eq 10
      expect([1, 4, 5].my_inject_rec(:+)).to eq 10
    end
    it 'takes symbol to subtract numbers in an array' do
      expect([1, 4, 5].inject(:-)).to eq(-8)
      expect([1, 4, 5].my_inject_rec(:-)).to eq(-8)
    end
    it 'takes symbol to multiply numbers in an array' do
      expect([1, 4, 5].inject(:*)).to eq 20
      expect([1, 4, 5].my_inject_rec(:*)).to eq 20
    end
    it 'takes symbol to add numbers in an array with starting number' do
      expect([1, 4, 5].inject(5, :+)).to eq 15
      expect([1, 4, 5].my_inject_rec(5, :+)).to eq 15
    end
    it 'takes symbol to multiply numbers in an array with starting number' do
      expect([1, 4, 5].inject(2, :*)).to eq 40
      expect([1, 4, 5].my_inject_rec(2, :*)).to eq 40
    end
    it 'can recreate map when start is an array' do
      expect([1, 4, 5].inject([]) do |array, num|
        array << num * 2
      end).to eq [2, 8, 10]
      expect([1, 4, 5].my_inject_rec([]) do |array, num|
        array << num * 2
      end).to eq [2, 8, 10]
    end
    it 'can find the longest word' do
      longest = %w( cat sheep bear ).inject do |memo, word|
        memo.length > word.length ? memo : word
      end
      expect(longest).to eq 'sheep'
      longest = %w( cat sheep bear ).my_inject_rec do |memo, word|
        memo.length > word.length ? memo : word
      end
      expect(longest).to eq 'sheep'
    end
  end
end
