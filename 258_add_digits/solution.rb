# @param {Integer} num
# @return {Integer}
def add_digits(num)
  result = num.to_s
  loop do
    break if result.size <= 1

    result = result.chars.map(&:to_i).sum.to_s
  end
  result.to_i
end
