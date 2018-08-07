# @param {String} s1
# @param {String} s2
# @return {Integer}
def minimum_delete_sum(s1, s2)
  a1 = s1.chars.map(&:ord)
  a2 = s2.chars.map(&:ord)
  minimum_size = [a1.size, a2.size].min
end

s1 = "kslcclpmfd"
s2 = "guvjxozrjvzhe"
p minimum_delete_sum(s1, s2)
