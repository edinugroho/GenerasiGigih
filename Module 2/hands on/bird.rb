class Bird
    def fly
        puts "can fly"
    end
end

class Penguin < Bird
    def fly
        puts "can't fly"
    end
end

penguin = Penguin.new()
penguin.fly