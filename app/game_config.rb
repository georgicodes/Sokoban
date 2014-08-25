module GameConfig

  @@actions = {'up' => :up, 'down' => :down, 'left' => :left, 'right' => :right, 'quit' => :quit}.freeze
  @@game_items = {"@" => "@",
                "#" => "#",
                "." => ".",
                "o" => "o",
                " " => " ",
                "*" => "*",
                "+" => "+"}

  def self.actions
    @@actions
  end

  def self.game_items
    @@game_items
  end

end