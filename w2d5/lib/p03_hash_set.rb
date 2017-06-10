require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    num = key.hash
    if @count == @store.length
      resize!
    end
    unless include?(key)
      self[num] << key
      @count += 1
    end
  end

  def include?(key)
    num = key.hash
    self[num].include?(key)
  end

  def remove(key)
    num = key.hash
    self[num].delete(key)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    store_dup = @store.dup
    @store = Array.new(@count * 2) { Array.new }
    @count = 0

    store_dup.each do |arr|
      arr.each do |key|
        insert(key)
      end
    end
  end
end
