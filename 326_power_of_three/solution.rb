# 基于loop的算法比较简单，这里用的是其它方法，基于base的方法
# 有十进制、二进制，其实有任何禁止，比如三进制或32进制
# 十进制中10的倍数都是1开头，后面0个到多个0；二进制也是如此，三进制也是如此
# 证明: 三进制转十进制的公式: sum( s[i] * 3 ** i ), the least significant digit index is 0, the sum of all digits is numer in base 10. 所以最左一位是1，其余位是0的三进制数是3的power.
# @param {Integer} n
# @return {Boolean}
def is_power_of_three(n)
  n.to_s(3).match? /^10{0,}$/
end
