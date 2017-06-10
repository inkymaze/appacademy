require 'byebug'
class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @head = Link.new
    @tail = Link.new
    @head.prev = @tail
    @tail.next = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @tail
  end

  def last
    @head
  end

  def empty?
    return true if @head.prev == @tail
    return true if @tail.next == @head
    false
  end

  def get(key)
    self[key]
  end

  def include?(key)
    return true if self[key]
    false
  end

  def append(key, val)
    #debugger
    new_link = Link.new(key, val)
    jeff = @tail.next
    jeff.prev = new_link
    new_link.prev = @tail
    @tail.next = new_link
    new_link.next = jeff

  end

  def update(key, val)
    self[key] = val
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
