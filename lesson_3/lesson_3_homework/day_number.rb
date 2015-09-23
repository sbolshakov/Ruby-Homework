print "Введите число: "
day = gets.chomp.to_i
print "Введите номер месяца: "
month = gets.chomp.to_i
print "Введите четыре цифры года: "
year = gets.chomp.to_i

case month
when 1
  result = day
when 2
  result = 31 + day
when 3
  result = 31 + 28 + day
when 4
  result = 31 + 28 + 31 + day
when 5
  result = 31 + 28 + 31 + 30 + day
when 6
  result = 31 + 28 + 31 + 30 + 31 + day
when 7
  result = 31 + 28 + 31 + 30 + 31 + 30 + day
when 8
  result = 31 + 28 + 31 + 30 + 31 + 30 + 31 + day
when 9
  result = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + day
when 10
  result = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + day
when 11
  result = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + day
when 12
   result = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30 + day
end

# Проверяем високосный год (делится на 4 и не делится на 100 или делится на 400)

result = result + 1 if month >= 3 && ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)

puts "Это день номер #{result} с начала года!"


