class MaxIntSet
  attr_reader :max
  def initialize(max)
    @store = Array.new(max)
    @max = max
    
  end

  def insert(num)
    raise "out of bounds" if num > max || num < 0
    @store << num
  end

  def remove(num)
    raise "out of bounds" if num > max || num < 0
    idx = @store.index_of(num)
    @store.remove(idx)
  end

  def include?(num)
    raise "out of bounds" if num > max || num < 0
    return true if @store.include?(num)
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num] << num
  end

  def remove(num)
    @store[num].delete(num) if self.include?(num)

  end

  def include?(num)
    @store[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    result = num % num_buckets
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
    @store[num] << num
    @count += 1
    self.resize!
  end

  def remove(num)
    @store[num].delete(num) if self.include?(num)
  end

  def include?(num)
    @store[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    result = num % num_buckets
  end

  def num_buckets
    @store.length
  end

  def resize!
    @store = Array.new(num_buckets + @count) { Array.new }
  end
end
