# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  index = nums.bsearch_index { |e| e >= target }
  if index.nil?
    nums.size
  else
    index
  end
end
