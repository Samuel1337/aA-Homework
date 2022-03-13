class Stack
  def initialize
    @store = []
  end

  def push(ele)
    store << ele
    nil
  end

  def pop
    store.pop
  end

  def peek
    store[-1]
  end

  def size 
    store.length
  end

  def empty?
    store.empty?
  end

  private
  attr_accessor :store
end

class MyQueue
  def initialize
    @inner_array = []
  end

  def enqueue(ele)
    inner_array << ele
    nil
  end

  def dequeue(ele)
    inner_array.shift
  end

  def show 
    inner_array.dup
  end

  def empty?
  inner_array.empty?
  end

  def size
    inner_array.length
  end

  private 
  attr_accessor :inner_array
end

class Map
  def initialize

  end
end

