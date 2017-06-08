require 'deck'

class Hand
  attr_accessor :hand
  def initialize(deck)
    @hand = []
    @deck = deck
    populate
  end

  def populate
    5.times do
      @hand << @deck.draw
    end
  end


  def hand_rank
    sorted_hand = @hand.sort_by {|card| card.value }

    if royal_flush(sorted_hand)
      return "royal_flush"
    elsif straight_flush(sorted_hand)
      return "straight_flush"
    elsif four_of_a_kind(sorted_hand)
      return "four_of_a_kind"
    elsif full_house(sorted_hand)
      return "full_house"
    elsif flush(sorted_hand)
      return "flush"
    elsif straight(sorted_hand)
      return "straight"
    elsif three_of_a_kind(sorted_hand)
      return "three_of_a_kind"
    elsif two_pair(sorted_hand)
      return "two_pair"
    elsif pair(sorted_hand)
      return "pair"
    else
      "high_card"
    end
  end


  def royal_flush(cards)
    cards.each_with_index do |card, i|
     return false unless cards[0].value == 10
     next if i + 1 == cards.length
     return false if cards[i + 1].value - 1 != cards[i].value
     return false unless cards.all? {|card| cards[0].suit == card.suit}
    end
    true
  end

  def straight_flush(cards)
    cards.each_with_index do |card, i|
     next if i + 1 == cards.length
     return false if cards[i + 1].value - 1 != cards[i].value
     return false unless cards.all? {|card| cards[0].suit == card.suit}
    end
    true
  end

  def four_of_a_kind
  end

  def full_house
  end

  def flush
  end

  def straight
  end

  def three_of_a_kind
  end

  def two_pair
  end

  def pair
  end

  def high_card
  end


end
