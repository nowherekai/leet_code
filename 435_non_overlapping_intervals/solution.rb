# Definition for an interval.
class Interval
  # include Comparable
  include Enumerable

  attr_reader :start, :end
  def initialize(s=0, e=0)
    @start = s
    @end = e
  end

  def <=>(other)
    if start == other.start
      self.end <=> other.end
    else
      start <=> other.start
    end
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

  def to_s
    "#{self.start}:#{self.end}"
  end

  alias inspect to_s
end

# @param {Interval[]} intervals
# @return {Integer}
#可以用matrix做?
def erase_overlap_intervals(intervals)
  intervals_remove_duplicate = intervals.uniq.sort

  overlap_count = Array.new(intervals_remove_duplicate.size, 0)
  intervals_remove_duplicate.each_with_index do |interval, index|
    intervals_remove_duplicate[index+1..-1].each_with_index do |other_interval, j|
      if interval.overlap?(other_interval)
        overlap_count[index] += 1
        overlap_count[index + j + 1] += 1
      end
    end
  end

  while !overlap_count.all?(&:zero?)
    index = overlap_count.find_index(overlap_count.max)
    overlap_count.delete_at(index)

    interval = intervals_remove_duplicate[index]
    intervals_remove_duplicate.delete_at(index)
    intervals_remove_duplicate.each_with_index do |other_interval, index|
      if interval.overlap?(other_interval)
        overlap_count[index] -= 1
      end
    end
  end
  intervals.size - intervals_remove_duplicate.size
end

intervals = [[1,100],[11,22],[1,11],[2,12]].map do |(s, e)|
  Interval.new(s, e)
end
puts erase_overlap_intervals(intervals)
