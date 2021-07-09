require_relative "mongol"

class Spearman < Mongol
    def hit(enemy)
        puts "#{@name} slash sword at #{enemy.name} with #{@damage} damage"
        enemy.hited(@damage)
    end
end