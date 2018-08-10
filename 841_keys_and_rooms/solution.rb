# 比较简单
# @param {Integer[][]} rooms
# @return {Boolean}
def can_visit_all_rooms(rooms)
  visited_rooms = Hash.new(false)
  keys = [0]

  loop do
    if key = keys.pop
      unless visited_rooms[key]
        visited_rooms[key] = true
        rooms[key].each do |new_key|
          keys.push(new_key) if new_key
        end
      end
    else
      break
    end
  end

  (0...(rooms.size)).to_a.all? { |i| visited_rooms[i] }
end

