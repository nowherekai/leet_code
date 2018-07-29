# 比较简单的链表操作

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
def odd_even_list(head)
  return head unless head
  return head unless head.next

  odd_tail = head

  even_head = head.next
  even_tail = even_head

  current = even_tail.next
  node_number = 3

  while current
    if node_number % 2 == 0
      even_tail.next = current
      even_tail = current
    else
      odd_tail.next = current
      odd_tail = current
    end

    current = current.next
    node_number += 1
  end
  even_tail.next = nil
  odd_tail.next = even_head

  head
end
