class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    place_stones
  end





  def place_stones
    @cups.each_with_index do |cup, i|
      unless i == 13 || i == 6
        4.times do
          cup << :stone
        end
      end
    end
  end

  def valid_move?(start_pos)

    raise "Invalid starting cup" unless start_pos.between?(0,5) || start_pos.between?(7,12)
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)

    stones_to_move = @cups[start_pos]
    @cups[start_pos] = []

    current_idx = start_pos
    until stones_to_move.empty?
      current_idx += 1
      current_idx = 0 if current_idx > 13

      if current_idx == 13
        @cups[13]  << stones_to_move.pop if current_player_name == @name2
      elsif current_idx == 6
        @cups[6] << stones_to_move.pop if current_player_name == @name1
      else
        @cups[current_idx] << stones_to_move.pop
      end
    end


    # opponent_player_cup = current_player_name == @name1 ? 13 : 6
    # stones_to_move = @cups[start_pos].count
    # @cups[start_pos] = []
    # next_pos = start_pos + 1
    # stones_to_move.times do
    #   @cups[next_pos] << :stone unless next_pos == opponent_player_cup
    #   next_pos = (next_pos + 1) % 13
    # end
    render
    # last_pos = next_pos - 1 > 0 ? (next_pos - 1) : 13
    #
    next_turn(current_idx)


  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all? {|cup| cup.empty?}
    return true if @cups[7..12].all? {|cup| cup.empty?}
    false
  end

  def winner
    first_player = @cups[6].count
    second_player = @cups[13].count

    if first_player == second_player
      :draw
    else
      first_player > second_player ? @name1 : @name2
    end
  end
end
