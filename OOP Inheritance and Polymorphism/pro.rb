require_relative "player"

class ProPlayer < Player
    def chance?
        return rand(100)*80/100 > 80
    end
end