rows = IO.readlines('input1.txt')

prev = -1
counter = 0
rows.each_with_index do |r, i|
  next if i == 0

  counter += 1 if prev < r.to_i
  prev = r.to_i
end

puts "Answer: #{counter}"
