require 'card'


class Deck
  attr_reader :cards
  SUITS = [:spades, :hearts, :clubs, :diamonds]
  VALUES = [2,3,4,5,6,7,8,9,10,11,12,13,14]
  def initialize
    @cards = []
    populate
    shuffle
  end

  def populate
    SUITS.each do |suit|
      VALUES.each do |value|
        @cards << Card.new(suit, value)
      end
    end
  end

  def draw
    @cards.pop
  end

  def shuffle
    @cards.shuffle!
  end

end
