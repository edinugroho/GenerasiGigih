class Player
    attr_reader :name

    def initialize(health,damage,name)
       @health, @damage, @name = health, damage, name
    end

    def hit(enemy)
        enemy.hited(@damage)
        puts "#{@name} attack #{enemy.name} with #{@damage} damage"
    end

    def hited(damage)
        @health -= damage
    end

    def alive?
        return @health > 0
    end
    
    def die?
        return @health <= 0
    end

    def to_s()
        return "#{@name} has #{@health} hitpoints and #{@damage} attack damage"
    end
end