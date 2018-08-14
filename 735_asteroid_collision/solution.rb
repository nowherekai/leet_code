# 思路：使用一个result stack，初始为empty，先从asteroids取出一个元素放入其中
# 分别从result和asteroids(当作反向stack)取一个asteroid, 比较它们的正负和大小，按不同情况做处理
# @param {Integer[]} asteroids
# @return {Integer[]}
def asteroid_collision(asteroids)
  result = []

  result.push asteroids.shift

  until asteroids.empty?
    left = result.pop
    right = asteroids.shift
    if left.nil?
      result.push right
      next
    end

    if left < 0 || (left > 0 && right > 0)
      result.push left
      result.push right
      next
    end

    # left > 0 && right < 0
    if left.abs > right.abs
      result.push left
    elsif left.abs < right.abs
      asteroids.unshift right
    end
  end
  result
end

p asteroid_collision([1,-2,-2, -2])
