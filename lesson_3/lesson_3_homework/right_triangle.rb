print "Введите длину первой стороны треугольника в сантиметрах: "
side_1 = gets.chomp.to_f
print "Введите длину второй стороны треугольника в сантиметрах: "
side_2 = gets.chomp.to_f
print "Введите длину третьей стороны треугольника в сантиметрах: "
side_3 = gets.chomp.to_f
if side_1 == side_2 && side_1 == side_3
  puts "Треугольник является равносторонним и не является прямоугольным"
elsif side_1 == side_2 || side_1 == side_3 || side_2 == side_3
  puts "Треугольник является равнобедренным"
  if side_1 == side_2 && side_3 ** 2 == side_1 ** 2 + side_2 ** 2
    puts "Треугольник является прямоугольным"
  elsif side_1 == side_3 && side_2 ** 2 == side_1 ** 2 + side_3 ** 2
    puts "Треугольник является прямоугольным"
  elsif side_3 == side_2 && side_1 ** 2 == side_3 ** 2 + side_2 ** 2
    puts "Треугольник является прямоугольным"
  else
    puts "Треугольник не является прямоугольным"
  end
  else
  puts "Это очень разносторонний треугольник :)"
    if side_1 > side_2 && side_1 > side_3 && side_1 ** 2 == side_2 ** 2 + side_3 ** 2
      puts "Треугольник является прямоугольным"
    elsif side_2 > side_1 && side_2 > side_3 && side_2 ** 2 == side_1 ** 2 + side_3 ** 2
      puts "Треугольник является прямоугольным"
    elsif side_3 > side_1 && side_3 > side_2 && side_3 ** 2 == side_1 ** 2 + side_2 ** 2
      puts "Треугольник является прямоугольным"
    else
      puts  "Треугольник не является прямоугольным"
    end
end
