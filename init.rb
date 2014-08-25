APP_ROOT = File.dirname(__FILE__)

$:.unshift(File.join(APP_ROOT, 'app'))

require 'sokoban'
require 'gameboard'
require 'game_config'
require 'awesome_print'

if __FILE__ == $0
  game = Sokoban.new("levels/level0.txt")
  game.launch!
end