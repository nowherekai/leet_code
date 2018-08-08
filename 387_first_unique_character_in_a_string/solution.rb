# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  h = {}
  s.chars.each_with_object(h) do |c, h|
    if h.key?(c)
      h[c] = false
    else
      h[c] = true
    end
  end

  s.chars.each_with_index do |c, index|
    if h[c]
      return index
    end
  end
  return -1
end
