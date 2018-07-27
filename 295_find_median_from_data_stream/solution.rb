#use insert sort, too slow: O(n ** 2) complexity
class MedianFinder

=begin
    initialize your data structure here.
=end
    def initialize()
      @nums = []
    end


=begin
    :type num: Integer
    :rtype: Void
=end
    def add_num(num)
      insert_sort(num)
    end



=begin
    :rtype: Float
=end
    def find_median()
      if @nums.size % 2 == 0
        (@nums[ @nums.size / 2] + @nums[ @nums.size / 2 - 1 ])/2.0
      else
        @nums[ @nums.size / 2 ]
      end
    end


    private
    def insert_sort(n)
      @nums.push(n)
      i = @nums.size - 1
      while i - 1 >= 0
        if @nums[i] < @nums[i - 1]
          @nums[i], @nums[i - 1] = @nums[i - 1], @nums[i]
          i -= 1
        else
          break
        end
      end
    end
end

# Your MedianFinder object will be instantiated and called as such:
obj = MedianFinder.new()
obj.add_num(3)
obj.add_num(1)
obj.add_num(4)
obj.add_num(2)
obj.add_num(5)
p obj.find_median
