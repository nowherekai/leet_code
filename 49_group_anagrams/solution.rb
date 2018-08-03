# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  strs.group_by { |str| str.chars.sort }.values
end

p group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
