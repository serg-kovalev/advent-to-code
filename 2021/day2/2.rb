rows = IO.readlines('input.txt')

x = 0
y = 0 # depth
aim = 0
rows.each do |r|
  puts "STEP #{r}"
  command, step = r.split(/\s/)
  step = step.to_i

  case command
  when 'forward'
    puts "aim=#{aim} x=#{x}"
    y += aim * step
    x += step
  when 'up'
    aim -= step
  when 'down'
    aim += step
  else
    puts "unknow command #{command}"
  end
  puts "x=#{x} y=#{y} aim=#{aim}"
  puts
end

puts "Answer: #{x * y}"
