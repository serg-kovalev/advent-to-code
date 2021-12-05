rows = IO.readlines('input.txt')

x = 0
y = 0 # depth
rows.each do |r|
  command, step = r.split(/\s/)
  step = step.to_i

  case command
  when 'forward'
    x += step
  when 'up'
    y -= step
  when 'down'
    y += step
  else
    puts "unknow command #{command}"
  end
end

puts "Answer: #{x * y}"
