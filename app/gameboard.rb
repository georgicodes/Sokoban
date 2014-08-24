class Gameboard

  GAME_ITEMS = {"@" => "@",
                "#" => "#",
                "." => ".",
                "o" => "o",
                " " => " "}

  def self.load_level_from_file(file_name)
    puts "Creating level from file #{file_name}"
    level = []
    file = File.open(file_name, "r")
    file.each_line do |line|
      level << line.chomp.split("")
    end
    ap level
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
    @player_pos = init_player_starting_position
  end

  def init_player_starting_position
    player_pos = []
    # first and final row will always be walls so we can skip looking there
    @level[1..-2].each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        if (GAME_ITEMS[cell] == GAME_ITEMS["@"])
          player_pos << col_index
          player_pos << row_index + 1
        end
      end
    end
    puts "#{player_pos}"
    player_pos
  end

  def print_level
    @level.each do |row|
      puts "#{row[0]}"
    end
  end

  def move_player(direction)
    # return false
  end

  def move_allowed(direction)

  end

end