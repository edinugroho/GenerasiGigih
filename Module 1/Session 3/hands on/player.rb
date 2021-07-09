class Player
    attr_reader :name

    def initialize(health,damage,name, deflect = 0)
       @health, @damage, @name = health, damage, name
       @deflect = deflect 
    end

    def hit(enemy)
        puts "#{@name} attacks #{enemy.name} with #{@damage} damage"
        enemy.hited(@damage)
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