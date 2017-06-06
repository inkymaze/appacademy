require 'singleton'
require_relative 'slideable'
require_relative 'stepable'

class Array
  def pair_sum(ary2)
    [self.first+ary2.first, self.last+ary2.last]
  end
end

class Piece
  attr_reader :pos, :color
  attr_accessor :board

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

  end

  def symbol
    self.class.name[0]
  end

  def valid_moves
    copy = board.dup
    self.moves.select do |move|
      copy = board.dup
      copy.move_piece(@pos, move)
      return false if copy.in_check?(@color)
      true
    end
  end

  private

  def move_into_check(to_pos)
  end
end


class NullPiece < Piece
  include Singleton

  def initialize

  end

  def symbol
    " "
  end

end

class Bishop <Piece
  include Slideable

end

class Queen < Piece
  include Slideable

end

class Rook < Piece
  include Slideable
end

class King < Piece
  include Stepable
end

class Knight < Piece
  include Stepable
  def symbol
    "N"
  end
end

class Pawn < Piece

  def moves
    forward_steps + side_attacks
  end

  protected

  def at_start_row?
    row=self.pos[0]
    if self.color==:white&&row==1
      return true
    elsif self.color==:black&&row==6
      return true
    end
    false
  end

  def forward_dir
    if self.color==:white
      return [1,0]
    else
      return [-1,0]
    end
  end

  def forward_steps
    co=@color
    out=[]
    target=self.pos.pair_sum(forward_dir)
    if @board.blocked?(target,co).nil? && @board.in_bounds(target)
     out<<target
     target=target.pair_sum(forward_dir)
     if @board.blocked?(target,co).nil?&&at_start_row?
       out<<target
     end
   end
   out
  end

  def side_attacks
    out = []
    side_swipes = [forward_dir.pair_sum([0,-1]), forward_dir.pair_sum([0,1])]
    side_swipes.each do |el|
      target = el.pair_sum(self.pos)
      if @board.blocked?(target,@color) == false
        out << target
      end
    end
    out
  end

end
