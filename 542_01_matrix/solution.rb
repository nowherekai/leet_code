# 先预处理，把matrix中为1的置空，然后
# 找到所有的0，把它四周为nil的都置为1，
# 然后找到所有的1，把它四周为nil的都置为2，
# 以此类推，知道不存在为nil的slot
# 时间复杂度 O(n ** 3)
# @param {Integer[][]} matrix
# @return {Integer[][]}
def update_matrix(matrix)
  rows = matrix.size
  cols = matrix[0].size
  remaind_slot = 0
  (0...rows).each do |i|
    (0...cols).each do |j|
      if 1 == matrix[i][j]
        matrix[i][j] = nil
        remaind_slot += 1
      end
    end
  end

  distance = 1
  until remaind_slot.zero?
    (0...rows).each do |i|
      (0...cols).each do |j|
        if matrix[i][j] == distance - 1
          if i - 1 >= 0
            if matrix[i - 1][j] == nil
              matrix[i - 1][j] = distance
              remaind_slot -= 1
            end
          end
          if i + 1 < rows
            if matrix[i + 1][j] == nil
              matrix[i + 1][j] = distance
              remaind_slot -= 1
            end
          end
          if j - 1 >= 0
            if matrix[i][j - 1] == nil
              matrix[i][j - 1] = distance
              remaind_slot -= 1
            end
          end
          if j + 1 < cols
            if matrix[i][j + 1] == nil
              matrix[i][ j + 1 ] = distance
              remaind_slot -= 1
            end
          end
        end
      end
    end

    distance += 1
  end
  # p distance
  matrix
end
(1000..1000).each do |i|
  matrix = []
  puts "i : #{i}"
  i.times do
    matrix.push Array.new(i, 1)
  end
  matrix[i - 1][i - 1] = 0
  update_matrix(matrix)
end
