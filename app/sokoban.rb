class Sokoban

  def initialize(path)
    if !Gameboard.file_exists?(path)
      puts "File doesn't exist, cannot import level"
      return -1
    end
    @gameboard = Gameboard.load_level_from_file(path)
  end

  def launch!
    intro
    result = nil
    until result == :quit
      user_response = get_action
      result = perform_action(user_response)
    end
    outro
  end

  def get_action
    action = nil
    until GameConfig::actions.keys.include?(action)
      puts "Allowed actions: " + GameConfig::actions.keys.join(", ") if action
      print "> "
      action = gets.chomp.downcase.strip
      # args = gets.chomp.downcase.strip.split(' ')
      # action = args.shift
    end
    return action
  end

  def perform_action(action)
    actions_symbol = GameConfig::actions[action]
    return nil if actions_symbol == nil
    return actions_symbol if actions_symbol == :quit

    move_player(actions_symbol)
  end

  def move_player(direction)
    success = @gameboard.move_player(direction)
    if !success
      puts "Move not allowed, try again"
    else
      puts "Success"
      print_current_gameboard
    end
  end

  def intro
    puts "\n\n>> Welcome to Sokoban <<\n\n"
    print_current_gameboard
  end

  def outro
    puts "\n\n>> Goodbye and Goodnight <<\n\n"
  end

  def print_current_gameboard
    @gameboard.print_level
  end

end