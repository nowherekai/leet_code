# Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
# 典型的DP算法题目
# s[i, j] = s[i] == s[j] && s[i - 1][j - 1]
# 时间复杂度O(n ** 2)
# NOTE leetcode refuse my answer due to time exceed, but the time complexity is O(n ** 2), don't understand
# @param {String} s
# @return {String}
def longest_palindrome(s)
  return s if s.size == 0 || s.size == 1
  return s if s.chars.all? { |c| c == s[0] }

  matrix = Array.new(s.size) { |index| Array.new(s.size, false) }

  result = s[0]
  longest = 1
  (0...(s.size)).each do |i|
    matrix[i][i] = true
    if s[i] == s[i + 1]
      matrix[i][i + 1] = true
      result = s[i,2]
      longest = 2
    end
  end

  (2...(s.size)).each do |size|
    (0..(s.size - size)).each do |i|
      j = i + size
      if s[i] == s[j] && matrix[i + 1][j - 1]
        matrix[i][j] = true
        if longest < size + 1
          longest = size + 1
          result = s[i..j]
        end
      end
    end
  end
  result
end

str = "a" * 1000

p(longest_palindrome(str))
