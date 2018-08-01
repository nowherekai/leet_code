#标记访问过的node，最简单的方法，O(n)时间复杂度，O(n)空间复杂度
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
  end
end

def detect_list_cycle(head)
  return unless head

  visited = {}
  current = head

  visited[current] = true
  while current.next
    if visited[current.next]
      return current
    else
      visited[current.next] = true
    end
    current = current.next
  end
  nil
end

root = ListNode.new(1)
root.next = root

p detect_list_cycle(root)
