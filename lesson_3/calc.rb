print "Пожалуйста, введите первое число: "
a = gets.chomp.to_f
print "Пожалуйста, введите второе число: "
b = gets.chomp.to_f
print "Пожалуйста, введите операцию, которую будем выполнять (+, -, * или /): "
operation = gets.chomp
if operation == '+'
  result = a + b
elsif operation == '-'
   result = a - b
elsif operation == '*'
   result = a * b
elsif operation == '/'
   result = a / b
else
  puts "Неверная операция"
end

puts "#{a} #{operation} #{b} = #{a+b}" if result
