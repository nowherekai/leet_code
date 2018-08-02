#solution#1 时间复杂度还是太高，本方法detect cycle和方法1一样，但是定位cycle 开始出不同
#假设已经探测到有cycle，并且一个指针n只想cycle中的某个node
#1. 统计node个数k
#2. 从head开始，找到第k个node
#3. 用两个指针，分别和head和第k个node开始，每次移动一个node，两个指针在cycle开始处相遇
#证明：1. 第k个node在cycle内
#   2.第k个node在cycle外
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

  p = quick
  cycle_node_count = 1
  while p.next != quick
    p = p.next
    cycle_node_count += 1
  end

  p = head
  total_node_count = 0
  while p.next != quick
    p = p.next
    total_node_count += 1
  end

  p = head
  unless total_node_count.zero?
    p = p.next
  end

  q = head
  while p != q
    p = p.next
    q = q.next
  end
  return p
end

root = nil
current = nil
tail = nil
cycle_begin = nil
(1..8).each do |n|
  if !root
    root = ListNode.new(n)
    current = root
  else
    current.next = ListNode.new(n)
    current = current.next
  end

  if n == 4
    cycle_begin = current
  end
  if n == 8
    tail = current
  end
end
tail.next = cycle_begin

p detect_list_cycle(root).val
