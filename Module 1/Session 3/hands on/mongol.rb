require_relative "player"

class Mongol < Player
    def initialize(health,damage,name, flee_chance = 0)
        super(health, damage, name)
        @flee_chance = flee_chance 
        @flee = false
    end

    def hitted(damage)
        super(damage)
        if @health <= 50 && @health>0 && @flee_chance != 0
            if rand(100) < @flee_chance
                @flee = true 
                puts "#{@name} has fled the battlefield with #{@health} hitpoint left" 
            end
        end
    end

    def flee?
        @flee
    end
end