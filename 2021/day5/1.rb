require 'pp'

rows = IO.readlines('input.txt')

points = []
rows.each do |r|
  x1, y1, x2, y2 = r.split(' -> ').map { |e| e.split(',').map(&:to_i) }.flatten
  if x1 == x2
    ([y1, y2].min..[y1, y2].max).each { |y| points << [x1, y] }
  elsif y1 == y2
    ([x1, x2].min..[x1, x2].max).each { |x| points << [x, y1] }
  else
    # not required in this task
    y_min = [y1, y2].min
    ([x1, x2].min..[x1, x2].max).each_with_index do |x, _i|
      # points << [x, y_min + 1]
    end
  end
end

min_x, max_x = points.minmax_by { |e| e[0] }.map { |e| e[0] }
min_y, max_y = points.minmax_by { |e| e[1] }.map { |e| e[1] }
diagram = Array.new(max_y - min_y + 1) { Array.new(max_x - min_x + 1) { 0 } }
points = points.map { |e| [e[0] - min_x, e[1] - min_y] }
points.each { |(x, y)| diagram[y][x] += 1 }

number_of_overlaps = diagram.sum { |row| row.select { |x| x > 1 }.count }
puts "Answer: #{number_of_overlaps}"
