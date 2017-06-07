require_relative 'piece'

class NullPiece < Piece
  include Singleton

  def initialize

  end

  def symbol
    " "
  end

end
