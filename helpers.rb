def print(text)
  puts text
end

def border
  border = ""
  Game.line_length.times do
    border << Game.border_char
  end
  border
end

class Fight
  def initialize(fighter1, fighter2)
    @fighter1 = fighter1
    @fighter2 = fighter2
  end

  def fight
    puts "\e[2J\e[f"
    puts "#{@fighter1.name} and #{@fighter2.name} are going to fight!"
    puts @fighter1.status
    puts "VERSUS"
    puts @fighter2.status
    puts "Let´s begin!"
    
    while @fighter1.alive && @fighter2.alive
      @fighter1.strike(@fighter2)
      if @fighter2.alive
        @fighter2.strike(@fighter1)
      end
    end
  end
end