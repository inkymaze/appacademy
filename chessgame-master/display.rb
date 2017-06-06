require 'colorize'
require 'colorized_string'
require_relative 'board'
require_relative 'cursor'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def get_background_color(x, y)

    if @cursor.cursor_pos == [x,y]
      return :blue
    end
    :red
  end

  def render
    @board.grid.each.with_index do |row, x|
      map = row.map.with_index do |piece, y|
        background = get_background_color(x, y)

        piece.to_s.colorize(:background => background)
      end
      puts map.join('')
    end
  end



end


board=Board.new
display=Display.new(board)
display.render
p "Rook moves #{board[[0,0]].moves}"
p "Knight moves #{board[[0,1]].moves}"
p "Pawn moves #{board[[1,0]].moves}"
