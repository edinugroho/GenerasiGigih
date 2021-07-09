class Play
    def initialize(hero, allies, villains)
        @hero = hero
        @allies = allies
        @villains = villains
    end

    def playing
        turn = 1
        while !@hero.die? and !@villains.empty?
            to_s
            puts
            puts "========= Turn #{turn} =========" 
            puts "As Jin Sakai, what do you want to do this turn?"
            puts "1) Attack an Enemy"
            puts "2) Heal an Ally"
            print "Enter option: "
            option = gets.chomp().to_i 
            case option
            when 1
                puts "Which enemy you want to attack?"
                @villains.each.with_index(1) do |villain, index|
                    puts "#{index}) #{villain.name}"
                end
                print "Enter option: "
                option = gets.chomp().to_i
                puts "\n"
                # validate
                if validate(option,@villains.length())
                    @hero.hit(@villains[option-1])
                else
                    next
                end
            when 2
                puts "Which ally you want to heal?"
                @allies.each.with_index(1) do |ally, index|
                    puts "#{index}) #{ally.name}"
                end
                print "Enter option: "
                option = gets.chomp().to_i
                # validate
                if validate(option,@allies.length())
                    @hero.heal(@allies[option-1])
                else
                    next
                end
                puts "\n"
            end

            # Allies hit random villains 
            @allies.each do |ally|
                if !@villains.empty?
                    ally.hit(@villains[rand(@villains.size)])
                end
                @villains.each do |villain|
                    if villain.die? or villain.flee?
                        @villains.delete(villain) 
                    end
                end
            end

            # Vilains hit jin or allies
            @villains.each do |villain|
                villain.hit(@allies[rand(@allies.size)])
                @allies.each do |ally|
                    if ally.die?
                        @allies.delete(ally)
                    end
                end
            end
            turn += 1
        end
    end

    def validate(input, range)
        if input < range and input > 0
            return true
        end
    end

    def add_allies(ally)
        @allies += [ally]
    end
    
    def add_villains(villain)
        @villains += [vilain]
    end


    def to_s
        @hero
        puts
        @allies.each do |ally|
            puts ally
        end
        puts
        @villains.each do |villain|
            puts villain
        end
    end
end
