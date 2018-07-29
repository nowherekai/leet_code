def dp(s, left, right, a)
  if left == right
    if s[left] == "*"
      a[left][right] = true
    else
      a[left][right] = false
    end
  elsif left + 1 == right
    if "*(".include? s[left] && "*)".include?(s[right])
      a[left][right] = true
    else
      a[left][right] = false
    end
    return
  elsif s[left] == "("
    i = left + 1
    while i <= right
    end
  end

  return s[left][right]
end
# @param {String} s
# # @return {Boolean}
def check_valid_string(s)
  a = Array.new(s.size) { |n| Array.new(s.size, nil) }
  dp(s, 0, s.size - 1, a)
end
