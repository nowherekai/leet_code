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
def insertion_sort_list(head)
  return head unless head
  sorted_tail = head

  while sorted_tail.next
    unsorted_node = sorted_tail.next
    sorted_tail.next = unsorted_node.next
    unsorted_node.next = nil

    if head.val > unsorted_node.val
      unsorted_node.next = head
      head = unsorted_node
      next
    end

    pre = head
    while pre != sorted_tail
      p = pre.next
      if p.val > unsorted_node.val
        pre.next = unsorted_node
        unsorted_node.next = p
        break
      end

      pre = p
    end

    if pre == sorted_tail
      unsorted_node.next = sorted_tail.next
      sorted_tail.next = unsorted_node
      sorted_tail = unsorted_node
    end

  end
  head
end
