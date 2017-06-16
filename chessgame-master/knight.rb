require_relative 'piece'

class Knight < Piece
  include Stepable
  def symbol
    "N"
  end

  def moves_diffs
    [[-1,-2],[-1,2],[1,-2],[1,2],[2,-1],[2,1],[-2,1],[-2,-1]]
  end
  
end
