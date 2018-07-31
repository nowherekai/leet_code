#每个字符都有两种可能性，所以共有2 ** n 种可能性，n是字符串长度
#ruby Array#product 返回所有的数组的所有元素的所有组合
# @param {String} s
# @return {String[]}
def letter_case_permutation(s)
  return [""] if s.empty?
  lower_chars = s.downcase.chars
  upper_chars = s.upcase.chars

  pairs = lower_chars.zip(upper_chars)
  result = pairs[0].product(*pairs[1..-1])
  result.map(&:join).uniq
end
p letter_case_permutation("abcdefghijk13")
