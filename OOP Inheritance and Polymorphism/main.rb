require_relative "player"
require_relative "pro"

sakai = ProPlayer.new(100, 50, "Jin Sakai")
khan = Player.new(500, 50, "Khotun Khan")

puts sakai
puts khan

while khan.alive? and sakai.alive?
    puts sakai.hit(khan)
    puts sakai
    if sakai.chance?
        puts khan.hit(sakai) 
        puts "#{sakai.name} attack"
        puts khan
    else
        puts "#{sakai.name} deflect the attack"
    end
    if sakai.die?
        puts "#{sakai.name} is dies"
    elsif khan.die?
        puts "#{khan.name} is dies"
    end
end