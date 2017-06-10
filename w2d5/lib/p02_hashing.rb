class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    fix_int = 0
    self.each_with_index do |el, i|
      fix_int += el.hash * (i + 1)
    end
    fix_int
  end
end

class String
  def hash
    fix_int = 0
    self.chars.each_with_index do |el, i|
      fix_int += el.ord.hash * (i + 1)
    end
    fix_int
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    fix_int = 0
    self.to_a.each do |arr|
      arr.each_with_index {|el, i| fix_int += el.to_s.hash * (i + 1) }
    end
    fix_int
  end
end
