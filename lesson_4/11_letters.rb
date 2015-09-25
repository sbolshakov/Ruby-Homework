i = 1
letters = {}
('а'..'я').each do | letter |
  letter.scan( /[аеиоуыэюя]/) { |l| letters[l] = i }
  i += 1
end
puts letters

