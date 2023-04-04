require "byebug"
class MaxIntSet

  attr_reader :store

  def initialize(max)
    @max_val = max
    @set = Set.new
    # @store = []
    @store = Hash.new(false)
  end

  def insert(num)
    if num < 0 || num > @max_val
      raise "Out of bounds"
    else
      # @store.unshift(num)
      @store[num] = true
    end
    
  end

  def remove(num)
    # @store.pop(num)
    @store.delete(num)
  end

  def include?(num)
    # @store.include?(num)
    @store.has_key?(num)
  end

  private

  def is_valid?(num)
    return true if @store.has_key?(num) && @store[num] == true
  end

  def validate!(num)

  end
end

class IntSet

  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @set = Set.new
  end

  def insert(num)
    @store[num] = num
  end

  def remove(num)
    @store.delete(num)
  end

  def include?(num)
    @store.include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    @count += 1 if @store[num] != num
    @store[num] = num
    resize! if @count >= num_buckets 
  end

  def remove(num)
    if @store.include?(num)
      @store.delete(num)
      @count -= 1 
    end
  end

  def include?(num)
    @store.include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    # @store += Array.new(num_buckets * 2) {Array.new}
    if @count >= num_buckets
      @store += Array.new(num_buckets * 2) {Array.new}
    end
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end
end