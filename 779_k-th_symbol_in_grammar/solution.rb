# 暴力法，时间复杂度O(2 ** n)
# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def kth_grammar(n, k)
  return 0 if n == 1

  content = [0]
  (2..n).each do |i|
    tmp = []
    content.each do |n|
      if n == 0
        tmp.push(0)
        tmp.push(1)
      else
        tmp.push(1)
        tmp.push(0)
      end

      content = tmp
    end
  end
  content[k - 1]
end
puts(kth_grammar(30,234234324))
