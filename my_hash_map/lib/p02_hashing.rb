class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
  end
end

class String
  def hash
    sum = 0
    chars.each {|ch| sum += ch.ord}
    my_hash(sum)
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end

def my_hash(n)
  s = n * (0.5*(Math.sqrt(5) - 1))
  x = s % 1
  f = 8*x
  until f % 1 == 0
    f *= 10
  end
  f.floor
end
