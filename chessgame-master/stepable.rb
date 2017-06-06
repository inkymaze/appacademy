module Stepable

  def moves
    arr = moves_diffs.map do |diff|
      self.pos.pair_sum(diff)
    end
    arr.select {|move| @board.in_bounds(move) && !@board.blocked?(move, self.color)}
  end

  #protected

  def moves_diffs
    if self.class == King
      [[-1, -1], [0, -1], [1, -1], [-1, 0], [1,0], [-1, 1],[0,1],[1,1]]
    else
      [[-1, -2], [-1, 2], [1, -2], [1, 2], [2,-1], [2, 1],[-2,1],[-2,-1]]
    end
  end

end
