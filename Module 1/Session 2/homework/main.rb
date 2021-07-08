require_relative "player"
require_relative "archerman"
require_relative "spearman"
require_relative "swordman"
require_relative "pro"

sakai = Pro.new(100, 50, "Jin Sakai", 80)
archer = Archerman.new(80, 40, "Mongol Archer",50)
spearman = Spearman.new(120, 60, "Mongol Spearman",50)
swordman = Swordman.new(100, 50, "Mongol Swordman",50)
khan = Player.new(500, 50, "Khotun Khan")

puts sakai
puts archer
puts spearman
puts swordman
puts khan
puts

turn = 1
while khan.alive? and sakai.alive? and archer.alive? and spearman.alive? and swordman.alive? 
    puts "==================== Turn #{turn} =================="
    sakai.hit(khan)
    sakai.hit(archer)
    sakai.hit(swordman)
    sakai.hit(spearman)
    puts archer
    puts swordman
    puts spearman
    # puts khan
    # khan.hit(sakai)
    puts sakai
    if sakai.die?
        puts "#{sakai.name} is dies"
    elsif khan.die?
        puts "#{khan.name} is dies"
    end
    turn+= 1
    puts
end