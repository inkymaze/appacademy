require 'rspec'
require 'deck'

describe Deck do

  subject(:deck) {Deck.new}

  describe '#initialize' do

    it 'should start with 52 cards' do
      expect(deck.cards.size).to eq(52)
    end


    it 'should contain card objects' do
      random_card = deck.cards[15]
      expect(random_card.class).to eq(Card)
    end
  end

  # describe '#shuffle' do
  #
  #   it 'should shuffle cards randomly' do
  #     cards_dup = deck.dup
  #     deck.shuffle
  #     expect(deck.cards).to_not eq(cards_dup.cards)
  #   end
  # end

  describe '#draw' do

    it 'should take a one card object' do
      card = deck.draw
      expect(card.class).to eq(Card)
    end
  end
end
