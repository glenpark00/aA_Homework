require_relative 'player'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    place_stones
    @player1 = Player.new(name1, 1)
    @player2 = Player.new(name2, 2)
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0...@cups.length).each do |i|
      unless i == 6 || i == 13
        @cups[i] = [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if cups[start_pos].nil?
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    valid_move?(start_pos)
    opponenet_store = (@player1.name == current_player_name ? 13 : 6)
    stones = cups[start_pos]
    cups[start_pos] = []
    until stones.empty?
      start_pos += 1
      start_pos = start_pos % cups.length
      unless start_pos == opponenet_store
        cups[start_pos] << stones.shift
      end
    end
    render
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif cups[ending_cup_idx].length == 1
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
    side1 = cups[0...6]
    side2 = cups[7...13]
    side1.all?(&:empty?) || side2.all?(&:empty?)
  end

  def winner
    points1 = cups[6].length
    points2 = cups[13].length
    return :draw if points1 == points2
    points1 > points2 ? @player1.name : @player2.name
  end
end
