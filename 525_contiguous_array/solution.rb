def find_max_length(nums)
  counts = [0]
  nums.each do |n|
    if n.zero?
      counts.push(counts[-1] - 1)
    else
      counts.push(counts[-1] + 1)
    end
  end

  h = { 0 => 0 }
  max_length = 0
  counts.each_with_index do |count, index|
    if !h[count]
      h[count] = index
    else
      if max_length < index - h[count]
        max_length = index - h[count]
      end
    end
  end
  max_length
end
