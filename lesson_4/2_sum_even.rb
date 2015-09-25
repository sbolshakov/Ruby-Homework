loop do
  print "Введите число или exit для выхода: "
  input = gets.chomp
  break if input == "exit"

  result = 0
  number_of_used_numbers = 0
  (1..input.to_i).each do | index |
    if index%2 == 0
      result += index
      number_of_used_numbers += 1
    end
  end
  puts "Сумма четных чисел от 1 до #{input} равна #{result}"
  puts "Среднее арифметическое четных чисел от 1 до #{input} равна #{result / number_of_used_numbers.to_f}"
end
