print "Введите число: "
day = gets.chomp.to_i
print "Введите номер месяца: "
month = gets.chomp.to_i
print "Введите четыре цифры года: "
year = gets.chomp.to_i

days_in_month = {0 => 0, 1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31}
result = day

(1..month).each do | mon |
 result += days_in_month[mon-1]
end

# Проверяем високосный год (делится на 4 и не делится на 100 или делится на 400)

result = result + 1 if month >= 3 && ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)

puts "Это день номер #{result} с начала года!"


