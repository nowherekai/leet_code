# @param {String} a
# @param {String} b
# @return {Boolean}
def rotate_string(a, b)
  return true if a == b

  as = a.chars
  bs = b.chars
  a.size.times do
    as.rotate!
    return true if as == bs
  end
  false
end

p rotate_string("abcde", "bcdea")
