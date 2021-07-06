require_relative "player"

sakai = Player.new(100, 50, "Jin Sakai", 80)
khan = Player.new(500, 50, "Khotun Khan")

puts sakai
puts khan
puts

while khan.alive? and sakai.alive?
    sakai.hit(khan)
    puts khan
    khan.hit(sakai)
    puts sakai
    if sakai.die?
        puts "#{sakai.name} is dies"
    elsif khan.die?
        puts "#{khan.name} is dies"
    end
    puts
end