require_relative "mongol"

class Swordman < Mongol
    def hit(enemy)
        puts "#{@name} thrust at #{enemy.name} with #{@damage} damage"
        enemy.hited(@damage)
    end
end