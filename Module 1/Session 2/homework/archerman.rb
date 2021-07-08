require_relative "mongol"

class Archerman < Mongol
    def hit(enemy)
        puts "#{@name} shoots an arrow at #{enemy.name} with #{@damage} damage"
        enemy.hited(@damage)
    end
end