loop do
  print "Введите число или exit для выхода: "
  input = gets.chomp
  break if input == "exit"
  result = 0
  index = 1
  until index > input.to_i do
    result += index
    index += 1
  end
  puts "Сумма чисел от 1 до #{input} равна #{result}"
  puts "Среднее арифметическое чисел от 1 до #{input} равна #{result / input.to_f}"
end
