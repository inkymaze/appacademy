module Stepable

  def moves
    arr = moves_diffs.map do |diff|
      self.pos.pair_sum(diff)
    end
    arr.select do |move|
      @board.in_bounds(move) && @board.blocked?(move, self.color) != :ally
    end
  end
end
