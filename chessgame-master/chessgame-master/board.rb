require_relative 'piece_list'

class Board
  attr_reader :grid
  attr_accessor :black_king, :white_king

  def initialize
    @null = NullPiece.instance
    @grid = Array.new(8) { Array.new(8) { @null } }
    make_starting_grid
    @black_king = @grid[7][4]
    @white_king = @grid[0][4]
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
    copy = Board.new
    @grid.flatten.each do |piece|
      unless piece.is_a? NullPiece
        pos = piece.pos
        color = piece.color
        new_piece = piece.class.new(copy, pos, color)
        copy[pos] = new_piece
      end
    end
    copy.black_king = @black_king
    copy.white_king = @white_king
    copy
  end

  def in_check?(color)
    king_pos = find_king_color(color)
    @grid.flatten.any? do |tile|
      if tile.is_a? NullPiece
        false
      elsif tile.color == color
        false
      elsif tile.moves.include?(king_pos)
        true
      else
        false
      end
    end
  end

  def checkmate?(color)
    @grid.flatten.all? do |piece|
      piece.color != color && piece.valid_moves.empty?
    end
  end

  def in_bounds(pos)
    pos.all? { |el| el.between?(0, 7) }
  end

  def move_piece(color, start_pos, end_pos)
    piece = self[start_pos]
    if piece.is_a?(NullPiece)
      puts "No piece there"
      return false
    end

    unless piece.color == color
      puts "That piece belongs to your enemy"
      return false
    end

    unless piece.valid_moves.include?(end_pos)
      puts "That #{piece.class.name} cannot move there"
      return false
    end

    move_piece!(start_pos, end_pos)
    true
  end

  def move_piece!(start_pos, end_pos)
    self[end_pos] = self[start_pos]
    self[end_pos].pos = end_pos
    self[start_pos] = NullPiece.instance
  end

  def blocked?(tile, side)
    occupant = self[tile]
    if occupant.is_a?(NullPiece)
      :empty
    elsif occupant.color == side
      :ally
    else
      :enemy
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
      @white_king.pos
    else
      @black_king.pos
    end
  end

end
