# @param {Integer[]} bills
# @return {Boolean}
def lemonade_change(bills)
  five_count = 0
  ten_count = 0

  bills.each do |bill|
    case bill
    when 5
      five_count += 1
    when 10
      ten_count += 1
      if five_count >= 1
        five_count -= 1
      else
        return false
      end
    when 20
      if ten_count > 0
        ten_count -= 1
        if five_count > 0
          five_count -= 1
        else
          return false
        end
      else
        if five_count > 3
          five_count -= 3
        else
          return false
        end
      end
    end
  end
  true
end
p lemonade_change([5,5,5,10,20])
