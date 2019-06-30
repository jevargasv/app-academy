require_relative 'tile'

class Board
  def initialize(size)
    @grid = create_grid(size)
    seed_bombs(@grid)
  end

  def create_grid(size)
    Array.new(size) { Array.new(size) { Tile.new } }
  end

  def seed_bombs(grid)
    bomb_count = 0
    until bomb_count == 10
      row = rand(@grid.length)
      col = rand(@grid.length)
      pos = [row, col]

      if self[pos].bombed == false
        self[pos].place_bomb
        bomb_count += 1
      end

    end
  end

  def render
    puts `clear`
    puts " #{(0..8).to_a.join("")}"
    @grid.each_with_index do |row, idx|
      print idx
      row.each do |tile|
        print tile.inspect
      end
      puts ""
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def solved?
    false
  end
end