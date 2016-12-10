
# 0 - aloved, -1 not aloved to move

def find_path grid, robot_position=[0,0]
  @path = []
  @grid = grid
  @failed_points = {}

  return false unless get_path(@grid.length - 1, @grid[0].length - 1)

  return @path
end

def get_path row, col
  return false if @failed_points["#{row},#{col}"] == true || row < 0 || col < 0 || @grid[row][col] == '✗'

  if origin?(row, col) || get_path(row - 1, col) || get_path(row, col - 1)
    @path << [row, col]
    return true
  end

  @failed_points["#{row},#{col}"] = true

  false
end

def origin? row, col
  row == 0 && col == 0
end


grip = [[0, 0, 0], [0, 0, 0]]
grip2 = [[0, 0, '✗', 0],
        [0, 0, '✗', 0],
        [0, 0, '✗', 0],
        ['✗', 0, '✗', 0],
        [0, 0, 0, 0]]

p find_path(grip, [0, 0])
path = find_path(grip2, [0, 0])

path.each do |(row, col)|
  grip2[row][col] = 1
end
grip2.each do |row|
  p row
end