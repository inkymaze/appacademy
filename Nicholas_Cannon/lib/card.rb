# -*- coding: utf-8 -*-

# Represents a playing card.
class Card
  SUIT_STRINGS = {
    clubs: '♣',
    diamonds: '♦',
    hearts: '♥',
    spades: '♠'
  }

  VALUE_STRINGS = {
    deuce: '2',
    three: '3',
    four: '4',
    five: '5',
    six: '6',
    seven: '7',
    eight: '8',
    nine: '9',
    ten: '10',
    jack: 'J',
    queen: 'Q',
    king: 'K',
    ace: 'A'
  }

  # Returns an array of all suits.
  def self.suits
    SUIT_STRINGS.keys
  end

  # Returns an array of all values.
  def self.values
    VALUE_STRINGS.keys
  end

  # Returns an array of all 52 cards.
  def self.all_cards
    deck = []

    Card.suits.each do |suit|
      Card.values.each do |value|
        deck << Card.new(suit, value)
      end
    end

    deck
  end

  attr_reader :suit, :value

  # Throws an error if suit or value is not valid.
  def initialize(suit, value)
    unless Card.values.include?(value) && Card.suits.include?(suit)
      raise "invalid suit or value"
    end
    @suit, @value = suit, value
  end

  # Returns an integer value of card's rank. For example:
  # 2 of Clubs rank: 2. Jack of Hearts: 11. Ace of Spades: 14
  def rank
    paint = %w(J Q K A)
    int_val = VALUE_STRINGS[value]

    if paint.include?(int_val)
      paint.index(int_val) + 11
    else
      int_val.to_i
    end

  end

  # Returns 0 if rank is equal to other, 1 if rank is greater,
  # and -1 if rank is less.
  def <=>(other)
    self.rank <=> other.rank
  end

  # Compares two cards to see if they're equal in suit & value.
  # DO NOT CHANGE THIS METHOD
  def ==(other)
    other.suit == suit && other.value == value
  end

  def to_s
    VALUE_STRINGS[value] + SUIT_STRINGS[suit]
  end
end
