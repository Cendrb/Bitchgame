require './models.rb'
require './helpers.rb'

class Game
  attr_reader :version, :name, :player
  def initialize
     @version = '0.1'
     @name = 'AD Game'
     print "Starting #{@name} version #{@version}"
  end
  
  def welcome
    print "Enter name of your character:"
    name = gets.chomp
    @player = Player.new(name: name, health: 1000, attack: 20, defense: 10, energy: 2000, luck: 69)
    print "Welcome #{name} to #{@name}!"
  end
end

game = Game.new()
game.welcome
entity = Entity.new(name: "Daniel Malý", health: 1000, attack: 20, defense: 20, energy: 69, luck: 5)
game.player.strike_repeatedly(entity)
