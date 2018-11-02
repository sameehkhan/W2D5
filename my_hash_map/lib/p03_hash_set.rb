class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end
  def insert(key)
    unless self.include?(key)
      self[key] << key
      @count += 1
      resize! if @count > num_buckets
    end
  end

  def remove(key)
    if self.include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  private

  def [](key)
    # optional but useful; return the bucket corresponding to `num`
    @store[key.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2){Array.new}
    @store.each do |el|
      el.each do |num|
        new_store[num % new_store.length] << num
      end
    end
    @store = new_store
  end

end