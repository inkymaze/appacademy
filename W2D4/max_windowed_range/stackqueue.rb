class MyStack
  attr_reader :arr
  def initialize
    @arr = []
  end

  def push(ele)
    @arr << ele
  end

  def pop
    @arr.pop
  end

  def peek
    @arr.last
  end

  def size
    @arr.length
  end

  def empty?
    @arr.empty?
  end
end

class StackQueue
  attr_reader :deq_stack, :enq_stack
  def initialize
    @enq_stack = MyStack.new
    @deq_stack = MyStack.new
  end

  def enqueue(ele)
    @enq_stack.push(ele)
  end

  def dequeue
    unless @deq_stack == []
      @deq_stack.pop
    else
      while @enq_stack
        @deq_stack.push(@enq_stack.pop)
      end
      @deq_stack.pop
    end
  end

  def size
    @enq_stack.size + @deq_stack.size
  end

  def empty?
    @enq_stack.empty? && @deq_stack.empty?
  end
end

class MinMaxStack
  attr_reader :arr
  def initialize
    @arr = MyStack.new
  end

  def push(ele)
    new_hash = {}
    new_hash['cur_ele'] = ele
    if ele > @arr.peek['max']
      new_hash['max'] = ele
    else
      new_hash['max'] = @arr.peek['max']
    end
    if ele < @arr.peek['min']
      new_hash['min'] = ele
    else
      new_hash['min'] = @arr.peek['min']
    end
    @arr.push(new_hash)
  end

  def pop
    @arr.pop
  end

  def peek
    @arr.last
  end

  def size
    @arr.length
  end

  def empty?
    @arr.empty?
  end

  def max
    @arr.last['max']
  end
  def min
    @arr.last['min']
  end
end

class StackQueue
  attr_reader :deq_stack, :enq_stack
  def initialize
    @enq_stack = MyStack.new
    @deq_stack = MyStack.new
  end

  def enqueue(ele)
    new_hash = {}
    new_hash['cur_ele'] = ele
    if ele > @arr.peek['max']
      new_hash['max'] = ele
    else
      new_hash['max'] = @arr.peek['max']
    end
    if ele < @arr.peek['min']
      new_hash['min'] = ele
    else
      new_hash['min'] = @arr.peek['min']
    end
    @deq_stack.push(new_hash)
  end

  def dequeue
    unless @deq_stack == []
      @deq_stack.pop
    else
      new_hash = {}
      new_hash['min'] = @enq_stack.peek['min']
      new_hash['max'] = @enq_stack.peek['max']
      while @enq_stack.peek['cur_ele']
        @deq_stack.push(@enq_stack.pop)
      end
      @deq_stack.pop
      @enq_stack.pop unless @enq_stack == []
      @enq_stack.push(new_hash)
    end
  end

  def size
    @enq_stack.size + @deq_stack.size
  end

  def empty?
    @enq_stack.empty? && @deq_stack.empty?
  end
end
