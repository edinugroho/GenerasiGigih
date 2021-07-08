class Mamaal
    def breath
        puts "can breath"
    end
end

class Whale < Mamaal
    def live
        puts "live in water"
    end
end

whale = Whale.new()
whale.live