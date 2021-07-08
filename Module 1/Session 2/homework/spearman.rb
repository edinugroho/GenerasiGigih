require_relative "player"

class Spearman < Player
    def hit(enemy)
        puts "#{@name} slash sword at #{enemy.name} with #{@damage} damage"
        enemy.hited(@damage)
    end
end