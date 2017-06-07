require_relative 'piece'

class Pawn < Piece

  def moves
    forward_steps + side_attacks
  end

  protected

  def at_start_row?
    row = pos[0]
    if color == :white && row == 1
      return true
    elsif color == :black && row == 6
      return true
    end
    false
  end

  def forward_dir
    if color == :white
      [1, 0]
    else
      [-1, 0]
    end
  end

  def forward_steps
    co = color
    out = []
    target = pos.pair_sum(forward_dir)
    if @board.in_bounds(target)
      if @board.blocked?(target, co) == :empty
        out << target
        target = target.pair_sum(forward_dir)
        if @board.blocked?(target, co) == :empty && at_start_row?
          out << target
        end
      end
    end
    out
  end

  def side_attacks
    out = []
    side_swipes = [forward_dir.pair_sum([0, -1]), forward_dir.pair_sum([0, 1])]
    side_swipes.each do |el|
      target = el.pair_sum(pos)
      if @board.in_bounds(target) && @board.blocked?(target, @color) == :enemy
        out << target
      end
    end
    out
  end

end
