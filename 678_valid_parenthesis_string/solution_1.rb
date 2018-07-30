#也可以用用动态规划的方法解决(非递归版本)
#s[i,j]是否是一个valid的string，可以分解为下面的问题
#1. s[i] 为 '*', 并且'*'表示空字符串，此时要判断s[i + 1, j]是不是valid
#2. s[i] 为 '('(包括'*'为'('的情景), 那么如果存在一个k使得s[k] 为')', 且s[i, k] 和 s[k + 1, j]都是valid的，那么s[i, j]也是valid，否则就不是
#算法：
#1. 先处理长度为为1和为2的子字符串，判断s[i,i] 和 s[i, i + 1]是不是valid的
#2. 然后依次处理长度为3到s.size的字符串

def display_matrix(matrix)
  puts "  " + (0...(matrix.size)).to_a.join("     ")
  (0...(matrix.size)).each do |i|
    str = "#{i} "
    str += matrix[i].join(" ")
    puts str
  end
end

# @param {String} s
# @return {Boolean}
def check_valid_string(s)
  return true if s.empty?
  matrix = Array.new(s.size) { |n| Array.new(s.size, false) }

  (0...(s.size)).each do |i|
    if s[i] == '*'
      matrix[i][i] = true
    end

    if %w[( *].include?(s[i]) && %w[) *].include?(s[i + 1])
      matrix[i][i + 1] = true
    end
  end

  (2...(s.size)).each do |len|
    (0...(s.size - len)).each do |i|
      j = i + len
      if s[i] == '*' && matrix[i + 1][j]
        matrix[i][j] = true
      elsif %w[( *].include?(s[i])
        ((i + 1)..(j)).each do |k|
          if %w[) *].include?(s[k]) && (k == i + 1 || matrix[i + 1][k - 1]) && (k == j || matrix[k + 1][j])
            matrix[i][j] = true
          end
        end
      end
    end
  end
  matrix[0][s.size - 1]
end

str = "*()(())*()(()()((()(()()*)(*(())((((((((()*)(()(*)"
puts(check_valid_string(str))
