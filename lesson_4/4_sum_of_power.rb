loop do
  print "Введите число или exit для выхода: "
  input = gets.chomp
  break if input == "exit"
  result = 0
  (1..input.to_i).each { | index | result += index ** index }
  puts "Сумма степеней чисел от 1 до #{input} равна #{result}"
end
