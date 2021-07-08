require_relative "player"

class Ally < Player
    def healed(heal)
        @health += heal
    end
end