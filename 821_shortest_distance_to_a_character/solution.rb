# @param {String} s
# @param {Character} c
# @return {Integer[]}
def shortest_to_char(s, c)
  chars = s.chars

  indices_of_c = []
  chars.each_with_index do |char, index|
    if char == c
      indices_of_c.push index
    end
  end

  result = Array.new(s.size)
  chars.each_with_index do |char, index|
    result[index] = indices_of_c.map { |i| (i - index).abs }.min
  end
  result
end

p shortest_to_char("loveleetcode", 'e')
