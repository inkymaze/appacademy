require_relative 'piece'

class King < Piece
  include Stepable

  def moves_diffs
    [[-1,-1],[0,-1],[1,-1],[-1,0],[1,0],[-1,1],[0,1],[1,1]]
  end
end
