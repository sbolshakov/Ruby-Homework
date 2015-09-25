basket = {}
total = 0
loop do
  print "Введите, пожалуйста, наименование товара или \"стоп\" для расчета и выхода: "
  product_name = gets.chomp
  break if product_name == "стоп"
  print "Введите, пожалуйста, цену за единицу #{product_name}: "
  product_price = gets.chomp.to_f
  print "Введите, пожалуйста, количество #{product_name}: "
  product_qnty = gets.chomp.to_f
  basket[product_name]={product_price => product_qnty}
end
puts "Ваша корзина:"
puts
puts basket
puts
basket.each do | name, price_and_qnty |
  print "Итого по #{name}: "
  price_and_qnty.each do | price, qnty |
    puts price * qnty
    total += price * qnty
  end
end
puts
puts "Итоговая сумма всех покупок: #{total}"





