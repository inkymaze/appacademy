class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game

  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    puts "Whats the current sequence?"
    user_seq = gets.chomp
    user_seq.split(" ").each_with_index do |color, i|
      if @seq[i] != color
        @game_over = true
      end 
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "You Win"
  end

  def game_over_message
    puts "You Lose"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
