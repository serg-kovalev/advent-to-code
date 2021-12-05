rows = IO.readlines('input.txt')

gamma_rate = ''
epsilon_rate = ''
len = rows.first.size
(0..len - 2).each do |i|
  tmp = rows.group_by { |e| e[i] }.max_by { |_, v| v.size }.first
  gamma_rate += tmp
  epsilon_rate += tmp == '1' ? '0' : '1'
end
gamma_rate = gamma_rate.to_i(2)
epsilon_rate = epsilon_rate.to_i(2)

puts "Answer: #{gamma_rate * epsilon_rate}"
