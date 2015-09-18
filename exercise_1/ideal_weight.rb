print "Представьтесь, пожалуйста: "
name = gets.chomp
print "Какой у вас рост в сантиметрах? "
heights = gets.chomp.to_i
puts "#{name}, ваш идеальный вес: #{heights-110} кг"
