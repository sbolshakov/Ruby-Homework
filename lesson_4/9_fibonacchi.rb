fibonacci = [0, 1]
while fibonacci.last <= 100 do
  fibonacci << fibonacci[(fibonacci.length - 2)] + fibonacci[(fibonacci.length - 1)]
end
fibonacci.pop
puts fibonacci
