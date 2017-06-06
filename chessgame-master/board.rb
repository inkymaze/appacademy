require_relative 'piece'
require 'byebug'

class Board
  attr_reader :grid

  def initialize
    @null = NullPiece.instance
    @grid = Array.new(8) { Array.new(8) { @null } }
    make_starting_grid
    @black_king = self[7,4]
    @white_king = self[0,4]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def dup
    copy = self.dup
    copy.grid.each do |row|
      row = row.dup
      row.each do |piece|
        piece = piece.dup
        piece.board = copy
      end
    end
    copy 
  end

  def in_check?(color)
    king_pos = find_king_color(color)
    @grid.each do |row|
      row.each do |tile|
        if tile.valid_moves.include?(king_pos) && tile.color != color
          return true
        end
      end
    end
    false
  end

  def checkmate?(color)
  end

  def in_bounds(pos)
    pos.each do |el|
      return false unless el.between?(0,7)
    end
    true
  end

  #def move_piece(color, from_pos, to_pos)
  #end


  def move_piece(start_pos, end_pos)
    if self[start_pos]==nil
      raise ArgumentError.new("No piece at start position!")
    end
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

  def blocked?(tile, side)
    occupant = self[tile]
    if occupant.is_a?(NullPiece)
      nil
    elsif occupant.color == side
      true
    else
      false
    end
  end

  protected

  def setup_helper(hash, columns, type)

    columns.each do |col|
      hash.each do |key, color|
        pos = [key, col]
        self[pos] = type.new(self, pos, color)
      end
    end
  end

  def make_starting_grid

    hash = { 0 => :white, 7 => :black }
    setup_helper(hash, [0, 7], Rook)
    setup_helper(hash, [1, 6], Knight)
    setup_helper(hash, [2, 5], Bishop)
    setup_helper(hash, [3], Queen)
    setup_helper(hash, [4], King)

    hash = { 1 => :white, 6 => :black }
    setup_helper(hash, (0..7).to_a, Pawn)

  end

  def find_king_color(color)
    if color == :white
      @white_king
    else
      @black_king
    end
  end

end
