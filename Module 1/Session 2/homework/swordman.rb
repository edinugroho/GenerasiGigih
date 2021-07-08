require_relative "player"

class Swordman < Player
    def hit(enemy)
        puts "#{@name} thrust at #{enemy.name} with #{@damage} damage"
        enemy.hited(@damage)
    end
end