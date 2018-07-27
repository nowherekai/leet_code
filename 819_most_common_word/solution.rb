# @param {String} paragraph
# @param {String[]} banned
# @return {String}
def most_common_word(paragraph, banned)
  work_frequency_hash = paragraph.split(/[ !?',;.']/).each_with_object(Hash.new(0)).each do |word, h|
    next if word.empty?
    h[word.downcase] += 1
  end

  banned.each { |banned_word| work_frequency_hash.delete(banned_word) }
  invert_hash = work_frequency_hash.invert
  invert_hash[invert_hash.keys.max]
end
puts most_common_word("Bob. hIt, baLl", ["bob","hit"])
