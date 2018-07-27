# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

def traverse_in_order(node, height, h)
  if node.left
    traverse_in_order(node.left, height + 1, h)
  end

  if !h[height]
    h[height] = node.val
  else
    if h[height] < node.val
      h[height] = node.val
    end
  end

  if node.right
    traverse_in_order(node.right, height + 1, h)
  end
end

# @param {TreeNode} root
# @return {Integer[]}
def largest_values(root)
  return [] unless root
  h = {}
  traverse_in_order(root, 0, h)
  h.keys.sort.map do |key|
    h[key]
  end
end
