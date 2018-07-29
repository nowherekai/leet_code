# @param {Integer[]} a
# # @return {Integer}
def peak_index_in_mountain_array(a)
  i = 0
  while i < a.size - 1
    if a[i] < a[i + 1]
      i += 1
    else
      return i
    end
  end
end

puts(peak_index_in_mountain_array([1,2,3,4,2,1]))
