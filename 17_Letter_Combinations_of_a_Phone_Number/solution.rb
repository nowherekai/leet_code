# 用Ruby的product比较简单
# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  return [] if digits.empty?
  digit_to_letters_map = {
    2 => ['a', 'b', 'c'],
    3 => ['d', 'e', 'f'],
    4 => ['g', 'h', 'i'],
    5 => ['j', 'k', 'l'],
    6 => ['m', 'n', 'o'],
    7 => ['p', 'q', 'r', 's'],
    8 => ['t', 'u', 'v'],
    9 => ['w', 'x', 'y', 'z']
  }
  digits = digits.chars.map(&:to_i)
  first_digit_letters = digit_to_letters_map[digits[0]]
  rest_digit_letters = digits[1..-1].map { |digit| digit_to_letters_map[digit] }
  first_digit_letters.product(*rest_digit_letters).map { |result| result.join }
end

p letter_combinations('7')
