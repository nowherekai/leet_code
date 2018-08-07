# @param {Integer} k
# @param {Integer} n
# @return {Integer[][]}
def combination_sum3(k, n)
  (1..9).to_a.combination(k).select do |arrs|
    arrs.sum == n
  end
end

p combination_sum3(3, 9)
