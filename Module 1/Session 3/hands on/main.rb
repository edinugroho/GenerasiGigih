require_relative "player"
require_relative "pro"
require_relative "ally"
require_relative "archerman"
require_relative "spearman"
require_relative "swordman"
require_relative "play"

jin_sakai = Pro.new(100, 50, "Jin Sakai", 80, 30)
yuna = Ally.new(100, 50, "Yuna", 80)
sensei_ishikawa = Ally.new(100, 50, "Sensei Ishikawa", 80)
new_allies = Ally.new(100, 50, "new", 80)
mongol_archer = Archerman.new(80, 40, "Mongol Archer",50)
mongol_spearman = Spearman.new(120, 60, "Mongol Spearman",50)
mongol_swordman = Swordman.new(100, 50, "Mongol Swordman",50)

allies = [yuna, sensei_ishikawa]
jin_allies = [jin_sakai] + allies 
villains = [mongol_archer, mongol_spearman, mongol_swordman]

players = Play.new(jin_sakai, allies ,villains)
players.playing




# while !jin_sakai.die? and !villains.empty?
#     puts "========= Turn #{turn} =========" 
#     puts 
#     puts jin_sakai
#     allies.each do |ally|
#         if ally.alive?
#             puts ally
#         else
#             puts "#{ally.name} dies"
#         end
#     end 
#     puts
#     villains.each do |villain|
#         if villain.alive?
#             puts villain
#         else
#             puts "#{villain.name} dies"
#         end
#     end 
#     puts
#     puts "As Jin Sakai, what do you want to do this turn?"
#     puts "1) Attack an Enemy"
#     puts "2) Heal an Ally"    
#     print "Enter option: "
#     option = gets.chomp().to_i 
#     puts 
#     case option
#     when 1
#         puts "Which enemy you want to attack?"
#         villains.each.with_index(1) do |villain, index|
#             puts "#{index}) #{villain.name}"
#         end
#         print "Enter option: "
#         option = gets.chomp().to_i
#         puts "\n"
#         jin_sakai.hit(villains[option-1])
#         villains.each do |villain|
#             if villain.die? or villain.flee?
#                 villains.delete(villain)
#             end 
#         end
#     when 2
#         puts "Which ally you want to heal?"
#         allies.each.with_index(1) do |ally, index|
#             puts "#{index}) #{ally.name}"
#         end
#         print "Enter option: "
#         option = gets.chomp().to_i
#         puts "\n"
#         jin_sakai.heal(allies[option-1])
#     end

#     # Allies hit random villains 
#     allies.each do |ally|
#         if !villains.empty?
#             ally.hit(villains[rand(villains.size)])
#         end
#         villains.each do |villain|
#             if villain.die? or villain.flee?
#                 villains.delete(villain) 
#             end
#         end
#     end

#     # Vilains hit jin or allies
#     villains.each do |villain|
#         villain.hit(jin_allies[rand(jin_allies.size)])
#         jin_allies.each do |ally|
#             if ally.die?
#                 jin_allies.delete(ally)
#             end
#         end
#     end

#     turn += 1
# end

# if jin_sakai.alive?
#     puts "#{jin_sakai.name} win"
# else
#     puts "#{jin_sakai.name} lose"
# end