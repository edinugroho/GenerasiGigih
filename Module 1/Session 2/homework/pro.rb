require_relative "player"

class Pro < Player
    def initialize(health,damage,name, deflect = 0, heal = 0)
        super(health, damage, name)
        @deflect = deflect 
        @heal = heal 
    end

    def hited(damage)
        if rand(100) >= @deflect and @deflect != 0 
            puts "#{@name} deflects the attack"
        else
            super
        end
    end

    def heal(ally)
        ally.healed(@heal)
        puts "#{@name} heals #{ally.name}, restoring #{@heal} hitpoints"
    end
end