
# Remix
# width, height, number_of_mines

# 1. generate 2d grid
# 2. randomly place the *
# 3. loop the grid
#    - foreach cell, count adjacent / neighbors cells which are mine

require 'pp'

MINE = '*'

def generate_board(w, h, number_of_mines)
  board = Array.new(h) { Array.new(w) { 0 } }
  mine_filled = 0
  mines = []
  while mine_filled < number_of_mines
    x, y = [Random.new.rand(0...h), Random.new.rand(0...w)]
    if board[x][y] != MINE
      board[x][y] = MINE
      mine_filled += 1
      mines += [x, x+1, x-1].product([y, y+1, y-1]) - [[x,y]]
    end
  end

  mines.each do |_|
    x,y = _
    next if x >= h || x < 0 || y >= w || y < 0 || board[x][y] == MINE
    count = 0
    pairs = [x, x+1, x-1].product([y, y+1, y-1]) - [[x,y]]
    pairs.each do |pair|
      next if pair[0] >= h || pair[0] < 0 || pair[1] >= w || pair[1] < 0
      if board[pair[0]][pair[1]] == MINE
        count += 1
      end
    end
    board[x][y] = count
  end
  board
end

pp "test case 1"
puts generate_board(2, 2, 1).map{|arr| arr.join(" ")}.join("\n")

pp "test case 2"
puts generate_board(3, 3, 2).map{|arr| arr.join(" ")}.join("\n")

pp "test case 3"
puts generate_board(7, 4, 4).map{|arr| arr.join(" ")}.join("\n")

pp "test case 4"
puts generate_board(15, 15, 1).map{|arr| arr.join(" ")}.join("\n")

pp "test case 5"
puts generate_board(15, 15, 100).map{|arr| arr.join(" ")}.join("\n")
