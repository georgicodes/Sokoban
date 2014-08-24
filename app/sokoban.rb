class Sokoban

  @@actions = ['up', 'down', 'left', 'right', 'quit']

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
    until @@actions.include?(action)
      puts "Allowed actions: " + @@actions.join(", ") if action
      print "> "
      action = gets.chomp.downcase.strip
      # args = gets.chomp.downcase.strip.split(' ')
      # action = args.shift
    end
    return action
  end

  def perform_action(action)
    case action
      when "quit"
        return :quit
      when "left"
      when "right"
      when "down"
      when "up"
        move_player(action)
    end
  end

  def move_player(direction)
    @gameboard.move_player(direction)
  end

  def intro
    puts "\n\n>> Welcome to Sokoban <<\n\n"
    @gameboard.print_level
  end

  def outro
    puts "\n\n>> Goodbye and Goodnight <<\n\n"
  end

end