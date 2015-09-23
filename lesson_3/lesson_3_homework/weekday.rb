print "Введите номер дня недели (от 1 до 7): "
weekday_num = gets.chomp.to_i
case weekday_num
when 1
  puts "Это понедельник"
when 2
  puts "Это вторник"
when 3
  puts "Это среда"
when 4
  puts "Это четверг"
when 5
  puts "Это пятница"
when 6
  puts "Это суббота"
when 7
  puts "Это воскресенье"
else
   puts "Неверный номер дня недели!"
end
