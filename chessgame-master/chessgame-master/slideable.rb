module Slideable

  def moves
    move_dirs.inject([]) do |accum, dpos|
      accum + grow_unblocked_moves_in_dirs(dpos)
    end
  end

  private

  def horizontal_dirs
    [[1, 0], [-1, 0], [0, 1], [0, -1]]
  end

  def diagonal_dirs
    [[-1, -1], [1, -1], [-1, 1], [1, 1]]
  end

  def grow_unblocked_moves_in_dirs(dpos)
    co = @color
    out = []
    pos = self.pos##program crashes if you remove this line
    done = false
    until done
      pos = pos.pair_sum(dpos)
      if (!@board.in_bounds(pos)) || @board.blocked?(pos, co) == :ally
        done = true
      elsif @board.blocked?(pos, co) == :enemy
        done = true
        out << pos
      else
        out << pos
      end
    end
    out
  end

end
