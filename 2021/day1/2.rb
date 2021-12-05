rows = IO.readlines('input1.txt')

prev = -1
counter = 0
puts rows.size
(0..rows.size - 3).each do |i|
  current = rows[i].to_i + rows[i + 1].to_i + rows[i + 2].to_i
  counter += 1 if prev < current && prev != -1
  prev = current
end

puts "Answer: #{counter}"
