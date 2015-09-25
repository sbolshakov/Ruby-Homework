loop do
  print "Введите число или exit для выхода: "
  input = gets.chomp
  break if input == "exit"
  print "Введите второе число: "
  num2 = gets.chomp
  result = 0
  number_of_used_numbers = 0
  (1..input.to_i).each do | index |
    if index%num2.to_i == 0
      result += index
      number_of_used_numbers += 1
    end
  end
  puts "Сумма чисел, которые делятся без остатка на #{num2}, от 1 до #{input} равна #{result}"
  puts "Среднее арифметическое чисел, которые делятся без остатка на #{num2}, от 1 до #{input} равна #{result / number_of_used_numbers.to_f}"
end
