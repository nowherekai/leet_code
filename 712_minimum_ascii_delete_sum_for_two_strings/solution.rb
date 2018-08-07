# 暴力法，时间复杂度太高(?)

# @param {String} s1
# @param {String} s2
# @return {Integer}
def minimum_delete_sum(s1, s2)
  a1 = s1.chars.map(&:ord)
  a2 = s2.chars.map(&:ord)
  minimum_size = [a1.size, a2.size].min

  max_common_sub_array_sum = 0

  minimum_size.downto(1).each do |sub_size|
    (a1.combination(sub_size).to_a & a2.combination(sub_size).to_a).each do |sub_array|
      if sub_array.sum > max_common_sub_array_sum
        p sub_array.map(&:chr)
        max_common_sub_array_sum = sub_array.sum
      end
    end
    if max_common_sub_array_sum > 0
      return a1.sum + a2.sum - max_common_sub_array_sum * 2
    end
  end
  return a1.sum + a2.sum
end

s1 = "kslcclpmfd"
s2 = "guvjxozrjvzhe"
p minimum_delete_sum(s1, s2)
