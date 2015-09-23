print "Представьтесь, пожалуйста: "
name = gets.chomp
print "Какой у вас рост в сантиметрах? "
heights = gets.chomp.to_f
if heights-110 > 0
  puts "#{name}, ваш идеальный вес: #{heights-110} кг"
else
  puts "#{name}, сначала подрасти!"
end
