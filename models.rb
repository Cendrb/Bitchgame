require './helpers.rb'

class Entity
  attr_reader :name, :health, :attack, :defense, :alive, :energy, :luck
  def initialize(params)
    @name = params[:name]
    @health = params[:health]
    @attack = params[:attack]
    @defense = params[:defense]
    @energy = params[:energy]
    @luck = params[:luck]
    @alive = true
  end
  
  def status
    stats = []
    stats << border
    stats << @name
    stats << "HP: #{@health}"
    stats << "Attack: #{@attack}"
    stats << "Defense: #{@defense}"
    stats << "Energy: #{@energy}"
    stats << "Luck: #{@luck}"
    stats << border
    stats
  end

  def defend(attacker, attack_strength)
    say "I was attacked by #{attacker.name}"
    result = attack_strength - (@defense + Random.rand(@luck))
    if result < 0
      result = 0
      print "Attack by #{attacker.name} failed"
    else
      print "#{@name} lost #{result} HP"
    end
    @health -= result
    if @health < 0
      die(attacker)
    end
  end

  def strike(target)
    say "I am going to attack #{target.name}"
    if @energy <= 0
      say "I have no more energy (#{@energy})"
    else
      target.defend(self, @attack + Random.rand(@luck))
      @energy -= 1
    end
  end

  def strike_repeatedly(target)
    while target.alive
      if !strike(target)
      break
      end
    end
  end

  def say(message)
    print "[#{@name}] " + message
  end

  def die(reason)
    say "I was killed by #{reason.to_s}"
    @alive = false
  end

  def to_s
    @name
  end
end

class Player < Entity
  def initialize(params)
    super
  end

end