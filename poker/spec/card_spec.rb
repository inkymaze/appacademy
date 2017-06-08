require 'rspec'
require 'card'

describe Card do
  subject(:card) { Card.new(:spades, 10)}
  describe '#initialize' do

    it 'should assign suit' do
      expect(card.suit).to eq(:spades)
    end

    it 'should assign a value' do
      expect(card.value).to eq(10)
    end
  end

end
