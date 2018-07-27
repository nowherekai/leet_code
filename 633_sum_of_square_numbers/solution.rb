# @param {Integer} c
# @return {Boolean}
def judge_square_sum(c)
  (0..Math.sqrt(c).to_i).each do |i|
    remainder = c - i * i
    next unless remainder >= 0

    root = Math.sqrt(remainder)
    if root == root.to_i # is square
      return true
    end
  end

  false
end
puts judge_square_sum(999999999)
