rows = IO.readlines('input.txt')

numbers = rows[0].scan(/\d+/).map(&:to_i).sort

position = 0
least_fuel = 2 << 64
total_size = numbers.size
(0..total_size - 1).each do |i|
  current = numbers.inject(0) { |res, e| res + (numbers[i] - e).abs }
  break if current > least_fuel

  least_fuel = current
  position = i
end

puts "Answer: #{least_fuel}"
