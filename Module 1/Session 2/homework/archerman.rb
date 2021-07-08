require_relative "player"

class Archerman < Player
    def initialize(health, damage, name, fled_chance)
        @health, @damage, @name = health, damage, name
        @fled_chance = fled_chance
    end

    def fled?
        puts @field_chance
        return rand(50) > @fled_chance
    end

    def hit(enemy)
        puts "#{@name} shoots an arrow at #{enemy.name} with #{@damage} damage"
        enemy.hited(@damage)
    end
end