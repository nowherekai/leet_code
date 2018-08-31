# 1.暴力法(use combination)：超出内存限制
# nums.combination(3).to_a.map { |a, b, c| a * b * c  }.max
# 2. 暴力法: 三层嵌套，超出时间限制
# 3. 排序法，按大小排序，因为负数的存在，所以要么最后三个数之积最大，要么前两个数以及最后一个数之积最大，比较算则最大的值
# 即使都是负数，或者只有一个负数，也是如此
# @param {Integer[]} nums
# @return {Integer}
# def maximum_product(nums)
#   max = nil
#   (0..(nums.size - 3)).each do |i|
#     ((i + 1)..(nums.size - 2)).each do |j|
#       ((j + 1)..(nums.size - 1)).each do |k|
#         if max.nil?
#           max = nums[i] * nums[j] * nums[k]
#         else
#           if max < nums[i] * nums[j] * nums[k]
#             max = nums[i] * nums[j] * nums[k]
#           end
#         end
#       end
#     end
#   end
#   max
# end
def maximum_product(nums)
  nums.sort!
  [(nums[0] * nums[1] * nums[-1]),  (nums[-3] * nums[-2] * nums[-1])].max
end
