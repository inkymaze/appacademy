require 'singleton'
require_relative 'slideable'
require_relative 'stepable'
require 'byebug'

class Array
  def pair_sum(ary2)
    [self.first + ary2.first, self.last + ary2.last]
  end
end

class Piece
  attr_reader :color
  attr_accessor :board, :pos

  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
  end

  def to_s
    if @color == :black
      symbol.colorize(:black)
    else
      symbol.colorize(:white)
    end
  end

  def empty?
    self.is_a?(NullPiece)
  end

  def symbol
    self.class.name[0]
  end

  def valid_moves
    self.moves.reject do |move|
      copy = board.dup
      copy.move_piece!(@pos, move)
      copy.in_check?(@color)
    end
  end

  private

  def move_into_check(to_pos)
  end
end
