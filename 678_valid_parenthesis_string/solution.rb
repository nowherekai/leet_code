#最简单的方法就是遍历所有的可能性
#1. 保持一个计数count，遇到"(" 加1， 遇到")" 减去1
#2. 如果没有"*"则比较简单，判断count永远大于等于0并且最后等于0就好
#3. 对于"*"，它有三种可能的值，所以分成三个分支，有一个分支是匹配的就是匹配
#时间复杂度：如果全都是'*',时间复杂度 O(n ** 3), n的三次方，因为每个字符都有三种可能（最坏情况下）
#NOTE  Time Limit Exceeded on leetcode
def check(s, start, count)
  return false if count < 0

  (start...(s.size)).each do |i|
    case s[i]
    when '('
      count += 1
    when ')'
      count -= 1
      return false if count < 0
    when '*'
      return check(s, i + 1, count) || check(s, i + 1, count + 1) || check(s, i + 1, count - 1)
    end
  end

  return count == 0
end
# @param {String} s
# # @return {Boolean}
def check_valid_string(s)
  check(s, 0, 0)
end

