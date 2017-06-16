require_relative 'cursor'
require_relative 'player'

class HumanPlayer < Player

  attr_reader :color

  def initialize(color = :white)
    @color = color
  end

  def play_turn(cursor)
    pos = []
    2.times do
      key = false
      key = cursor.get_input until key
      pos << key.dup
    end
    pos
  end

end
