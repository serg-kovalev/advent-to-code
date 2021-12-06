NUMBER_OF_DAYS = 80

rows = IO.readlines('input.txt')

numbers = rows[0].scan(/\d+/).map(&:to_i)
lanternfish_counter = numbers.size

def simulate_day(input, lanternfish_counter)
  values_to_add = []
  results = input.map do |e|
    if e.zero?
      values_to_add << 8
      lanternfish_counter += 1
      next 6
    end
    e - 1
  end
  [results + values_to_add, lanternfish_counter]
end

i = 1
while i <= NUMBER_OF_DAYS do
  numbers, lanternfish_counter = simulate_day(numbers, lanternfish_counter)
  if i < 19 # for debugging
    puts("Another day #{i} passed: #{numbers.join(',')}")
    puts("Day #{i}: #{lanternfish_counter}")
  end
  i += 1
end

puts "Answer: #{lanternfish_counter}"
