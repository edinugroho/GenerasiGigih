require_relative "player"

class Pro < Player
    def hited(damage)
        if rand(100) >= @deflect and @deflect != 0 
            puts "#{@name} deflects the attack"
        else
            super
        end
    end
end