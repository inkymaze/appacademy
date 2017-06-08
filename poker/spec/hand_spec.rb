require 'rspec'
require 'hand'
require 'deck'

describe Hand do

  let(:deck) {Deck.new}
  subject(:hand) {Hand.new(deck)}

  describe '#initialize' do

    it 'should draw 5 cards from the deck' do
      expect(hand.hand.length).to eq(5)
    end

  end

  describe '#hand_rank' do
    it 'should return highest hand rank' do
      expect(hand.hand_rank).to be_truthy
    end

    it 'should return royal_flush' do
      hand.hand = [Card.new(10, :spades),Card.new(11, :spades),
        Card.new(12, :spades), Card.new(13, :spades), Card.new(14, :spades)]
      expect(hand.hand_rank).to eq("royal_flush")
    end

    it 'should return straight_flush' do
      hand.hand = [Card.new(5, :spades),Card.new(6, :spades),
        Card.new(7, :spades), Card.new(8, :spades), Card.new(9, :spades)]
      expect(hand.hand_rank).to eq("straight_flush")
    end

    # it 'should return four of a kind' do
    #   hand.hand = [Card.new(6, :spades), Card.new(6, :hearts),
    #   Card.new(6, :diamonds), Card,new(6, :clubs), Card,new(10, :hearts)]
    #   expect(hand.hand_rank).to eq("")
    # end

    it 'should return full house'

    it 'should return flush'

    it 'should return straight'

    it 'should return three of a kind'

    it 'should return two pair'

    it 'should return one pair'
  end













end
