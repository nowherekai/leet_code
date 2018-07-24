#用一个queue保存已经知道distance的坐标
#先遍历一边，找到所有的0，把坐标加入queue
#然后循环pop queue，把distance为0的挨着的元素置为1，并把这个元素的坐标加入queue中，distance为0的处理完后，queue都是为1的，
#以此类推，每个元素都遍历一边
#遍历两遍O(n) 的时间复杂度
def update_matrix(matrix)
  rows = matrix.size
  cols = matrix[0].size
  have_distance_slots = []
  (0...rows).each do |i|
    (0...cols).each do |j|
      if 1 == matrix[i][j]
        matrix[i][j] = nil
      else
        have_distance_slots.push([i,j])
      end
    end
  end
  #数字作为哨兵，也作为distance
  have_distance_slots.push(0)

  distance = nil
  until have_distance_slots.empty?
    item = have_distance_slots.pop
    if Integer === item
      if have_distance_slots.empty?
        break
      else
        distance = item
        have_distance_slots.unshift(distance + 1)
        next
      end
    end

    i, j = item
    if i - 1 >= 0
      if matrix[i - 1][j] == nil
        matrix[i - 1][j] = distance + 1
        have_distance_slots.unshift([i - 1, j])
      end
    end
    if i + 1 < rows
      if matrix[i + 1][j] == nil
        matrix[i + 1][j] = distance + 1
        have_distance_slots.unshift([i + 1,j])
      end
    end
    if j - 1 >= 0
      if matrix[i][j - 1] == nil
        matrix[i][j - 1] = distance + 1
        have_distance_slots.unshift([i,j - 1])
      end
    end
    if j + 1 < cols
      if matrix[i][j + 1] == nil
        matrix[i][ j + 1 ] = distance + 1
        have_distance_slots.unshift([i,j + 1])
      end
    end
  end
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
