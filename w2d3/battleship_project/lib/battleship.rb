require_relative "board"
require_relative "player"
require "byebug"
class Battleship

    #attr_writer :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)  
        @remaining_misses = @board.size / 2.0
    end

    def board
        @board
    end
end
