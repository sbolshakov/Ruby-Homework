loop do
  print "Введите число или exit для выхода: "
  input = gets.chomp
  break if input == "exit"
  result = 1
  (1..input.to_i).each { | index | result = result * index }
  puts "Произведение чисел от 1 до #{input} равна #{result}"
end
