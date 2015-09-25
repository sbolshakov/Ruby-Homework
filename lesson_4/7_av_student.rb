loop do
  print "Введите количество студентов в группе или exit для выхода: "
  number_of_students = gets.chomp
  break if number_of_students == 'exit'
  # Объявляем переменную для выхода при ошибочном балле студента
  restart = 0

  group = []
  (1..number_of_students.to_i).each do | index |
    next if restart != 0
    print "Введите оценку для студента номер #{index}: "
    grade = gets.chomp.to_i
    if grade < 0 || grade > 100
      puts "Оценка должна быть в диапазоне от 0 до 100"
      restart = 1
      next
    end
    group << grade
  end
  group_sum = 0
  group.each{ | index | group_sum += index }
  puts "Средний балл группы: #{group_sum/number_of_students.to_f}"
end

