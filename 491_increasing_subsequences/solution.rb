# @param {Integer[]} nums
# @return {Integer[][]}
def find_subsequences(nums)
  (2..(nums.size)).flat_map do |size|
    nums.combination(size).to_a.select { |arr| arr == arr.sort }.uniq
  end
end
p find_subsequences([4,6,7,7])
