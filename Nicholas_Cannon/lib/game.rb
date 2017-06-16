require_relative './ai_player'

class Game
  # ::deal_in_players is a factory method that:
  # 1) Takes in an array of cards
  # 2) deals cards in an alternating pattern & creates 2 AIPlayers
  # 3) return instance of Game
  def self.deal_in_players(deck)
    hand1 = []
    hand2 = []

    deck.each_with_index do |card, i|
      if i.odd?
        hand1 << card
      else
        hand2 << card
      end
    end

    Game.new(AIPlayer.new(hand1),AIPlayer.new(hand2))

  end

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  # call do_battle until game is over
  def play
    until game_over?
      do_battle
    end

    rescue OutOfCardsError
  end

  # 1. Players each take their top card
  # 2. If the cards' rank is the same, first, take an additional card
  #    prisoner from each player. Then, repeat #do_battle.
  # 3. If the last drawn cards are different ranks, all the cards drawn in
  #    this round are awarded to the drawer of the higher ranked card.
  def do_battle(prisoners = [])
    first_card = @player1.take_card
    second_card = @player2.take_card

    prisoners << first_card
    prisoners << second_card

    case first_card <=> second_card

    when -1
      @player2.give_won_cards(prisoners)

    when 0
      prisoners << @player1.take_card
      prisoners << @player2.take_card
      do_battle(prisoners)

    when 1
      @player1.give_won_cards(prisoners)

    end

  end

  # if either of the players has run out of cards, the game is over
  def game_over?
    @player1.out_of_cards? || @player2.out_of_cards?
  end
end
