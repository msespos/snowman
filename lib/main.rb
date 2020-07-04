require_relative 'game.rb'
require_relative 'board.rb'
require_relative 'figure.rb'

# ask the user if they want to load a new game
# if so, give them the list of filenames
# load their selected game

game = Game.new
p game.to_yaml
game.start