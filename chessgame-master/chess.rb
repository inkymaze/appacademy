
require_relative 'player'
require_relative 'human_player'
require_relative 'board'
require_relative 'display'

class Game

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @board = Board.new
    @cursor = Cursor.new([4,4], @board)
    @display = Display.new(@board,@cursor)
  end


  def play
    system ('clear')
    @display.render
    pos = @current_player.play_turn(@cursor)
    moved = @board.move_piece(@current_player.color, pos.first, pos.last)

    swap_turns if moved
    if @board.checkmate?(@current_player.color) && in_check?(@current_player.color)
      puts "Game Over"
      return
    end
    play
  end

  private

  def notify_players
  end

  def swap_turns
    @current_player = @current_player == @player1 ? @player2 : @player1
  end


end

player1 = HumanPlayer.new(:white)
player2 = HumanPlayer.new(:black)
game = Game.new(player1, player2)
game.play
