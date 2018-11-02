class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each_with_index do |parts, idx|
      sum += parts.hash * idx  
    end 
    sum.hash 
  end  
end

class String
  def hash
    sum = 1
    chars.each.with_index {|ch, i| sum *= ch.ord * i + 2}
    # my_hash(sum*length)
    sum.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0
    self.each do |k, v|
      sum += k.hash 
      sum += v.hash 
    end 
    sum.hash 
  end
end

