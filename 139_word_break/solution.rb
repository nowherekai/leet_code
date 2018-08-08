# 方法一：暴力递归方法，计算所有可能性, 时间复杂度太高
# 方法二：dynamic programming，思路如下
# 先找到从零开始的位于word dict中的字串的index，标记为true；然后从这些坐标的以一个坐标开始，重复执行
# 时间复杂度：?
# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}
def word_break(s, word_dict)
  dp = Array.new(s.size, false)
  word_dict.each do |word|
    if s[0, word.size] == word
      dp[word.size - 1] = true
    end
  end

  (0...(dp.size)).each do |i|
    if dp[i]
      if i == dp.size - 1
        break
      end

      word_dict.each do |word|
        if s[(i + 1), word.size] == word
          dp[i + 1 + word.size - 1] = true
        end
      end
    end
  end
  dp[-1]
end
p word_break("applepenapple", ["apple", "pen"])
