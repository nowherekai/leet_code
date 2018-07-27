# @param {String} s
# @return {String}
def reverse_vowels(s)
  vowels_indices = []
  s.chars.each_with_index do |char, index|
    if %w(A a E e I i O o U u).include?(char)
      vowels_indices.push(index)
    end
  end
  pairs = vowels_indices.zip(vowels_indices.reverse)
  pairs[0, pairs.size/2].each do |i, j|
    s[i], s[j] = s[j], s[i]
  end
  s
end
p reverse_vowels("leetcode")
