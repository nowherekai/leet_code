# 比较简单的，先找到degree(最大频次)，然后在找到所有频次和degree一样的数字,
# 然后再找到这些数字的最小和最大index，找到差最小的一个
# O(n)的时间复杂度
# @param {Integer[]} nums
# @return {Integer}
def find_shortest_sub_array(nums)
  num_freq_hash = nums.each_with_object(Hash.new(0)) do |n, h|
    h[n] += 1
  end
  degree = num_freq_hash.values.max

  nums_of_degree = []
  num_freq_hash.each do |n, count|
    if count == degree
      nums_of_degree.push n
    end
  end

  degree_nums_to_indices = Hash.new { |h, k| h[k] = [] }
  nums.each_with_index do |n, index|
    if nums_of_degree.include?(n)
      degree_nums_to_indices[n].push(index)
    end
  end

  min_length = nums.size
  degree_nums_to_indices.each do |n, indices|
    if indices[-1] - indices[0] < min_length
      min_length = indices[-1] - indices[0] + 1
    end
  end
  min_length
end
