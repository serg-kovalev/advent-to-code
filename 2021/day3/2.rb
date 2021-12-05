rows = IO.readlines('input.txt')

life_support_rate = 0
oxygen_rate = 0
co2_rate = 0

len = rows.first.size
filtered_values = rows.clone
# oxygen
(0..len - 2).each do |i|
  tmp = filtered_values.group_by { |e| e[i] }
  most_common_bit = if tmp['1']&.size == tmp['0']&.size
                      '1'
                    else
                      tmp.max_by { |_, v| v.size }.first
                    end
  filtered_values.select! { |e| e[i] == most_common_bit }
  break if filtered_values.size == 1
end
oxygen_rate = filtered_values.first.to_i(2)

# co2
filtered_values = rows.clone
(0..len - 2).each do |i|
  tmp = filtered_values.group_by { |e| e[i] }
  least_common_bit = if tmp['1']&.size == tmp['0']&.size
                       '0'
                     else
                       tmp.min_by { |_, v| v.size }.first
                     end
  filtered_values.select! { |e| e[i] == least_common_bit }
  break if filtered_values.size == 1
end
co2_rate = filtered_values.first.to_i(2)

life_support_rate = oxygen_rate * co2_rate
puts "Answer: #{life_support_rate}"
