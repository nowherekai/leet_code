# @param {String} s
# @return {Boolean}
def repeated_substring_pattern(s)
  (2..s.size).each do |i|
    if s == s[0, s.size/i] * i
      return true
    end
  end
  false
end
p repeated_substring_pattern("aaaaa")
