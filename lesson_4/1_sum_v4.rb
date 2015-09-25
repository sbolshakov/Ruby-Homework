loop do
  print "Введите число или exit для выхода: "
  input = gets.chomp
  break if input == "exit"
  result = 0
  (1..input.to_i).each { | index | result += index }
  puts "Сумма чисел от 1 до #{input} равна #{result}"
  puts "Среднее арифметическое чисел от 1 до #{input} равна #{result / input.to_f}"
end
