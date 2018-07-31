# @param {String} s
# @return {String}
def reverse_words(s)
  s.split.map { |word| word.reverse }.join(" ")
end
puts reverse_words("Let's take LeetCode contest")
