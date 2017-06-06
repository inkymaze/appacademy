module Slideable

  def moves
    arr = move_dirs.map do |diff|
      self.pos.pair_sum(diff)
    end
    arr.select {|move| @board.in_bounds(move) }

  end

  private

  def move_dirs
    if self.class==Queen
      movetype=horizontal_dirs+diagonal_dirs
    elsif self.class==Bishop
      movetype=diagonal_dirs
    elsif self.class==Rook
      movetype=horizontal_dirs
    end
    out=[]
    movetype.each do |dpos|
      out.concat(grow_unblocked_moves_in_dirs(dpos))
    end
    out
  end

  def horizontal_dirs
    [[1,0], [-1,0], [0,1], [0,-1]]
  end

  def diagonal_dirs
    [[-1,-1], [1,-1],[-1,1], [1,1]]
  end

  def grow_unblocked_moves_in_dirs(dpos)
    co=@color
    out = []
    pos = self.pos
    done = false
    until done
      pos = pos.pair_sum(dpos)
      if @board.blocked?(pos,co)==true || !@board.in_bounds(pos)
        done=true
      elsif @board.blocked?(pos,co)==false
        done=true
        out<<pos
      else
        out<<pos
      end
    end
    out
  end

end
