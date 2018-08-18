#用Array#permutation暴力法很加单，但是时间复杂度太高
#[3,30,34,5,9] -> "9534330" 的例子可以看到，是先选择每一个数的高位最大的数，如果高位一样则选择比较第二位，意思类推
#其实就是字符串的排序, 所以是一个排序算法
#下面的排序规则取巧了，直接比较产生的最终结果, 如果比这样比较，那么就要写一套比较两个数字字符串的算法
#因为两个数字字符串，一个start_with?另一个的时候，需要特殊处理。
#比如ABCDE, ABC两个数字字符串s1, s2，要比较ABCDEABC 和 ABCABCDE,写起来比较麻烦，不过直接比较最终结果
# @param {Integer[]} nums
# @return {String}
def largest_number(nums)
  nums.map(&:to_s).sort do |a, b|
    [a,b].join <=> [b,a].join
  end.reverse.join.sub(/^0+/, '0')
end
