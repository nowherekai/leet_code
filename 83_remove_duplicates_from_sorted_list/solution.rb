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
def delete_duplicates(head)
  return unless head

  first = head
  while first && first.next
    second = first.next
    if second.val == first.val
      first.next = second.next
    else
      first = second
    end
  end
  head
end

root = ListNode.new(1)
root.next = ListNode.new(1)
root.next.next = ListNode.new(1)
root.next.next.next = ListNode.new(1)
delete_duplicates(root)
p root
