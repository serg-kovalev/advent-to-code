rows = IO.readlines('input.txt')

numbers = rows[0].scan(/\d+/).map(&:to_i).sort

position = 0
least_fuel = 2 << 64
(0..numbers.last).each do |v|
  current = numbers.inject(0) do |res, e|
    steps = (v - e).abs
    res + steps * (steps + 1) / 2
  end
  break if current > least_fuel

  least_fuel = current
  position = v
end

puts "Answer: #{least_fuel}"
