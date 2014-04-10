require './models.rb'
require './helpers.rb'

class Game
  @line_length = 69
  @border_char = '#'
  class << self
    attr_reader :line_length, :border_char
  end
  
  attr_reader :version, :name, :player, :subjects
  def initialize
    @subjects = ["Dan","Píro","Canale","Rak","Zymonová","Ender Dragon","Creeper","Jolanda","Kuruteku_09","Keralis","Miley Cyrus","Mumbo","Mike Shinoda","Lindsey Stirling","Superpennys139","Herout","Nemčoková","Sakalová","Štěpánek","Anonymní gynekolog","Prezident Semen","Andršová","Exner","Nina Nováková","Justin Bieber","Roko","Metrix","SethBling","Dragnoz","Kuchařka od okýnka číslo dvě","Hospodářka","Svatá trojce","Adam Urbánek",""]
     @version = '16.6.69'
     @name = 'The Hunting Party'
     print "Starting #{@name} version #{@version}"
  end
  
  def welcome
    print "Enter name of your character:"
    name = gets.chomp
    @player = Player.new(name: name, health: Random.rand(15..23), attack: Random.rand(7..13), defense: Random.rand(7..13), energy: Random.rand(20..50), luck: Random.rand(5..10))
    print "Welcome #{name} to #{@name}!"
  end
end

game = Game.new()
game.welcome
entity = Entity.new(name: game.subjects.sample, health: 69, attack: 20, defense: 0, energy: 69, luck: 5)
fight = Fight.new(game.player, entity)
fight.fight
