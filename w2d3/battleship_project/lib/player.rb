require "byebug"
class Player

    def get_move
        p "enter a position with coordinates separated with a space like '4 7'"
        nums = gets.chomp.split
        nums.map {|ele| ele.to_i}
    end

end 
