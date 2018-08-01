require 'byebug'
#Can you solve it without using extra space?
#用两个指针，一个走得快，一个走得慢，如果两个指针相遇了，就说明存在cycle，并且相遇的node是在cycle中。
#下一步就是定位cycle开始的node：
#1. 上一步定位的node位于cycle中，从head开始重新遍历找到它的前一个node
#2. 判断前一个node是否在cycle中，如果是，重复1，如果不是就说明找到了cycle开始的node
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
  end
end

def detect_list_cycle(head)
  return unless head

  slow = head
  quick = head.next
  cycle = false

  while quick
    if slow == quick
      cycle = true
      break
    else
      quick = quick.next
      return unless quick
      quick = quick.next

      slow = slow.next
    end
  end

  return nil unless cycle

  node_in_cycle = quick

  loop do
    from_head = head
    if from_head == node_in_cycle
      return from_head
    end

    until from_head.next == node_in_cycle
      from_head = from_head.next
    end

    until node_in_cycle.next == from_head.next
      node_in_cycle = node_in_cycle.next
    end

    if node_in_cycle == from_head
      node_in_cycle = from_head
    else
      return from_head.next
    end
  end
end

root = nil
current = nil
tail = nil
(1..2).each do |n|
  if !root
    root = ListNode.new(n)
    current = root
  else
    current.next = ListNode.new(n)
    current = current.next
  end

  if n == 2
    tail = current
  end
end
tail.next = root

p detect_list_cycle(root).val
