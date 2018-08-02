# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
  i = 0
  while i < nums.size
    j = i + 1
    while j < nums.size
      if nums[i] == nums[j]
        return nums[i]
      end
      j += 1
    end
    i += 1
  end
end

p find_duplicate([1,2,3,3])
