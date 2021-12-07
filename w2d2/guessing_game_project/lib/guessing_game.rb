class GuessingGame
    attr_reader :num_attempts

    def initialize(min, max)
        @min = min
        @max = max
        @secret_num = rand(min..max) 
        @num_attempts = 0
        @game_over = false
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        if num > @secret_num 
            p "too big"
            @num_attempts += 1
        elsif num < @secret_num
            p "too small"
            @num_attempts += 1
        else
            p "you win"
            @num_attempts += 1
            @game_over = true
        end
    end

    def ask_user
        p "enter a number"
        num = gets.chomp.to_i
        check_num(num)
    end
    

end
