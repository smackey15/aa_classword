require "byebug"
class Board

    attr_reader :size

    def self.print_grid(array)
        array.each do |row|
            puts row.join(" ")
        end

    end

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)} #[[:N, :N, :N], [:N, :N, :N], [:N, :N, :N]]
        @size = n * n
    end

    def [](array)
        return @grid[array[0]][array[1]]
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    #def attack(position)  ##non-sugar version of below##
    #    if self.[](position) == :S 
    #        self.[]=(position, :H)
    #        p "you sunk my battleship!"
    #        return true
    #    else
    #        self.[]=(position, :X)
    #        return false
    #    end
    #end

    def attack(position)
        if self[position] == :S 
            self[position] = :H
            p "you sunk my battleship!"
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        while self.num_ships < (@size * 0.25)
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            self[[row, col]] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S 
                    :N
                else
                    ele 
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

    

end
