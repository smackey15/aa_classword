# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        if self.length > 0
            self.max - self.min 
        else 
            nil 
        end        
    end

    def average
        if self.length > 0
            self.sum / (self.length * 1.0)
        else
        nil
        end
    end

    def median
        return nil if self.empty?
        
        sorted = self.sort
        
        if sorted.length.odd?
            return sorted[(sorted.length / 2)]
        end

        if sorted.length.even?
            length_idx = (sorted.length / 2)
            second_idx = length_idx - 1
            return (sorted[length_idx] + sorted[second_idx]) / 2.0
        end
    end

    def counts
        count = Hash.new(0)
        self.each {|ele| count[ele] += 1}
        count
    end

    def my_count(arg)
        count = Hash.new(0)
        self.each {|ele| count[ele] += 1}
        count[arg]
    end

    def my_index(arg)
        return nil if !self.include?(arg)

        self.each_with_index do |ele, i|
            if ele == arg
                return i 
            end
        end
    end

    def my_uniq  ##not quite finished
        count = Hash.new(0)
        self.each {|ele| count[ele] += 1}
        return count.keys
    end

    def my_transpose
        new_arr = []
        (0...self.length).each do |r|
            new_r = []
            (0...self.length).each do |c|
                new_r << self[c][r]
            end
            new_arr << new_r
        end
        new_arr
    end
end
