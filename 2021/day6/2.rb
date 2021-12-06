NUMBER_OF_DAYS = 256

rows = IO.readlines('input.txt')

numbers = rows[0].scan(/\d+/).map(&:to_i)
input = Array.new(9) { 0 }
numbers.each { |e| input[e] += 1 }

def simulate_day(input)
  result = Array.new(9) { 0 }
  (1..8).each do |idx|
    next if input[idx].zero?

    result[idx] = 0
    result[idx - 1] += input[idx]
  end
  result[8] += input[0]
  result[6] += input[0]
  result
end

i = 1
while i <= NUMBER_OF_DAYS do
  input = simulate_day(input)
  i += 1
end

puts "Answer: #{input.reduce(&:+)}"
