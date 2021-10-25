require_relative 'player.rb'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14)
    self.place_stones
    @player_1 = Player.new(name1,1)
    @player_2 = Player.new(name2,2)
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cups, i|
      if i == 6 || i == 13
        @cups[i] = []
      else
        @cups[i] = Array.new(4,:stone)
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 13
      raise "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    stone_count = @cups[start_pos].length
    @cups[start_pos] = []
    until stone_count == 0
      pos = (start_pos+1)%14
      if current_player_name == @player_1.name
        if pos == 13
          start_pos += 1
          next
        end
      else
        if pos == 6
          start_pos += 1
          next
        end
      end
      @cups[pos] << :stone
      start_pos += 1
      stone_count -= 1
    end
    self.render
    next_turn(start_pos%14)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length > 1
      return ending_cup_idx
    else
      return :switch
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
    @cups[0..5].all?{|cup| cup.empty?} || @cups[7..12].all?{|cup| cup.empty?}
  end

  def winner
    if @cups[6].length == @cups[13].length
      return :draw
    elsif @cups[6].length > @cups[13].length
      return @player_1.name
    else
      return @player_2.name
    end
  end
end
