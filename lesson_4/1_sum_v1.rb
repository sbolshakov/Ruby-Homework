loop do
  print "Введите число или exit для выхода: "
  input = gets.chomp
  break if input == "exit"
  result = 0
  for number in (1..input.to_i)
    result += number
  end
  puts "Сумма чисел от 1 до #{input} равна #{result}"
  puts "Среднее арифметическое чисел от 1 до #{input} равна #{result / input.to_f}"
end
