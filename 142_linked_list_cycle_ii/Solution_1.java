/* 见solution_1.ruby, leetcode本题不接受ruby，所以用ruby重写 */
class ListNode {
  int val;
  ListNode next;
  ListNode(int x) {
    val = x;
    next = null;
  }
}
public class Solution_1 {
  public static void main(String argv[]) {
    ListNode root = new ListNode(1);
    root.next = new ListNode(2);
    root.next.next = root;
    Solution_1 s = new Solution_1();
    System.out.println(s.detectCycle(root).val);
  }

  public ListNode detectCycle(ListNode head) {
    if(head == null) {
      return null;
    }
    ListNode slow = head;
    ListNode quick = head.next;
    boolean cycle = false;

    while(quick != null) {
      if(slow == quick) {
        cycle = true;
        break;
      } else {
        quick = quick.next;
        if (quick == null) {
          return null;
        }
        quick = quick.next;
        slow = slow.next;
      }
    }
    if (!cycle) {
      return null;
    }

    ListNode node_in_cycle = quick;
    ListNode from_head = null;

    while (true) {
      from_head = head;
      if(from_head == node_in_cycle) {
        return from_head;
      }
      while(from_head.next != node_in_cycle) {
        from_head = from_head.next;
      }

      while(node_in_cycle.next != from_head.next) {
        node_in_cycle = node_in_cycle.next;
      }

      if(from_head == node_in_cycle){
        node_in_cycle = from_head;
      } {
        return from_head.next;
      }
    }
  }
}
