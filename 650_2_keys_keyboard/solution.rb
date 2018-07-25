#naive DP solution
#求n的因数(factor)，去除1和n本身，剩下的因数数组
#比如12的因数是2，3，4，6
#每个因数都有自己的一个min_steps,然后加上n/factor 就等于这个因数组成这个数的steps, 从所有的factors的steps找到最小的
#TODO 时间复杂度?
def min_steps_dp(n, min_steps_array)
  if min_steps_array[n]
    return min_steps_array[n]
  end

  factors = []
  (2...n).each do |i|
    factors.push(i) if n % i == 0
  end
  if factors.empty?
    min_steps_array[n] = n
  else
    min_steps_array[n] = factors.map { |factor| min_steps_dp(factor, min_steps_array) + (n / factor) }.min
  end
  min_steps_array[n]
end
# @param {Integer} n
# # @return {Integer}
def min_steps(n)
  min_steps_array = Array.new(n + 1, nil)
  min_steps_array[1] = 0
  min_steps_dp(n, min_steps_array)
end
