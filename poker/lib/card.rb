class Card
  attr_reader :suit, :value
  
  def initialize(value, suit)
    @suit = suit
    @value = value
  end

end
