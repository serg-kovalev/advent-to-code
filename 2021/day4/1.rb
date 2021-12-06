rows = IO.readlines('test.txt')

numbers = rows.shift.scan(/\d+/)
rows.shift

boards = []
def fill_board(rows)
  board = []
  loop do
    r = rows.shift
    break if r.nil? || r == "\n"

    board << r.scan(/\d+/)
  end
  board
end

while rows.size > 0
  boards << fill_board(rows)
end

pp boards

puts "Answer: #{}"
