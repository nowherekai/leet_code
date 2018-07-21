class Interval
  attr_reader :start, :end
  include Enumerable
  def initialize(s, e)
    @start = s
    @end = e
  end

  def overlap?(other)
    self.start < other.end && self.end > other.start
  end

  def eql?(other)
    self.start == other.start && self.end == other.end
  end

  def hash
    self.start.hash + self.end.hash
  end

  def <=>(other)
    if (self.start <=> other.start) == 0
      self.end <=> other.end
    else
      self.start <=> other.start
    end
  end

  def inspect
    "#{start}:#{self.end}"
  end
end

def maximum_non_overlap_count_of(sorted_intervals, next_intervals, index, maximum_non_overlap_count)
  if index >= sorted_intervals.size
    return 0
  end

  if index == sorted_intervals.size - 1
    maximum_non_overlap_count[index] = 1
  end

  if maximum_non_overlap_count[index] != nil
    return maximum_non_overlap_count[index]
  end

  f_i = maximum_non_overlap_count_of(sorted_intervals, next_intervals, index + 1, maximum_non_overlap_count)
  if next_intervals[index]
    f_n = maximum_non_overlap_count_of(sorted_intervals, next_intervals, next_intervals[index], maximum_non_overlap_count)
  else
    f_n = 0
  end
  if f_n + 1 > f_i
    maximum_non_overlap_count[index] = f_n + 1
  else
    maximum_non_overlap_count[index] = f_i
  end
  maximum_non_overlap_count[index]
end

#采用动态规划（divide and conquer）算法
#先预处理：1. 排序
# =>       2. 对于排序后的每一个interval，找到它的下一个不overlap的interval（没有则指ni）
# 然后用DP算法求出对第一个interval最大的non-overlap intervals数量
# f[i] = [ f[i+1], f[Nest[i]] + 1].max
# f[0] 就是要求的值
def erase_overlap_intervals(intervals)
  return 0 if intervals.empty?
  sorted_intervals = intervals.sort.uniq

  next_intervals = Array.new(sorted_intervals.size, nil)
  sorted_intervals.each_with_index do |interval, index|
    sorted_intervals[(index + 1)..-1].each_with_index do |behind_interval, behind_index|
      if !interval.overlap?(behind_interval)
        next_intervals[index] = behind_index + index + 1
        break
      end
    end
  end
  # p sorted_intervals
  # p next_intervals

  maximum_non_overlap_count = Array.new(sorted_intervals.size, nil)
  maximum_non_overlap_count_of(sorted_intervals, next_intervals, 0, maximum_non_overlap_count)
  # p maximum_non_overlap_count
  intervals.size - maximum_non_overlap_count[0]
end
intervals = [[1,2],[1,3],[1,4]].map { |s, e| Interval.new(s, e) }
p erase_overlap_intervals(intervals)
