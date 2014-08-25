class Gameboard

  PlayerPosition = Struct.new(:x, :y)
  MinMaxCoords = Struct.new(:minX, :maxX, :minY, :maxY)

  def self.load_level_from_file(file_name)
    puts "Creating level from file #{file_name}"
    level = []
    file = File.open(file_name, "r")
    file.each_line do |line|
      level << line.chomp.split("")
    end
    Gameboard.new(level)
  end

  def self.file_exists?(file_name)
    return false unless file_name
    return false unless File.exist?(file_name)
    return true
  end

  def self.file_useable?(file_name)
    return false unless file_name
    return false unless File.exist?(file_name)
    return false unless File.readable?(file_name)
    return false unless File.writable?(file_name)
    return true
  end

  def initialize(level)
    @level = level
    @min_max_coords = init_min_max_coords
    @num_crates_to_move = 0
    init_play_pos_and_num_crates
  end

  def init_min_max_coords
    MinMaxCoords.new(0, @level[0].length - 1, 0, @level.length - 1)
  end

  def init_play_pos_and_num_crates
    player_pos = []
    # first and final row will always be walls so we can skip looking there
    # TODO: don't look at first and last column also
    @level[1..-2].each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        if GameConfig::game_items[cell] == GameConfig::game_items["@"]
          @player_pos = PlayerPosition.new(col_index, row_index + 1)
        elsif GameConfig::game_items[cell] == GameConfig::game_items["o"]
          @num_crates_to_move += 1
        end
      end
    end
    puts "Player is starting at #{player_pos} with #{@num_crates_to_move} to place"
    player_pos
  end

  def print_level
    @level.each do |row|
      puts "#{row.join("")}"
    end
  end

  def move_player(direction)
    next_cell = move_allowed(direction)
    return false if !next_cell

    return false if is_wall(next_cell)
  end

  def is_wall(next_cell)
    next_cell == GameConfig::game_items["#"]
  end

  def move_allowed(direction)
    pos_after_move = get_cell_after_move(direction)
    puts "#{pos_after_move}"
    return false if !pos_after_move
    return pos_after_move
  end

  # def get_cell(x, y)
  #   @level[x][y]
  # end

  def get_cell_after_move(direction)
    case
      when direction == :left
        get_left
      when direction == :right
        get_right
      when direction == :up
        get_up
      when direction == :down
        get_down
    end
  end

  private
  def get_left
    new_val = @player_pos.x - 1
    return nil if new_val < @min_max_coords.minX
    @level[@player_pos.y][new_val]
  end

  def get_right
    new_val = @player_pos.x + 1
    return nil if new_val > @min_max_coords.maxX
    @level[@player_pos.y][new_val]
  end

  def get_up
    new_val = @player_pos.y - 1
    return nil if new_val < @min_max_coords.minY
    @level[new_val][@player_pos.x]
  end

  def get_down
    new_val = @player_pos.y + 1
    return nil if new_val > @min_max_coords.maxY
    @level[new_val][@player_pos.x]
  end

end