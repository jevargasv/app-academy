require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = create_cups
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, idx|
      next if idx == 13 || idx == 6
      4.times { cup << :stone }
    end
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 14
      raise "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise "Starting cup is empty"
    end

    true
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].length
    @cups[start_pos].clear

    next_pos = start_pos
    until stones.empty?
      next_pos += 1
      next_pos = 0 if next_pos > 13

      if next_pos == 6
        @cups[next_pos] << :stone if current_player_name == @name1
      elsif next_pos == 13
        @cups[next_pos] << :stone if current_player_name == @name2
      else
        @cups[next_pos] << :stone
      end

      stones -= 1
    end

    render
    next_turn(next_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end

  def create_cups
    Array.new(14) { Array.new }
  end
end
