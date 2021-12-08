require "byebug"
class Board

    attr_reader :size

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
        flattened = @grid.flatten
        (0..flattened.length - 1).each do |i|
            while num_ships < (@size * 0.25)
                flattened[i] = :S 
            end
        end
    end

        #@grid.flatten.map.sample(@size * 0.25) do |ele|
        #    @grid[i] = :S
        #end


        #@grid.flatten.sample(@size * 0.25)
            #ele == :S 
            #ele ==   
    def hidden_ships_grid

    end

    def self.print_grid(array)

    end


end
