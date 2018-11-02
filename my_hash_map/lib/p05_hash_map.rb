require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store.each do |bucketss|
      return true if bucketss.include?(key)
    end 
    false 
  end

  def set(key, val)
    i = key.hash 
    linked = i % num_buckets
    @store[linked].append(key,val)
  end

  def get(key)
  end

  def delete(key)
  end

  def each
    @store.each do |lists|
      lists.each do |node|
        yield(node.key,node.val)
      end 
    end 
  end

  def inspect
    "#{@count}"
  end 
  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
  end
  
  # def inspect
  # 
  # end 

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
