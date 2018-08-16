# 比较简单的链表操作，用两个指针，一遍遍历定位倒数第k个node，然后修改node指针完成rotate
# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def rotate_right(head, k)
  return head unless head
  return head unless head.next

  list_size = 0
  current = head
  while current
    current = current.next
    list_size += 1
  end

  k = k % list_size

  before_new_head = head
  current = head
  k.times do
    current = current.next
  end

  while current.next
    current = current.next
    before_new_head = before_new_head.next
  end

  current.next = head
  head = before_new_head.next
  before_new_head.next = nil
  head
end
root = ListNode.new(0)
root.next = ListNode.new(1)
root.next.next = ListNode.new(2)
root.next.next.next = ListNode.new(3)
root.next.next.next.next = ListNode.new(4)
p rotate_right(root, 8)
