# 最简单的做法是把两位数组变成一维数组然后重新排序，时间复杂度O(n ** 2 * log(n ** 2))
# @param {Integer[][]} matrix
# @param {Integer} k
# @return {Integer}
def kth_smallest(matrix, k)
  matrix.flatten.sort[k - 1]
end
matrix = [
  [ 1,  5,  9 ],
  [10, 11, 13],
  [12, 13, 15]
]
p kth_smallest(matrix, 8)
