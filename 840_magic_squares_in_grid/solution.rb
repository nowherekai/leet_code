def magic_square?(grid, row, col)
  h = {}
  (0..2).each do |i|
    (0..2).each do |j|
      n = grid[row + i][col + j]
      return false unless 1 <= n && n <= 9
      return false if h[n]
      h[n] = true
    end
  end

  sum_of_first_row = grid[row][col] + grid[row][col + 1] + grid[row][col + 2]
  (1..2).each do |i|
    return false unless grid[row + i][col] + grid[row + i][col + 1] + grid[row + i][col + 2] == sum_of_first_row
  end
  (0..2).each do |j|
    return false unless grid[row][col + j] + grid[row + 1][col + j] + grid[row + 2][col + j] == sum_of_first_row
  end

  return false unless grid[row][col] + grid[row + 1][col + 1] + grid[row + 2][col + 2] == sum_of_first_row
  return false unless grid[row][col + 2] + grid[row + 1][col + 1] + grid[row + 2][col] == sum_of_first_row

  return true
end
# @param {Integer[][]} grid
# # @return {Integer}
def num_magic_squares_inside(grid)
  rows = grid.size
  cols = grid[0].size
  num = 0

  (0..(rows - 3)).each do |i|
    (0..(cols - 3)).each do |j|
      num += 1 if magic_square?(grid, i, j)
    end
  end
  num
end

p(num_magic_squares_inside(
  [[3,2,9,2,7],
   [6,1,8,4,2],
   [7,5,3,2,7],
   [2,9,4,9,6],
   [4,3,8,2,5]]
))
