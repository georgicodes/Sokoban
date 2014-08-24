APP_ROOT = File.dirname(__FILE__)

$:.unshift(File.join(APP_ROOT, 'app'))

require 'Sokoban'
require 'Gameboard'
require 'awesome_print'

game = Sokoban.new("levels/level0.txt")
game.launch!