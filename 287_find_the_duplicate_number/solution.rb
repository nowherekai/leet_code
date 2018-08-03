# 暴力法 O(n ** 2)
# 排序法 O( n * lg(n) )，moidify 数组
# hash标记访问过的数据，O(n) 时间，O(n) 空间
# 本文解法：转换为单链表，然后用监测单链表是否有循环的算法求解
# TODO finish
# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
  return nums[0] if nums[0] == nums[1]

  slow = nums[0]
  quick = nums[0]

  loop do
    slow = nums[slow]
    quick = nums[nums[quick]]

    if slow == quick
      break
    end
  end
end

p find_duplicate([3,1,3,4,2])
