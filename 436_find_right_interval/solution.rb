# Definition for an interval.
class Interval
  attr_accessor :start, :end
  def initialize(s=0, e=0)
    @start = s
    @end = e
  end
end

# @param {Interval[]} intervals
# @return {Integer[]}
def find_right_interval(intervals)
  start_point_to_index_h = {}
  intervals.each_with_index do |interval, index|
    start_point_to_index_h[interval.start] = index
  end

  sorted_start_points = start_point_to_index_h.keys.sort

  intervals.map do |interval|
    start_point = sorted_start_points.bsearch { |n| n >= interval.end }
    if start_point
      start_point_to_index_h[start_point]
    else
      -1
    end
  end
end
intervals = [ [1,4], [2,3], [3,4]  ].map { |s, e| Interval.new(s, e) }
p find_right_interval(intervals)

