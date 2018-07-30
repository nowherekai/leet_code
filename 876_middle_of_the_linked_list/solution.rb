# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @return {ListNode}
def middle_node(head)
  p = head
  count = 0
  while p
    count += 1
    p = p.next
  end

  if count % 2 == 0
    middle = count/2 + 1
  else
    middle = (count/2.0).ceil
  end
  p = head
  while middle > 1
    p = p.next
    middle -= 1
  end
  p
end

head = ListNode.new(1)
head.next = ListNode.new(2)
head.next.next = ListNode.new(3)
head.next.next.next = ListNode.new(4)
head.next.next.next.next = ListNode.new(5)

p middle_node(head)
